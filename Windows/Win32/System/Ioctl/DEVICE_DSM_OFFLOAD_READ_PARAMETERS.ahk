#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains parameters for the DeviceDsmAction_OffloadRead action for the IOCTL_STORAGE_MANAGE_DATA_SET_ATTRIBUTES control code.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-device_dsm_offload_read_parameters
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct DEVICE_DSM_OFFLOAD_READ_PARAMETERS {
    #StructPack 4

    /**
     * Set to 0.
     */
    Flags : UInt32

    /**
     * The time to live (TTL) for the token, in milliseconds.
     */
    TimeToLive : UInt32

    /**
     * Set to 0.
     */
    Reserved : UInt32[2]

}
