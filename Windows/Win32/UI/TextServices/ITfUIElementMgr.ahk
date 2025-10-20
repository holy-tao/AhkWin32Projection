#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The ITfUIElementMgr interface is implemented by TSF manager and used by an application or a text service. An application and a text service can obtain this interface by ITfThreadMgr::QueryInterface with IID_ITfUIElementMgr.
 * @remarks
 * 
  * A text service that supports UIElement must call <b>ITfUIElementMgr</b> whenever the UI is shown, updated or hidden. Then the application can control the visibility of the UI.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//msctf/nn-msctf-itfuielementmgr
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class ITfUIElementMgr extends IUnknown{
    /**
     * The interface identifier for ITfUIElementMgr
     * @type {Guid}
     */
    static IID => Guid("{ea1ea135-19df-11d7-a6d2-00065b84435c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<ITfUIElement>} pElement 
     * @param {Pointer<BOOL>} pbShow 
     * @param {Pointer<UInt32>} pdwUIElementId 
     * @returns {HRESULT} 
     */
    BeginUIElement(pElement, pbShow, pdwUIElementId) {
        result := ComCall(3, this, "ptr", pElement, "ptr", pbShow, "uint*", pdwUIElementId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwUIElementId 
     * @returns {HRESULT} 
     */
    UpdateUIElement(dwUIElementId) {
        result := ComCall(4, this, "uint", dwUIElementId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwUIElementId 
     * @returns {HRESULT} 
     */
    EndUIElement(dwUIElementId) {
        result := ComCall(5, this, "uint", dwUIElementId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwUIELementId 
     * @param {Pointer<ITfUIElement>} ppElement 
     * @returns {HRESULT} 
     */
    GetUIElement(dwUIELementId, ppElement) {
        result := ComCall(6, this, "uint", dwUIELementId, "ptr", ppElement, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IEnumTfUIElements>} ppEnum 
     * @returns {HRESULT} 
     */
    EnumUIElements(ppEnum) {
        result := ComCall(7, this, "ptr", ppEnum, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
