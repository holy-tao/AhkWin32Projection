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
     * The ITfUIElementMgr::BeginUIElement method is called by a text service before showing UI. The value returned determines whether the UI for the text service should be shown or not.
     * @param {ITfUIElement} pElement [in] A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfuielement">ITfUIElement</a> interface of the UIElement object.
     * @param {Pointer<BOOL>} pbShow [in, out] If false is returned, the application may draw the UI by itself and a text service does not show its own UI for this UI element.
     * @returns {Integer} [out] A pointer to receive the ID of this UI element.
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itfuielementmgr-beginuielement
     */
    BeginUIElement(pElement, pbShow) {
        pbShowMarshal := pbShow is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, "ptr", pElement, pbShowMarshal, pbShow, "uint*", &pdwUIElementId := 0, "HRESULT")
        return pdwUIElementId
    }

    /**
     * The ITfUIElementMgr::UpdateUIElement method is called by a text service when the UI element must be updated.
     * @param {Integer} dwUIElementId [in] The element id to update the UI element.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method was successful.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unspecified error occurred.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more parameters are invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Recursion call of <a href="/windows/desktop/api/msctf/nn-msctf-itfuielementmgr">ITfUIElementMgr</a> interface happened.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itfuielementmgr-updateuielement
     */
    UpdateUIElement(dwUIElementId) {
        result := ComCall(4, this, "uint", dwUIElementId, "HRESULT")
        return result
    }

    /**
     * The ITfUIElementMgr::EndUIElement method is called by a text service when the element of UI is hidden.
     * @param {Integer} dwUIElementId [in] The element id to hide the UI element.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method was successful.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unspecified error occurred.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more parameters are invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Recursion call of <a href="/windows/desktop/api/msctf/nn-msctf-itfuielementmgr">ITfUIElementMgr</a> interface happened.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itfuielementmgr-enduielement
     */
    EndUIElement(dwUIElementId) {
        result := ComCall(5, this, "uint", dwUIElementId, "HRESULT")
        return result
    }

    /**
     * The ITfUIElementMgr::GetUIElement method gets the ITfUIElement interface of the element id.
     * @param {Integer} dwUIELementId [in] The element id to get the <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfuielement">ITfUIElement</a> interface.
     * @returns {ITfUIElement} [out] A pointer to receive <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfuielement">ITfUIElement</a> interface.
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itfuielementmgr-getuielement
     */
    GetUIElement(dwUIELementId) {
        result := ComCall(6, this, "uint", dwUIELementId, "ptr*", &ppElement := 0, "HRESULT")
        return ITfUIElement(ppElement)
    }

    /**
     * The ITfUIElementMgr::EnumUIElements method returns IEnumTfUIElements interface pointer to enumerate the ITfUIElement.
     * @returns {IEnumTfUIElements} [in] A pointer to receive the <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-ienumtfuielements">IEnumTfUIElements</a> interface.
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itfuielementmgr-enumuielements
     */
    EnumUIElements() {
        result := ComCall(7, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumTfUIElements(ppEnum)
    }
}
