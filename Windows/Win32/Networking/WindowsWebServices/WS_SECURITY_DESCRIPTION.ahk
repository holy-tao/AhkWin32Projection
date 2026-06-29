#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WS_SECURITY_PROPERTY.ahk" { WS_SECURITY_PROPERTY }
#Import ".\WS_SECURITY_BINDING.ahk" { WS_SECURITY_BINDING }

/**
 * The top-level structure used to specify the security requirements for a channel (on the client side) or a listener (on the server side).
 * @remarks
 * The figure below illustrates the structure of a security description.
 * 
 * :::image type="content" source="images/SecurityDescription.png" border="false" alt-text="Diagram of the elements in a security description. A Channel-wide Settings Bag,  a Security Binding, and the properties of the Security Binding.":::
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_security_description
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
export default struct WS_SECURITY_DESCRIPTION {
    #StructPack 8

    /**
     * The array of pointers to security bindings.  The set of security
     * bindings supplies determines the kind of security applied to the
     * channel.  Each security binding specifies one security token.
     */
    securityBindings : IntPtr

    /**
     * The count of elements in the securityBindings array.
     */
    securityBindingCount : UInt32

    /**
     * The array of properties specifying the optional channel-wide security
     * settings.  Each <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_security_property">WS_SECURITY_PROPERTY</a> in the array is a key-value
     * pair and must use a key defined in <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_security_property_id">WS_SECURITY_PROPERTY_ID</a>.  This field can be <b>NULL</b>,
     * and if it is <b>NULL</b>, the default value will be used for each security
     * channel setting.
     */
    properties : WS_SECURITY_PROPERTY.Ptr

    /**
     * The count of elements in the properties array.
     */
    propertyCount : UInt32

}
