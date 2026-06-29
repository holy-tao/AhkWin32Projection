#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CLUSPROP_VALUE.ahk" { CLUSPROP_VALUE }
#Import ".\CLUS_PARTITION_INFO_EX.ahk" { CLUS_PARTITION_INFO_EX }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\CLUSPROP_SYNTAX.ahk" { CLUSPROP_SYNTAX }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * The CLUSPROP_PARTITION_INFO_EX structure contains information relevant to storage class resources.
 * @see https://learn.microsoft.com/windows/win32/api/clusapi/ns-clusapi-clusprop_partition_info_ex
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct CLUSPROP_PARTITION_INFO_EX {
    #StructPack 8

    Base : CLUSPROP_VALUE

    Base2 : CLUS_PARTITION_INFO_EX

}
