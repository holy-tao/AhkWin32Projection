#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32Struct.ahk

/**
 * Represents the package version info.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.packageversion
 * @namespace Windows.ApplicationModel
 * @version WindowsRuntime 1.4
 */
class PackageVersion extends Win32Struct
{
    static sizeof => 8

    static packingSize => 2

    /**
     * The major version number of the package.
     * @type {Integer}
     */
    Major {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * The minor version number of the package.
     * @type {Integer}
     */
    Minor {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * The build version number of the package.
     * @type {Integer}
     */
    Build {
        get => NumGet(this, 4, "ushort")
        set => NumPut("ushort", value, this, 4)
    }

    /**
     * The revision version number of the package.
     * @type {Integer}
     */
    Revision {
        get => NumGet(this, 6, "ushort")
        set => NumPut("ushort", value, this, 6)
    }
}
