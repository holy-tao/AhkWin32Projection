#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods for client applications to retrieve documents.
 * @see https://docs.microsoft.com/windows/win32/api//msaatext/nn-msaatext-iaccclientdocmgr
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class IAccClientDocMgr extends IUnknown{
    /**
     * The interface identifier for IAccClientDocMgr
     * @type {Guid}
     */
    static IID => Guid("{4c896039-7b6d-49e6-a8c1-45116a98292b}")

    /**
     * The class identifier for AccClientDocMgr
     * @type {Guid}
     */
    static CLSID => Guid("{fc48cc30-4f3e-4fa1-803b-ad0e196a83b1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IEnumUnknown>} enumUnknown 
     * @returns {HRESULT} 
     */
    GetDocuments(enumUnknown) {
        result := ComCall(3, this, "ptr", enumUnknown, "int")
        if(result != 0)
            throw OSError(result)

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

        result := ComCall(4, this, "ptr", hWnd, "ptr", riid, "ptr", ppunk, "int")
        if(result != 0)
            throw OSError(result)

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
        result := ComCall(5, this, "ptr", pt, "ptr", riid, "ptr", ppunk, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<IUnknown>} ppunk 
     * @returns {HRESULT} 
     */
    GetFocused(riid, ppunk) {
        result := ComCall(6, this, "ptr", riid, "ptr", ppunk, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
