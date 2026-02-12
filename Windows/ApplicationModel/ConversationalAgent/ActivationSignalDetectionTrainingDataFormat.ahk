#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the activation signal training data formats supported by the [ActivationSignalDetector](activationsignaldetector.md) for the digital assistant.
 * @remarks
 * Digital assistant applications can train keyword detectors to more accurately recognize an individual user's voice by applying algorithmic customizations to the detector based on speech data (the detector provides these customizations). For example, training a spoken keyword detector to only detect the keyword when spoken by a specific person.
 * 
 * This is achieved through a series of [ActivationSignalDetectionConfiguration](activationsignaldetectionconfiguration.md) training steps, where each step consumes a logical fragment of speech input data.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.conversationalagent.activationsignaldetectiontrainingdataformat
 * @namespace Windows.ApplicationModel.ConversationalAgent
 * @version WindowsRuntime 1.4
 */
class ActivationSignalDetectionTrainingDataFormat extends Win32Enum{

    /**
     * Training data is voice audio in 8-bit 8kHz mono.
     * @type {Integer (Int32)}
     */
    static Voice8kHz8BitMono => 0

    /**
     * Training data is voice audio in 16-bit 8kHz mono.
     * @type {Integer (Int32)}
     */
    static Voice8kHz16BitMono => 1

    /**
     * Training data is voice audio in 8-bit 16kHz mono.
     * @type {Integer (Int32)}
     */
    static Voice16kHz8BitMono => 2

    /**
     * Training data is voice audio in 16-bit 16kHz mono.
     * @type {Integer (Int32)}
     */
    static Voice16kHz16BitMono => 3

    /**
     * Training data is voice audio is defined by an OEM.
     * @type {Integer (Int32)}
     */
    static VoiceOEMDefined => 4

    /**
     * Training data is generic audio in 8-bit 44kHz mono.
     * @type {Integer (Int32)}
     */
    static Audio44kHz8BitMono => 5

    /**
     * Training data is generic audio in 16-bit 44kHz mono.
     * @type {Integer (Int32)}
     */
    static Audio44kHz16BitMono => 6

    /**
     * Training data is generic audio in 8-bit 48kHz mono.
     * @type {Integer (Int32)}
     */
    static Audio48kHz8BitMono => 7

    /**
     * Training data is generic audio in 16-bit 48kHz mono.
     * @type {Integer (Int32)}
     */
    static Audio48kHz16BitMono => 8

    /**
     * Training data is generic audio in a format specified by a hardware provider.
     * @type {Integer (Int32)}
     */
    static AudioOEMDefined => 9

    /**
     * Training data is in a format specified by a hardware provider.
     * @type {Integer (Int32)}
     */
    static OtherOEMDefined => 10
}
