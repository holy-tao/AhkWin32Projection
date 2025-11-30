#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the set of possible data types for an EAP method property value.
 * @see https://docs.microsoft.com/windows/win32/api//eaptypes/ne-eaptypes-eap_method_property_value_type
 * @namespace Windows.Win32.Security.ExtensibleAuthenticationProtocol
 * @version v4.0.30319
 */
class EAP_METHOD_PROPERTY_VALUE_TYPE extends Win32Enum{

    /**
     * The method property value is of type <b>BOOL</b>.
     * @type {Integer (Int32)}
     */
    static empvtBool => 0

    /**
     * The method property value is of type <b>DWORD</b>.
     * @type {Integer (Int32)}
     */
    static empvtDword => 1

    /**
     * The method property value is a pointer to a value of type  <b>BYTE</b>.
     * @type {Integer (Int32)}
     */
    static empvtString => 2
}
