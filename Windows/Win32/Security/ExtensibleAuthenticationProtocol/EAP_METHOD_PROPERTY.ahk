#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\EAP_METHOD_PROPERTY_VALUE_DWORD.ahk" { EAP_METHOD_PROPERTY_VALUE_DWORD }
#Import ".\EAP_METHOD_PROPERTY_TYPE.ahk" { EAP_METHOD_PROPERTY_TYPE }
#Import ".\EAP_METHOD_PROPERTY_VALUE_BOOL.ahk" { EAP_METHOD_PROPERTY_VALUE_BOOL }
#Import ".\EAP_METHOD_PROPERTY_VALUE.ahk" { EAP_METHOD_PROPERTY_VALUE }
#Import ".\EAP_METHOD_PROPERTY_VALUE_STRING.ahk" { EAP_METHOD_PROPERTY_VALUE_STRING }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\EAP_METHOD_PROPERTY_VALUE_TYPE.ahk" { EAP_METHOD_PROPERTY_VALUE_TYPE }

/**
 * Contains an EAP method property.
 * @see https://learn.microsoft.com/windows/win32/api/eaptypes/ns-eaptypes-eap_method_property
 * @namespace Windows.Win32.Security.ExtensibleAuthenticationProtocol
 */
export default struct EAP_METHOD_PROPERTY {
    #StructPack 8

    /**
     * An <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ne-eaptypes-eap_method_property_type">EAP_METHOD_PROPERTY_TYPE</a> enumeration value that describes the type of the EAP method property.
     */
    eapMethodPropertyType : EAP_METHOD_PROPERTY_TYPE

    /**
     * An <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ne-eaptypes-eap_method_property_value_type">EAP_METHOD_PROPERTY_VALUE_TYPE</a> enumeration value that describes the data type of the value specified in <b>eapMethodPropertyValue</b>.
     */
    eapMethodPropertyValueType : EAP_METHOD_PROPERTY_VALUE_TYPE

    /**
     * An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eaptypes/ns-eaptypes-eap_method_property_value">EAP_METHOD_PROPERTY_VALUE</a> union that contains the method property value.
     */
    eapMethodPropertyValue : EAP_METHOD_PROPERTY_VALUE

}
