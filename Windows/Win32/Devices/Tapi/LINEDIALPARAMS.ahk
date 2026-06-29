#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The LINEDIALPARAMS structure specifies a collection of dialing-related fields. Call the lineSetCallParams function or the TSPI_lineSetCallParams function to set parameters for a call using the LINEDIALPARAMS structure.
 * @remarks
 * This structure may not be extended.
 * 
 * If zero is specified for a member, the default value is used. If a nonzero value is specified for a member that is outside the range specified by the <b>MinDialParams</b> and <b>MaxDialParams</b> members in the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-linedevcaps">LINEDEVCAPS</a> structure, the nearest value within the valid range is used instead.
 * 
 * The 
 * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linemakecall">lineMakeCall</a> function allows an application to adjust the dialing parameters to be used for the call. The 
 * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/nf-tapi-linesetcallparams">lineSetCallParams</a> function can be used to adjust the dialing parameters of an existing call. The 
 * <a href="https://docs.microsoft.com/windows/desktop/api/tapi/ns-tapi-linecallinfo">LINECALLINFO</a> structure lists the call's current dialing parameters.
 * @see https://learn.microsoft.com/windows/win32/api/tapi/ns-tapi-linedialparams
 * @namespace Windows.Win32.Devices.Tapi
 */
export default struct LINEDIALPARAMS {
    #StructPack 4

    /**
     * Duration of a comma in the dialable address, in milliseconds.
     */
    dwDialPause : UInt32

    /**
     * Interdigit time period between successive digits, in milliseconds.
     */
    dwDialSpeed : UInt32

    /**
     * Duration of a digit, in milliseconds.
     */
    dwDigitDuration : UInt32

    /**
     * Maximum amount of time to wait for a dial tone when a 'W' is used in the dialable address, in milliseconds.
     */
    dwWaitForDialtone : UInt32

}
