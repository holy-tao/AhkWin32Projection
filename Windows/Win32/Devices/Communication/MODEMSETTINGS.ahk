#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information about a modem's configuration.
 * @see https://learn.microsoft.com/windows/win32/api/mcx/ns-mcx-modemsettings
 * @namespace Windows.Win32.Devices.Communication
 * @version v4.0.30319
 */
class MODEMSETTINGS extends Win32Struct
{
    static sizeof => 48

    static packingSize => 4

    /**
     * The size of the data actually returned to the application, in bytes. This member may be less than the <b>dwRequiredSize</b> member if an application did not allocate enough space for the variable-length portion of the structure.
     * @type {Integer}
     */
    dwActualSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The number of bytes required for the entire 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mcx/ns-mcx-modemdevcaps">MODEMDEVCAPS</a> structure, including the variable-length portion.
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
     * The maximum number of seconds the modem should wait, after dialing is completed, for an indication that a modem-to-modem connection has been established. If a connection is not established in this interval, the call is assumed to have failed. This member is equivalent to register S7 in Hayes® compatible modems.
     * @type {Integer}
     */
    dwCallSetupFailTimer {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * The maximum number of seconds of inactivity allowed after a connection is established. If no data is either transmitted or received for this period of time, the call is automatically terminated. This time-out is used to avoid excessive long-distance charges or online service charges if an application unexpectedly locks up or the user leaves.
     * @type {Integer}
     */
    dwInactivityTimeout {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * 
     * @type {Integer}
     */
    dwSpeakerVolume {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * 
     * @type {Integer}
     */
    dwSpeakerMode {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * The modem options requested by the application. The local and remote modems negotiate modem options during call setup; this member specifies the initial negotiating position of the local modem. 
     * 
     * 
     * 
     * 
     * The <b>dwModemOptions</b> member of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mcx/ns-mcx-modemdevcaps">MODEMDEVCAPS</a> structure specifies the modem options supported by the local modem. For a list of modem options, see the description of the 
     * <b>MODEMDEVCAPS</b> structure.
     * @type {Integer}
     */
    dwPreferredModemOptions {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * The modem options that are actually in effect. This member is filled in after a connection is established and the local and remote modems negotiate modem options. 
     * 
     * 
     * 
     * 
     * The <b>dwModemOptions</b> member of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mcx/ns-mcx-modemdevcaps">MODEMDEVCAPS</a> structure specifies the modem options supported by the local modem. For a list of modem options, see the description of the 
     * <b>MODEMDEVCAPS</b> structure.
     * @type {Integer}
     */
    dwNegotiatedModemOptions {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * The DCE rate in effect. This member is filled in after a connection is established and the local and remote modems negotiate modem modulations.
     * @type {Integer}
     */
    dwNegotiatedDCERate {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * Optional provider-defined information.
     * @type {Array<Byte>}
     */
    abVariablePortion{
        get {
            if(!this.HasProp("__abVariablePortionProxyArray"))
                this.__abVariablePortionProxyArray := Win32FixedArray(this.ptr + 44, 1, Primitive, "char")
            return this.__abVariablePortionProxyArray
        }
    }
}
