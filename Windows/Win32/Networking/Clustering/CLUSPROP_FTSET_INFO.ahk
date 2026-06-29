#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CLUSPROP_VALUE.ahk" { CLUSPROP_VALUE }
#Import ".\CLUS_FTSET_INFO.ahk" { CLUS_FTSET_INFO }
#Import ".\CLUSPROP_SYNTAX.ahk" { CLUSPROP_SYNTAX }

/**
 * Contains information about an FT (fault tolerant) set. It is used as an entry in a value list and consists of a CLUSPROP_VALUE and a CLUS_FTSET_INFO structure.
 * @see https://learn.microsoft.com/windows/win32/api/clusapi/ns-clusapi-clusprop_ftset_info
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct CLUSPROP_FTSET_INFO {
    #StructPack 4

    Base : CLUSPROP_VALUE

    Base2 : CLUS_FTSET_INFO

}
