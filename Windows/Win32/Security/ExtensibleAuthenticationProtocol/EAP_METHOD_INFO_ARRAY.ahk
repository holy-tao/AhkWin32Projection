#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\EAP_METHOD_INFO.ahk" { EAP_METHOD_INFO }

/**
 * Contains information on EAP methods installed on the client computer.
 * @see https://learn.microsoft.com/windows/win32/api/eaptypes/ns-eaptypes-eap_method_info_array
 * @namespace Windows.Win32.Security.ExtensibleAuthenticationProtocol
 */
export default struct EAP_METHOD_INFO_ARRAY {
    #StructPack 8

    /**
     * The number of <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ns-eaptypes-eap_method_info">EAP_METHOD_INFO</a> structures in <b>pEapMethods</b>.
     */
    dwNumberOfMethods : UInt32

    /**
     * Pointer to the address of the first element in an array of <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ns-eaptypes-eap_method_info">EAP_METHOD_INFO</a> structures. The total number of elements is specified in <b>dwNumberOfMethods</b>.
     */
    pEapMethods : EAP_METHOD_INFO.Ptr

}
