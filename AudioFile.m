classdef AudioFile
    %UNTITLED2 Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        FFTSize
        hopSize
        tolerance
        descritptionFileStrucutre
        wavFile
        midiFile
        midiMessages
        realOnsets
        detectedOnsets
        comparaisonOnsets
    end
    
    methods
        
        
        function obj = GetMidiInformations(obj)
            obj.midiMessages = readmidi(obj.midiFile); 
            obj.realOnsets = obj.midiMessages(:,6);
        end
        function obj = testAccuracy(obj)
            positifDetection =0;
            nbrFalsePositifDetection =0;
            missDetection =0;
            numberOfDetectedOnsets = size(obj.detectedOnsets,1);
            numberOfRealOnsets = size(obj.realOnsets,1);
            obj.comparaisonOnsets = zeros(2,numberOfRealOnsets);
            
            
      
            for k=1:numberOfRealOnsets
            candidat =0;
            realValue = obj.realOnsets(k);
                for i=1:numberOfDetectedOnsets
                    myValue = obj.detectedOnsets(i);
                    if(abs(realValue-myValue)<= obj.tolerance)
                        if(abs(realValue-candidat)> abs(realValue-candidat))
                            candidat = myValue;
                        end
                    end
                end
                obj.comparaisonOnsets(k,2) = candidat;
                
                
            end
            
            obj.comparaisonOnsets
            

        end
        function obj = detectOnsets(obj)
            obj.detectedOnsets = spectralDifference_onsetDetection(obj.wavFile,obj.FFTSize,obj.hopSize);
        end
        
            
    end
end
