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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["EnumItems", "GetItem", "AddItem", "RemoveItem", "AdviseItemSink", "UnadviseItemSink", "GetItemFloatingRect", "GetItemsStatus", "GetItemNum", "GetItems", "AdviseItemsSink", "UnadviseItemsSink"]

    /**
     * 
     * @param {Pointer<IEnumTfLangBarItems>} ppEnum 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ctfutb/nf-ctfutb-itflangbaritemmgr-enumitems
     */
    EnumItems(ppEnum) {
        result := ComCall(3, this, "ptr*", ppEnum, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} rguid 
     * @param {Pointer<ITfLangBarItem>} ppItem 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ctfutb/nf-ctfutb-itflangbaritemmgr-getitem
     */
    GetItem(rguid, ppItem) {
        result := ComCall(4, this, "ptr", rguid, "ptr*", ppItem, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ITfLangBarItem} punk 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ctfutb/nf-ctfutb-itflangbaritemmgr-additem
     */
    AddItem(punk) {
        result := ComCall(5, this, "ptr", punk, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ITfLangBarItem} punk 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ctfutb/nf-ctfutb-itflangbaritemmgr-removeitem
     */
    RemoveItem(punk) {
        result := ComCall(6, this, "ptr", punk, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ITfLangBarItemSink} punk 
     * @param {Pointer<Integer>} pdwCookie 
     * @param {Pointer<Guid>} rguidItem 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ctfutb/nf-ctfutb-itflangbaritemmgr-adviseitemsink
     */
    AdviseItemSink(punk, pdwCookie, rguidItem) {
        result := ComCall(7, this, "ptr", punk, "uint*", pdwCookie, "ptr", rguidItem, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwCookie 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ctfutb/nf-ctfutb-itflangbaritemmgr-unadviseitemsink
     */
    UnadviseItemSink(dwCookie) {
        result := ComCall(8, this, "uint", dwCookie, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwThreadId 
     * @param {Pointer<Guid>} rguid 
     * @param {Pointer<RECT>} prc 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ctfutb/nf-ctfutb-itflangbaritemmgr-getitemfloatingrect
     */
    GetItemFloatingRect(dwThreadId, rguid, prc) {
        result := ComCall(9, this, "uint", dwThreadId, "ptr", rguid, "ptr", prc, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulCount 
     * @param {Pointer<Guid>} prgguid 
     * @param {Pointer<Integer>} pdwStatus 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ctfutb/nf-ctfutb-itflangbaritemmgr-getitemsstatus
     */
    GetItemsStatus(ulCount, prgguid, pdwStatus) {
        result := ComCall(10, this, "uint", ulCount, "ptr", prgguid, "uint*", pdwStatus, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pulCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ctfutb/nf-ctfutb-itflangbaritemmgr-getitemnum
     */
    GetItemNum(pulCount) {
        result := ComCall(11, this, "uint*", pulCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulCount 
     * @param {Pointer<ITfLangBarItem>} ppItem 
     * @param {Pointer<TF_LANGBARITEMINFO>} pInfo 
     * @param {Pointer<Integer>} pdwStatus 
     * @param {Pointer<Integer>} pcFetched 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ctfutb/nf-ctfutb-itflangbaritemmgr-getitems
     */
    GetItems(ulCount, ppItem, pInfo, pdwStatus, pcFetched) {
        result := ComCall(12, this, "uint", ulCount, "ptr*", ppItem, "ptr", pInfo, "uint*", pdwStatus, "uint*", pcFetched, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulCount 
     * @param {Pointer<ITfLangBarItemSink>} ppunk 
     * @param {Pointer<Guid>} pguidItem 
     * @param {Pointer<Integer>} pdwCookie 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ctfutb/nf-ctfutb-itflangbaritemmgr-adviseitemssink
     */
    AdviseItemsSink(ulCount, ppunk, pguidItem, pdwCookie) {
        result := ComCall(13, this, "uint", ulCount, "ptr*", ppunk, "ptr", pguidItem, "uint*", pdwCookie, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulCount 
     * @param {Pointer<Integer>} pdwCookie 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ctfutb/nf-ctfutb-itflangbaritemmgr-unadviseitemssink
     */
    UnadviseItemsSink(ulCount, pdwCookie) {
        result := ComCall(14, this, "uint", ulCount, "uint*", pdwCookie, "HRESULT")
        return result
    }
}
