#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SECURE_ELEMENT_PROTO_ROUTING_INFO.ahk" { SECURE_ELEMENT_PROTO_ROUTING_INFO }
#Import ".\SECURE_ELEMENT_ROUTING_TYPE.ahk" { SECURE_ELEMENT_ROUTING_TYPE }
#Import ".\SECURE_ELEMENT_AID_ROUTING_INFO.ahk" { SECURE_ELEMENT_AID_ROUTING_INFO }
#Import ".\SECURE_ELEMENT_TECH_ROUTING_INFO.ahk" { SECURE_ELEMENT_TECH_ROUTING_INFO }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.Devices.Nfc
 */
export default struct SECURE_ELEMENT_ROUTING_TABLE_ENTRY {
    #StructPack 4

    eRoutingType : SECURE_ELEMENT_ROUTING_TYPE

    TechRoutingInfo : SECURE_ELEMENT_TECH_ROUTING_INFO

    static __New() {
        DefineProp(this.Prototype, 'ProtoRoutingInfo', { type: SECURE_ELEMENT_PROTO_ROUTING_INFO, offset: 4 })
        DefineProp(this.Prototype, 'AidRoutingInfo', { type: SECURE_ELEMENT_AID_ROUTING_INFO, offset: 4 })
        this.DeleteProp("__New")
    }
}
