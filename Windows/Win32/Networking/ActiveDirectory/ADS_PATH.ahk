#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The ADS_PATH structure is an ADSI representation of the Path attribute syntax.
 * @remarks
 * 
  * The <b>Path</b> attribute in represents a file system path.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//iads/ns-iads-ads_path
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class ADS_PATH extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Type of file in the file system.
     * @type {Integer}
     */
    Type {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The null-terminated Unicode string that contains the name of an existing volume in the file system.
     * @type {Pointer<Char>}
     */
    VolumeName {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * The null-terminated Unicode string that contains the path of a directory in the file system.
     * @type {Pointer<Char>}
     */
    Path {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}
