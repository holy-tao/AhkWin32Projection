#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines values for the type of attendee.
 * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/ne-rdpencomapi-rdpencomapi_attendee_flags
 * @namespace Windows.Win32.System.DesktopSharing
 * @version v4.0.30319
 */
class RDPENCOMAPI_ATTENDEE_FLAGS extends Win32Enum{

    /**
     * Indicates that the attendee is a local attendee.
     * @type {Integer (Int32)}
     */
    static ATTENDEE_FLAGS_LOCAL => 1
}
