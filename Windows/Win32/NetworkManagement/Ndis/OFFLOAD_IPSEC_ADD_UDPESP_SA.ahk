#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\OFFLOAD_ALGO_INFO.ahk
#Include .\OFFLOAD_SECURITY_ASSOCIATION.ahk
#Include ..\..\Foundation\HANDLE.ahk
#Include .\OFFLOAD_IPSEC_UDPESP_ENCAPTYPE_ENTRY.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.Ndis
 * @version v4.0.30319
 */
class OFFLOAD_IPSEC_ADD_UDPESP_SA extends Win32Struct
{
    static sizeof => 96

    static packingSize => 8

    /**
     * @type {Integer}
     */
    SrcAddr {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    SrcMask {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    DstAddr {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    DstMask {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    Protocol {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    SrcPort {
        get => NumGet(this, 20, "ushort")
        set => NumPut("ushort", value, this, 20)
    }

    /**
     * @type {Integer}
     */
    DstPort {
        get => NumGet(this, 22, "ushort")
        set => NumPut("ushort", value, this, 22)
    }

    /**
     * @type {Integer}
     */
    SrcTunnelAddr {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    DstTunnelAddr {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 32, "ushort")
        set => NumPut("ushort", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    NumSAs {
        get => NumGet(this, 34, "short")
        set => NumPut("short", value, this, 34)
    }

    /**
     * @type {Array<OFFLOAD_SECURITY_ASSOCIATION>}
     */
    SecAssoc{
        get {
            if(!this.HasProp("__SecAssocProxyArray"))
                this.__SecAssocProxyArray := Win32FixedArray(this.ptr + 40, 3, OFFLOAD_SECURITY_ASSOCIATION, "")
            return this.__SecAssocProxyArray
        }
    }

    /**
     * @type {HANDLE}
     */
    OffloadHandle{
        get {
            if(!this.HasProp("__OffloadHandle"))
                this.__OffloadHandle := HANDLE(this.ptr + 64)
            return this.__OffloadHandle
        }
    }

    /**
     * @type {OFFLOAD_IPSEC_UDPESP_ENCAPTYPE_ENTRY}
     */
    EncapTypeEntry{
        get {
            if(!this.HasProp("__EncapTypeEntry"))
                this.__EncapTypeEntry := OFFLOAD_IPSEC_UDPESP_ENCAPTYPE_ENTRY(this.ptr + 72)
            return this.__EncapTypeEntry
        }
    }

    /**
     * @type {HANDLE}
     */
    EncapTypeEntryOffldHandle{
        get {
            if(!this.HasProp("__EncapTypeEntryOffldHandle"))
                this.__EncapTypeEntryOffldHandle := HANDLE(this.ptr + 80)
            return this.__EncapTypeEntryOffldHandle
        }
    }

    /**
     * @type {Integer}
     */
    KeyLen {
        get => NumGet(this, 88, "uint")
        set => NumPut("uint", value, this, 88)
    }

    /**
     * @type {Array<Byte>}
     */
    KeyMat{
        get {
            if(!this.HasProp("__KeyMatProxyArray"))
                this.__KeyMatProxyArray := Win32FixedArray(this.ptr + 92, 1, Primitive, "char")
            return this.__KeyMatProxyArray
        }
    }
}
