#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\STORAGE_OFFLOAD_TOKEN.ahk" { STORAGE_OFFLOAD_TOKEN }

/**
 * Specifies parameters for the offload write operation.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-device_dsm_offload_write_parameters
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct DEVICE_DSM_OFFLOAD_WRITE_PARAMETERS {
    #StructPack 8

    /**
     * Set to 0.
     */
    Flags : UInt32

    /**
     * Reserved.
     */
    Reserved : UInt32

    /**
     * The starting offset to copy from the range bound to the token
     */
    TokenOffset : Int64

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ns-winioctl-storage_offload_token">STORAGE_OFFLOAD_TOKEN</a> structure containing 
     *       the token returned from the offload read operation.
     */
    Token : STORAGE_OFFLOAD_TOKEN

}
