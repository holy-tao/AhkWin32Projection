#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Specifies the type of certificate information that is provided.
 * @see https://docs.microsoft.com/windows/win32/api//ntsecapi/ne-ntsecapi-kerb_certificate_info_type
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class KERB_CERTIFICATE_INFO_TYPE extends Win32Enum{

    /**
     * Identifies certificate hash information as defined by the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ns-ntsecapi-kerb_certificate_hashinfo">KERB_CERTIFICATE_HASHINFO</a> structure.
     * @type {Integer (Int32)}
     */
    static CertHashInfo => 1
}
