#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * The IContextMenuCallback2 interface is used to add menu items to a context menu. This interface supersedes IContextMenuCallback.
 * @see https://docs.microsoft.com/windows/win32/api//mmc/nn-mmc-icontextmenucallback2
 * @namespace Windows.Win32.System.Mmc
 * @version v4.0.30319
 */
class IContextMenuCallback2 extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IContextMenuCallback2
     * @type {Guid}
     */
    static IID => Guid("{e178bc0e-2ed0-4b5e-8097-42c9087e8b33}")

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
     * 
     * @param {Pointer<CONTEXTMENUITEM2>} pItem 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-icontextmenucallback2-additem
     */
    AddItem(pItem) {
        result := ComCall(3, this, "ptr", pItem, "HRESULT")
        return result
    }
}
