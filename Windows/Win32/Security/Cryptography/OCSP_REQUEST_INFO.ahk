#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information for an online certificate status protocol (OCSP) request as specified by RFC 2560.
 * @see https://docs.microsoft.com/windows/win32/api//wincrypt/ns-wincrypt-ocsp_request_info
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class OCSP_REQUEST_INFO extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * A value that indicates the protocol version of the OCSP request.
     * @type {Integer}
     */
    dwVersion {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_alt_name_entry">CERT_ALT_NAME_ENTRY</a> structure that contains the name bound to the certificate <a href="https://docs.microsoft.com/windows/desktop/SecGloss/p-gly">public key</a> of the requester.
     * @type {Pointer<CERT_ALT_NAME_ENTRY>}
     */
    pRequestorName {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * The number of elements in the <b>rgRequestEntry</b> array.
     * @type {Integer}
     */
    cRequestEntry {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * An array of pointers to <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-ocsp_request_entry">OCSP_REQUEST_ENTRY</a> structures.
     * @type {Pointer<OCSP_REQUEST_ENTRY>}
     */
    rgRequestEntry {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * The number of elements in the <b>rgExtension</b> array.
     * @type {Integer}
     */
    cExtension {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * An array of pointers to <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_extension">CERT_EXTENSION</a> structures, each of which contains information about the request.
     * @type {Pointer<CERT_EXTENSION>}
     */
    rgExtension {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }
}
