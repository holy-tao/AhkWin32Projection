#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\EAP_METHOD_PROPERTY_VALUE_DWORD.ahk" { EAP_METHOD_PROPERTY_VALUE_DWORD }
#Import ".\EAP_METHOD_PROPERTY_VALUE_BOOL.ahk" { EAP_METHOD_PROPERTY_VALUE_BOOL }
#Import ".\EAP_METHOD_PROPERTY_VALUE_STRING.ahk" { EAP_METHOD_PROPERTY_VALUE_STRING }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Contains the value of an EAP method property.
 * @see https://learn.microsoft.com/windows/win32/api/eaptypes/ns-eaptypes-eap_method_property_value
 * @namespace Windows.Win32.Security.ExtensibleAuthenticationProtocol
 */
export default struct EAP_METHOD_PROPERTY_VALUE {
    #StructPack 8

    /**
     * case(<i>empvtBool</i>)
     * 
     * If  <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ns-eaptypes-eap_method_property">eapMethodPropertyValueType</a> specifies a Boolean type (<i>empvtBool</i>), the data pointed to by this parameter is defined by the <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ns-eaptypes-eap_method_property_value_bool">EAP_METHOD_PROPERTY_VALUE_BOOL</a> structure.
     */
    empvBool : EAP_METHOD_PROPERTY_VALUE_BOOL

    static __New() {
        DefineProp(this.Prototype, 'empvDword', { type: EAP_METHOD_PROPERTY_VALUE_DWORD, offset: 0 })
        DefineProp(this.Prototype, 'empvString', { type: EAP_METHOD_PROPERTY_VALUE_STRING, offset: 0 })
        this.DeleteProp("__New")
    }
}
