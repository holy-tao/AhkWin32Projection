#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\FILETIME.ahk

/**
 * SAFER_IDENTIFICATION_HEADER structure is used as the header for the SAFER_PATHNAME_IDENTIFICATION, SAFER_HASH_IDENTIFICATION, and SAFER_URLZONE_IDENTIFICATION structures.
 * @see https://learn.microsoft.com/windows/win32/api/winsafer/ns-winsafer-safer_identification_header
 * @namespace Windows.Win32.Security.AppLocker
 * @version v4.0.30319
 */
class SAFER_IDENTIFICATION_HEADER extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsafer/ne-winsafer-safer_identification_types">SAFER_IDENTIFICATION_TYPES</a> enumeration value that indicates the type of the structure. The following table shows the possible values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SaferIdentityDefault"></a><a id="saferidentitydefault"></a><a id="SAFERIDENTITYDEFAULT"></a><dl>
     * <dt><b>SaferIdentityDefault</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The header is for a default structure.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SaferIdentityTypeImageName"></a><a id="saferidentitytypeimagename"></a><a id="SAFERIDENTITYTYPEIMAGENAME"></a><dl>
     * <dt><b>SaferIdentityTypeImageName</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The header is for a <a href="https://docs.microsoft.com/windows/desktop/api/winsafer/ns-winsafer-safer_pathname_identification">SAFER_PATHNAME_IDENTIFICATION</a> structure.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SaferIdentityTypeImageHash"></a><a id="saferidentitytypeimagehash"></a><a id="SAFERIDENTITYTYPEIMAGEHASH"></a><dl>
     * <dt><b>SaferIdentityTypeImageHash</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The header is for a <a href="https://docs.microsoft.com/windows/desktop/api/winsafer/ns-winsafer-safer_hash_identification">SAFER_HASH_IDENTIFICATION</a> structure.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SaferIdentityTypeUrlZone"></a><a id="saferidentitytypeurlzone"></a><a id="SAFERIDENTITYTYPEURLZONE"></a><dl>
     * <dt><b>SaferIdentityTypeUrlZone</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The header is for a <a href="https://docs.microsoft.com/windows/desktop/api/winsafer/ns-winsafer-safer_urlzone_identification">SAFER_URLZONE_IDENTIFICATION</a> structure.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SaferIdentityTypeCertificate"></a><a id="saferidentitytypecertificate"></a><a id="SAFERIDENTITYTYPECERTIFICATE"></a><dl>
     * <dt><b>SaferIdentityTypeCertificate</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The header is for a <a href="https://docs.microsoft.com/windows/desktop/api/winsafer/ns-winsafer-safer_pathname_identification">SAFER_PATHNAME_IDENTIFICATION</a> structure.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    dwIdentificationType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * The size of the entire  <a href="https://docs.microsoft.com/windows/desktop/api/winsafer/ns-winsafer-safer_pathname_identification">SAFER_PATHNAME_IDENTIFICATION</a>, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsafer/ns-winsafer-safer_hash_identification">SAFER_HASH_IDENTIFICATION</a>, or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsafer/ns-winsafer-safer_urlzone_identification">SAFER_URLZONE_IDENTIFICATION</a> structure, including the common header.
     * @type {Integer}
     */
    cbStructSize {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The GUID of the identification.
     * @type {Pointer<Guid>}
     */
    IdentificationGuid {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * 
     * @type {FILETIME}
     */
    lastModified{
        get {
            if(!this.HasProp("__lastModified"))
                this.__lastModified := FILETIME(this.ptr + 16)
            return this.__lastModified
        }
    }
}
