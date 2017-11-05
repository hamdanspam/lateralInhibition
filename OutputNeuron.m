classdef OutputNeuron < Neuron
    %OUTPUTNEURON Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
    end
    
    methods
        function obj = OutputNeuron(Incoming, Outgoing)
            %Note: I don't know if calling this superclass's constructor
            %will work.
            obj@Neuron(Incoming, Outgoing);
        end
        function activation = getActivation(obj)
            activation = obj.Activation;
        end
    end
    
end

