#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOLEAN.ahk
#Include ..\..\Foundation\HANDLE.ahk

/**
 * Contains the name to which the file should be renamed.
 * @see https://docs.microsoft.com/windows/win32/api//winbase/ns-winbase-file_rename_info
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class FILE_RENAME_INFO extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {BOOLEAN}
     */
    ReplaceIfExists{
        get {
            if(!this.HasProp("__ReplaceIfExists"))
                this.__ReplaceIfExists := BOOLEAN(this.ptr + 0)
            return this.__ReplaceIfExists
        }
    }

    /**
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A handle to the root directory in which the file to be renamed is located.
     * @type {HANDLE}
     */
    RootDirectory{
        get {
            if(!this.HasProp("__RootDirectory"))
                this.__RootDirectory := HANDLE(this.ptr + 8)
            return this.__RootDirectory
        }
    }

    /**
     * The size of <b>FileName</b> in bytes.
     * @type {Integer}
     */
    FileNameLength {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * The new file name.
     * @type {String}
     */
    FileName {
        get => StrGet(this.ptr + 20, 0, "UTF-16")
        set => StrPut(value, this.ptr + 20, 0, "UTF-16")
    }
}
