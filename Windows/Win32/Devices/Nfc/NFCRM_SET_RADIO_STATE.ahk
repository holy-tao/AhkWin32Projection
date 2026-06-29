#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * @namespace Windows.Win32.Devices.Nfc
 */
export default struct NFCRM_SET_RADIO_STATE {
    #StructPack 1

    SystemStateUpdate : BOOLEAN

    MediaRadioOn : BOOLEAN

}
