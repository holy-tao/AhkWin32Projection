#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Specifies certificate selection &quot;subject&quot; criteria for an authentication method.
 * @see https://learn.microsoft.com/windows/win32/api/iketypes/ns-iketypes-ikeext_cert_name0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 * @version v4.0.30319
 */
class IKEEXT_CERT_NAME0 extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Type: [IKEEXT_CERT_CRITERIA_NAME_TYPE](/windows/desktop/api/iketypes/ne-iketypes-ikeext_cert_criteria_name_type)</b>
     * 
     * The type of NAME field.
     * @type {Integer}
     */
    nameType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Type: <b>LPWSTR</b>
     * 
     * The string to be used for matching the "subject" criteria.
     * @type {Pointer<PWSTR>}
     */
    certName {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
