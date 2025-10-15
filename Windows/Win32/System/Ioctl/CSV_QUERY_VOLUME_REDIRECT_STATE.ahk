#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOLEAN.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class CSV_QUERY_VOLUME_REDIRECT_STATE extends Win32Struct
{
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
    IsDiskConnected{
        get {
            if(!this.HasProp("__IsDiskConnected"))
                this.__IsDiskConnected := BOOLEAN(this.ptr + 8)
            return this.__IsDiskConnected
        }
    }

    /**
     * @type {BOOLEAN}
     */
    ClusterEnableDirectIo{
        get {
            if(!this.HasProp("__ClusterEnableDirectIo"))
                this.__ClusterEnableDirectIo := BOOLEAN(this.ptr + 9)
            return this.__ClusterEnableDirectIo
        }
    }

    /**
     * @type {Integer}
     */
    DiskConnectivity {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }
}
