#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SAFER_IDENTIFICATION_HEADER.ahk" { SAFER_IDENTIFICATION_HEADER }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\SAFER_IDENTIFICATION_TYPES.ahk" { SAFER_IDENTIFICATION_TYPES }
#Import "..\..\Foundation\FILETIME.ahk" { FILETIME }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * Represents a path identification rule.
 * @see https://learn.microsoft.com/windows/win32/api/winsafer/ns-winsafer-safer_pathname_identification
 * @namespace Windows.Win32.Security.AppLocker
 */
export default struct SAFER_PATHNAME_IDENTIFICATION {
    #StructPack 8

    /**
     * A  <a href="https://docs.microsoft.com/windows/desktop/api/winsafer/ns-winsafer-safer_identification_header">SAFER_IDENTIFICATION_HEADER</a> structure containing the structure header. The <b>dwIdentificationType</b> member of the header must be <b>SaferIdentityTypeImageName</b>, and the  <b>cbStructSize</b> member of the header must be sizeof(SAFER_PATHNAME_IDENTIFICATION).
     */
    header : SAFER_IDENTIFICATION_HEADER

    /**
     * A description of the path identification rule provided by the user.
     */
    Description : WCHAR[256]

    /**
     * A pointer to a <b>null</b>-terminated wide character string that specifies the fully qualified path and file name to be used for path-based discrimination checks. The image name is also used to open and read the file to identify any other discrimination criteria not supplied in this structure. This member can be set to <b>NULL</b>. If the <b>dwCheckFlags</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/winsafer/ns-winsafer-safer_identification_header">SAFER_IDENTIFICATION_HEADER</a> structure specified by the <b>header</b> member includes SAFER_CRITERIA_AUTHENTICODE, either the <b>hImageFileHandle</b> member or the <b>ImagePath</b> member of the <b>SAFER_IDENTIFICATION_HEADER</b> structure must be set.
     */
    ImageName : PWSTR

    /**
     * Reserved for future use.
     */
    dwSaferFlags : UInt32

}
