#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\OFFLOAD_ALGO_INFO.ahk
#Include .\OFFLOAD_SECURITY_ASSOCIATION.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.Ndis
 * @version v4.0.30319
 */
class OFFLOAD_IPSEC_ADD_SA extends Win32Struct
{
    static sizeof => 80

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
    DestAddr {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    DestMask {
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
    DestPort {
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
    DestTunnelAddr {
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
     * @type {Pointer<HANDLE>}
     */
    OffloadHandle {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * @type {Integer}
     */
    KeyLen {
        get => NumGet(this, 72, "uint")
        set => NumPut("uint", value, this, 72)
    }

    /**
     * @type {Array<Byte>}
     */
    KeyMat{
        get {
            if(!this.HasProp("__KeyMatProxyArray"))
                this.__KeyMatProxyArray := Win32FixedArray(this.ptr + 76, 1, Primitive, "char")
            return this.__KeyMatProxyArray
        }
    }
}
