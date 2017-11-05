classdef InputNeuron < Neuron
    %INPUTNEURON Inputs to output neuron
    %   We won't concern ourselves much with whether this neuron fires, it
    %   will somewhat randomly.
    
    properties
    end
    
    methods
        function obj = InputNeuron(Incoming, Outgoing)
            obj@Neuron(Incoming, Outgoing);
        end
        function obj = fire(obj)
            obj.spiking = 1;
        end
    end
    
end

