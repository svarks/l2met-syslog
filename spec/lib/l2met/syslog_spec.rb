require 'spec_helper'

describe L2met::Syslog do
  let(:options) { {interval: 0.01} }

  subject { described_class.new(options) }

  describe '#initialize' do
    context 'without params' do
      let(:options) { {} }

      it 'sets default logger' do
        subject.logger.should be_an_instance_of ::Logger
      end

      it 'sets default interval' do
        subject.interval.should == 60
      end
    end
  end

  describe '#log_data' do
    it 'must be implemented' do
      expect {subject.log_data }.to raise_error
    end
  end

  describe 'log' do
    it 'outputs params in log' do
      subject.logger.should_receive(:info).with('source=hostname measure=load val=10.0')
      subject.log source: 'hostname', measure: 'load', val: 10.0
    end
  end

  describe '#run' do
    it 'runs in thread' do
      Thread.should_receive :new
      subject.run
    end

    it 'logs data when running' do
      subject.should_receive(:log_data).at_least(:once).and_return nil
      subject.run
      sleep 0.02
      subject.stop
    end
  end

  describe '#stop' do
    it 'stops executing' do
      thread = subject.run
      thread.should_receive(:exit)
      subject.stop
    end
  end
end
