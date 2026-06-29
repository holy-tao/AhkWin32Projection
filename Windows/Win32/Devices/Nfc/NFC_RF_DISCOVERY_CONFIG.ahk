#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import ".\NFC_RF_DISCOVERY_MODE.ahk" { NFC_RF_DISCOVERY_MODE }

/**
 * @namespace Windows.Win32.Devices.Nfc
 */
export default struct NFC_RF_DISCOVERY_CONFIG {
    #StructPack 4

    usTotalDuration : UInt16

    ulPollConfig : UInt32

    fDisableCardEmulation : BOOLEAN

    ucNfcIPMode : Int8

    fNfcIPTgtModeDisable : BOOLEAN

    ucNfcIPTgtMode : Int8

    ucNfcCEMode : Int8

    ucBailoutConfig : Int8

    ucSystemCode : Int8[2]

    ucRequestCode : Int8

    ucTimeSlotNumber : Int8

    eRfDiscoveryMode : NFC_RF_DISCOVERY_MODE

}
