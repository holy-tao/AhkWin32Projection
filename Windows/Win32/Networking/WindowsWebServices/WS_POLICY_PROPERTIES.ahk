#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WS_POLICY_PROPERTY.ahk

/**
 * Specifies a set of WS_POLICY_PROPERTY structures.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_policy_properties
 * @namespace Windows.Win32.Networking.WindowsWebServices
 */
class WS_POLICY_PROPERTIES extends Win32Struct {
    static sizeof => 16

    static packingSize => 8

    /**
     * An array of properties.  The number of elements in the array is specified
     *                     using the propertyCount parameter.  This field may be <b>NULL</b> if the propertyCount
     *                     is 0.
     * @type {Pointer<WS_POLICY_PROPERTY>}
     */
    properties {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * The number of elements in the properties array.
     * @type {Integer}
     */
    propertyCount {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
