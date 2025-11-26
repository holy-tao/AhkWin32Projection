#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * The IContextMenuCallback interface is used to add menu items to a context menu.
 * @see https://docs.microsoft.com/windows/win32/api//mmc/nn-mmc-icontextmenucallback
 * @namespace Windows.Win32.System.Mmc
 * @version v4.0.30319
 */
class IContextMenuCallback extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IContextMenuCallback
     * @type {Guid}
     */
    static IID => Guid("{43136eb7-d36c-11cf-adbc-00aa00a80033}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AddItem"]

    /**
     * The IContextMenuCallback::AddItem method adds a single item to a context menu.
     * @param {Pointer<CONTEXTMENUITEM>} pItem A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/mmc/ns-mmc-contextmenuitem">CONTEXTMENUITEM</a> structure with the item to be added. This parameter cannot be <b>NULL</b>.
     * @returns {HRESULT} This method can return one of these values.
     * @see https://docs.microsoft.com/windows/win32/api//mmc/nf-mmc-icontextmenucallback-additem
     */
    AddItem(pItem) {
        result := ComCall(3, this, "ptr", pItem, "HRESULT")
        return result
    }
}
