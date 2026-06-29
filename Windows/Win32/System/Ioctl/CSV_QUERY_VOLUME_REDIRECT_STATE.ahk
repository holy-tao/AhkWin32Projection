#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import ".\CSVFS_DISK_CONNECTIVITY.ahk" { CSVFS_DISK_CONNECTIVITY }

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct CSV_QUERY_VOLUME_REDIRECT_STATE {
    #StructPack 4

    MdsNodeId : UInt32

    DsNodeId : UInt32

    IsDiskConnected : BOOLEAN

    ClusterEnableDirectIo : BOOLEAN

    DiskConnectivity : CSVFS_DISK_CONNECTIVITY

}
