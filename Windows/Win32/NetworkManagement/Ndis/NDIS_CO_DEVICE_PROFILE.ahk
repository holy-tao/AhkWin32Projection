#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\NDIS_VAR_DATA_DESC.ahk" { NDIS_VAR_DATA_DESC }

/**
 * @namespace Windows.Win32.NetworkManagement.Ndis
 */
export default struct NDIS_CO_DEVICE_PROFILE {
    #StructPack 8

    DeviceDescription : NDIS_VAR_DATA_DESC

    DevSpecificInfo : NDIS_VAR_DATA_DESC

    ulTAPISupplementaryPassThru : UInt32

    ulAddressModes : UInt32

    ulNumAddresses : UInt32

    ulBearerModes : UInt32

    ulMaxTxRate : UInt32

    ulMinTxRate : UInt32

    ulMaxRxRate : UInt32

    ulMinRxRate : UInt32

    ulMediaModes : UInt32

    ulGenerateToneModes : UInt32

    ulGenerateToneMaxNumFreq : UInt32

    ulGenerateDigitModes : UInt32

    ulMonitorToneMaxNumFreq : UInt32

    ulMonitorToneMaxNumEntries : UInt32

    ulMonitorDigitModes : UInt32

    ulGatherDigitsMinTimeout : UInt32

    ulGatherDigitsMaxTimeout : UInt32

    ulDevCapFlags : UInt32

    ulMaxNumActiveCalls : UInt32

    ulAnswerMode : UInt32

    ulUUIAcceptSize : UInt32

    ulUUIAnswerSize : UInt32

    ulUUIMakeCallSize : UInt32

    ulUUIDropSize : UInt32

    ulUUISendUserUserInfoSize : UInt32

    ulUUICallInfoSize : UInt32

}
