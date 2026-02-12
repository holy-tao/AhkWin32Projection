#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * The types of media available in a phone call.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.phonecallmedia
 * @namespace Windows.ApplicationModel.Calls
 * @version WindowsRuntime 1.4
 */
class PhoneCallMedia extends Win32Enum{

    /**
     * The phone call supports audio only.
     * @type {Integer (Int32)}
     */
    static Audio => 0

    /**
     * The phone call supports audio and video.
     * @type {Integer (Int32)}
     */
    static AudioAndVideo => 1

    /**
     * The phone call supports audio and realtime text.
     * @type {Integer (Int32)}
     */
    static AudioAndRealTimeText => 2
}
