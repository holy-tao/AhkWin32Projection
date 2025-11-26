#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods that retrieve and set the state of items in a tree-view control that have the Tree-View Control Window Styles flag set.
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nn-shobjidl_core-iregtreeitem
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IRegTreeItem extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRegTreeItem
     * @type {Guid}
     */
    static IID => Guid("{a9521922-0812-4d44-9ec3-7fd38c726f3d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetCheckState", "SetCheckState"]

    /**
     * Gets the state of a check box item in a tree-view control.
     * @returns {BOOL} Type: <b>BOOL*</b>
     * 
     * A pointer to a <b>BOOL</b> that contains the state of the check box.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-iregtreeitem-getcheckstate
     */
    GetCheckState() {
        result := ComCall(3, this, "int*", &pbCheck := 0, "HRESULT")
        return pbCheck
    }

    /**
     * Sets the state of a check box item in a tree-view control.
     * @param {BOOL} bCheck Type: <b>BOOL</b>
     * 
     * A <b>BOOL</b> that sets the state of the check box.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-iregtreeitem-setcheckstate
     */
    SetCheckState(bCheck) {
        result := ComCall(4, this, "int", bCheck, "HRESULT")
        return result
    }
}
