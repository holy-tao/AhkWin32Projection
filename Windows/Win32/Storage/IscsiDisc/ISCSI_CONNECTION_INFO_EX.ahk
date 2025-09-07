#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\ISCSI_UNIQUE_SESSION_ID.ahk

/**
 * @namespace Windows.Win32.Storage.IscsiDisc
 * @version v4.0.30319
 */
class ISCSI_CONNECTION_INFO_EX extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * @type {ISCSI_UNIQUE_SESSION_ID}
     */
    ConnectionId{
        get {
            if(!this.HasProp("__ConnectionId"))
                this.__ConnectionId := ISCSI_UNIQUE_SESSION_ID(this.ptr + 0)
            return this.__ConnectionId
        }
    }

    /**
     * @type {Integer}
     */
    State {
        get => NumGet(this, 16, "char")
        set => NumPut("char", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    Protocol {
        get => NumGet(this, 17, "char")
        set => NumPut("char", value, this, 17)
    }

    /**
     * @type {Integer}
     */
    HeaderDigest {
        get => NumGet(this, 18, "char")
        set => NumPut("char", value, this, 18)
    }

    /**
     * @type {Integer}
     */
    DataDigest {
        get => NumGet(this, 19, "char")
        set => NumPut("char", value, this, 19)
    }

    /**
     * @type {Integer}
     */
    MaxRecvDataSegmentLength {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * @type {Integer}
     */
    AuthType {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    EstimatedThroughput {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    MaxDatagramSize {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }
}
