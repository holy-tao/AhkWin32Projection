#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * Contains an object identifier (OID) and a pointer to its related function.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-crypt_oid_func_entry
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CRYPT_OID_FUNC_ENTRY {
    #StructPack 8

    /**
     * If the high-order word of the OID is nonzero, <b>pszOID</b> is a pointer to either an OID string, such as "2.5.29.1" or an <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">ASCII</a> string, such as "file". If the high-order word of the OID is zero, the low-order word specifies the numeric identifier to be used as the object identifier.
     */
    pszOID : PSTR

    /**
     * The starting address of the function that the OID identifies.
     */
    pvFuncAddr : IntPtr

}
