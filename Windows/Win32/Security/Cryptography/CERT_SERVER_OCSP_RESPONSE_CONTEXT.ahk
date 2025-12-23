#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains an encoded OCSP response.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-cert_server_ocsp_response_context
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CERT_SERVER_OCSP_RESPONSE_CONTEXT extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * The size in bytes of this structure.
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A pointer to the data buffer that contains the encoded OCSP response.
     * @type {Pointer<Integer>}
     */
    pbEncodedOcspResponse {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * The size in bytes of <b>pbEncodedOcspResponse</b>.
     * @type {Integer}
     */
    cbEncodedOcspResponse {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    __New(ptrOrObj := 0, parent := ""){
        super.__New(ptrOrObj, parent)
        this.cbSize := 24
    }
}
