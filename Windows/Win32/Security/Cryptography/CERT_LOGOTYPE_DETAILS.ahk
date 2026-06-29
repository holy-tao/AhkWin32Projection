#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\CERT_HASHED_URL.ahk" { CERT_HASHED_URL }

/**
 * Contains additional information about a logotype.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-cert_logotype_details
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CERT_LOGOTYPE_DETAILS {
    #StructPack 8

    /**
     * The address of a null-terminated Unicode string that contains the Multipurpose Internet Mail Extensions (MIME) type of the logotype.
     */
    pwszMimeType : PWSTR

    /**
     * The number of elements in the <b>rgHashedUrl</b> array.
     */
    cHashedUrl : UInt32

    /**
     * An array of <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_hashed_url">CERT_HASHED_URL</a> structures that contain the hashed URLs of the logotype. The <b>cHashedUrl</b> member contains the number of elements in this array.
     */
    rgHashedUrl : CERT_HASHED_URL.Ptr

}
