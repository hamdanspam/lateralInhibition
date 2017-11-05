classdef InhibitoryNeuron < Neuron
    %INHIBITORYNEURON Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        
    end
    
    methods
        function obj = InhibitoryNeuron(Incoming, Outgoing)
            %Note: I don't know if calling this superclass's constructor
            %will work.
            obj@Neuron(Incoming, Outgoing);
        end
        
        
        % defining feature of inhibitory neurons
        function obj = spike(obj)
            if (obj.Activation > obj.Threshold) && obj.spiking == 0
                obj.spiking = -1;
            else
                obj.spiking = 0;
            end
        end
    end
end

