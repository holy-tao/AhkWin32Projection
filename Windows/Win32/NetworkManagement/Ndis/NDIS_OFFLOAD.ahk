#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\NDIS_OBJECT_HEADER.ahk
#Include .\NDIS_TCP_IP_CHECKSUM_OFFLOAD.ahk
#Include .\NDIS_TCP_LARGE_SEND_OFFLOAD_V1.ahk
#Include .\NDIS_IPSEC_OFFLOAD_V1.ahk
#Include .\NDIS_TCP_LARGE_SEND_OFFLOAD_V2.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.Ndis
 * @version v4.0.30319
 */
class NDIS_OFFLOAD extends Win32Struct
{
    static sizeof => 128

    static packingSize => 8

    /**
     * @type {NDIS_OBJECT_HEADER}
     */
    Header{
        get {
            if(!this.HasProp("__Header"))
                this.__Header := NDIS_OBJECT_HEADER(this.ptr + 0)
            return this.__Header
        }
    }

    /**
     * @type {NDIS_TCP_IP_CHECKSUM_OFFLOAD}
     */
    Checksum{
        get {
            if(!this.HasProp("__Checksum"))
                this.__Checksum := NDIS_TCP_IP_CHECKSUM_OFFLOAD(this.ptr + 8)
            return this.__Checksum
        }
    }

    /**
     * @type {NDIS_TCP_LARGE_SEND_OFFLOAD_V1}
     */
    LsoV1{
        get {
            if(!this.HasProp("__LsoV1"))
                this.__LsoV1 := NDIS_TCP_LARGE_SEND_OFFLOAD_V1(this.ptr + 40)
            return this.__LsoV1
        }
    }

    /**
     * @type {NDIS_IPSEC_OFFLOAD_V1}
     */
    IPsecV1{
        get {
            if(!this.HasProp("__IPsecV1"))
                this.__IPsecV1 := NDIS_IPSEC_OFFLOAD_V1(this.ptr + 56)
            return this.__IPsecV1
        }
    }

    /**
     * @type {NDIS_TCP_LARGE_SEND_OFFLOAD_V2}
     */
    LsoV2{
        get {
            if(!this.HasProp("__LsoV2"))
                this.__LsoV2 := NDIS_TCP_LARGE_SEND_OFFLOAD_V2(this.ptr + 88)
            return this.__LsoV2
        }
    }

    /**
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 120, "uint")
        set => NumPut("uint", value, this, 120)
    }
}
