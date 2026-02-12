#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The following constants are used by applications or UI frameworks to identify how UI feedback is processed when an input contact is detected.
 * @see https://learn.microsoft.com/windows/win32/ktop-src/winmsg/contact-visualization
 * @namespace Windows.Win32.System.Contacts
 * @version v4.0.30319
 */
class Contact extends Win32Struct
{
    static sizeof => 0

    static packingSize => 1
}
