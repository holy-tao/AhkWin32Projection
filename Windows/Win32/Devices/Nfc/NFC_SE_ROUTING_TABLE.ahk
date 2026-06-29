#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\NFC_SE_AID_ROUTING_INFO.ahk" { NFC_SE_AID_ROUTING_INFO }
#Import ".\NFC_SE_TECH_ROUTING_INFO.ahk" { NFC_SE_TECH_ROUTING_INFO }
#Import ".\NFC_SE_PROTO_ROUTING_INFO.ahk" { NFC_SE_PROTO_ROUTING_INFO }
#Import ".\SECURE_ELEMENT_ROUTING_TYPE.ahk" { SECURE_ELEMENT_ROUTING_TYPE }
#Import ".\NFC_SE_ROUTING_TABLE_ENTRY.ahk" { NFC_SE_ROUTING_TABLE_ENTRY }

/**
 * @namespace Windows.Win32.Devices.Nfc
 */
export default struct NFC_SE_ROUTING_TABLE {
    #StructPack 8

    NumberOfEntries : UInt32

    TableEntries : NFC_SE_ROUTING_TABLE_ENTRY[1]

}
