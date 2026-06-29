#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SECURE_ELEMENT_ENDPOINT_INFO.ahk" { SECURE_ELEMENT_ENDPOINT_INFO }
#Import ".\SECURE_ELEMENT_TYPE.ahk" { SECURE_ELEMENT_TYPE }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.Devices.Nfc
 */
export default struct SECURE_ELEMENT_ENDPOINT_LIST {
    #StructPack 4

    NumberOfEndpoints : UInt32

    EndpointList : SECURE_ELEMENT_ENDPOINT_INFO[1]

}
