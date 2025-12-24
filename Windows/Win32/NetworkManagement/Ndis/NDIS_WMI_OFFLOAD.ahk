#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\NDIS_OBJECT_HEADER.ahk
#Include .\NDIS_WMI_TCP_IP_CHECKSUM_OFFLOAD.ahk
#Include .\NDIS_WMI_TCP_LARGE_SEND_OFFLOAD_V1.ahk
#Include .\NDIS_WMI_IPSEC_OFFLOAD_V1.ahk
#Include .\NDIS_WMI_TCP_LARGE_SEND_OFFLOAD_V2.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.Ndis
 * @version v4.0.30319
 */
class NDIS_WMI_OFFLOAD extends Win32Struct
{
    static sizeof => 224

    static packingSize => 4

    /**
     * @type {NDIS_OBJECT_HEADER}
     */
    Header{
        get {
            if(!this.HasProp("__Header"))
                this.__Header := NDIS_OBJECT_HEADER(0, this)
            return this.__Header
        }
    }

    /**
     * @type {NDIS_WMI_TCP_IP_CHECKSUM_OFFLOAD}
     */
    Checksum{
        get {
            if(!this.HasProp("__Checksum"))
                this.__Checksum := NDIS_WMI_TCP_IP_CHECKSUM_OFFLOAD(4, this)
            return this.__Checksum
        }
    }

    /**
     * @type {NDIS_WMI_TCP_LARGE_SEND_OFFLOAD_V1}
     */
    LsoV1{
        get {
            if(!this.HasProp("__LsoV1"))
                this.__LsoV1 := NDIS_WMI_TCP_LARGE_SEND_OFFLOAD_V1(92, this)
            return this.__LsoV1
        }
    }

    /**
     * @type {NDIS_WMI_IPSEC_OFFLOAD_V1}
     */
    IPsecV1{
        get {
            if(!this.HasProp("__IPsecV1"))
                this.__IPsecV1 := NDIS_WMI_IPSEC_OFFLOAD_V1(112, this)
            return this.__IPsecV1
        }
    }

    /**
     * @type {NDIS_WMI_TCP_LARGE_SEND_OFFLOAD_V2}
     */
    LsoV2{
        get {
            if(!this.HasProp("__LsoV2"))
                this.__LsoV2 := NDIS_WMI_TCP_LARGE_SEND_OFFLOAD_V2(188, this)
            return this.__LsoV2
        }
    }

    /**
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 220, "uint")
        set => NumPut("uint", value, this, 220)
    }
}
