#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ITfUIElement.ahk
#Include .\IEnumTfUIElements.ahk
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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["BeginUIElement", "UpdateUIElement", "EndUIElement", "GetUIElement", "EnumUIElements"]

    /**
     * 
     * @param {ITfUIElement} pElement 
     * @param {Pointer<BOOL>} pbShow 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfuielementmgr-beginuielement
     */
    BeginUIElement(pElement, pbShow) {
        pbShowMarshal := pbShow is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, "ptr", pElement, pbShowMarshal, pbShow, "uint*", &pdwUIElementId := 0, "HRESULT")
        return pdwUIElementId
    }

    /**
     * 
     * @param {Integer} dwUIElementId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfuielementmgr-updateuielement
     */
    UpdateUIElement(dwUIElementId) {
        result := ComCall(4, this, "uint", dwUIElementId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwUIElementId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfuielementmgr-enduielement
     */
    EndUIElement(dwUIElementId) {
        result := ComCall(5, this, "uint", dwUIElementId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwUIELementId 
     * @returns {ITfUIElement} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfuielementmgr-getuielement
     */
    GetUIElement(dwUIELementId) {
        result := ComCall(6, this, "uint", dwUIELementId, "ptr*", &ppElement := 0, "HRESULT")
        return ITfUIElement(ppElement)
    }

    /**
     * 
     * @returns {IEnumTfUIElements} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfuielementmgr-enumuielements
     */
    EnumUIElements() {
        result := ComCall(7, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumTfUIElements(ppEnum)
    }
}
