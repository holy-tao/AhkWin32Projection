#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\CRYPT_XML_CHARSET.ahk" { CRYPT_XML_CHARSET }
#Import ".\CRYPT_XML_BLOB.ahk" { CRYPT_XML_BLOB }

/**
 * Specifies the algorithm used to sign or transform the message.
 * @see https://learn.microsoft.com/windows/win32/api/cryptxml/ns-cryptxml-crypt_xml_algorithm
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CRYPT_XML_ALGORITHM {
    #StructPack 8

    /**
     * The size, in bytes, of this structure.
     */
    cbSize : UInt32 := this.Size

    /**
     * A pointer to a null-terminated Unicode string that contains the <b>Algorithm</b> attribute. 
     *     When the <b>Encoded</b> member contains an element that is proved by an application, this member is set to <b>NULL</b>.XML
     */
    wszAlgorithm : PWSTR

    /**
     * Optional.  The XML encoded element. 
     *     This member  is set when an element tag is present in the XML signature.
     */
    Encoded : CRYPT_XML_BLOB

}
