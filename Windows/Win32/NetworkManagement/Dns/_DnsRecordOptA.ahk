#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DNS_HEADER_EXT.ahk
#Include .\DNS_OPT_DATA.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.Dns
 * @version v4.0.30319
 */
class _DnsRecordOptA extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * @type {Pointer<DNS_RECORDA>}
     */
    pNext {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Pointer<PSTR>}
     */
    pName {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    wType {
        get => NumGet(this, 16, "ushort")
        set => NumPut("ushort", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    wDataLength {
        get => NumGet(this, 18, "ushort")
        set => NumPut("ushort", value, this, 18)
    }

    /**
     * @type {Integer}
     */
    DW {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * @type {Integer}
     */
    S {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * @type {DNS_HEADER_EXT}
     */
    ExtHeader{
        get {
            if(!this.HasProp("__ExtHeader"))
                this.__ExtHeader := DNS_HEADER_EXT(this.ptr + 24)
            return this.__ExtHeader
        }
    }

    /**
     * @type {Integer}
     */
    wPayloadSize {
        get => NumGet(this, 28, "ushort")
        set => NumPut("ushort", value, this, 28)
    }

    /**
     * @type {Integer}
     */
    wReserved {
        get => NumGet(this, 30, "ushort")
        set => NumPut("ushort", value, this, 30)
    }

    /**
     * @type {DNS_OPT_DATA}
     */
    OPT{
        get {
            if(!this.HasProp("__OPT"))
                this.__OPT := DNS_OPT_DATA(this.ptr + 36)
            return this.__OPT
        }
    }

    /**
     * @type {DNS_OPT_DATA}
     */
    Opt1{
        get {
            if(!this.HasProp("__Opt1"))
                this.__Opt1 := DNS_OPT_DATA(this.ptr + 36)
            return this.__Opt1
        }
    }
}
