#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains the starting LCN to the FSCTL_GET_VOLUME_BITMAP control code.
 * @see https://docs.microsoft.com/windows/win32/api//winioctl/ns-winioctl-starting_lcn_input_buffer
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class STARTING_LCN_INPUT_BUFFER extends Win32Struct
{
    static sizeof => 8

    static packingSize => 8

    /**
     * The LCN from which the operation should start when describing a bitmap. This member will be rounded down to a file-system-dependent rounding boundary, and that value will be returned. Its  value should be an integral multiple of eight.
     * @type {Integer}
     */
    StartingLcn {
        get => NumGet(this, 0, "int64")
        set => NumPut("int64", value, this, 0)
    }
}
