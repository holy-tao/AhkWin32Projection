#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Indicates the status of a property change that an app requested of a frame source.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.perceptionframesourcepropertychangestatus
 * @namespace Windows.Devices.Perception
 * @version WindowsRuntime 1.4
 */
class PerceptionFrameSourcePropertyChangeStatus extends Win32Enum{

    /**
     * The status change is unknown.
     * @type {Integer (Int32)}
     */
    static Unknown => 0

    /**
     * The requested property change was accepted by the frame source.
     * @type {Integer (Int32)}
     */
    static Accepted => 1

    /**
     * The frame source property could not be changed because the app lost controller mode before the request was processed.
     * @type {Integer (Int32)}
     */
    static LostControl => 2

    /**
     * The requested property is not supported by the frame source.
     * @type {Integer (Int32)}
     */
    static PropertyNotSupported => 3

    /**
     * The requested property change was not accepted because the property is read-only.
     * @type {Integer (Int32)}
     */
    static PropertyReadOnly => 4

    /**
     * The requested property change was not accepted because the value is not in a valid range.
     * @type {Integer (Int32)}
     */
    static ValueOutOfRange => 5
}
