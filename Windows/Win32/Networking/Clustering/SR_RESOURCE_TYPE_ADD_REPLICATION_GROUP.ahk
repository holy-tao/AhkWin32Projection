#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOLEAN.ahk

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
    EnableWriteConsistency{
        get {
            if(!this.HasProp("__EnableWriteConsistency"))
                this.__EnableWriteConsistency := BOOLEAN(this.ptr + 1580)
            return this.__EnableWriteConsistency
        }
    }

    /**
     * @type {BOOLEAN}
     */
    EnableEncryption{
        get {
            if(!this.HasProp("__EnableEncryption"))
                this.__EnableEncryption := BOOLEAN(this.ptr + 1581)
            return this.__EnableEncryption
        }
    }

    /**
     * @type {BOOLEAN}
     */
    EnableCompression{
        get {
            if(!this.HasProp("__EnableCompression"))
                this.__EnableCompression := BOOLEAN(this.ptr + 1582)
            return this.__EnableCompression
        }
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
