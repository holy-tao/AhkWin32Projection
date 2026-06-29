#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\CRYPT_XML_REFERENCE.ahk" { CRYPT_XML_REFERENCE }
#Import ".\CRYPT_XML_CHARSET.ahk" { CRYPT_XML_CHARSET }
#Import ".\CRYPT_XML_REFERENCES.ahk" { CRYPT_XML_REFERENCES }
#Import ".\CRYPT_XML_BLOB.ahk" { CRYPT_XML_BLOB }

/**
 * Describes an Object element in the signature.
 * @see https://learn.microsoft.com/windows/win32/api/cryptxml/ns-cryptxml-crypt_xml_object
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CRYPT_XML_OBJECT {
    #StructPack 8

    /**
     * The size, in bytes, of this structure.
     */
    cbSize : UInt32 := this.Size

    /**
     * The handle of the object.
     */
    hObject : IntPtr

    /**
     * Optional. A pointer to a null-terminated wide character string that contains the value of the unique identifier attribute of the <b>Object</b> element.
     */
    wszId : PWSTR

    /**
     * Optional. A pointer to a null-terminated wide character string that contains the value of the MIME-type attribute of the <b>Object</b> element.
     */
    wszMimeType : PWSTR

    /**
     * Optional. A pointer to a null-terminated wide character string that contains the value of the encoding method attribute of the <b>Object</b> element.
     */
    wszEncoding : PWSTR

    /**
     * Optional. A <a href="https://docs.microsoft.com/windows/desktop/api/cryptxml/ns-cryptxml-crypt_xml_references">CRYPT_XML_REFERENCES</a> structure that specifies an array of references.
     */
    Manifest : CRYPT_XML_REFERENCES

    /**
     * Optional. A <a href="https://docs.microsoft.com/windows/desktop/api/cryptxml/ns-cryptxml-crypt_xml_blob">CRYPT_XML_BLOB</a> structure that contains the XML part of the entire <b>Object</b> element.
     * 
     * <div class="alert"><b>Note</b>  This field is empty when the <b>Object</b> element does not contain
     *     any elements.
     *     Applications can use the <b>CRYPT_XML_FLAG_ALWAYS_RETURN_ENCODED_OBJECT</b> flag
     *     to always receive an encoded <b>Object</b> element.</div>
     * <div> </div>
     */
    Encoded : CRYPT_XML_BLOB

}
