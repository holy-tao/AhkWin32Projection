#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * 
     * @param {Pointer<BSTR>} pbstrDescription 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfuielement-getdescription
     */
    GetDescription(pbstrDescription) {
        result := ComCall(3, this, "ptr", pbstrDescription, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pguid 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfuielement-getguid
     */
    GetGUID(pguid) {
        result := ComCall(4, this, "ptr", pguid, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} bShow 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfuielement-show
     */
    Show(bShow) {
        result := ComCall(5, this, "int", bShow, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pbShow 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfuielement-isshown
     */
    IsShown(pbShow) {
        result := ComCall(6, this, "ptr", pbShow, "HRESULT")
        return result
    }
}
