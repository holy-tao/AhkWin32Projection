#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOL.ahk
#Include .\EAP_METHOD_PROPERTY_VALUE_BOOL.ahk
#Include .\EAP_METHOD_PROPERTY_VALUE_DWORD.ahk
#Include .\EAP_METHOD_PROPERTY_VALUE_STRING.ahk
#Include .\EAP_METHOD_PROPERTY_VALUE.ahk

/**
 * Contains an EAP method property.
 * @see https://docs.microsoft.com/windows/win32/api//eaptypes/ns-eaptypes-eap_method_property
 * @namespace Windows.Win32.Security.ExtensibleAuthenticationProtocol
 * @version v4.0.30319
 */
class EAP_METHOD_PROPERTY extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * An <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ne-eaptypes-eap_method_property_type">EAP_METHOD_PROPERTY_TYPE</a> enumeration value that describes the type of the EAP method property.
     * @type {Integer}
     */
    eapMethodPropertyType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * An <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ne-eaptypes-eap_method_property_value_type">EAP_METHOD_PROPERTY_VALUE_TYPE</a> enumeration value that describes the data type of the value specified in <b>eapMethodPropertyValue</b>.
     * @type {Integer}
     */
    eapMethodPropertyValueType {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eaptypes/ns-eaptypes-eap_method_property_value">EAP_METHOD_PROPERTY_VALUE</a> union that contains the method property value.
     * @type {EAP_METHOD_PROPERTY_VALUE}
     */
    eapMethodPropertyValue{
        get {
            if(!this.HasProp("__eapMethodPropertyValue"))
                this.__eapMethodPropertyValue := EAP_METHOD_PROPERTY_VALUE(this.ptr + 8)
            return this.__eapMethodPropertyValue
        }
    }
}
