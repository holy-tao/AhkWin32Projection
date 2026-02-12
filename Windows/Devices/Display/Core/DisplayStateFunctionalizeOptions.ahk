#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify options for functionalizing a [DisplayState](displaystate.md) with the system.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.display.core.displaystatefunctionalizeoptions
 * @namespace Windows.Devices.Display.Core
 * @version WindowsRuntime 1.4
 */
class DisplayStateFunctionalizeOptions extends Win32BitflagEnum{

    /**
     * Indicates no option.
     * @type {Integer (UInt32)}
     */
    static None => 0

    /**
     * Indicates that the functionalize operation should fail with [SystemStateChanged](displaystateoperationstatus.md) if the system display state has changed since the [DisplayState](displaystate.md) object was created. This is useful for improving reliability of a functionalize operation because, if it fails for this reason, then it's often better to just redo the entire operation in case the system state change resulted in different availability of modes or monitors.
     * @type {Integer (UInt32)}
     */
    static FailIfStateChanged => 1

    /**
     * Indicates that the operation should validate whether functionalization will succeed, without updating any [DisplayPath](displaypath.md) properties.
     * @type {Integer (UInt32)}
     */
    static ValidateTopologyOnly => 2
}
