#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the physical device data of a storage node.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-storage_physical_node_data
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct STORAGE_PHYSICAL_NODE_DATA {
    #StructPack 4

    /**
     * The hardware ID of the storage node.
     */
    NodeId : UInt32

    /**
     * A value of 0 or 1 that indicates the adapter count in the storage node.
     */
    AdapterCount : UInt32

    /**
     * The data length of the storage adapter in the storage node,  in units of kilobytes (1024 bytes).
     */
    AdapterDataLength : UInt32

    /**
     * The data offset from the beginning of the data structure. The buffer contains an array of <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ns-winioctl-storage_physical_adapter_data">STORAGE_PHYSICAL_ADAPTER_DATA</a>.
     */
    AdapterDataOffset : UInt32

    /**
     * A value less than or equal to 1.
     */
    DeviceCount : UInt32

    /**
     * The data length of the storage device in the storage node,  in units of kilobytes (1024 bytes).
     */
    DeviceDataLength : UInt32

    /**
     * The data offset from the beginning of the data structure. The buffer contains an array of <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ns-winioctl-storage_physical_device_data">STORAGE_PHYSICAL_DEVICE_DATA</a>.
     */
    DeviceDataOffset : UInt32

    /**
     * Specifies if the storage adapter is reserved.
     */
    Reserved : UInt32[3]

}
