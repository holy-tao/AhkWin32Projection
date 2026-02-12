#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the media types used by a VoIP call.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.calls.voipphonecallmedia
 * @namespace Windows.ApplicationModel.Calls
 * @version WindowsRuntime 1.4
 */
class VoipPhoneCallMedia extends Win32BitflagEnum{

    /**
     * The call uses no media.
     * @type {Integer (UInt32)}
     */
    static None => 0

    /**
     * The call uses audio.
     * @type {Integer (UInt32)}
     */
    static Audio => 1

    /**
     * The call uses video.
     * @type {Integer (UInt32)}
     */
    static Video => 2
}
