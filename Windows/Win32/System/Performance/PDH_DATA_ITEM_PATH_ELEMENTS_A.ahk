#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * The PDH_DATA_ITEM_PATH_ELEMENTS structure contains the path elements of a specific data item. (ANSI)
 * @see https://learn.microsoft.com/windows/win32/api/pdh/ns-pdh-pdh_data_item_path_elements_a
 * @namespace Windows.Win32.System.Performance
 * @charset ANSI
 */
export default struct PDH_DATA_ITEM_PATH_ELEMENTS_A {
    #StructPack 8

    /**
     * Pointer to a null-terminated string that specifies the name of the computer where the data item resides.
     */
    szMachineName : PSTR

    /**
     * GUID of the object where the data item resides.
     */
    ObjectGUID : Guid

    /**
     * Identifier of the data item.
     */
    dwItemId : UInt32

    /**
     * Pointer to a null-terminated string that specifies the name of the data item instance.
     */
    szInstanceName : PSTR

}
