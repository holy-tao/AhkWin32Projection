#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\EAP_ERROR.ahk" { EAP_ERROR }

/**
 * @namespace Windows.Win32.Security.ExtensibleAuthenticationProtocol
 */
export default struct EAPHOST_INTERACTIVE_UI_PARAMS {
    #StructPack 8

    dwSizeofContextData : UInt32

    pContextData : IntPtr

    dwSizeofInteractiveUIData : UInt32

    pInteractiveUIData : IntPtr

    dwError : UInt32

    pEapError : EAP_ERROR.Ptr

}
