#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WS_ENDPOINT_IDENTITY_TYPE.ahk" { WS_ENDPOINT_IDENTITY_TYPE }
#Import ".\WS_XML_BUFFER.ahk" { WS_XML_BUFFER }
#Import ".\WS_ENDPOINT_IDENTITY.ahk" { WS_ENDPOINT_IDENTITY }

/**
 * Type for unknown endpoint identity. This type is only used to represent an endpoint identity type that was deserialized but was not understood.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_unknown_endpoint_identity
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_UNKNOWN_ENDPOINT_IDENTITY {
    #StructPack 8

    /**
     * The base type from which this type and all other endpoint identity types derive.
     */
    identity : WS_ENDPOINT_IDENTITY

    /**
     * An XML buffer containing a single XML Element which corresponds to the
     *                     identity element that was not understood.  This field may not be <b>NULL</b>.
     */
    element : WS_XML_BUFFER.Ptr

}
