#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.ExtensibleAuthenticationProtocol
 */
export default struct LEGACY_INTERACTIVE_UI_PARAMS {
    #StructPack 8

    eapType : UInt32

    dwSizeofContextData : UInt32

    pContextData : IntPtr

    dwSizeofInteractiveUIData : UInt32

    pInteractiveUIData : IntPtr

    dwError : UInt32

}
