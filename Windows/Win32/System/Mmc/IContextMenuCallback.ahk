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
     * 
     * @param {Pointer<CONTEXTMENUITEM>} pItem 
     * @returns {HRESULT} 
     */
    AddItem(pItem) {
        result := ComCall(3, this, "ptr", pItem, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
