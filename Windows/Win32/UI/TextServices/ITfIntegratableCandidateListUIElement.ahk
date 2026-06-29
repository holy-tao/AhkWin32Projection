#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\LPARAM.ahk" { LPARAM }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\TfIntegratableCandidateListSelectionStyle.ahk" { TfIntegratableCandidateListSelectionStyle }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\Foundation\WPARAM.ahk" { WPARAM }

/**
 * Enables text services and Input Method Editors (IMEs) to adjust UI-less mode behavior.
 * @remarks
 * The <b>ITfIntegratableCandidateListUIElement</b> interface is implemented by text services and Input Method Editors (IMEs) to adjust UI-less mode behavior for a better UI and keyboarding experience in IME-integrated controls, like the Windows 8 Search box.  The interface is used by apps that need a more streamlined UI and keyboarding experience with IME languages. 
 * 
 * You can get an <b>ITfIntegratableCandidateListUIElement</b> interface pointer by calling <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> on the <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfuielement">ITfUIElement</a> interface pointer that's provided by using the <i>dwUIElementId</i> parameters of the <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfuielementsink">ITfUIElementSink</a> callback functions to obtain the interface from  <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfuielementmgr">ITfUIElementMgr</a>.
 * 
 * The <b>ITfIntegratableCandidateListUIElement</b> interface is an optional interface that's implemented by a text service or IME that needs greater control over how its UI is presented in UI-less mode.  Apps can use it to implement more streamlined, special-purpose input controls, as in auto-complete or search suggestions.
 * 
 * Implement the <b>ITfIntegratableCandidateListUIElement</b> interface in the same class that implements the <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfuielement">ITfUIElement</a>, <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfcandidatelistuielement">ITfCandidateListUIElement</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfcandidatelistuielementbehavior">ITfCandidateListUIElementBehavior</a> interfaces.  These interfaces work together to create a fully integrated experience in which the app renders candidate list UI for the text service or IME and can also have some IME-specific UI customization and keyboard interaction behavior.
 * @see https://learn.microsoft.com/windows/win32/api/ctffunc/nn-ctffunc-itfintegratablecandidatelistuielement
 * @namespace Windows.Win32.UI.TextServices
 */
export default struct ITfIntegratableCandidateListUIElement extends IUnknown {
    /**
     * The interface identifier for ITfIntegratableCandidateListUIElement
     * @type {Guid}
     */
    static IID := Guid("{c7a6f54f-b180-416f-b2bf-7bf2e4683d7b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITfIntegratableCandidateListUIElement interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetIntegrationStyle            : IntPtr
        GetSelectionStyle              : IntPtr
        OnKeyDown                      : IntPtr
        ShowCandidateNumbers           : IntPtr
        FinalizeExactCompositionString : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITfIntegratableCandidateListUIElement.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Sets the integration style.
     * @remarks
     * If an app needs a keyboard-integrated experience, it can set a <b>GUID</b> for the desired type of 
     *     integration experience.  If the text service supports the integration style, it should return <b>S_OK</b>.
     *           If it's not supported, it should return <b>E_NOTIMPL</b>.  When called, the text service may adjust its respond to
     *     keyboard interaction for the lifetime of the <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfcandidatelistuielement">ITfCandidateListUIElement</a> object, for example, until <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfuielementsink-enduielement">ITfUIElementSink::EndUIElement</a> is called.
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
     * @see https://learn.microsoft.com/windows/win32/api/ctffunc/nf-ctffunc-itfintegratablecandidatelistuielement-setintegrationstyle
     */
    SetIntegrationStyle(guidIntegrationStyle) {
        result := ComCall(3, this, Guid, guidIntegrationStyle, "HRESULT")
        return result
    }

    /**
     * Retrieves the selection style.
     * @remarks
     * The active selection style usually indicates that the selection can be changed with the arrow keys. The implied selection style indicates the default selection key chooses it.
     *          If the app supports changing selection styles, this method should be called when the <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfuielementmgr-updateuielement">UpdateUIElement</a> method is called.
     * @returns {TfIntegratableCandidateListSelectionStyle} A value that specifies the selection style.
     * @see https://learn.microsoft.com/windows/win32/api/ctffunc/nf-ctffunc-itfintegratablecandidatelistuielement-getselectionstyle
     */
    GetSelectionStyle() {
        result := ComCall(4, this, "int*", &ptfSelectionStyle := 0, "HRESULT")
        return ptfSelectionStyle
    }

    /**
     * Processes a key press.
     * @remarks
     * The <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfcontextkeyeventsink-onkeydown">OnKeyDown</a> method enables an app to ask query the text service if it wants to process a given key in an integration style.  The behavior of the <b>OnKeyDown</b> method can depend on the integration style. If the text service returns <i>*pfEaten</i>=<b>TRUE</b>, then the app should do
     *     no processing of the key. If <b>FALSE</b> is returned, the app can perform its own action in response to the key.
     * 
     * <b>GUID_INTEGRATIONSTYLE_SEARCHBOX</b> ({E6D1BD11-82F7-4903-AE21-1A6397CDE2EB}) enables an implementation of a keyboarding experience in which the user can move perceived keyboard focus 
     *     from the search box to the candidate list to search suggestions. The text service can process keys     like <b>VK_UP</b> and <b>VK_DOWN</b> before Search handles them to change its internal state.
     * @param {WPARAM} _wParam Specifies the virtual-key code of the key. For more information about this parameter, see the <i>wParam</i> parameter in <a href="https://docs.microsoft.com/windows/desktop/inputdev/wm-keydown">WM_KEYDOWN</a>.
     * @param {LPARAM} _lParam Specifies the repeat count, scan code, extended-key flag, context code, previous key-state flag, and transition-state flag of the key. For more information about this parameter, see the <i>lParam</i> parameter in <a href="https://docs.microsoft.com/windows/desktop/inputdev/wm-keydown">WM_KEYDOWN</a>.
     * @returns {BOOL} <b>TRUE</b> if the key event was handled; otherwise, <b>FALSE</b>.
     * @see https://learn.microsoft.com/windows/win32/api/ctffunc/nf-ctffunc-itfintegratablecandidatelistuielement-onkeydown
     */
    OnKeyDown(_wParam, _lParam) {
        result := ComCall(5, this, WPARAM, _wParam, LPARAM, _lParam, BOOL.Ptr, &pfEaten := 0, "HRESULT")
        return pfEaten
    }

    /**
     * Specifies whether candidate numbers should be shown.
     * @returns {BOOL} <b>TRUE</b> if candidate numbers should be shown; otherwise <b>FALSE</b>.
     * @see https://learn.microsoft.com/windows/win32/api/ctffunc/nf-ctffunc-itfintegratablecandidatelistuielement-showcandidatenumbers
     */
    ShowCandidateNumbers() {
        result := ComCall(6, this, BOOL.Ptr, &pfShow := 0, "HRESULT")
        return pfShow
    }

    /**
     * Finalizes the current composition with the value currently shown to the user.
     * @remarks
     * The <b>FinalizeExactCompositionString</b> method enables an app to tell the text service that it should finalize the current composition with the exact
     *     value currently shown to the user, with no automatic conversion of the first candidate.  This enables the apps to move focus
     *     to suggestions below the candidate list, without changing the string.
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
     * @see https://learn.microsoft.com/windows/win32/api/ctffunc/nf-ctffunc-itfintegratablecandidatelistuielement-finalizeexactcompositionstring
     */
    FinalizeExactCompositionString() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (ITfIntegratableCandidateListUIElement.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetIntegrationStyle := CallbackCreate(GetMethod(implObj, "SetIntegrationStyle"), flags, 2)
        this.vtbl.GetSelectionStyle := CallbackCreate(GetMethod(implObj, "GetSelectionStyle"), flags, 2)
        this.vtbl.OnKeyDown := CallbackCreate(GetMethod(implObj, "OnKeyDown"), flags, 4)
        this.vtbl.ShowCandidateNumbers := CallbackCreate(GetMethod(implObj, "ShowCandidateNumbers"), flags, 2)
        this.vtbl.FinalizeExactCompositionString := CallbackCreate(GetMethod(implObj, "FinalizeExactCompositionString"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetIntegrationStyle)
        CallbackFree(this.vtbl.GetSelectionStyle)
        CallbackFree(this.vtbl.OnKeyDown)
        CallbackFree(this.vtbl.ShowCandidateNumbers)
        CallbackFree(this.vtbl.FinalizeExactCompositionString)
    }
}
