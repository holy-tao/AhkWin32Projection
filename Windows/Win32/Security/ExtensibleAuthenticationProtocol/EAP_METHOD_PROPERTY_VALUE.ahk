#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\EAP_METHOD_PROPERTY_VALUE_BOOL.ahk
#Include .\EAP_METHOD_PROPERTY_VALUE_DWORD.ahk
#Include .\EAP_METHOD_PROPERTY_VALUE_STRING.ahk

/**
 * Contains the value of an EAP method property.
 * @see https://docs.microsoft.com/windows/win32/api//eaptypes/ns-eaptypes-eap_method_property_value
 * @namespace Windows.Win32.Security.ExtensibleAuthenticationProtocol
 * @version v4.0.30319
 */
class EAP_METHOD_PROPERTY_VALUE extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * case(<i>empvtBool</i>)
     * 
     * If  <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ns-eaptypes-eap_method_property">eapMethodPropertyValueType</a> specifies a Boolean type (<i>empvtBool</i>), the data pointed to by this parameter is defined by the <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ns-eaptypes-eap_method_property_value_bool">EAP_METHOD_PROPERTY_VALUE_BOOL</a> structure.
     * @type {EAP_METHOD_PROPERTY_VALUE_BOOL}
     */
    empvBool{
        get {
            if(!this.HasProp("__empvBool"))
                this.__empvBool := EAP_METHOD_PROPERTY_VALUE_BOOL(0, this)
            return this.__empvBool
        }
    }

    /**
     * case(<i>empvDword</i>)
     * 
     * If <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ns-eaptypes-eap_method_property">eapMethodPropertyValueType</a> specifies a DWORD type (empvtDword), the data pointed to by this parameter is defined by the  <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ns-eaptypes-eap_method_property_value_dword">EAP_METHOD_PROPERTY_VALUE_DWORD</a> structure.
     * @type {EAP_METHOD_PROPERTY_VALUE_DWORD}
     */
    empvDword{
        get {
            if(!this.HasProp("__empvDword"))
                this.__empvDword := EAP_METHOD_PROPERTY_VALUE_DWORD(0, this)
            return this.__empvDword
        }
    }

    /**
     * case(<i>empvString</i>)
     * 
     * If <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ns-eaptypes-eap_method_property">eapMethodPropertyValueType</a> specifies a BYTE *(empvtString), the data pointed to by this parameter is defined by the   <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ns-eaptypes-eap_method_property_value_string">EAP_METHOD_PROPERTY_VALUE_STRING</a> structure.
     * @type {EAP_METHOD_PROPERTY_VALUE_STRING}
     */
    empvString{
        get {
            if(!this.HasProp("__empvString"))
                this.__empvString := EAP_METHOD_PROPERTY_VALUE_STRING(0, this)
            return this.__empvString
        }
    }
}
