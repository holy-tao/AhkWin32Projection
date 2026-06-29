#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\BCRYPT_KEY_HANDLE.ahk" { BCRYPT_KEY_HANDLE }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\CRYPT_XML_KEY_INFO_ITEM.ahk" { CRYPT_XML_KEY_INFO_ITEM }

/**
 * Encapsulates key information data.
 * @see https://learn.microsoft.com/windows/win32/api/cryptxml/ns-cryptxml-crypt_xml_key_info
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CRYPT_XML_KEY_INFO {
    #StructPack 8

    /**
     * The size, in bytes, of this structure.
     */
    cbSize : UInt32 := this.Size

    /**
     * A pointer to a null-terminated wide character string that specifies the value of the <b>ID</b> attribute of the key information element.
     */
    wszId : PWSTR

    /**
     * The number of items in the array pointed to by the <b>rgKeyInfo</b> member.
     */
    cKeyInfo : UInt32

    /**
     * A pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/cryptxml/ns-cryptxml-crypt_xml_key_info_item">CRYPT_XML_KEY_INFO_ITEM</a> structures that contain key information.
     */
    rgKeyInfo : CRYPT_XML_KEY_INFO_ITEM.Ptr

    /**
     * Optional. The handle of data  derived from the first key value.
     */
    hVerifyKey : BCRYPT_KEY_HANDLE

}
