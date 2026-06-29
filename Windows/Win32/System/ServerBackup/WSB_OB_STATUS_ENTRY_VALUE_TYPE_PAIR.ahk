#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WSB_OB_STATUS_ENTRY_PAIR_TYPE.ahk" { WSB_OB_STATUS_ENTRY_PAIR_TYPE }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * Contains the value and value type for a parameter used to expand the value resource string.
 * @see https://learn.microsoft.com/windows/win32/api/wsbonline/ns-wsbonline-wsb_ob_status_entry_value_type_pair
 * @namespace Windows.Win32.System.ServerBackup
 */
export default struct WSB_OB_STATUS_ENTRY_VALUE_TYPE_PAIR {
    #StructPack 8

    /**
     * Specifies the value for the parameter.
     */
    m_wszObStatusEntryPairValue : PWSTR

    /**
     * Specifies the type of the value for the parameter.
     */
    m_ObStatusEntryPairType : WSB_OB_STATUS_ENTRY_PAIR_TYPE

}
