#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SECURE_ELEMENT_TYPE.ahk" { SECURE_ELEMENT_TYPE }
#Import ".\NFC_SE_INFO.ahk" { NFC_SE_INFO }

/**
 * @namespace Windows.Win32.Devices.Nfc
 */
export default struct NFC_SE_LIST {
    #StructPack 8

    NumberOfEndpoints : UInt32

    EndpointList : NFC_SE_INFO[1]

}
