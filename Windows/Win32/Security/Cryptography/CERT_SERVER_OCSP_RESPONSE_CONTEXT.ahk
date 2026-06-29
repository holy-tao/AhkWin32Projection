#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains an encoded OCSP response.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-cert_server_ocsp_response_context
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CERT_SERVER_OCSP_RESPONSE_CONTEXT {
    #StructPack 8

    /**
     * The size in bytes of this structure.
     */
    cbSize : UInt32 := this.Size

    /**
     * A pointer to the data buffer that contains the encoded OCSP response.
     */
    pbEncodedOcspResponse : IntPtr

    /**
     * The size in bytes of <b>pbEncodedOcspResponse</b>.
     */
    cbEncodedOcspResponse : UInt32

}
