#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\NFC_SE_AID_ROUTING_INFO.ahk" { NFC_SE_AID_ROUTING_INFO }
#Import ".\NFC_SE_TECH_ROUTING_INFO.ahk" { NFC_SE_TECH_ROUTING_INFO }
#Import ".\NFC_SE_PROTO_ROUTING_INFO.ahk" { NFC_SE_PROTO_ROUTING_INFO }
#Import ".\SECURE_ELEMENT_ROUTING_TYPE.ahk" { SECURE_ELEMENT_ROUTING_TYPE }

/**
 * @namespace Windows.Win32.Devices.Nfc
 */
export default struct NFC_SE_ROUTING_TABLE_ENTRY {
    #StructPack 8

    eRoutingType : SECURE_ELEMENT_ROUTING_TYPE

    TechRoutingInfo : NFC_SE_TECH_ROUTING_INFO

    static __New() {
        DefineProp(this.Prototype, 'ProtoRoutingInfo', { type: NFC_SE_PROTO_ROUTING_INFO, offset: 8 })
        DefineProp(this.Prototype, 'AidRoutingInfo', { type: NFC_SE_AID_ROUTING_INFO, offset: 8 })
        this.DeleteProp("__New")
    }
}
