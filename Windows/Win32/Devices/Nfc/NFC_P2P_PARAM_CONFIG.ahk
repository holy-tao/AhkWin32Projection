#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\NFC_P2P_MODE.ahk" { NFC_P2P_MODE }

/**
 * @namespace Windows.Win32.Devices.Nfc
 */
export default struct NFC_P2P_PARAM_CONFIG {
    #StructPack 4

    eP2pMode : NFC_P2P_MODE

    cbGeneralBytes : Int8

    pbGeneralBytes : Int8[48]

}
