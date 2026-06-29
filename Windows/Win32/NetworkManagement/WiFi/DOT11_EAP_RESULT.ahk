#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Security\ExtensibleAuthenticationProtocol\EAP_ATTRIBUTES.ahk" { EAP_ATTRIBUTES }

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 */
export default struct DOT11_EAP_RESULT {
    #StructPack 8

    dwFailureReasonCode : UInt32

    pAttribArray : EAP_ATTRIBUTES.Ptr

}
