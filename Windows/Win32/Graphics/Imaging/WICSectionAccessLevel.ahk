#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the access level of a Windows Graphics Device Interface (GDI) section.
 * @see https://learn.microsoft.com/windows/win32/api/wincodec/ne-wincodec-wicsectionaccesslevel
 * @namespace Windows.Win32.Graphics.Imaging
 */
class WICSectionAccessLevel extends Win32Enum {

    /**
     * Indicates a read only access level.
     * Native name: WICSectionAccessLevelRead
     * @type {Integer (Int32)}
     */
    static Read => 1

    /**
     * Indicates a read/write access level.
     * Native name: WICSectionAccessLevelReadWrite
     * @type {Integer (Int32)}
     */
    static ReadWrite => 3
}
