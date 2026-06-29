#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SECURE_ELEMENT_CARD_EMULATION_MODE.ahk" { SECURE_ELEMENT_CARD_EMULATION_MODE }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.Devices.Nfc
 */
export default struct SECURE_ELEMENT_SET_CARD_EMULATION_MODE_INFO {
    #StructPack 4

    guidSecureElementId : Guid

    eMode : SECURE_ELEMENT_CARD_EMULATION_MODE

}
