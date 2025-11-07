#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The PDH_COUNTER_PATH_ELEMENTS structure contains the components of a counter path.
 * @remarks
 * 
 * This structure is used by <a href="https://docs.microsoft.com/windows/desktop/api/pdh/nf-pdh-pdhmakecounterpatha">PdhMakeCounterPath</a> to create a counter path and by <a href="https://docs.microsoft.com/windows/desktop/api/pdh/nf-pdh-pdhparsecounterpatha">PdhParseCounterPath</a> to parse a counter path.
 * 
 * When you allocate memory for this structure, allocate enough memory for the member strings, such as <b>szCounterName</b>, that are appended to the end of this structure.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//pdh/ns-pdh-pdh_counter_path_elements_w
 * @namespace Windows.Win32.System.Performance
 * @version v4.0.30319
 * @charset Unicode
 */
class PDH_COUNTER_PATH_ELEMENTS_W extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * Pointer to a null-terminated string that specifies the computer name.
     * @type {PWSTR}
     */
    szMachineName {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Pointer to a null-terminated string that specifies the object name.
     * @type {PWSTR}
     */
    szObjectName {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Pointer to a null-terminated string that specifies the instance name. Can contain a wildcard character.
     * @type {PWSTR}
     */
    szInstanceName {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Pointer to a null-terminated string that specifies the parent instance name. Can contain a wildcard character.
     * @type {PWSTR}
     */
    szParentInstance {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Index used to uniquely identify duplicate instance names.
     * @type {Integer}
     */
    dwInstanceIndex {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * Pointer to a null-terminated string that specifies the counter name.
     * @type {PWSTR}
     */
    szCounterName {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }
}
