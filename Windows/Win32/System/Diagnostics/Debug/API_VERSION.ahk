#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Contains the library version.
 * @see https://docs.microsoft.com/windows/win32/api//dbghelp/ns-dbghelp-api_version
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 */
class API_VERSION extends Win32Struct
{
    static sizeof => 8

    static packingSize => 2

    /**
     * The major version number.
     * @type {Integer}
     */
    MajorVersion {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * The minor version number.
     * @type {Integer}
     */
    MinorVersion {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * The revision number.
     * @type {Integer}
     */
    Revision {
        get => NumGet(this, 4, "ushort")
        set => NumPut("ushort", value, this, 4)
    }

    /**
     * This member is reserved for use by the operating system.
     * @type {Integer}
     */
    Reserved {
        get => NumGet(this, 6, "ushort")
        set => NumPut("ushort", value, this, 6)
    }
}
