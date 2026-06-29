#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains the copy offload capabilities for a storage device.
 * @remarks
 * This structure is returned from a 
 *     <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ni-winioctl-ioctl_storage_query_property">IOCTL_STORAGE_QUERY_PROPERTY</a> request when the 
 *     <b>PropertyId</b> member of 
 *     <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ns-winioctl-storage_property_query">STORAGE_PROPERTY_QUERY</a> is set to 
 *     <b>StorageDeviceCopyOffloadProperty</b>.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-device_copy_offload_descriptor
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct DEVICE_COPY_OFFLOAD_DESCRIPTOR {
    #StructPack 8

    /**
     * Contains the size of this structure, in bytes. The value of this member will change as members are added to 
     *       the structure.
     */
    Version : UInt32

    /**
     * Specifies the total size of the data returned, in bytes. This may include data that follows this 
     *       structure.
     */
    Size : UInt32

    /**
     * The maximum lifetime of the token, in seconds.
     */
    MaximumTokenLifetime : UInt32

    /**
     * The default lifetime of the token, in seconds.
     */
    DefaultTokenLifetime : UInt32

    /**
     * The maximum transfer size, in bytes.
     */
    MaximumTransferSize : Int64

    /**
     * The optimal transfer size, in bytes.
     */
    OptimalTransferCount : Int64

    /**
     * The maximum number of data descriptors.
     */
    MaximumDataDescriptors : UInt32

    /**
     * The maximum transfer length, in blocks, per descriptor.
     */
    MaximumTransferLengthPerDescriptor : UInt32

    /**
     * The optimal transfer length per descriptor.
     */
    OptimalTransferLengthPerDescriptor : UInt32

    /**
     * The granularity of the optimal transfer length, in blocks. Transfer lengths that are not an even multiple 
     *       of this length may be delayed.
     */
    OptimalTransferLengthGranularity : UInt16

    /**
     * Reserved.
     */
    Reserved : Int8[2]

}
