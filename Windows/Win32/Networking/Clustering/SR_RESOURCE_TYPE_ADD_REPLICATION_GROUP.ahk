#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class SR_RESOURCE_TYPE_ADD_REPLICATION_GROUP extends Win32Struct
{
    static sizeof => 2632

    static packingSize => 8

    /**
     * @type {String}
     */
    ReplicationGroupName {
        get => StrGet(this.ptr + 0, 259, "UTF-16")
        set => StrPut(value, this.ptr + 0, 259, "UTF-16")
    }

    /**
     * @type {String}
     */
    Description {
        get => StrGet(this.ptr + 520, 259, "UTF-16")
        set => StrPut(value, this.ptr + 520, 259, "UTF-16")
    }

    /**
     * @type {String}
     */
    LogPath {
        get => StrGet(this.ptr + 1040, 259, "UTF-16")
        set => StrPut(value, this.ptr + 1040, 259, "UTF-16")
    }

    /**
     * @type {Integer}
     */
    MaxLogSizeInBytes {
        get => NumGet(this, 1560, "uint")
        set => NumPut("uint", value, this, 1560)
    }

    /**
     * @type {Integer}
     */
    LogType {
        get => NumGet(this, 1568, "ushort")
        set => NumPut("ushort", value, this, 1568)
    }

    /**
     * @type {Integer}
     */
    ReplicationMode {
        get => NumGet(this, 1572, "uint")
        set => NumPut("uint", value, this, 1572)
    }

    /**
     * @type {Integer}
     */
    MinimumPartnersInSync {
        get => NumGet(this, 1576, "uint")
        set => NumPut("uint", value, this, 1576)
    }

    /**
     * @type {BOOLEAN}
     */
    EnableWriteConsistency {
        get => NumGet(this, 1580, "char")
        set => NumPut("char", value, this, 1580)
    }

    /**
     * @type {BOOLEAN}
     */
    EnableEncryption {
        get => NumGet(this, 1581, "char")
        set => NumPut("char", value, this, 1581)
    }

    /**
     * @type {BOOLEAN}
     */
    EnableCompression {
        get => NumGet(this, 1582, "char")
        set => NumPut("char", value, this, 1582)
    }

    /**
     * @type {String}
     */
    CertificateThumbprint {
        get => StrGet(this.ptr + 1584, 259, "UTF-16")
        set => StrPut(value, this.ptr + 1584, 259, "UTF-16")
    }

    /**
     * @type {Integer}
     */
    VolumeNameCount {
        get => NumGet(this, 2104, "uint")
        set => NumPut("uint", value, this, 2104)
    }

    /**
     * @type {String}
     */
    VolumeNames {
        get => StrGet(this.ptr + 2108, 259, "UTF-16")
        set => StrPut(value, this.ptr + 2108, 259, "UTF-16")
    }
}
