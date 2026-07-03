#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the interface to the XML data provider.
 * @see https://learn.microsoft.com/windows/win32/api/cryptxml/ns-cryptxml-crypt_xml_data_provider
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CRYPT_XML_DATA_PROVIDER {
    #StructPack 8

    /**
     * An application-defined argument that is passed to
     *     the <b>pfnRead</b> and <b>pfnClose</b> callback functions.
     */
    pvCallbackState : IntPtr

    /**
     * The size, in bytes, of the data provider's buffer. The size can be zero if the size does not matter or if the size cannot be determined by the provider.
     *     This value is used by a caller of <b>pfnRead</b> to determine the necessary size of the receiving buffer.
     */
    cbBufferSize : UInt32

    /**
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/cryptxml/nc-cryptxml-pfn_crypt_xml_data_provider_read">PFN_CRYPT_XML_DATA_PROVIDER_READ</a> callback function used to read data.
     */
    pfnRead : IntPtr

    /**
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/cryptxml/nc-cryptxml-pfn_crypt_xml_data_provider_close">PFN_CRYPT_XML_DATA_PROVIDER_CLOSE</a> callback function used to release the data provider. When you have finished using the data provider, you must release it.
     */
    pfnClose : IntPtr

}
