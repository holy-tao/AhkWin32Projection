#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The ITfLangBarItemMgr interface is implemented by the language bar and used by a text service to manage items in the language bar.
 * @see https://docs.microsoft.com/windows/win32/api//ctfutb/nn-ctfutb-itflangbaritemmgr
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class ITfLangBarItemMgr extends IUnknown{
    /**
     * The interface identifier for ITfLangBarItemMgr
     * @type {Guid}
     */
    static IID => Guid("{ba468c55-9956-4fb1-a59d-52a7dd7cc6aa}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IEnumTfLangBarItems>} ppEnum 
     * @returns {HRESULT} 
     */
    EnumItems(ppEnum) {
        result := ComCall(3, this, "ptr", ppEnum, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} rguid 
     * @param {Pointer<ITfLangBarItem>} ppItem 
     * @returns {HRESULT} 
     */
    GetItem(rguid, ppItem) {
        result := ComCall(4, this, "ptr", rguid, "ptr", ppItem, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITfLangBarItem>} punk 
     * @returns {HRESULT} 
     */
    AddItem(punk) {
        result := ComCall(5, this, "ptr", punk, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITfLangBarItem>} punk 
     * @returns {HRESULT} 
     */
    RemoveItem(punk) {
        result := ComCall(6, this, "ptr", punk, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITfLangBarItemSink>} punk 
     * @param {Pointer<UInt32>} pdwCookie 
     * @param {Pointer<Guid>} rguidItem 
     * @returns {HRESULT} 
     */
    AdviseItemSink(punk, pdwCookie, rguidItem) {
        result := ComCall(7, this, "ptr", punk, "uint*", pdwCookie, "ptr", rguidItem, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwCookie 
     * @returns {HRESULT} 
     */
    UnadviseItemSink(dwCookie) {
        result := ComCall(8, this, "uint", dwCookie, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwThreadId 
     * @param {Pointer<Guid>} rguid 
     * @param {Pointer<RECT>} prc 
     * @returns {HRESULT} 
     */
    GetItemFloatingRect(dwThreadId, rguid, prc) {
        result := ComCall(9, this, "uint", dwThreadId, "ptr", rguid, "ptr", prc, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ulCount 
     * @param {Pointer<Guid>} prgguid 
     * @param {Pointer<UInt32>} pdwStatus 
     * @returns {HRESULT} 
     */
    GetItemsStatus(ulCount, prgguid, pdwStatus) {
        result := ComCall(10, this, "uint", ulCount, "ptr", prgguid, "uint*", pdwStatus, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pulCount 
     * @returns {HRESULT} 
     */
    GetItemNum(pulCount) {
        result := ComCall(11, this, "uint*", pulCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ulCount 
     * @param {Pointer<ITfLangBarItem>} ppItem 
     * @param {Pointer<TF_LANGBARITEMINFO>} pInfo 
     * @param {Pointer<UInt32>} pdwStatus 
     * @param {Pointer<UInt32>} pcFetched 
     * @returns {HRESULT} 
     */
    GetItems(ulCount, ppItem, pInfo, pdwStatus, pcFetched) {
        result := ComCall(12, this, "uint", ulCount, "ptr", ppItem, "ptr", pInfo, "uint*", pdwStatus, "uint*", pcFetched, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ulCount 
     * @param {Pointer<ITfLangBarItemSink>} ppunk 
     * @param {Pointer<Guid>} pguidItem 
     * @param {Pointer<UInt32>} pdwCookie 
     * @returns {HRESULT} 
     */
    AdviseItemsSink(ulCount, ppunk, pguidItem, pdwCookie) {
        result := ComCall(13, this, "uint", ulCount, "ptr", ppunk, "ptr", pguidItem, "uint*", pdwCookie, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ulCount 
     * @param {Pointer<UInt32>} pdwCookie 
     * @returns {HRESULT} 
     */
    UnadviseItemsSink(ulCount, pdwCookie) {
        result := ComCall(14, this, "uint", ulCount, "uint*", pdwCookie, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
