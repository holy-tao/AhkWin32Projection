#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains the output for the FSCTL_GET_RETRIEVAL_POINTER_BASE control code.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-retrieval_pointer_base
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class RETRIEVAL_POINTER_BASE extends Win32Struct
{
    static sizeof => 8

    static packingSize => 8

    /**
     * The volume-relative sector offset to the first allocatable unit on the file system, also referred to as the base of the cluster heap.
     * @type {Integer}
     */
    FileAreaOffset {
        get => NumGet(this, 0, "int64")
        set => NumPut("int64", value, this, 0)
    }
}
