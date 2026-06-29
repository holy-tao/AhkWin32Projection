#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains a bitmask of the driver letters that are available on a node. It is used as the return value of the CLUSCTL_RESOURCE_TYPE_STORAGE_GET_DRIVELETTERS control code.
 * @see https://learn.microsoft.com/windows/win32/api/clusapi/ns-clusapi-clus_storage_get_available_driveletters
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct CLUS_STORAGE_GET_AVAILABLE_DRIVELETTERS {
    #StructPack 4

    /**
     * The least significant bit represents the letter 'A' and is set to zero if any partition on the node has that drive letter in use. This convention continues until bit 26, which represents the letter 'Z'. The value of bits 27 through 32 is not defined.
     */
    AvailDrivelettersMask : UInt32

}
