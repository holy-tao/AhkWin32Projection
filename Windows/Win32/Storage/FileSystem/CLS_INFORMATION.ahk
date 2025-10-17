#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\CLS_LSN.ahk

/**
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class CLS_INFORMATION extends Win32Struct
{
    static sizeof => 112

    static packingSize => 8

    /**
     * @type {Integer}
     */
    TotalAvailable {
        get => NumGet(this, 0, "int64")
        set => NumPut("int64", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    CurrentAvailable {
        get => NumGet(this, 8, "int64")
        set => NumPut("int64", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    TotalReservation {
        get => NumGet(this, 16, "int64")
        set => NumPut("int64", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    BaseFileSize {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    ContainerSize {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    TotalContainers {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * @type {Integer}
     */
    FreeContainers {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }

    /**
     * @type {Integer}
     */
    TotalClients {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * @type {Integer}
     */
    Attributes {
        get => NumGet(this, 52, "uint")
        set => NumPut("uint", value, this, 52)
    }

    /**
     * @type {Integer}
     */
    FlushThreshold {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * @type {Integer}
     */
    SectorSize {
        get => NumGet(this, 60, "uint")
        set => NumPut("uint", value, this, 60)
    }

    /**
     * @type {CLS_LSN}
     */
    MinArchiveTailLsn{
        get {
            if(!this.HasProp("__MinArchiveTailLsn"))
                this.__MinArchiveTailLsn := CLS_LSN(64, this)
            return this.__MinArchiveTailLsn
        }
    }

    /**
     * @type {CLS_LSN}
     */
    BaseLsn{
        get {
            if(!this.HasProp("__BaseLsn"))
                this.__BaseLsn := CLS_LSN(72, this)
            return this.__BaseLsn
        }
    }

    /**
     * @type {CLS_LSN}
     */
    LastFlushedLsn{
        get {
            if(!this.HasProp("__LastFlushedLsn"))
                this.__LastFlushedLsn := CLS_LSN(80, this)
            return this.__LastFlushedLsn
        }
    }

    /**
     * @type {CLS_LSN}
     */
    LastLsn{
        get {
            if(!this.HasProp("__LastLsn"))
                this.__LastLsn := CLS_LSN(88, this)
            return this.__LastLsn
        }
    }

    /**
     * @type {CLS_LSN}
     */
    RestartLsn{
        get {
            if(!this.HasProp("__RestartLsn"))
                this.__RestartLsn := CLS_LSN(96, this)
            return this.__RestartLsn
        }
    }

    /**
     * @type {Pointer<Guid>}
     */
    Identity {
        get => NumGet(this, 104, "ptr")
        set => NumPut("ptr", value, this, 104)
    }
}
