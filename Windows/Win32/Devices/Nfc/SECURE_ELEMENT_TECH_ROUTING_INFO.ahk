#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.Devices.Nfc
 */
export default struct SECURE_ELEMENT_TECH_ROUTING_INFO {
    #StructPack 4

    guidSecureElementId : Guid

    eRfTechType : Int8

}
