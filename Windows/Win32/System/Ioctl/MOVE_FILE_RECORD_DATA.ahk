#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HANDLE.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class MOVE_FILE_RECORD_DATA extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {HANDLE}
     */
    FileHandle{
        get {
            if(!this.HasProp("__FileHandle"))
                this.__FileHandle := HANDLE(this.ptr + 0)
            return this.__FileHandle
        }
    }

    /**
     * @type {Integer}
     */
    SourceFileRecord {
        get => NumGet(this, 8, "int64")
        set => NumPut("int64", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    TargetFileRecord {
        get => NumGet(this, 16, "int64")
        set => NumPut("int64", value, this, 16)
    }
}
