#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DNS_RECORD_FLAGS.ahk
#Include .\DNS_RECORDA.ahk
#Include .\DNS_OPT_DATA.ahk
#Include ..\..\Foundation\PSTR.ahk
#Include .\DNS_HEADER_EXT.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.Dns
 */
class _DnsRecordOptA extends Win32Struct {
    static sizeof => 40

    static packingSize => 8

    class _Flags extends Win32Struct {
        static sizeof => 4
        static packingSize => 4

        /**
         * @type {Integer}
         */
        DW {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }

        /**
         * @type {DNS_RECORD_FLAGS}
         */
        S {
            get {
                if(!this.HasProp("__S"))
                    this.__S := DNS_RECORD_FLAGS(0, this)
                return this.__S
            }
        }
    }

    class _Data extends Win32Struct {
        static sizeof => 6
        static packingSize => 2

        /**
         * @type {DNS_OPT_DATA}
         */
        OPT {
            get {
                if(!this.HasProp("__OPT"))
                    this.__OPT := DNS_OPT_DATA(0, this)
                return this.__OPT
            }
        }
    }

    /**
     * @type {Pointer<DNS_RECORDA>}
     */
    pNext {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {PSTR}
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
     * @type {_Flags}
     */
    Flags {
        get {
            if(!this.HasProp("__Flags"))
                this.__Flags := _DnsRecordOptA._Flags(20, this)
            return this.__Flags
        }
    }

    /**
     * @type {DNS_HEADER_EXT}
     */
    ExtHeader {
        get {
            if(!this.HasProp("__ExtHeader"))
                this.__ExtHeader := DNS_HEADER_EXT(24, this)
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
     * @type {_Data}
     */
    Data {
        get {
            if(!this.HasProp("__Data"))
                this.__Data := _DnsRecordOptA._Data(32, this)
            return this.__Data
        }
    }
}
