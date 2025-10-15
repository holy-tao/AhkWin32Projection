#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PSTR.ahk

/**
 * The PDH_DATA_ITEM_PATH_ELEMENTS structure contains the path elements of a specific data item.
 * @see https://docs.microsoft.com/windows/win32/api//pdh/ns-pdh-pdh_data_item_path_elements_a
 * @namespace Windows.Win32.System.Performance
 * @version v4.0.30319
 * @charset ANSI
 */
class PDH_DATA_ITEM_PATH_ELEMENTS_A extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Pointer to a null-terminated string that specifies the name of the computer where the data item resides.
     * @type {PSTR}
     */
    szMachineName{
        get {
            if(!this.HasProp("__szMachineName"))
                this.__szMachineName := PSTR(this.ptr + 0)
            return this.__szMachineName
        }
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
     * @type {PSTR}
     */
    szInstanceName{
        get {
            if(!this.HasProp("__szInstanceName"))
                this.__szInstanceName := PSTR(this.ptr + 24)
            return this.__szInstanceName
        }
    }
}
