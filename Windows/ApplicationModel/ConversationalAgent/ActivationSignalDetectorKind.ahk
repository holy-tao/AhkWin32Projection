#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the supported [ActivationSignalDetector](activationsignaldetector.md) types.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.conversationalagent.activationsignaldetectorkind
 * @namespace Windows.ApplicationModel.ConversationalAgent
 * @version WindowsRuntime 1.4
 */
class ActivationSignalDetectorKind extends Win32Enum{

    /**
     * Audio input has matched a specified pattern (for example, a keyword or "bark detector").
     * @type {Integer (Int32)}
     */
    static AudioPattern => 0

    /**
     * Audio input has hit a signal threshold (for example, voice activity detection).
     * @type {Integer (Int32)}
     */
    static AudioImpulse => 1

    /**
     * Activation signal detected from a hardware device such as a keyboard or bluetooth headset.
     * @type {Integer (Int32)}
     */
    static HardwareEvent => 2
}
