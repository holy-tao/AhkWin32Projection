#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The PDH_DATA_ITEM_PATH_ELEMENTS structure contains the path elements of a specific data item. (Unicode)
 * @see https://learn.microsoft.com/windows/win32/api/pdh/ns-pdh-pdh_data_item_path_elements_w
 * @namespace Windows.Win32.System.Performance
 * @version v4.0.30319
 * @charset Unicode
 */
class PDH_DATA_ITEM_PATH_ELEMENTS_W extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Pointer to a null-terminated string that specifies the name of the computer where the data item resides.
     * @type {PWSTR}
     */
    szMachineName {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * GUID of the object where the data item resides.
     * @type {Pointer<Guid>}
     */
    ObjectGUID {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Identifier of the data item.
     * @type {Integer}
     */
    dwItemId {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Pointer to a null-terminated string that specifies the name of the data item instance.
     * @type {PWSTR}
     */
    szInstanceName {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }
}
