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
     * 
     * @param {Pointer<BOOL>} pbCheck 
     * @returns {HRESULT} 
     */
    GetCheckState(pbCheck) {
        result := ComCall(3, this, "ptr", pbCheck, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} bCheck 
     * @returns {HRESULT} 
     */
    SetCheckState(bCheck) {
        result := ComCall(4, this, "int", bCheck, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
