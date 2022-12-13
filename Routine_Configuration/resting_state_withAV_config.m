function [opts_vars, opts_vals] = resting_state_withAV_config(mouse,experimenter,type)

% All routines for Widefield Imaging Aquisition must follow this format

%Define types of options for the routine 
% @Values: specific list of usable values
% @Editable: If not edible, will not show up in edit configuration dialog

%General Options
opts_vars(1) = struct('Name','routine_name','Type','char','Values',[],'Label','AssociatedRoutine','Editable',1); 

%Imaging Options
opts_vars(2) = struct('Name','exposure_duration','Type','scalar','Values',[],'Label','Exposure (ms)','Editable',1); 
opts_vars(3) = struct('Name','framerate','Type','scalar','Values',[],'Label','Framerate','Editable',0); 
opts_vars(4) = struct('Name','recording_duration','Type','scalar','Values',[],'Label','Duration (s)','Editable',1); 

%Nidaq Aquisition Info
opts_vars(5) = struct('Name','analog_in_rate','Type','scalar','Values',[],'Label','AI-Rate (hz)','Editable',1); 
opts_vars(6) = struct('Name','analog_out_rate','Type','scalar','Values',[],'Label','AO-Rate (hz)','Editable',1); 
opts_vars(7) = struct('Name','digital_in_rate','Type','scalar','Values',[],'Label','DI-Rate (hz)','Editable',1); 
opts_vars(8) = struct('Name','digital_out_rate','Type','scalar','Values',[],'Label','D0-Rate (hz)','Editable',1); 

%Directory Info
opts_vars(9) = struct('Name', 'rec_date', 'Type', 'char', 'Values', [], 'Label', 'RecDate','Editable',0); 
opts_vars(10) = struct('Name', 'options_filename', 'Type', 'char', 'Values', [], 'Label', 'OptionsFilename','Editable',0); 
opts_vars(11) = struct('Name', 'acquired_data_filename', 'Type', 'char', 'Values', [], 'Label', 'DataFilename','Editable',0); 
opts_vars(12) = struct('Name', 'mouse', 'Type', 'char', 'Values', [], 'Label', 'mouse','Editable',0); 
opts_vars(13) = struct('Name', 'experimenter', 'Type', 'char', 'Values', [], 'Label', 'Experimenter','Editable',0); 
opts_vars(14) = struct('Name', 'experiment_type', 'Type', 'char', 'Values', [], 'Label', 'ExperimentType','Editable',0); 

%Input/Output Mapping Info
opts_vars(15) = struct('Name','frame_out_chan','Type','scalar','Values',[0,6,20,21],'Label','Frame Out Chan','Editable',1); 
opts_vars(16) = struct('Name','trigger_in_chan','Type','scalar','Values',[0,6,20,21],'Label','Trigger In Chan','Editable',1); 
opts_vars(17) = struct('Name','trigger_ready_chan','Type','scalar','Values',[0,1,2,6,7,16,20,21],'Label','Trigger Ready Chan','Editable',1);
opts_vars(18) = struct('Name','photodiode_chan','Type','scalar','Values',[0,1,2,6,7,16,20,21],'Label','Photodiode Chan','Editable',1); 
opts_vars(19) = struct('Name','trigger_out_chan','Type','scalar','Values',[0,1,2,3],'Label','Tigger Out Chan','Editable',1); 
opts_vars(20) = struct('Name','trigger_speaker_chan','Type','scalar','Values',[0,1,2,3],'Label','Trigger Speaker Chan','Editable',1); 
opts_vars(21) = struct('Name','trigger_LED_chan','Type','scalar','Values',[0,1,2,3],'Label','Trigger LED Chan','Editable',1); 
opts_vars(22) = struct('Name','trigger_LED_in_chan','Type','scalar','Values',[0,1,2,6,7,16,20,21],'Label','LED In Chan','Editable',1);
opts_vars(23) = struct('Name','speaker_in','Type','scalar','Values',[0,1,2,6,7,16,20,21],'Label','Speaker In','Editable',1);

%trial options
opts_vars(24) = struct('Name','number_trials','Type','scalar','Values',[],'Label','Number of Trials','Editable',0); 

%%Define default values 
%General Options
opts_vals.routine_name='resting_state_withAV';

%Imaging Options
opts_vals.exposure_duration = 33.33;  %Camera Exposure in ms
opts_vals.framerate =1000/opts_vals.exposure_duration; %Frame rate
opts_vals.recording_duration = 4000; %Total duration of the recording in seconds

%Nidaq Aquisition Info
opts_vals.analog_in_rate = 1000; %samples/sec
opts_vals.analog_out_rate = 100000; %samples/sec
opts_vals.digital_in_rate = 1000; %samples/sec
opts_vals.digital_out_rate = 1000; %samples/sec

%Directory Info
opts_vals.rec_date = datestr(datetime('Now','Format','dd-MMM-uuuu HH:mm:ss'));
opts_vals.options_filename = sprintf('%s-OptsFile.mat',mouse);
opts_vals.acquired_data_filename = sprintf('%s-AquiredData.mat',mouse);
opts_vals.mouse = mouse; 
opts_vals.experimenter = experimenter;
opts_vals.experiment_type = type;

%Input/Output Mapping
opts_vals.frame_out_chan = 6;
opts_vals.trigger_in_chan = 0;
opts_vals.trigger_ready_chan = 1;
opts_vals.photodiode_chan = 21;
opts_vals.trigger_out_chan = 1;
opts_vals.trigger_speaker_chan = 0;
opts_vals.trigger_LED_chan = 2;
opts_vals.trigger_LED_in_chan = 16;
opts_vals.speaker_in = 7;

%General Options
opts_vals.number_trials = 100; %number of trials

end
