#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ITfTextInputProcessor.ahk" { ITfTextInputProcessor }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ITfThreadMgr.ahk" { ITfThreadMgr }

/**
 * The ITfTextInputProcessorEx interface is implemented by a text service and used by the TSF manager to activate and deactivate the text service.
 * @see https://learn.microsoft.com/windows/win32/api/msctf/nn-msctf-itftextinputprocessorex
 * @namespace Windows.Win32.UI.TextServices
 */
export default struct ITfTextInputProcessorEx extends ITfTextInputProcessor {
    /**
     * The interface identifier for ITfTextInputProcessorEx
     * @type {Guid}
     */
    static IID := Guid("{6e4e2102-f9cd-433d-b496-303ce03a6507}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITfTextInputProcessorEx interfaces
    */
    struct Vtbl extends ITfTextInputProcessor.Vtbl {
        ActivateEx : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITfTextInputProcessorEx.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The ITfTextInputProcessorEx::ActivateEx method activates a text service when a user session starts. If the text service implements ITfTextInputProcessorEx and ActivateEx is called, ITfTextInputProcessor::Activate will not be called.
     * @param {ITfThreadMgr} ptim [in] Pointer to the ITfThreadMgr interface for the thread manager that owns the text service.
     * @param {Integer} tid [in] Specifies the client identifier for the text service.
     * @param {Integer} dwFlags [in] The combination of the following bits:
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TF_TMAE_SECUREMODE"></a><a id="tf_tmae_securemode"></a><dl>
     * <dt><b>TF_TMAE_SECUREMODE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A text service is activated as secure mode. A text service may not want to show the setting dialog box.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TF_TMAE_COMLESS"></a><a id="tf_tmae_comless"></a><dl>
     * <dt><b>TF_TMAE_COMLESS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A text service is activated as com less mode. TSF was activated without COM. COM may not be initialized or COM may be initialized as MTA.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TF_TMAE_WOW16"></a><a id="tf_tmae_wow16"></a><dl>
     * <dt><b>TF_TMAE_WOW16</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The current thread is 16 bit task.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TF_TMAE_CONSOLE"></a><a id="tf_tmae_console"></a><dl>
     * <dt><b>TF_TMAE_CONSOLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A text service is activated for console usage.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {HRESULT} The TSF manager ignores the return value of this method.
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itftextinputprocessorex-activateex
     */
    ActivateEx(ptim, tid, dwFlags) {
        result := ComCall(5, this, "ptr", ptim, "uint", tid, "uint", dwFlags, "HRESULT")
        return result
    }

    Query(iid) {
        if (ITfTextInputProcessorEx.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.ActivateEx := CallbackCreate(GetMethod(implObj, "ActivateEx"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.ActivateEx)
    }
}
