#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The top-level structure used to specify the security requirements for a channel (on the client side) or a listener (on the server side).
 * @remarks
 * The figure below illustrates the structure of a security description.
 * 
 * :::image type="content" source="images/SecurityDescription.png" border="false" alt-text="Diagram of the elements in a security description. A Channel-wide Settings Bag,  a Security Binding, and the properties of the Security Binding.":::
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_security_description
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_SECURITY_DESCRIPTION extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * The array of pointers to security bindings.  The set of security
     * bindings supplies determines the kind of security applied to the
     * channel.  Each security binding specifies one security token.
     * @type {Pointer<Pointer<WS_SECURITY_BINDING>>}
     */
    securityBindings {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * The count of elements in the securityBindings array.
     * @type {Integer}
     */
    securityBindingCount {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The array of properties specifying the optional channel-wide security
     * settings.  Each <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_security_property">WS_SECURITY_PROPERTY</a> in the array is a key-value
     * pair and must use a key defined in <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_security_property_id">WS_SECURITY_PROPERTY_ID</a>.  This field can be <b>NULL</b>,
     * and if it is <b>NULL</b>, the default value will be used for each security
     * channel setting.
     * @type {Pointer<WS_SECURITY_PROPERTY>}
     */
    properties {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * The count of elements in the properties array.
     * @type {Integer}
     */
    propertyCount {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }
}
