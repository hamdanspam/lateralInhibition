classdef Neuron < matlab.mixin.Heterogeneous
    %Neuron Our model of a single neuron will be here
    %   Has inputs and outputs. Has limited number of outputs depending on
    %   what kind of neuron it is, as opposed to a full neural network with
    %   connections to every other node. Each connection has its own
    %   weight, for now arbitrarily designated.
    
    properties
        Threshold = (-50--70)/(40--70); % same ratio from baseline (0) as in neurons, approximately
        Activation = 0; % starts at baseline of 0
        Incoming = Neuron.empty(0); % set of ilnks to neurons
        Incoming_weights = [];
        Outgoing = Neuron.empty(0); 
        spiking = 0;
% Weights
%         Incoming/Outgoing =
% 
%     1.0000    0.1000
%     0.0000    0.1000
%     1.0000    0.1000
%     0.0000    0.1000
    end
    
    methods
        function obj = Neuron(Incoming, Outgoing)
            obj.Incoming = [obj.Incoming; Incoming];
            obj.Outgoing = [obj.Outgoing; Outgoing];
        end
        
        function obj = iterate(obj)
            % fluctuates activation state randomly
            obj.Activation = obj.Activation + (1 - rand * 2);
            obj.Activation = obj.Activation + dot([obj.Incoming.spiking]', obj.Incoming_weights);
            obj = obj.spike(); % if spiking, let it spike
        end
        
        function obj = spike(obj)
            if (obj.Activation > obj.Threshold) && (obj.spiking == 0)
                obj.spiking = 1;
                obj.Activation = 1; % reflect activity in neuron
            elseif(obj.Activation > obj.Threshold) && (obj.spiking == 1) % if right after spike
                obj.Activation = -0.20; % hyperpolarization for right after spike
                obj.spiking = 0;
            else
                obj.spiking = 0;
            end
        end
        
        function obj = addOutput (obj, newOutgoing)
            obj.Outgoing = [obj.Outgoing; newOutgoing];
        end
        
        function obj = addInput (obj, newIncoming, weight)
            obj.Incoming = [obj.Incoming; newIncoming];
            % add same number of entries to Incoming weights
            obj.Incoming_weights = [obj.Incoming_weights; weight*ones(length(newIncoming),1)];
        end
    end 
end

