#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Enables text services and Input Method Editors (IMEs) to adjust UI-less mode behavior.
 * @remarks
 * 
  * The <b>ITfIntegratableCandidateListUIElement</b> interface is implemented by text services and Input Method Editors (IMEs) to adjust UI-less mode behavior for a better UI and keyboarding experience in IME-integrated controls, like the Windows 8 Search box.  The interface is used by apps that need a more streamlined UI and keyboarding experience with IME languages. 
  * 
  * You can get an <b>ITfIntegratableCandidateListUIElement</b> interface pointer by calling <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> on the <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfuielement">ITfUIElement</a> interface pointer that's provided by using the <i>dwUIElementId</i> parameters of the <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfuielementsink">ITfUIElementSink</a> callback functions to obtain the interface from  <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfuielementmgr">ITfUIElementMgr</a>.
  * 
  * The <b>ITfIntegratableCandidateListUIElement</b> interface is an optional interface that's implemented by a text service or IME that needs greater control over how its UI is presented in UI-less mode.  Apps can use it to implement more streamlined, special-purpose input controls, as in auto-complete or search suggestions.
  * 
  * Implement the <b>ITfIntegratableCandidateListUIElement</b> interface in the same class that implements the <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfuielement">ITfUIElement</a>, <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfcandidatelistuielement">ITfCandidateListUIElement</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfcandidatelistuielementbehavior">ITfCandidateListUIElementBehavior</a> interfaces.  These interfaces work together to create a fully integrated experience in which the app renders candidate list UI for the text service or IME and can also have some IME-specific UI customization and keyboard interaction behavior.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//ctffunc/nn-ctffunc-itfintegratablecandidatelistuielement
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class ITfIntegratableCandidateListUIElement extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITfIntegratableCandidateListUIElement
     * @type {Guid}
     */
    static IID => Guid("{c7a6f54f-b180-416f-b2bf-7bf2e4683d7b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetIntegrationStyle", "GetSelectionStyle", "OnKeyDown", "ShowCandidateNumbers", "FinalizeExactCompositionString"]

    /**
     * 
     * @param {Guid} guidIntegrationStyle 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ctffunc/nf-ctffunc-itfintegratablecandidatelistuielement-setintegrationstyle
     */
    SetIntegrationStyle(guidIntegrationStyle) {
        result := ComCall(3, this, "ptr", guidIntegrationStyle, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} ptfSelectionStyle 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ctffunc/nf-ctffunc-itfintegratablecandidatelistuielement-getselectionstyle
     */
    GetSelectionStyle(ptfSelectionStyle) {
        result := ComCall(4, this, "int*", ptfSelectionStyle, "HRESULT")
        return result
    }

    /**
     * 
     * @param {WPARAM} wParam 
     * @param {LPARAM} lParam 
     * @param {Pointer<BOOL>} pfEaten 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ctffunc/nf-ctffunc-itfintegratablecandidatelistuielement-onkeydown
     */
    OnKeyDown(wParam, lParam, pfEaten) {
        result := ComCall(5, this, "ptr", wParam, "ptr", lParam, "ptr", pfEaten, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pfShow 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ctffunc/nf-ctffunc-itfintegratablecandidatelistuielement-showcandidatenumbers
     */
    ShowCandidateNumbers(pfShow) {
        result := ComCall(6, this, "ptr", pfShow, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ctffunc/nf-ctffunc-itfintegratablecandidatelistuielement-finalizeexactcompositionstring
     */
    FinalizeExactCompositionString() {
        result := ComCall(7, this, "HRESULT")
        return result
    }
}
