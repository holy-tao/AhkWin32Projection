#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\SECURE_ELEMENT_ENDPOINT_INFO.ahk" { SECURE_ELEMENT_ENDPOINT_INFO }
#Import ".\SECURE_ELEMENT_TYPE.ahk" { SECURE_ELEMENT_TYPE }

/**
 * @namespace Windows.Win32.Devices.Nfc
 */
export default struct SECURE_ELEMENT_ENDPOINT_LIST {
    #StructPack 4

    NumberOfEndpoints : UInt32

    EndpointList : SECURE_ELEMENT_ENDPOINT_INFO[1]

}
