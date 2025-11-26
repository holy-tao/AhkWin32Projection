#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The ITfUIElement interface is a base interface of the UIElement object and is implemented by a text service.
 * @remarks
 * 
 * A text service may implement some other UIElement interface such as <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfcandidatelistuielement">ITfCandidateListUIElement</a> in the same object that can be obtained by QI. A text service may implement only the <b>ITfUIElement</b> interface to a UI object that does not have to be drawn by the application but the show status can be controlled by the application. A text service that is categorized by GUID_TFCAT_TIPCAP_UIELEMENTENABLED needs to implement ITfUIElement for any UI object.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//msctf/nn-msctf-itfuielement
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class ITfUIElement extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITfUIElement
     * @type {Guid}
     */
    static IID => Guid("{ea1ea137-19df-11d7-a6d2-00065b84435c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDescription", "GetGUID", "Show", "IsShown"]

    /**
     * The ITfUIElement::GetDescription method returns the description of the UI element.
     * @returns {BSTR} [in] A pointer to BSTR that contains the description of the UI element.
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itfuielement-getdescription
     */
    GetDescription() {
        pbstrDescription := BSTR()
        result := ComCall(3, this, "ptr", pbstrDescription, "HRESULT")
        return pbstrDescription
    }

    /**
     * The ITfUIElement::GetGUID method returns the unique id of this UI element.
     * @returns {Guid} [out] A pointer to receive the GUID of the UI element.
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itfuielement-getguid
     */
    GetGUID() {
        pguid := Guid()
        result := ComCall(4, this, "ptr", pguid, "HRESULT")
        return pguid
    }

    /**
     * The ITfUIElement::Show method shows the text service's UI of this UI element.
     * @param {BOOL} bShow [in] <b>TRUE</b> to show the original UI of the element. <b>FALSE</b> to hide the original UI of the element.
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
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itfuielement-show
     */
    Show(bShow) {
        result := ComCall(5, this, "int", bShow, "HRESULT")
        return result
    }

    /**
     * The ITfUIElement::IsShown method returns true if the UI is currently shown by a text service; otherwise false.
     * @returns {BOOL} [out] A pointer to bool of the current show status of the original UI of this element.
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itfuielement-isshown
     */
    IsShown() {
        result := ComCall(6, this, "int*", &pbShow := 0, "HRESULT")
        return pbShow
    }
}
