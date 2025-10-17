#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HANDLE.ahk

/**
 * Contains parameters for the FSCTL_DUPLICATE_EXTENTS control code that performs the Block Cloning operation.
 * @see https://docs.microsoft.com/windows/win32/api//winioctl/ns-winioctl-duplicate_extents_data
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class DUPLICATE_EXTENTS_DATA extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * A handle to the source file from which the byte range is to be copied.
     * To retrieve a file handle, use the <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-createfilea">CreateFile</a> function.
     * @type {HANDLE}
     */
    FileHandle{
        get {
            if(!this.HasProp("__FileHandle"))
                this.__FileHandle := HANDLE(0, this)
            return this.__FileHandle
        }
    }

    /**
     * The offset, in bytes, to the beginning of the range to copy from the source file.
     * @type {Integer}
     */
    SourceFileOffset {
        get => NumGet(this, 8, "int64")
        set => NumPut("int64", value, this, 8)
    }

    /**
     * The offset, in bytes, to place the copied byte range in the destination file.
     * @type {Integer}
     */
    TargetFileOffset {
        get => NumGet(this, 16, "int64")
        set => NumPut("int64", value, this, 16)
    }

    /**
     * The length, in bytes, of the range to copy.
     * @type {Integer}
     */
    ByteCount {
        get => NumGet(this, 24, "int64")
        set => NumPut("int64", value, this, 24)
    }
}
