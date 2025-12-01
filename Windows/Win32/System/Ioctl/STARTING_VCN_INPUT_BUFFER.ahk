#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains the starting VCN to the FSCTL_GET_RETRIEVAL_POINTERS control code.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-starting_vcn_input_buffer
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class STARTING_VCN_INPUT_BUFFER extends Win32Struct
{
    static sizeof => 8

    static packingSize => 8

    /**
     * The VCN at which 
     * the operation will begin enumerating extents in the file. This value may be rounded down to the first VCN of the extent in which the specified extent is found.
     * @type {Integer}
     */
    StartingVcn {
        get => NumGet(this, 0, "int64")
        set => NumPut("int64", value, this, 0)
    }
}
