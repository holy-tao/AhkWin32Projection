#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/wpd_sdk/contact-properties
 * @namespace Windows.Win32.System.Contacts
 * @version v4.0.30319
 */
class Contact extends Win32Struct
{
    static sizeof => 0

    static packingSize => 1
}
