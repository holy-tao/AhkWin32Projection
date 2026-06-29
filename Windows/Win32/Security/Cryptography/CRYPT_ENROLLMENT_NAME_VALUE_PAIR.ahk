#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * Used to create certificate requests on behalf of a user.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-crypt_enrollment_name_value_pair
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CRYPT_ENROLLMENT_NAME_VALUE_PAIR {
    #StructPack 8

    /**
     * Name of a certificate requester.
     */
    pwszName : PWSTR

    /**
     * Name of the user for whom the certificate is being requested.
     */
    pwszValue : PWSTR

}
