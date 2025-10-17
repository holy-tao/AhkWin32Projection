#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\CTL_USAGE.ahk

/**
 * Provides parameters for finding certificate trust lists (CTL) used to build a certificate chain.
 * @see https://docs.microsoft.com/windows/win32/api//wincrypt/ns-wincrypt-ctl_usage_match
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CTL_USAGE_MATCH extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Determines the kind of issuer matching to be done. In <b>AND</b> logic, the certificate must meet all criteria. In <b>OR</b> logic, the certificate must meet at least one of the criteria. The following codes are defined to determine the logic used in the match.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="USAGE_MATCH_TYPE_AND"></a><a id="usage_match_type_and"></a><dl>
     * <dt><b>USAGE_MATCH_TYPE_AND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>AND</b> logic
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="USAGE_MATCH_TYPE_OR"></a><a id="usage_match_type_or"></a><dl>
     * <dt><b>USAGE_MATCH_TYPE_OR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>OR</b> logic
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * Default usage match logic is USAGE_MATCH_TYPE_AND.
     * @type {Integer}
     */
    dwType {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-ctl_usage">CTL_USAGE</a> structure that includes an array of <a href="https://docs.microsoft.com/windows/desktop/SecGloss/o-gly">object identifiers</a> (OIDs) a CTL must match in order to be valid.
     * @type {CTL_USAGE}
     */
    Usage{
        get {
            if(!this.HasProp("__Usage"))
                this.__Usage := CTL_USAGE(8, this)
            return this.__Usage
        }
    }
}
