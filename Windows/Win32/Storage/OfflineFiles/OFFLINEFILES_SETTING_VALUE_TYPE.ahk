#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Identifies the data type returned by the IOfflineFilesSetting::GetValueType method.
 * @see https://docs.microsoft.com/windows/win32/api//cscobj/ne-cscobj-offlinefiles_setting_value_type
 * @namespace Windows.Win32.Storage.OfflineFiles
 * @version v4.0.30319
 */
class OFFLINEFILES_SETTING_VALUE_TYPE extends Win32Enum{

    /**
     * A single VT_UI4 value. Used to represent single REG_DWORD values. REG_DWORD is by far the most common type of setting value.
     * @type {Integer (Int32)}
     */
    static OFFLINEFILES_SETTING_VALUE_UI4 => 0

    /**
     * A single VT_BSTR value.  Used to represent single REG_SZ and REG_EXPAND_SZ values.
     * @type {Integer (Int32)}
     */
    static OFFLINEFILES_SETTING_VALUE_BSTR => 1

    /**
     * A single VT_BSTR value.  The string is a double-null-terminated string containing multiple null-terminated substrings. Used to represent single REG_MULTI_SZ values.
     * @type {Integer (Int32)}
     */
    static OFFLINEFILES_SETTING_VALUE_BSTR_DBLNULTERM => 2

    /**
     * A 2-dimensional array.  Each row is a <i>name,value</i> pair. Used to represent a set of REG_DWORD values under a registry key of the same name as the setting.  Typically, the value names contain UNC paths and the values contain a parameter associated with each UNC path. Column 0 is the value name expressed as VT_BSTR. Column 1 is the VT_UI4 value.
     * @type {Integer (Int32)}
     */
    static OFFLINEFILES_SETTING_VALUE_2DIM_ARRAY_BSTR_UI4 => 3

    /**
     * A 2-dimensional array.  Each row is a <i>name,value</i> pair. Used to represent a set of BSTR values under a registry key of the same name as the setting.  Typically, the value names contain UNC paths and the values contain a parameter associated with each UNC path. Column 0 is the value name expressed as VT_BSTR. Column 1 is the VT_BSTR value.
     * @type {Integer (Int32)}
     */
    static OFFLINEFILES_SETTING_VALUE_2DIM_ARRAY_BSTR_BSTR => 4
}
