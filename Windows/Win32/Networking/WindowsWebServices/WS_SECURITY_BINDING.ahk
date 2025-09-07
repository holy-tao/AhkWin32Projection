#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The abstract base type for all security bindings.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_security_binding
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_SECURITY_BINDING extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * The<a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_security_binding_type"> WS_SECURITY_BINDING_TYPE</a> of the security binding being described.  The type value
     * indicates how to obtain the security token corresponding to this
     * security binding.
     * @type {Integer}
     */
    bindingType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * The array of properties specifying the optional security binding
     * settings.  Each <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ns-webservices-ws_security_binding_property">WS_SECURITY_BINDING_PROPERTY</a> in the array is a key-value
     * pair and must use a key defined in <a href="https://docs.microsoft.com/windows/desktop/api/webservices/ne-webservices-ws_security_binding_property_id">WS_SECURITY_BINDING_PROPERTY_ID</a>.  This field can be <b>NULL</b>, and if
     * it is <b>NULL</b>, the default value will be used for each security token
     * setting.
     * @type {Pointer<WS_SECURITY_BINDING_PROPERTY>}
     */
    properties {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * The count of elements in the properties array.
     * @type {Integer}
     */
    propertyCount {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}
