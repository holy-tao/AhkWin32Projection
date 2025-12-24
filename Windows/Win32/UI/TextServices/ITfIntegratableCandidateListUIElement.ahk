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
     * Sets the integration style.
     * @param {Guid} guidIntegrationStyle The desired type of keyboard integration experience.
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
     * The text service supports the integration style.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOTIMPL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The text service does not support the integration style.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//ctffunc/nf-ctffunc-itfintegratablecandidatelistuielement-setintegrationstyle
     */
    SetIntegrationStyle(guidIntegrationStyle) {
        result := ComCall(3, this, "ptr", guidIntegrationStyle, "HRESULT")
        return result
    }

    /**
     * Retrieves the selection style.
     * @returns {Integer} A value that specifies the selection style.
     * @see https://docs.microsoft.com/windows/win32/api//ctffunc/nf-ctffunc-itfintegratablecandidatelistuielement-getselectionstyle
     */
    GetSelectionStyle() {
        result := ComCall(4, this, "int*", &ptfSelectionStyle := 0, "HRESULT")
        return ptfSelectionStyle
    }

    /**
     * Processes a key press.
     * @param {WPARAM} wParam Specifies the virtual-key code of the key. For more information about this parameter, see the <i>wParam</i> parameter in <a href="https://docs.microsoft.com/windows/desktop/inputdev/wm-keydown">WM_KEYDOWN</a>.
     * @param {LPARAM} lParam Specifies the repeat count, scan code, extended-key flag, context code, previous key-state flag, and transition-state flag of the key. For more information about this parameter, see the <i>lParam</i> parameter in <a href="https://docs.microsoft.com/windows/desktop/inputdev/wm-keydown">WM_KEYDOWN</a>.
     * @returns {BOOL} <b>TRUE</b> if the key event was handled; otherwise, <b>FALSE</b>.
     * @see https://docs.microsoft.com/windows/win32/api//ctffunc/nf-ctffunc-itfintegratablecandidatelistuielement-onkeydown
     */
    OnKeyDown(wParam, lParam) {
        result := ComCall(5, this, "ptr", wParam, "ptr", lParam, "int*", &pfEaten := 0, "HRESULT")
        return pfEaten
    }

    /**
     * Specifies whether candidate numbers should be shown.
     * @returns {BOOL} <b>TRUE</b> if candidate numbers should be shown; otherwise <b>FALSE</b>.
     * @see https://docs.microsoft.com/windows/win32/api//ctffunc/nf-ctffunc-itfintegratablecandidatelistuielement-showcandidatenumbers
     */
    ShowCandidateNumbers() {
        result := ComCall(6, this, "int*", &pfShow := 0, "HRESULT")
        return pfShow
    }

    /**
     * Finalizes the current composition with the value currently shown to the user.
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
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//ctffunc/nf-ctffunc-itfintegratablecandidatelistuielement-finalizeexactcompositionstring
     */
    FinalizeExactCompositionString() {
        result := ComCall(7, this, "HRESULT")
        return result
    }
}
