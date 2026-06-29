#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IShellItem2.ahk" { IShellItem2 }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\SYNCMGR_CONFLICT_ITEM_TYPE.ahk" { SYNCMGR_CONFLICT_ITEM_TYPE }

/**
 * Defines conflict item structure.
 * @see https://learn.microsoft.com/windows/win32/api/syncmgr/ns-syncmgr-confirm_conflict_item
 * @namespace Windows.Win32.UI.Shell
 */
export default struct CONFIRM_CONFLICT_ITEM {
    #StructPack 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem2">IShellItem2</a>*</b>
     * 
     * A pointer to <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem2">IShellItem2</a> interface.
     */
    pShellItem : IShellItem2

    /**
     * Type: <b>LPWSTR</b>
     * 
     * A pointer to the original name. If set to <b>NULL</b> then IShellItem's display name will be used.
     */
    pszOriginalName : PWSTR

    /**
     * Type: <b>LPWSTR</b>
     * 
     * A pointer to the alternate name. If multiple items are kept, then item must be renamed to this name. User may or may not have an ability to change the name.
     */
    pszAlternateName : PWSTR

    /**
     * Type: <b>LPWSTR</b>
     * 
     * A pointer to the short location.
     */
    pszLocationShort : PWSTR

    /**
     * Type: <b>LPWSTR</b>
     * 
     * A pointer to the full location.
     */
    pszLocationFull : PWSTR

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/ne-syncmgr-syncmgr_conflict_item_type">SYNCMGR_CONFLICT_ITEM_TYPE</a></b>
     * 
     * The conflict item type. See <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/ne-syncmgr-syncmgr_conflict_item_type">SYNCMGR_CONFLICT_ITEM_TYPE</a>.
     */
    nType : SYNCMGR_CONFLICT_ITEM_TYPE

}
