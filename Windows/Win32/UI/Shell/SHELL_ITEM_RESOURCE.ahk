#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * Defines Shell item resource.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/ns-shobjidl_core-shell_item_resource
 * @namespace Windows.Win32.UI.Shell
 */
export default struct SHELL_ITEM_RESOURCE {
    #StructPack 4

    /**
     * Type: <b>GUID</b>
     * 
     * The <b>GUID</b> that identifies the item.
     */
    guidType : Guid

    /**
     * Type: <b>WCHAR[MAX_PATH]</b>
     * 
     * The item name. A null-terminated Unicode buffer of size MAX_LENGTH characters.
     */
    szName : WCHAR[260]

}
