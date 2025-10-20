#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Enables snap-ins to enumerate dynamic subcontainers in the scope pane. The particular snap-in determines what qualifies as a subcontainer.
 * @see https://docs.microsoft.com/windows/win32/api//mmc/nn-mmc-iconsolenamespace
 * @namespace Windows.Win32.System.Mmc
 * @version v4.0.30319
 */
class IConsoleNameSpace extends IUnknown{
    /**
     * The interface identifier for IConsoleNameSpace
     * @type {Guid}
     */
    static IID => Guid("{bedeb620-f24d-11cf-8afc-00aa003ca9f6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<SCOPEDATAITEM>} item 
     * @returns {HRESULT} 
     */
    InsertItem(item) {
        result := ComCall(3, this, "ptr", item, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer} hItem 
     * @param {Integer} fDeleteThis 
     * @returns {HRESULT} 
     */
    DeleteItem(hItem, fDeleteThis) {
        result := ComCall(4, this, "ptr", hItem, "int", fDeleteThis, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SCOPEDATAITEM>} item 
     * @returns {HRESULT} 
     */
    SetItem(item) {
        result := ComCall(5, this, "ptr", item, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SCOPEDATAITEM>} item 
     * @returns {HRESULT} 
     */
    GetItem(item) {
        result := ComCall(6, this, "ptr", item, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer} item 
     * @param {Pointer<IntPtr>} pItemChild 
     * @param {Pointer<IntPtr>} pCookie 
     * @returns {HRESULT} 
     */
    GetChildItem(item, pItemChild, pCookie) {
        result := ComCall(7, this, "ptr", item, "ptr*", pItemChild, "ptr*", pCookie, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer} item 
     * @param {Pointer<IntPtr>} pItemNext 
     * @param {Pointer<IntPtr>} pCookie 
     * @returns {HRESULT} 
     */
    GetNextItem(item, pItemNext, pCookie) {
        result := ComCall(8, this, "ptr", item, "ptr*", pItemNext, "ptr*", pCookie, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer} item 
     * @param {Pointer<IntPtr>} pItemParent 
     * @param {Pointer<IntPtr>} pCookie 
     * @returns {HRESULT} 
     */
    GetParentItem(item, pItemParent, pCookie) {
        result := ComCall(9, this, "ptr", item, "ptr*", pItemParent, "ptr*", pCookie, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
