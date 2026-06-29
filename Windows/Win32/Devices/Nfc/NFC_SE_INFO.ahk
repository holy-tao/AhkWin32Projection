#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SECURE_ELEMENT_TYPE.ahk" { SECURE_ELEMENT_TYPE }

/**
 * @namespace Windows.Win32.Devices.Nfc
 */
export default struct NFC_SE_INFO {
    #StructPack 8

    hSecureElement : IntPtr

    eSecureElementType : SECURE_ELEMENT_TYPE

}
