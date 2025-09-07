#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the access level of a Windows Graphics Device Interface (GDI) section.
 * @see https://learn.microsoft.com/windows/win32/api/wincodec/ne-wincodec-wicsectionaccesslevel
 * @namespace Windows.Win32.Graphics.Imaging
 * @version v4.0.30319
 */
class WICSectionAccessLevel{

    /**
     * Indicates a read only access level.
     * @type {Integer (Int32)}
     */
    static WICSectionAccessLevelRead => 1

    /**
     * Indicates a read/write access level.
     * @type {Integer (Int32)}
     */
    static WICSectionAccessLevelReadWrite => 3
}
