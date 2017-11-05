%% create our network
number_of_units = 4; % ie, number of units of input, output, and inhibitory
input_neurons = InputNeuron.empty(0,number_of_units);
output_neurons = OutputNeuron.empty(0,number_of_units);
inhibitory_neurons = InhibitoryNeuron.empty(0,number_of_units);

activity = [];

% Initialize our neurons
for i = 1:number_of_units
    output_neurons(i) = OutputNeuron([], []);
    input_neurons(i) = InputNeuron([], []);
    inhibitory_neurons(i) = InhibitoryNeuron([],[]);
end
for i = 1:number_of_units
    % Organize our neurons
    % We initialize the weights of each connection individually
    % Weights for inhibitory are lower because they are more plentiful than the
    % input neurons
    output_neurons(i) = output_neurons(i).addInput(input_neurons(i), 0.8);
    output_neurons(i) = output_neurons(i).addInput(inhibitory_neurons', 0.002);
    input_neurons(i) = input_neurons(i).addOutput(output_neurons(i));
    inhibitory_neurons(i) = inhibitory_neurons(i).addInput(output_neurons(i), 0.8);
    inhibitory_neurons(i) = inhibitory_neurons(i).addInput(inhibitory_neurons', 0.002);
    inhibitory_neurons(i) = inhibitory_neurons(i).addOutput(output_neurons');
    inhibitory_neurons(i) = inhibitory_neurons(i).addOutput(inhibitory_neurons');
end
%% run simulation
while(1)
    % Our input will be 0 or 1 with a likelihood of 1 in 10 to each input unit
    % TODO: the order matters for how it iterates
    for i = 1:length(input_neurons)
        if(rand < 0.60)
            input_neurons(i) = input_neurons(i).fire();
            
        end
    end
    for i = 1:length(output_neurons)
        output_neurons(i) = output_neurons(i).iterate();
    end
    for i = 1:length(inhibitory_neurons)
        inhibitory_neurons(i) = inhibitory_neurons(i).iterate();
    end
    % This can sample and image a matrix with several units in real time
    activity = [activity [output_neurons.Activation]']; % puts into vector 
    
    waterfall(activity);hold on
    pause(0.25);
end