#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\NFC_SE_EMULATION_MODE.ahk" { NFC_SE_EMULATION_MODE }

/**
 * @namespace Windows.Win32.Devices.Nfc
 */
export default struct NFC_SE_EMULATION_MODE_INFO {
    #StructPack 8

    hSecureElement : IntPtr

    eMode : NFC_SE_EMULATION_MODE

}
