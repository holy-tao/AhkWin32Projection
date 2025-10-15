#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\ISCSI_UNIQUE_SESSION_ID.ahk
#Include ..\..\Foundation\BOOLEAN.ahk

/**
 * @namespace Windows.Win32.Storage.IscsiDisc
 * @version v4.0.30319
 */
class ISCSI_SESSION_INFO_EX extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
     * @type {ISCSI_UNIQUE_SESSION_ID}
     */
    SessionId{
        get {
            if(!this.HasProp("__SessionId"))
                this.__SessionId := ISCSI_UNIQUE_SESSION_ID(this.ptr + 0)
            return this.__SessionId
        }
    }

    /**
     * @type {BOOLEAN}
     */
    InitialR2t{
        get {
            if(!this.HasProp("__InitialR2t"))
                this.__InitialR2t := BOOLEAN(this.ptr + 16)
            return this.__InitialR2t
        }
    }

    /**
     * @type {BOOLEAN}
     */
    ImmediateData{
        get {
            if(!this.HasProp("__ImmediateData"))
                this.__ImmediateData := BOOLEAN(this.ptr + 17)
            return this.__ImmediateData
        }
    }

    /**
     * @type {Integer}
     */
    Type {
        get => NumGet(this, 18, "char")
        set => NumPut("char", value, this, 18)
    }

    /**
     * @type {BOOLEAN}
     */
    DataSequenceInOrder{
        get {
            if(!this.HasProp("__DataSequenceInOrder"))
                this.__DataSequenceInOrder := BOOLEAN(this.ptr + 19)
            return this.__DataSequenceInOrder
        }
    }

    /**
     * @type {BOOLEAN}
     */
    DataPduInOrder{
        get {
            if(!this.HasProp("__DataPduInOrder"))
                this.__DataPduInOrder := BOOLEAN(this.ptr + 20)
            return this.__DataPduInOrder
        }
    }

    /**
     * @type {Integer}
     */
    ErrorRecoveryLevel {
        get => NumGet(this, 21, "char")
        set => NumPut("char", value, this, 21)
    }

    /**
     * @type {Integer}
     */
    MaxOutstandingR2t {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    FirstBurstLength {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * @type {Integer}
     */
    MaxBurstLength {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    MaximumConnections {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * @type {Integer}
     */
    ConnectionCount {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * @type {Pointer<ISCSI_CONNECTION_INFO_EX>}
     */
    Connections {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }
}
