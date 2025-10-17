#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\NFC_SE_TECH_ROUTING_INFO.ahk
#Include .\NFC_SE_PROTO_ROUTING_INFO.ahk
#Include .\NFC_SE_AID_ROUTING_INFO.ahk

/**
 * @namespace Windows.Win32.Devices.Nfc
 * @version v4.0.30319
 */
class NFC_SE_ROUTING_TABLE_ENTRY extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * @type {Integer}
     */
    eRoutingType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {NFC_SE_TECH_ROUTING_INFO}
     */
    TechRoutingInfo{
        get {
            if(!this.HasProp("__TechRoutingInfo"))
                this.__TechRoutingInfo := NFC_SE_TECH_ROUTING_INFO(8, this)
            return this.__TechRoutingInfo
        }
    }

    /**
     * @type {NFC_SE_PROTO_ROUTING_INFO}
     */
    ProtoRoutingInfo{
        get {
            if(!this.HasProp("__ProtoRoutingInfo"))
                this.__ProtoRoutingInfo := NFC_SE_PROTO_ROUTING_INFO(8, this)
            return this.__ProtoRoutingInfo
        }
    }

    /**
     * @type {NFC_SE_AID_ROUTING_INFO}
     */
    AidRoutingInfo{
        get {
            if(!this.HasProp("__AidRoutingInfo"))
                this.__AidRoutingInfo := NFC_SE_AID_ROUTING_INFO(8, this)
            return this.__AidRoutingInfo
        }
    }
}
