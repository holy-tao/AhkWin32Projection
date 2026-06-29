#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WS_SECURITY_CONTEXT_PROPERTY_ID.ahk" { WS_SECURITY_CONTEXT_PROPERTY_ID }

/**
 * Defines a property of a WS_SECURITY_CONTEXT
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_security_context_property
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_SECURITY_CONTEXT_PROPERTY {
    #StructPack 8

    /**
     * The identifier of the property.
     */
    id : WS_SECURITY_CONTEXT_PROPERTY_ID

    /**
     * The property value.
     */
    value : IntPtr

    /**
     * The size of the property value
     */
    valueSize : UInt32

}
