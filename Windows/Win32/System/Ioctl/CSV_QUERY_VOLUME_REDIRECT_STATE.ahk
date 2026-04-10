#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\CSVFS_DISK_CONNECTIVITY.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 */
class CSV_QUERY_VOLUME_REDIRECT_STATE extends Win32Struct {
    static sizeof => 16

    static packingSize => 4

    /**
     * @type {Integer}
     */
    MdsNodeId {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    DsNodeId {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {BOOLEAN}
     */
    IsDiskConnected {
        get => NumGet(this, 8, "char")
        set => NumPut("char", value, this, 8)
    }

    /**
     * @type {BOOLEAN}
     */
    ClusterEnableDirectIo {
        get => NumGet(this, 9, "char")
        set => NumPut("char", value, this, 9)
    }

    /**
     * @type {CSVFS_DISK_CONNECTIVITY}
     */
    DiskConnectivity {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }
}
