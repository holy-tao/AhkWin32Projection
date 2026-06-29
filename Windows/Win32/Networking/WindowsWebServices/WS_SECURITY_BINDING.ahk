#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WS_SECURITY_BINDING_PROPERTY.ahk" { WS_SECURITY_BINDING_PROPERTY }
#Import ".\WS_SECURITY_BINDING_TYPE.ahk" { WS_SECURITY_BINDING_TYPE }

/**
 * The abstract base type for all security bindings.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_security_binding
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_SECURITY_BINDING {
    #StructPack 8

    /**
     * The<a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_security_binding_type"> WS_SECURITY_BINDING_TYPE</a> of the security binding being described.  The type value
     * indicates how to obtain the security token corresponding to this
     * security binding.
     */
    bindingType : WS_SECURITY_BINDING_TYPE

    /**
     * The array of properties specifying the optional security binding
     * settings.  Each <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_security_binding_property">WS_SECURITY_BINDING_PROPERTY</a> in the array is a key-value
     * pair and must use a key defined in <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_security_binding_property_id">WS_SECURITY_BINDING_PROPERTY_ID</a>.  This field can be <b>NULL</b>, and if
     * it is <b>NULL</b>, the default value will be used for each security token
     * setting.
     */
    properties : WS_SECURITY_BINDING_PROPERTY.Ptr

    /**
     * The count of elements in the properties array.
     */
    propertyCount : UInt32

}
