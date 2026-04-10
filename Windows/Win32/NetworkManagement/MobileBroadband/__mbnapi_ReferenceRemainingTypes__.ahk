#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\MBN_BAND_CLASS.ahk
#Include .\MBN_CONTEXT_CONSTANTS.ahk
#Include .\MBN_CTRL_CAPS.ahk
#Include .\MBN_DATA_CLASS.ahk
#Include .\MBN_INTERFACE_CAPS_CONSTANTS.ahk
#Include .\MBN_PIN_CONSTANTS.ahk
#Include .\MBN_PROVIDER_CONSTANTS.ahk
#Include .\MBN_PROVIDER_STATE.ahk
#Include .\MBN_REGISTRATION_CONSTANTS.ahk
#Include .\MBN_SIGNAL_CONSTANTS.ahk
#Include .\MBN_SMS_CAPS.ahk
#Include .\WWAEXT_SMS_CONSTANTS.ahk
#Include .\MBN_SMS_STATUS_FLAG.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.MobileBroadband
 */
class __mbnapi_ReferenceRemainingTypes__ extends Win32Struct {
    static sizeof => 56

    static packingSize => 4

    /**
     * @type {MBN_BAND_CLASS}
     */
    bandClass {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {MBN_CONTEXT_CONSTANTS}
     */
    contextConstants {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * @type {MBN_CTRL_CAPS}
     */
    ctrlCaps {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * @type {MBN_DATA_CLASS}
     */
    dataClass {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * @type {MBN_INTERFACE_CAPS_CONSTANTS}
     */
    interfaceCapsConstants {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * @type {MBN_PIN_CONSTANTS}
     */
    pinConstants {
        get => NumGet(this, 20, "int")
        set => NumPut("int", value, this, 20)
    }

    /**
     * @type {MBN_PROVIDER_CONSTANTS}
     */
    providerConstants {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }

    /**
     * @type {MBN_PROVIDER_STATE}
     */
    providerState {
        get => NumGet(this, 28, "int")
        set => NumPut("int", value, this, 28)
    }

    /**
     * @type {MBN_REGISTRATION_CONSTANTS}
     */
    registrationConstants {
        get => NumGet(this, 32, "int")
        set => NumPut("int", value, this, 32)
    }

    /**
     * @type {MBN_SIGNAL_CONSTANTS}
     */
    signalConstants {
        get => NumGet(this, 36, "int")
        set => NumPut("int", value, this, 36)
    }

    /**
     * @type {MBN_SMS_CAPS}
     */
    smsCaps {
        get => NumGet(this, 40, "int")
        set => NumPut("int", value, this, 40)
    }

    /**
     * @type {WWAEXT_SMS_CONSTANTS}
     */
    smsConstants {
        get => NumGet(this, 44, "int")
        set => NumPut("int", value, this, 44)
    }

    /**
     * @type {WWAEXT_SMS_CONSTANTS}
     */
    wwaextSmsConstants {
        get => NumGet(this, 48, "int")
        set => NumPut("int", value, this, 48)
    }

    /**
     * @type {MBN_SMS_STATUS_FLAG}
     */
    smsStatusFlag {
        get => NumGet(this, 52, "int")
        set => NumPut("int", value, this, 52)
    }
}
