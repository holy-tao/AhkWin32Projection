#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CRYPT_XML_STATUS_ERROR_STATUS.ahk" { CRYPT_XML_STATUS_ERROR_STATUS }
#Import ".\CRYPT_XML_STATUS_INFO_STATUS.ahk" { CRYPT_XML_STATUS_INFO_STATUS }

/**
 * Returns information about the signature validation status, summary status information about a SignedInfo element, or summary status information about an array of Reference elements.
 * @see https://learn.microsoft.com/windows/win32/api/cryptxml/ns-cryptxml-crypt_xml_status
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CRYPT_XML_STATUS {
    #StructPack 4

    /**
     * The size, in bytes, of this structure.
     */
    cbSize : UInt32 := this.Size

    /**
     * The retrieved error flags.
     */
    dwErrorStatus : CRYPT_XML_STATUS_ERROR_STATUS

    /**
     * The retrieved informational flags.
     */
    dwInfoStatus : CRYPT_XML_STATUS_INFO_STATUS

}
