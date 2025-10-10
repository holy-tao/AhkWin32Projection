#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains the output for the FSCTL_GET_RETRIEVAL_POINTERS control code.
 * @see https://docs.microsoft.com/windows/win32/api//winioctl/ns-winioctl-retrieval_pointers_buffer
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class RETRIEVAL_POINTERS_BUFFER extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * The count of elements in the <b>Extents</b> array.
     * @type {Integer}
     */
    ExtentCount {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The starting VCN returned by the function call. This is not necessarily the VCN requested by the function call, as the file system driver may round down to the first VCN of the extent in which the requested starting VCN is found.
     * @type {Integer}
     */
    StartingVcn {
        get => NumGet(this, 8, "int64")
        set => NumPut("int64", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    NextVcn {
        get => NumGet(this, 16, "int64")
        set => NumPut("int64", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    Lcn {
        get => NumGet(this, 24, "int64")
        set => NumPut("int64", value, this, 24)
    }
}
