#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Cryptography\CRYPT_INTEGER_BLOB.ahk" { CRYPT_INTEGER_BLOB }

/**
 * The SecPkgContext_IssuerListInfoEx structure holds a list of trusted certification authorities (CAs).
 * @see https://learn.microsoft.com/windows/win32/api/schannel/ns-schannel-secpkgcontext_issuerlistinfoex
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct SecPkgContext_IssuerListInfoEx {
    #StructPack 8

    /**
     * A pointer to 
     * an array of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa381414(v=vs.85)">CERT_NAME_BLOB</a> structures that contains a list of the names of CAs that the server trusts.
     * 
     * When you have finished using the data in this array, free it by calling the <a href="https://docs.microsoft.com/windows/desktop/api/sspi/nf-sspi-freecontextbuffer">FreeContextBuffer</a> function.
     */
    aIssuers : CRYPT_INTEGER_BLOB.Ptr

    /**
     * The number of names in <b>aIssuers</b>.
     */
    cIssuers : UInt32

}
