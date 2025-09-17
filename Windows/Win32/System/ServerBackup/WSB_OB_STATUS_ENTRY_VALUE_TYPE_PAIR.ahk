#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains the value and value type for a parameter used to expand the value resource string.
 * @see https://learn.microsoft.com/windows/win32/api/wsbonline/ns-wsbonline-wsb_ob_status_entry_value_type_pair
 * @namespace Windows.Win32.System.ServerBackup
 * @version v4.0.30319
 */
class WSB_OB_STATUS_ENTRY_VALUE_TYPE_PAIR extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Specifies the value for the parameter.
     * @type {Pointer<Char>}
     */
    m_wszObStatusEntryPairValue {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Specifies the type of the value for the parameter.
     * @type {Integer}
     */
    m_ObStatusEntryPairType {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }
}
