#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct SR_RESOURCE_TYPE_ADD_REPLICATION_GROUP_RESULT {
    #StructPack 4

    Result : UInt32

    ErrorString : WCHAR[260]

}
