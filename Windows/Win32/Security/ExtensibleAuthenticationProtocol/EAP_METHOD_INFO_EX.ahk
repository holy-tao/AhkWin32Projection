#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\EAP_METHOD_TYPE.ahk" { EAP_METHOD_TYPE }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\EAP_TYPE.ahk" { EAP_TYPE }
#Import ".\EAP_METHOD_INFO_ARRAY_EX.ahk" { EAP_METHOD_INFO_ARRAY_EX }

/**
 * Contains information about an EAP method. (EAP_METHOD_INFO_EX)
 * @see https://learn.microsoft.com/windows/win32/api/eaptypes/ns-eaptypes-eap_method_info_ex
 * @namespace Windows.Win32.Security.ExtensibleAuthenticationProtocol
 */
export default struct EAP_METHOD_INFO_EX {
    #StructPack 8

    /**
     * An <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ns-eaptypes-eap_method_type">EAP_METHOD_TYPE</a> structure that identifies the EAP method.
     */
    eaptype : EAP_METHOD_TYPE

    /**
     * Pointer to a zero-terminated Unicode string that contains the name of the EAP method's author.
     */
    pwszAuthorName : PWSTR

    /**
     * Pointer to a zero-terminated Unicode string that contains the display name of the EAP method.
     */
    pwszFriendlyName : PWSTR

    /**
     * Set of flags that describe specific properties of the EAP methods. For flag descriptions, see [EAP Method Properties](/windows/win32/eaphost/eap-method-properties).
     */
    eapProperties : UInt32

    __pInnerMethodInfoArray_ptr : IntPtr
    /**
     * Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ns-eaptypes-eap_method_info_array_ex">EAP_METHOD_INFO_ARRAY_EX</a> structure that contains information about all of the EAP methods installed on the client computer.
     */
    pInnerMethodInfoArray {
        get => (addr := this.__pInnerMethodInfoArray_ptr) ? EAP_METHOD_INFO_ARRAY_EX.At(addr) : unset
        set => this.__pInnerMethodInfoArray_ptr := (IsSet(value) && value) ? value.Ptr : 0
    }

}
