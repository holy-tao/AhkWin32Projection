#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The ITfUIElementSink interface is implemented by an application to receive notifications when the UI element is changed.
 * @remarks
 * 
 * To install this advise sink, obtain an <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfsource">ITfSource</a> object from an <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfuielementmgr">ITfUIElementMgr</a> object by calling <b>ITfUIElementMgr::QueryInterface</b> with IID_ ITfSource. Then call <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfsource-advisesink">ITfSource::AdviseSink</a> with IID_ ITfUIElementSink.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//msctf/nn-msctf-itfuielementsink
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class ITfUIElementSink extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITfUIElementSink
     * @type {Guid}
     */
    static IID => Guid("{ea1ea136-19df-11d7-a6d2-00065b84435c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["BeginUIElement", "UpdateUIElement", "EndUIElement"]

    /**
     * The ITfUIElementSink::BeginUIElement method is called when the UIElement started. This sink can let the textservice to draw or not to draw the UI element.
     * @param {Integer} dwUIElementId [in] Id of the UIElement that was started.
     * @param {Pointer<BOOL>} pbShow [in, out] Return <b>true</b> if the application does not draw the UIElement content and the text service draws its original UI content. Return <b>false</b> if the application draws the UIElement's content and stops the text service from drawing it. The application can get the <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfuielement">ITfUIElement</a> interface by using <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfuielementmgr-getuielement">ITfUIElementMgr::GetUIElement</a> and it can evaluate if it can handle the UIElement by QI with <b>IID_ITfCandidateListUIElement</b> or with other UIElement interfaces. The application can always return <b>FALSE</b> if it is unknown or it cannot be handled. In this case, the text service will not show any extra UI on the screen. This is a good way for some full screen applications. Alternatively, the application can return <b>TRUE</b> to use TextService's UI on some particular or unknown UIs.
     * @returns {HRESULT} The TSF manager ignores the return value of this method.
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
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itfuielementsink-beginuielement
     */
    BeginUIElement(dwUIElementId, pbShow) {
        pbShowMarshal := pbShow is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, "uint", dwUIElementId, pbShowMarshal, pbShow, "HRESULT")
        return result
    }

    /**
     * The ITfUIElementSink::UpdateUIElement method is called when the contents of the UIElement is updated.
     * @param {Integer} dwUIElementId [in] Id of the UIElement that has had its content updated.
     * @returns {HRESULT} The TSF manager ignores the return value of this method.
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itfuielementsink-updateuielement
     */
    UpdateUIElement(dwUIElementId) {
        result := ComCall(4, this, "uint", dwUIElementId, "HRESULT")
        return result
    }

    /**
     * The ITfUIElementSink::EndUIElement method is called when the UIElement is finished.
     * @param {Integer} dwUIElementId [in] Id of the UIElement that is finished.
     * @returns {HRESULT} The TSF manager ignores the return value of this method.
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itfuielementsink-enduielement
     */
    EndUIElement(dwUIElementId) {
        result := ComCall(5, this, "uint", dwUIElementId, "HRESULT")
        return result
    }
}
