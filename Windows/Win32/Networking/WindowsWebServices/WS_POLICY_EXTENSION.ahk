#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WS_POLICY_EXTENSION_TYPE.ahk" { WS_POLICY_EXTENSION_TYPE }

/**
 * The base class for all policy extension structures. Policy extensions are assertions that are directly handled by applications such as custom assertions.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_policy_extension
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_POLICY_EXTENSION {
    #StructPack 4

    /**
     * This value depends on which type of policy extension that is used.
     */
    type : WS_POLICY_EXTENSION_TYPE

}
