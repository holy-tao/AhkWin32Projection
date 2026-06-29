#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * Used with the CryptInstallDefaultContext function to contain an array of object identifier strings.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-crypt_default_context_multi_oid_para
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CRYPT_DEFAULT_CONTEXT_MULTI_OID_PARA {
    #StructPack 8

    /**
     * The number of elements in the <b>rgpszOID</b> array.
     */
    cOID : UInt32

    /**
     * An array of pointers to null-terminated ANSI strings that contain the object identifier strings of the certificate signature algorithm to install the default provider for, for example, <b>szOID_OIWSEC_md5RSA</b>. The <b>cOID</b> member of this structure contains the number of elements in this array.
     */
    rgpszOID : PSTR.Ptr

}
