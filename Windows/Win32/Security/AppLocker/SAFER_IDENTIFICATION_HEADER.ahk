#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SAFER_IDENTIFICATION_TYPES.ahk" { SAFER_IDENTIFICATION_TYPES }
#Import "..\..\Foundation\FILETIME.ahk" { FILETIME }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * SAFER_IDENTIFICATION_HEADER structure is used as the header for the SAFER_PATHNAME_IDENTIFICATION, SAFER_HASH_IDENTIFICATION, and SAFER_URLZONE_IDENTIFICATION structures.
 * @see https://learn.microsoft.com/windows/win32/api/winsafer/ns-winsafer-safer_identification_header
 * @namespace Windows.Win32.Security.AppLocker
 */
export default struct SAFER_IDENTIFICATION_HEADER {
    #StructPack 4

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
     */
    dwIdentificationType : SAFER_IDENTIFICATION_TYPES

    /**
     * The size of the entire  <a href="https://docs.microsoft.com/windows/desktop/api/winsafer/ns-winsafer-safer_pathname_identification">SAFER_PATHNAME_IDENTIFICATION</a>, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsafer/ns-winsafer-safer_hash_identification">SAFER_HASH_IDENTIFICATION</a>, or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsafer/ns-winsafer-safer_urlzone_identification">SAFER_URLZONE_IDENTIFICATION</a> structure, including the common header.
     */
    cbStructSize : UInt32

    /**
     * The GUID of the identification.
     */
    IdentificationGuid : Guid

    lastModified : FILETIME

}
