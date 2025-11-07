#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the type and usage of the XML property.
 * @remarks
 * 
 * If a property value is defined as a pointer to data, then the pointer must be valid 
 *   for the entire period of the signature operation.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//cryptxml/ne-cryptxml-crypt_xml_property_id
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class CRYPT_XML_PROPERTY_ID{

    /**
     * Specifies the maximum heap size, in bytes, that the  XML layer can use.
 *       This property is applied to intermediate buffers used to parse or construct XML parts. 
 *       By default, the limit is equal to <b>CRYPT_XML_BLOB_MAX</b>.
     * @type {Integer (Int32)}
     */
    static CRYPT_XML_PROPERTY_MAX_HEAP_SIZE => 1

    /**
     * Specifies the location in the XML document where the signature is to be created.
 * 
 * 
 * 
 * The following formats are supported:
 * 
 * 
 * 
 * <dl>
 * <dt><a id="_id"></a><a id="_ID"></a>#id</dt>
 * <dd>
 * The Id attribute of the element to insert the signature.
 * 
 * </dd>
 * <dt><a id="_a_b_c"></a><a id="_A_B_C"></a>/a/b/c</dt>
 * <dd>
 * The absolute path of the element to insert the signature.
 * 
 * </dd>
 * </dl>
     * @type {Integer (Int32)}
     */
    static CRYPT_XML_PROPERTY_SIGNATURE_LOCATION => 2

    /**
     * Specifies the maximum number of <b>Signature</b> elements when parsing an XML document. 
 *      This property overrides the default <b>CRYPT_XML_SIGNATURES_MAX</b> value.
     * @type {Integer (Int32)}
     */
    static CRYPT_XML_PROPERTY_MAX_SIGNATURES => 3

    /**
     * Specifies whether to write an XML document declaration. This property is used with the 
 *      <a href="https://docs.microsoft.com/windows/desktop/api/cryptxml/nf-cryptxml-cryptxmlencode">CryptXmlEncode</a> function. The default property is <b>TRUE</b>.
     * @type {Integer (Int32)}
     */
    static CRYPT_XML_PROPERTY_DOC_DECLARATION => 4

    /**
     * Specifies an encoding character set of XML fragments for custom elements. This property is used with the 
 *      <a href="https://docs.microsoft.com/windows/desktop/api/cryptxml/nf-cryptxml-cryptxmlopentodecode">CryptXmlOpenToDecode</a> function. 
 *      The default character set is inherited from the opened document.
     * @type {Integer (Int32)}
     */
    static CRYPT_XML_PROPERTY_XML_OUTPUT_CHARSET => 5
}
