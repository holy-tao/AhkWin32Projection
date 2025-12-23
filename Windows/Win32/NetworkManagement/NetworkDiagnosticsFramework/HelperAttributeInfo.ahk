#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The HelperAttributeInfo structure contains the name of the helper attribute and its type.
 * @see https://learn.microsoft.com/windows/win32/api/ndhelper/ns-ndhelper-helperattributeinfo
 * @namespace Windows.Win32.NetworkManagement.NetworkDiagnosticsFramework
 * @version v4.0.30319
 */
class HelperAttributeInfo extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Type: <b>[string] LPWSTR</b>
     * 
     * Pointer to a null-terminated string that contains the name of the helper attribute.
     * @type {PWSTR}
     */
    pwszName {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/ndattrib/ne-ndattrib-attribute_type">ATTRIBUTE_TYPE</a></b>
     * 
     * The type of helper attribute.
     * @type {Integer}
     */
    type {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }
}
