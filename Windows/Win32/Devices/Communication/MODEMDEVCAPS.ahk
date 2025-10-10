#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information about the capabilities of a modem.
 * @see https://docs.microsoft.com/windows/win32/api//mcx/ns-mcx-modemdevcaps
 * @namespace Windows.Win32.Devices.Communication
 * @version v4.0.30319
 */
class MODEMDEVCAPS extends Win32Struct
{
    static sizeof => 80

    static packingSize => 4

    /**
     * The size of the data actually returned to the application, in bytes. This member may be less than the <b>dwRequiredSize</b> member, if an application did not allocate enough space for the variable-length portion of the structure.
     * @type {Integer}
     */
    dwActualSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The number of bytes required for the entire 
     * <b>MODEMDEVCAPS</b> structure, including the variable-length portion.
     * @type {Integer}
     */
    dwRequiredSize {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The offset of the provider-defined portion of the structure, in bytes relative to the beginning of the structure.
     * @type {Integer}
     */
    dwDevSpecificOffset {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The size of the provider-defined portion of the structure, in bytes.
     * @type {Integer}
     */
    dwDevSpecificSize {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * The version of the service provider. The format and use of this member depends on the service provider.
     * @type {Integer}
     */
    dwModemProviderVersion {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * The offset of a text string that contains the name of the modem manufacturer, in bytes relative to the beginning of the structure.
     * @type {Integer}
     */
    dwModemManufacturerOffset {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * The length of the modem manufacturer name, in bytes. The string is not null-terminated.
     * @type {Integer}
     */
    dwModemManufacturerSize {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * The offset of a text string that contains the model of the modem, in bytes relative to the beginning of the structure.
     * @type {Integer}
     */
    dwModemModelOffset {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * The length of the model name, in bytes. The string is not null-terminated.
     * @type {Integer}
     */
    dwModemModelSize {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * The offset of a text string that gives the version and revision of the attached modem, if the provider could determine the information. The offset is specified in bytes relative to the beginning of the structure.
     * @type {Integer}
     */
    dwModemVersionOffset {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * The length of the modem version string, in bytes. The string is not null-terminated.
     * @type {Integer}
     */
    dwModemVersionSize {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * 
     * @type {Integer}
     */
    dwDialOptions {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }

    /**
     * The maximum call setup timeout supported by the modem, in seconds. This is the largest value that can be specified for the corresponding member of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mcx/ns-mcx-modemsettings">MODEMSETTINGS</a> structure.
     * @type {Integer}
     */
    dwCallSetupFailTimer {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * The maximum inactivity timeout supported by the modem, in tenths of seconds. This is the largest value that can be specified for the corresponding member of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mcx/ns-mcx-modemsettings">MODEMSETTINGS</a> structure.
     * @type {Integer}
     */
    dwInactivityTimeout {
        get => NumGet(this, 52, "uint")
        set => NumPut("uint", value, this, 52)
    }

    /**
     * 
     * @type {Integer}
     */
    dwSpeakerVolume {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * 
     * @type {Integer}
     */
    dwSpeakerMode {
        get => NumGet(this, 60, "uint")
        set => NumPut("uint", value, this, 60)
    }

    /**
     * 
     * @type {Integer}
     */
    dwModemOptions {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * The maximum DTE rate in bits per second.
     * @type {Integer}
     */
    dwMaxDTERate {
        get => NumGet(this, 68, "uint")
        set => NumPut("uint", value, this, 68)
    }

    /**
     * The maximum DCE rate in bits per second.
     * @type {Integer}
     */
    dwMaxDCERate {
        get => NumGet(this, 72, "uint")
        set => NumPut("uint", value, this, 72)
    }

    /**
     * Variable-length information, including strings and any provider-defined information.
     * @type {Array<Byte>}
     */
    abVariablePortion{
        get {
            if(!this.HasProp("__abVariablePortionProxyArray"))
                this.__abVariablePortionProxyArray := Win32FixedArray(this.ptr + 76, 1, Primitive, "char")
            return this.__abVariablePortionProxyArray
        }
    }
}
