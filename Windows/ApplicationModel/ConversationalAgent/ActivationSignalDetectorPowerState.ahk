#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the power modes, supported by an [ActivationSignalDetector](activationsignaldetector.md), that describe the power-related conditions under which a detector is allowed to operate.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.conversationalagent.activationsignaldetectorpowerstate
 * @namespace Windows.ApplicationModel.ConversationalAgent
 * @version WindowsRuntime 1.4
 */
class ActivationSignalDetectorPowerState extends Win32Enum{

    /**
     * A device that is not currently affected by any power restriction conditions. For example, a laptop that's charging and in active use (with the screen on).
     * @type {Integer (Int32)}
     */
    static HighPower => 0

    /**
     * A device in a low-power state but not currently using battery power. For example, a laptop that's charging while in sleep state.
     * @type {Integer (Int32)}
     */
    static ConnectedLowPower => 1

    /**
     * A device in a low-power state and using battery power. For example, a laptop in sleep state that's not connected to an external power source.
     * @type {Integer (Int32)}
     */
    static DisconnectedLowPower => 2
}
