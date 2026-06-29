#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct SR_RESOURCE_TYPE_ADD_REPLICATION_GROUP {
    #StructPack 8

    ReplicationGroupName : WCHAR[260]

    Description : WCHAR[260]

    LogPath : WCHAR[260]

    MaxLogSizeInBytes : Int64

    LogType : UInt16

    ReplicationMode : UInt32

    MinimumPartnersInSync : UInt32

    EnableWriteConsistency : BOOLEAN

    EnableEncryption : BOOLEAN

    EnableCompression : BOOLEAN

    CertificateThumbprint : WCHAR[260]

    VolumeNameCount : UInt32

    VolumeNames : WCHAR[260]

}
