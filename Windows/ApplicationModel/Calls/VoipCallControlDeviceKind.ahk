#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify a kind of call control device that might be supported for association with calls.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.voipcallcontroldevicekind
 * @namespace Windows.ApplicationModel.Calls
 * @version WindowsRuntime 1.4
 */
class VoipCallControlDeviceKind extends Win32Enum{

    /**
     * Specifies a call control device kind of Bluetooth.
     * @type {Integer (Int32)}
     */
    static Bluetooth => 0

    /**
     * Specifies a call control device kind of USB.
     * @type {Integer (Int32)}
     */
    static Usb => 1
}
