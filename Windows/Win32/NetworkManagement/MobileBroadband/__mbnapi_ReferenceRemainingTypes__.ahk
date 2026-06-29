#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MBN_BAND_CLASS.ahk" { MBN_BAND_CLASS }
#Import ".\MBN_PIN_CONSTANTS.ahk" { MBN_PIN_CONSTANTS }
#Import ".\MBN_PROVIDER_CONSTANTS.ahk" { MBN_PROVIDER_CONSTANTS }
#Import ".\MBN_DATA_CLASS.ahk" { MBN_DATA_CLASS }
#Import ".\MBN_SMS_CAPS.ahk" { MBN_SMS_CAPS }
#Import ".\MBN_CONTEXT_CONSTANTS.ahk" { MBN_CONTEXT_CONSTANTS }
#Import ".\WWAEXT_SMS_CONSTANTS.ahk" { WWAEXT_SMS_CONSTANTS }
#Import ".\MBN_CTRL_CAPS.ahk" { MBN_CTRL_CAPS }
#Import ".\MBN_INTERFACE_CAPS_CONSTANTS.ahk" { MBN_INTERFACE_CAPS_CONSTANTS }
#Import ".\MBN_SIGNAL_CONSTANTS.ahk" { MBN_SIGNAL_CONSTANTS }
#Import ".\MBN_PROVIDER_STATE.ahk" { MBN_PROVIDER_STATE }
#Import ".\MBN_SMS_STATUS_FLAG.ahk" { MBN_SMS_STATUS_FLAG }
#Import ".\MBN_REGISTRATION_CONSTANTS.ahk" { MBN_REGISTRATION_CONSTANTS }

/**
 * @namespace Windows.Win32.NetworkManagement.MobileBroadband
 */
export default struct __mbnapi_ReferenceRemainingTypes__ {
    #StructPack 4

    bandClass : MBN_BAND_CLASS

    contextConstants : MBN_CONTEXT_CONSTANTS

    ctrlCaps : MBN_CTRL_CAPS

    dataClass : MBN_DATA_CLASS

    interfaceCapsConstants : MBN_INTERFACE_CAPS_CONSTANTS

    pinConstants : MBN_PIN_CONSTANTS

    providerConstants : MBN_PROVIDER_CONSTANTS

    providerState : MBN_PROVIDER_STATE

    registrationConstants : MBN_REGISTRATION_CONSTANTS

    signalConstants : MBN_SIGNAL_CONSTANTS

    smsCaps : MBN_SMS_CAPS

    smsConstants : WWAEXT_SMS_CONSTANTS

    wwaextSmsConstants : WWAEXT_SMS_CONSTANTS

    smsStatusFlag : MBN_SMS_STATUS_FLAG

}
