#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * Reserved for system use. (DEVICE_WRITE_AGGREGATION_DESCRIPTOR)
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-device_write_aggregation_descriptor
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct DEVICE_WRITE_AGGREGATION_DESCRIPTOR {
    #StructPack 4

    /**
     * Contains the size, in bytes, of this structure. The value of this member will change as members are added 
     *       to the structure.
     */
    Version : UInt32

    /**
     * Specifies the total size of the descriptor, in bytes.
     */
    Size : UInt32

    /**
     * <b>TRUE</b> if the device benefits from write aggregation.
     */
    BenefitsFromWriteAggregation : BOOLEAN

}
