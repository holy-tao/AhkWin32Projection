#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The EMI_METADATA_SIZE structure specifies the size of the Energy Metering Interface (EMI) metadata object that can be obtained from the device by issuing an IOCTL_EMI_GET_METADATA request.
 * @remarks
 * This structure is returned through a successful completion of an <a href="https://docs.microsoft.com/windows/desktop/api/emi/ni-emi-ioctl_emi_get_metadata_size">IOCTL_EMI_GET_METADATA_SIZE</a> IOCTL request.
 * @see https://learn.microsoft.com/windows/win32/api/emi/ns-emi-emi_metadata_size
 * @namespace Windows.Win32.System.Power
 */
export default struct EMI_METADATA_SIZE {
    #StructPack 4

    /**
     * The size of the  EMI metadata (an [EMI_METADATA](./ns-emi-emi_metadata_v1.md) structure) that can be obtained from the device.
     */
    MetadataSize : UInt32

}
