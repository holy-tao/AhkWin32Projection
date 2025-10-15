#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOLEAN.ahk

/**
 * Receives extended information for the file.
 * @see https://docs.microsoft.com/windows/win32/api//winbase/ns-winbase-file_standard_info
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class FILE_STANDARD_INFO extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * The amount of space that is allocated for the file.
     * @type {Integer}
     */
    AllocationSize {
        get => NumGet(this, 0, "int64")
        set => NumPut("int64", value, this, 0)
    }

    /**
     * The end of the file.
     * @type {Integer}
     */
    EndOfFile {
        get => NumGet(this, 8, "int64")
        set => NumPut("int64", value, this, 8)
    }

    /**
     * The number of links to the file.
     * @type {Integer}
     */
    NumberOfLinks {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * <b>TRUE</b> if the file in the delete queue; otherwise, 
     *       <b>false</b>.
     * @type {BOOLEAN}
     */
    DeletePending{
        get {
            if(!this.HasProp("__DeletePending"))
                this.__DeletePending := BOOLEAN(this.ptr + 20)
            return this.__DeletePending
        }
    }

    /**
     * <b>TRUE</b> if  the  file is a directory; otherwise, 
     *       <b>false</b>.
     * @type {BOOLEAN}
     */
    Directory{
        get {
            if(!this.HasProp("__Directory"))
                this.__Directory := BOOLEAN(this.ptr + 21)
            return this.__Directory
        }
    }
}
