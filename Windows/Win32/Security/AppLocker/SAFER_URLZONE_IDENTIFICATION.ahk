#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\FILETIME.ahk
#Include .\SAFER_IDENTIFICATION_HEADER.ahk

/**
 * Represents a URL zone identification rule.
 * @see https://learn.microsoft.com/windows/win32/api/winsafer/ns-winsafer-safer_urlzone_identification
 * @namespace Windows.Win32.Security.AppLocker
 * @version v4.0.30319
 */
class SAFER_URLZONE_IDENTIFICATION extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * 
     * @type {SAFER_IDENTIFICATION_HEADER}
     */
    header{
        get {
            if(!this.HasProp("__header"))
                this.__header := SAFER_IDENTIFICATION_HEADER(0, this)
            return this.__header
        }
    }

    /**
     * A URLZONE identifier that represents the origin of the code image to be checked. The following table shows the possible values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="URLZONE_LOCAL_MACHINE"></a><a id="urlzone_local_machine"></a><dl>
     * <dt><b>URLZONE_LOCAL_MACHINE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The local machine. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="URLZONE_INTRANET"></a><a id="urlzone_intranet"></a><dl>
     * <dt><b>URLZONE_INTRANET</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The current intranet.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="URLZONE_TRUSTED"></a><a id="urlzone_trusted"></a><dl>
     * <dt><b>URLZONE_TRUSTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A trusted URL zone.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="URLZONE_INTERNET"></a><a id="urlzone_internet"></a><dl>
     * <dt><b>URLZONE_INTERNET</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The Internet.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="URLZONE_UNTRUSTED"></a><a id="urlzone_untrusted"></a><dl>
     * <dt><b>URLZONE_UNTRUSTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An untrusted URL zone.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    UrlZoneId {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Reserved for future use.
     * @type {Integer}
     */
    dwSaferFlags {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }
}
