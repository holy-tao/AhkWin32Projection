#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Specifies the interface to the XML data provider.
 * @see https://learn.microsoft.com/windows/win32/api/cryptxml/ns-cryptxml-crypt_xml_data_provider
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CRYPT_XML_DATA_PROVIDER extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * An application-defined argument that is passed to
     *     the <b>pfnRead</b> and <b>pfnClose</b> callback functions.
     * @type {Pointer<Void>}
     */
    pvCallbackState {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * The size, in bytes, of the data provider's buffer. The size can be zero if the size does not matter or if the size cannot be determined by the provider.
     *     This value is used by a caller of <b>pfnRead</b> to determine the necessary size of the receiving buffer.
     * @type {Integer}
     */
    cbBufferSize {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/cryptxml/nc-cryptxml-pfn_crypt_xml_data_provider_read">PFN_CRYPT_XML_DATA_PROVIDER_READ</a> callback function used to read data.
     * @type {Pointer<PFN_CRYPT_XML_DATA_PROVIDER_READ>}
     */
    pfnRead {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/cryptxml/nc-cryptxml-pfn_crypt_xml_data_provider_close">PFN_CRYPT_XML_DATA_PROVIDER_CLOSE</a> callback function used to release the data provider. When you have finished using the data provider, you must release it.
     * @type {Pointer<PFN_CRYPT_XML_DATA_PROVIDER_CLOSE>}
     */
    pfnClose {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }
}
