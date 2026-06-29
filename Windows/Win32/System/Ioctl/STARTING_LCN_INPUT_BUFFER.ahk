#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains the starting LCN to the FSCTL_GET_VOLUME_BITMAP control code.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-starting_lcn_input_buffer
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct STARTING_LCN_INPUT_BUFFER {
    #StructPack 8

    /**
     * The LCN from which the operation should start when describing a bitmap. This member will be rounded down to a file-system-dependent rounding boundary, and that value will be returned. Its  value should be an integral multiple of eight.
     */
    StartingLcn : Int64

}
