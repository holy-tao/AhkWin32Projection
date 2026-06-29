#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CSVFS_DISK_CONNECTIVITY.ahk" { CSVFS_DISK_CONNECTIVITY }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct CSV_QUERY_MDS_PATH_V2 {
    #StructPack 8

    Version : Int64

    RequiredSize : UInt32

    MdsNodeId : UInt32

    DsNodeId : UInt32

    Flags : UInt32

    DiskConnectivity : CSVFS_DISK_CONNECTIVITY

    VolumeId : Guid

    IpAddressOffset : UInt32

    IpAddressLength : UInt32

    PathOffset : UInt32

    PathLength : UInt32

}
