#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the types of system resources that might be reported as unavailable to an [ActivationSignalDetectionConfiguration](activationsignaldetectionconfiguration.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.conversationalagent.signaldetectorresourcekind
 * @namespace Windows.ApplicationModel.ConversationalAgent
 * @version WindowsRuntime 1.4
 */
class SignalDetectorResourceKind extends Win32Enum{

    /**
     * The number of active, unique models as specified by the [ActivationSignalDetector](activationsignaldetector.md) object has been exceeded.
     * @type {Integer (Int32)}
     */
    static ParallelModelSupport => 0

    /**
     * The number of active, unique models as specified by the [ConversationalAgentSession](conversationalagentsession.md) object has been exceeded.
     * @type {Integer (Int32)}
     */
    static ParallelModelSupportForAgent => 1

    /**
     * The number of active, unique signals as specified by the [ActivationSignalDetector](activationsignaldetector.md) object has been exceeded.
     * @type {Integer (Int32)}
     */
    static ParallelSignalSupport => 2

    /**
     * The number of active, unique signals as specified by the [ConversationalAgentSession](conversationalagentsession.md) object has been exceeded.
     * @type {Integer (Int32)}
     */
    static ParallelSignalSupportForAgent => 3

    /**
     * The [ActivationSignalDetector](activationsignaldetector.md) object is not active when the display is turned off.
     * @type {Integer (Int32)}
     */
    static DisplayOffSupport => 4

    /**
     * The [ActivationSignalDetector](activationsignaldetector.md) object requires the system to be plugged in to external power. The associated detector is not active on battery power.
     * @type {Integer (Int32)}
     */
    static PluggedInPower => 5

    /**
     * The [ActivationSignalDetector](activationsignaldetector.md) object is in an error state and is not currently functional.
     * @type {Integer (Int32)}
     */
    static Detector => 6

    /**
     * The [ActivationSignalDetector](activationsignaldetector.md) object is not active when system is in sleep state.
     * @type {Integer (Int32)}
     */
    static SupportedSleepState => 7

    /**
     * The [ActivationSignalDetector](activationsignaldetector.md) object is not active in the current battery saver state.
     * @type {Integer (Int32)}
     */
    static SupportedBatterySaverState => 8

    /**
     * The [ActivationSignalDetector](activationsignaldetector.md) object is not active when the display is unavailable, such as when a laptop lid is closed.
     * @type {Integer (Int32)}
     */
    static ScreenAvailability => 9

    /**
     * The [ActivationSignalDetector](activationsignaldetector.md) object is not active when there is no suitable hardware available, such as a microphone to detect a spoken keyword. The hardware might be disabled, in error state, or unavailable for some reason.
     * @type {Integer (Int32)}
     */
    static InputHardware => 10

    /**
     * The [ActivationSignalDetector](activationsignaldetector.md) object requires Acoustic Echo Cancellation (AEC), but AEC is not available or supported.
     * @type {Integer (Int32)}
     */
    static AcousticEchoCancellation => 11

    /**
     * The specified model ID is not valid for the [ActivationSignalDetector](activationsignaldetector.md) object.
     * @type {Integer (Int32)}
     */
    static ModelIdSupport => 12

    /**
     * The specified data channel is not valid for the [ActivationSignalDetector](activationsignaldetector.md) object.
     * @type {Integer (Int32)}
     */
    static DataChannel => 13
}
