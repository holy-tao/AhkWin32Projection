#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CERT_EXTENSION.ahk" { CERT_EXTENSION }
#Import ".\CRYPT_INTEGER_BLOB.ahk" { CRYPT_INTEGER_BLOB }
#Import "..\..\Foundation\FILETIME.ahk" { FILETIME }

/**
 * Contains information about a single revoked certificate. It is a member of a CRL_INFO structure.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-crl_entry
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CRL_ENTRY {
    #StructPack 8

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/SecGloss/b-gly">BLOB</a> that contains the serial number of a <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">revoked certificate</a>. 
     * 
     * 
     * 
     * 
     * Leading 0x00 or 0xFF bytes are removed. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/nf-wincrypt-certcompareintegerblob">CertCompareIntegerBlob</a>.
     */
    SerialNumber : CRYPT_INTEGER_BLOB

    /**
     * Date that the certificate was revoked. Time is UTC-time encoded as an eight-byte date/time precise to seconds with a two digit year (that is, YYMMDDHHMMSS plus 2 bytes). The date is interpreted as a date between the years 1968 and 2067.
     */
    RevocationDate : FILETIME

    /**
     * Number of elements in the <b>rgExtension</b> member array of extensions.
     */
    cExtension : UInt32

    /**
     * Array of pointers to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_extension">CERT_EXTENSION</a> structures, each providing information about the revoked certificate.
     */
    rgExtension : CERT_EXTENSION.Ptr

}
