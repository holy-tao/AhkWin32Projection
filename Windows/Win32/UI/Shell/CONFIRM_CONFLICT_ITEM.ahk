#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * Defines conflict item structure.
 * @see https://docs.microsoft.com/windows/win32/api//syncmgr/ns-syncmgr-confirm_conflict_item
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class CONFIRM_CONFLICT_ITEM extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem2">IShellItem2</a>*</b>
     * 
     * A pointer to <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem2">IShellItem2</a> interface.
     * @type {Pointer<IShellItem2>}
     */
    pShellItem {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Type: <b>LPWSTR</b>
     * 
     * A pointer to the original name. If set to <b>NULL</b> then IShellItem's display name will be used.
     * @type {PWSTR}
     */
    pszOriginalName{
        get {
            if(!this.HasProp("__pszOriginalName"))
                this.__pszOriginalName := PWSTR(this.ptr + 8)
            return this.__pszOriginalName
        }
    }

    /**
     * Type: <b>LPWSTR</b>
     * 
     * A pointer to the alternate name. If multiple items are kept, then item must be renamed to this name. User may or may not have an ability to change the name.
     * @type {PWSTR}
     */
    pszAlternateName{
        get {
            if(!this.HasProp("__pszAlternateName"))
                this.__pszAlternateName := PWSTR(this.ptr + 16)
            return this.__pszAlternateName
        }
    }

    /**
     * Type: <b>LPWSTR</b>
     * 
     * A pointer to the short location.
     * @type {PWSTR}
     */
    pszLocationShort{
        get {
            if(!this.HasProp("__pszLocationShort"))
                this.__pszLocationShort := PWSTR(this.ptr + 24)
            return this.__pszLocationShort
        }
    }

    /**
     * Type: <b>LPWSTR</b>
     * 
     * A pointer to the full location.
     * @type {PWSTR}
     */
    pszLocationFull{
        get {
            if(!this.HasProp("__pszLocationFull"))
                this.__pszLocationFull := PWSTR(this.ptr + 32)
            return this.__pszLocationFull
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/ne-syncmgr-syncmgr_conflict_item_type">SYNCMGR_CONFLICT_ITEM_TYPE</a></b>
     * 
     * The conflict item type. See <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/ne-syncmgr-syncmgr_conflict_item_type">SYNCMGR_CONFLICT_ITEM_TYPE</a>.
     * @type {Integer}
     */
    nType {
        get => NumGet(this, 40, "int")
        set => NumPut("int", value, this, 40)
    }
}
