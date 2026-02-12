#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the voice training data states recognized by the [ActivationSignalDetector](activationsignaldetector.md) for the digital assistant.
  * 
  * > [!NOTE]
  * > These determinations are made by the training algorithms of an individual signal detector and may be specific to the hardware or software implementations of the detector.
 * @remarks
 * Digital assistant applications can train keyword detectors to more accurately recognize an individual user's voice by algorithmically applying customizations to the detector based on speech data. For example, training a spoken keyword detector to only detect the keyword when spoken by a specific person.
 * 
 * This is achieved through a series of [ActivationSignalDetectionConfiguration](activationsignaldetectionconfiguration.md) training steps, where each step consumes a logical fragment of speech input data.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.conversationalagent.detectionconfigurationtrainingstatus
 * @namespace Windows.ApplicationModel.ConversationalAgent
 * @version WindowsRuntime 1.4
 */
class DetectionConfigurationTrainingStatus extends Win32Enum{

    /**
     * Signal detection training was successful.
     * @type {Integer (Int32)}
     */
    static Success => 0

    /**
     * Training data format is not recognized by the signal detector.
     * @type {Integer (Int32)}
     */
    static FormatNotSupported => 1

    /**
     * Training data cannot be processed by the signal detector due to user speaking too quietly.
     * @type {Integer (Int32)}
     */
    static VoiceTooQuiet => 2

    /**
     * Training data cannot be processed by the signal detector due to user speaking too loudly.
     * @type {Integer (Int32)}
     */
    static VoiceTooLoud => 3

    /**
     * Training data cannot be processed by the signal detector due to user speaking too fast.
     * @type {Integer (Int32)}
     */
    static VoiceTooFast => 4

    /**
     * Training data cannot be processed by the signal detector due to user speaking too slowly.
     * @type {Integer (Int32)}
     */
    static VoiceTooSlow => 5

    /**
     * Training data cannot be processed by the signal detector due to poor quality of speech input.
     * @type {Integer (Int32)}
     */
    static VoiceQualityProblem => 6

    /**
     * An internal error, unrelated to the input data format, was encountered during signal detection training.
     * @type {Integer (Int32)}
     */
    static TrainingSystemInternalError => 7

    /**
     * Training process took too long and has timed out. Any training data provided during this training cycle is discarded.
     * @type {Integer (Int32)}
     */
    static TrainingTimedOut => 8

    /**
     * The request failed because a configuration with the specified parameters was not found.
     * @type {Integer (Int32)}
     */
    static ConfigurationNotFound => 9
}
