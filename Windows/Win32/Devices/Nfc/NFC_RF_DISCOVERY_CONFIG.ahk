#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Devices.Nfc
 * @version v4.0.30319
 */
class NFC_RF_DISCOVERY_CONFIG extends Win32Struct
{
    static sizeof => 24

    static packingSize => 4

    /**
     * @type {Integer}
     */
    usTotalDuration {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    ulPollConfig {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {BOOLEAN}
     */
    fDisableCardEmulation {
        get => NumGet(this, 8, "char")
        set => NumPut("char", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    ucNfcIPMode {
        get => NumGet(this, 9, "char")
        set => NumPut("char", value, this, 9)
    }

    /**
     * @type {BOOLEAN}
     */
    fNfcIPTgtModeDisable {
        get => NumGet(this, 10, "char")
        set => NumPut("char", value, this, 10)
    }

    /**
     * @type {Integer}
     */
    ucNfcIPTgtMode {
        get => NumGet(this, 11, "char")
        set => NumPut("char", value, this, 11)
    }

    /**
     * @type {Integer}
     */
    ucNfcCEMode {
        get => NumGet(this, 12, "char")
        set => NumPut("char", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    ucBailoutConfig {
        get => NumGet(this, 13, "char")
        set => NumPut("char", value, this, 13)
    }

    /**
     * @type {Array<Byte>}
     */
    ucSystemCode{
        get {
            if(!this.HasProp("__ucSystemCodeProxyArray"))
                this.__ucSystemCodeProxyArray := Win32FixedArray(this.ptr + 14, 2, Primitive, "char")
            return this.__ucSystemCodeProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    ucRequestCode {
        get => NumGet(this, 16, "char")
        set => NumPut("char", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    ucTimeSlotNumber {
        get => NumGet(this, 17, "char")
        set => NumPut("char", value, this, 17)
    }

    /**
     * @type {Integer}
     */
    eRfDiscoveryMode {
        get => NumGet(this, 20, "int")
        set => NumPut("int", value, this, 20)
    }
}
