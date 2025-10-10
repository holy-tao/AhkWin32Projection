#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information about a file that the OpenFile function opened or attempted to open.
 * @see https://docs.microsoft.com/windows/win32/api//winbase/ns-winbase-ofstruct
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class OFSTRUCT extends Win32Struct
{
    static sizeof => 264

    static packingSize => 2

    /**
     * The size of the structure, in bytes.
     * @type {Integer}
     */
    cBytes {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * If this member is nonzero, the file is on a hard (fixed) disk. Otherwise, it is not.
     * @type {Integer}
     */
    fFixedDisk {
        get => NumGet(this, 1, "char")
        set => NumPut("char", value, this, 1)
    }

    /**
     * The MS-DOS error code if the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-openfile">OpenFile</a> function failed.
     * @type {Integer}
     */
    nErrCode {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * Reserved; do not use.
     * @type {Integer}
     */
    Reserved1 {
        get => NumGet(this, 4, "ushort")
        set => NumPut("ushort", value, this, 4)
    }

    /**
     * Reserved; do not use.
     * @type {Integer}
     */
    Reserved2 {
        get => NumGet(this, 6, "ushort")
        set => NumPut("ushort", value, this, 6)
    }

    /**
     * The path and file name of the file.
     * @type {String}
     */
    szPathName {
        get => StrGet(this.ptr + 8, 127, "UTF-16")
        set => StrPut(value, this.ptr + 8, 127, "UTF-16")
    }
}
