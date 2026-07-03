#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\IKEEXT_CERT_CRITERIA_NAME_TYPE.ahk" { IKEEXT_CERT_CRITERIA_NAME_TYPE }

/**
 * Specifies certificate selection &quot;subject&quot; criteria for an authentication method.
 * @see https://learn.microsoft.com/windows/win32/api/iketypes/ns-iketypes-ikeext_cert_name0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
export default struct IKEEXT_CERT_NAME0 {
    #StructPack 8

    /**
     * Type: [IKEEXT_CERT_CRITERIA_NAME_TYPE](/windows/desktop/api/iketypes/ne-iketypes-ikeext_cert_criteria_name_type)</b>
     * 
     * The type of NAME field.
     */
    nameType : IKEEXT_CERT_CRITERIA_NAME_TYPE

    /**
     * Type: <b>LPWSTR</b>
     * 
     * The string to be used for matching the "subject" criteria.
     */
    certName : PWSTR

}
