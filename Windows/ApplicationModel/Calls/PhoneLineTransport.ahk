#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * The transport used by a particular phone line.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.phonelinetransport
 * @namespace Windows.ApplicationModel.Calls
 * @version WindowsRuntime 1.4
 */
class PhoneLineTransport extends Win32Enum{

    /**
     * The phone line uses a cellular transport.
     * @type {Integer (Int32)}
     */
    static Cellular => 0

    /**
     * The phone line uses a voice over IP transport.
     * @type {Integer (Int32)}
     */
    static VoipApp => 1

    /**
     * The phone line uses a bluetooth transport.
     * @type {Integer (Int32)}
     */
    static Bluetooth => 2
}
