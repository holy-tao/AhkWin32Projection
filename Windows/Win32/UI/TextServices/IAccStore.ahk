#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class IAccStore extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAccStore
     * @type {Guid}
     */
    static IID => Guid("{e2cd4a63-2b72-4d48-b739-95e4765195ba}")

    /**
     * The class identifier for AccStore
     * @type {Guid}
     */
    static CLSID => Guid("{5440837f-4bff-4ae5-a1b1-7722ecc6332a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Register", "Unregister", "GetDocuments", "LookupByHWND", "LookupByPoint", "OnDocumentFocus", "GetFocused"]

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @param {IUnknown} punk 
     * @returns {HRESULT} 
     */
    Register(riid, punk) {
        result := ComCall(3, this, "ptr", riid, "ptr", punk, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUnknown} punk 
     * @returns {HRESULT} 
     */
    Unregister(punk) {
        result := ComCall(4, this, "ptr", punk, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IEnumUnknown>} enumUnknown 
     * @returns {HRESULT} 
     */
    GetDocuments(enumUnknown) {
        result := ComCall(5, this, "ptr*", enumUnknown, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HWND} hWnd 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<IUnknown>} ppunk 
     * @returns {HRESULT} 
     */
    LookupByHWND(hWnd, riid, ppunk) {
        hWnd := hWnd is Win32Handle ? NumGet(hWnd, "ptr") : hWnd

        result := ComCall(6, this, "ptr", hWnd, "ptr", riid, "ptr*", ppunk, "HRESULT")
        return result
    }

    /**
     * 
     * @param {POINT} pt 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<IUnknown>} ppunk 
     * @returns {HRESULT} 
     */
    LookupByPoint(pt, riid, ppunk) {
        result := ComCall(7, this, "ptr", pt, "ptr", riid, "ptr*", ppunk, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUnknown} punk 
     * @returns {HRESULT} 
     */
    OnDocumentFocus(punk) {
        result := ComCall(8, this, "ptr", punk, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<IUnknown>} ppunk 
     * @returns {HRESULT} 
     */
    GetFocused(riid, ppunk) {
        result := ComCall(9, this, "ptr", riid, "ptr*", ppunk, "HRESULT")
        return result
    }
}
