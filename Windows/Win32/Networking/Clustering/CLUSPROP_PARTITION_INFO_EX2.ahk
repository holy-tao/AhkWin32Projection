#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CLUS_PARTITION_INFO_EX2.ahk" { CLUS_PARTITION_INFO_EX2 }
#Import ".\CLUSPROP_VALUE.ahk" { CLUSPROP_VALUE }
#Import ".\CLUSPROP_PARTITION_INFO_EX.ahk" { CLUSPROP_PARTITION_INFO_EX }
#Import ".\CLUS_PARTITION_INFO_EX.ahk" { CLUS_PARTITION_INFO_EX }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\CLUSPROP_SYNTAX.ahk" { CLUSPROP_SYNTAX }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * A value list entry that contains partition information for a storage class resource. This structure is as a input, and a as a return value for the CLUSCTL_RESOURCE_STORAGE_GET_DISK_INFO_EX2 control code.
 * @see https://learn.microsoft.com/windows/win32/api/clusapi/ns-clusapi-clusprop_partition_info_ex2
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct CLUSPROP_PARTITION_INFO_EX2 {
    #StructPack 8

    Base : CLUSPROP_PARTITION_INFO_EX

    Base2 : CLUS_PARTITION_INFO_EX2

}
