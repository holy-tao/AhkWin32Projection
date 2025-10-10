#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The LINEDIALPARAMS structure specifies a collection of dialing-related fields. Call the lineSetCallParams function or the TSPI_lineSetCallParams function to set parameters for a call using the LINEDIALPARAMS structure.
 * @remarks
 * 
  * This structure may not be extended.
  * 
  * If zero is specified for a member, the default value is used. If a nonzero value is specified for a member that is outside the range specified by the <b>MinDialParams</b> and <b>MaxDialParams</b> members in the 
  * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-linedevcaps">LINEDEVCAPS</a> structure, the nearest value within the valid range is used instead.
  * 
  * The 
  * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linemakecall">lineMakeCall</a> function allows an application to adjust the dialing parameters to be used for the call. The 
  * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linesetcallparams">lineSetCallParams</a> function can be used to adjust the dialing parameters of an existing call. The 
  * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-linecallinfo">LINECALLINFO</a> structure lists the call's current dialing parameters.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//tapi/ns-tapi-linedialparams
 * @namespace Windows.Win32.Devices.Tapi
 * @version v4.0.30319
 */
class LINEDIALPARAMS extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * Duration of a comma in the dialable address, in milliseconds.
     * @type {Integer}
     */
    dwDialPause {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Interdigit time period between successive digits, in milliseconds.
     * @type {Integer}
     */
    dwDialSpeed {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Duration of a digit, in milliseconds.
     * @type {Integer}
     */
    dwDigitDuration {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Maximum amount of time to wait for a dial tone when a 'W' is used in the dialable address, in milliseconds.
     * @type {Integer}
     */
    dwWaitForDialtone {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }
}
