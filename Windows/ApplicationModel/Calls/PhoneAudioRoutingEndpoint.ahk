#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * The available audio endpoints you can use for dialing a phone call.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.phoneaudioroutingendpoint
 * @namespace Windows.ApplicationModel.Calls
 * @version WindowsRuntime 1.4
 */
class PhoneAudioRoutingEndpoint extends Win32Enum{

    /**
     * The default audio endpoint for the phone.
     * @type {Integer (Int32)}
     */
    static Default => 0

    /**
     * A Bluetooth connection.
     * @type {Integer (Int32)}
     */
    static Bluetooth => 1

    /**
     * A speaker phone.
     * @type {Integer (Int32)}
     */
    static Speakerphone => 2
}
