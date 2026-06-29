#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * Describes the disk partition information of a storage class resource.
 * @see https://learn.microsoft.com/windows/win32/api/clusapi/ns-clusapi-clus_partition_info_ex2
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct CLUS_PARTITION_INFO_EX2 {
    #StructPack 4

    /**
     * The globally unique identifier (GUID) of the partition.
     */
    GptPartitionId : Guid

    /**
     * The name of the partition.
     */
    szPartitionName : WCHAR[260]

    /**
     * A flag that indicates whether BitLocker encryption is enabled on the partition.
     */
    EncryptionFlags : UInt32

}
