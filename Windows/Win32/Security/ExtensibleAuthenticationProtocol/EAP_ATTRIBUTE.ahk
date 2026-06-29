#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\EAP_ATTRIBUTE_TYPE.ahk" { EAP_ATTRIBUTE_TYPE }

/**
 * Contains an EAP attribute.
 * @see https://learn.microsoft.com/windows/win32/api/eaptypes/ns-eaptypes-eap_attribute
 * @namespace Windows.Win32.Security.ExtensibleAuthenticationProtocol
 */
export default struct EAP_ATTRIBUTE {
    #StructPack 8

    /**
     * An <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ne-eaptypes-eap_attribute_type">EAP_ATTRIBUTE_TYPE</a> enumeration value that describes the type of the EAP attribute value supplied in <b>pValue</b>.
     */
    eaType : EAP_ATTRIBUTE_TYPE

    /**
     * The size, in bytes, of <b>pValue</b>.
     */
    dwLength : UInt32

    /**
     * Pointer to a byte buffer that contains the data value of the attribute.
     */
    pValue : IntPtr

}
