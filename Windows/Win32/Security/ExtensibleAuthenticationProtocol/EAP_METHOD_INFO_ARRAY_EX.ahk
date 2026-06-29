#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\EAP_METHOD_INFO_EX.ahk" { EAP_METHOD_INFO_EX }

/**
 * Contains information about all of the EAP methods installed on the client computer.
 * @see https://learn.microsoft.com/windows/win32/api/eaptypes/ns-eaptypes-eap_method_info_array_ex
 * @namespace Windows.Win32.Security.ExtensibleAuthenticationProtocol
 */
export default struct EAP_METHOD_INFO_ARRAY_EX {
    #StructPack 8

    /**
     * The number of <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ns-eaptypes-eap_method_info_ex">EAP_METHOD_INFO_EX</a> structures in <b>pEapMethods</b>.
     */
    dwNumberOfMethods : UInt32

    __pEapMethods_ptr : IntPtr
    /**
     * Pointer to the address of the first element in an array of <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ns-eaptypes-eap_method_info_ex">EAP_METHOD_INFO_EX</a> structures. The total number of elements is specified in <b>dwNumberOfMethods</b>.
     */
    pEapMethods {
        get => (addr := this.__pEapMethods_ptr) ? EAP_METHOD_INFO_EX.At(addr) : unset
        set => this.__pEapMethods_ptr := (IsSet(value) && value) ? value.Ptr : 0
    }

}
