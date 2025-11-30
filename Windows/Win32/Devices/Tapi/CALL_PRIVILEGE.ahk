#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * A CALL_PRIVILEGE member is returned by the ITCallInfo::get_Privilege method, and indicates when the current application owns or is monitoring the current call.
 * @see https://docs.microsoft.com/windows/win32/api//tapi3if/ne-tapi3if-call_privilege
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class CALL_PRIVILEGE extends Win32Enum{

    /**
     * The application is the owner of the call.
     * @type {Integer (Int32)}
     */
    static CP_OWNER => 0

    /**
     * The application is a monitor of the call.
     * @type {Integer (Int32)}
     */
    static CP_MONITOR => 1
}
