#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ITfDocumentMgr.ahk
#Include .\IEnumTfDocumentMgrs.ahk
#Include .\ITfFunctionProvider.ahk
#Include .\IEnumTfFunctionProviders.ahk
#Include .\ITfCompartmentMgr.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The ITfThreadMgr2 defines the primary object implemented by the TSF manager. ITfThreadMgr2 is used by applications and text services to activate and deactivate text services, create document managers, and maintain the document context focus.
 * @see https://docs.microsoft.com/windows/win32/api//msctf/nn-msctf-itfthreadmgr2
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class ITfThreadMgr2 extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITfThreadMgr2
     * @type {Guid}
     */
    static IID => Guid("{0ab198ef-6477-4ee8-8812-6780edb82d5e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Activate", "Deactivate", "CreateDocumentMgr", "EnumDocumentMgrs", "GetFocus", "SetFocus", "IsThreadFocus", "GetFunctionProvider", "EnumFunctionProviders", "GetGlobalCompartment", "ActivateEx", "GetActiveFlags", "SuspendKeystrokeHandling", "ResumeKeystrokeHandling"]

    /**
     * Activates TSF for the calling thread.
     * @returns {Integer} Pointer to a <a href="https://docs.microsoft.com/windows/desktop/TSF/tfclientid">TfClientId</a> value that receives a client identifier.
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itfthreadmgr2-activate
     */
    Activate() {
        result := ComCall(3, this, "uint*", &ptid := 0, "HRESULT")
        return ptid
    }

    /**
     * Deactivates TSF for the calling thread.
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
     * <dt><b>E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This method was called while the thread was activated or this call had no corresponding <a href="/windows/desktop/api/msctf/nf-msctf-itfthreadmgr2-activate">Activate</a> call.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itfthreadmgr2-deactivate
     */
    Deactivate() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * Creates a document manager object.
     * @returns {ITfDocumentMgr} Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfdocumentmgr">ITfDocumentMgr</a> interface that receives the document manager object.
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itfthreadmgr2-createdocumentmgr
     */
    CreateDocumentMgr() {
        result := ComCall(5, this, "ptr*", &ppdim := 0, "HRESULT")
        return ITfDocumentMgr(ppdim)
    }

    /**
     * Returns an enumerator for all the document managers within the calling thread.
     * @returns {IEnumTfDocumentMgrs} Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-ienumtfdocumentmgrs">IEnumTfDocumentMgrs</a> interface that receives the enumerator.
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itfthreadmgr2-enumdocumentmgrs
     */
    EnumDocumentMgrs() {
        result := ComCall(6, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumTfDocumentMgrs(ppEnum)
    }

    /**
     * Returns the document manager that has the input focus.
     * @returns {ITfDocumentMgr} Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfdocumentmgr">ITfDocumentMgr</a> interface that receives the document manager with the current input focus. Receives <b>NULL</b> if no document manager has the focus.
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itfthreadmgr2-getfocus
     */
    GetFocus() {
        result := ComCall(7, this, "ptr*", &ppdimFocus := 0, "HRESULT")
        return ITfDocumentMgr(ppdimFocus)
    }

    /**
     * Sets the input focus to the specified document manager.
     * @param {ITfDocumentMgr} pdimFocus Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfdocumentmgr">ITfDocumentMgr</a> interface that receives the input focus. This parameter cannot be <b>NULL</b>.
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
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>pdimFocus</i> is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itfthreadmgr2-setfocus
     */
    SetFocus(pdimFocus) {
        result := ComCall(8, this, "ptr", pdimFocus, "HRESULT")
        return result
    }

    /**
     * Determines if the calling thread has the TSF input focus.
     * @returns {BOOL} Pointer to a BOOL that receives a value that indicates if the calling thread has input focus. This parameter receives a nonzero value if the calling thread has the focus or zero otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itfthreadmgr2-isthreadfocus
     */
    IsThreadFocus() {
        result := ComCall(9, this, "int*", &pfThreadFocus := 0, "HRESULT")
        return pfThreadFocus
    }

    /**
     * Obtains the specified function provider object.
     * @param {Pointer<Guid>} clsid CLSID of the desired function provider. This can be the CLSID of a function provider registered for the calling thread or one of the following predefined values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="GUID_SYSTEM_FUNCTIONPROVIDER"></a><a id="guid_system_functionprovider"></a><dl>
     * <dt><b>GUID_SYSTEM_FUNCTIONPROVIDER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Obtains the TSF system function provider.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="GUID_APP_FUNCTIONPROVIDER"></a><a id="guid_app_functionprovider"></a><dl>
     * <dt><b>GUID_APP_FUNCTIONPROVIDER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Obtains the function provider implemented by the current application. This object is not available if the application does not register itself as a function provider.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {ITfFunctionProvider} Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itffunctionprovider">ITfFunctionProvider</a> interface that receives the function provider.
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itfthreadmgr2-getfunctionprovider
     */
    GetFunctionProvider(clsid) {
        result := ComCall(10, this, "ptr", clsid, "ptr*", &ppFuncProv := 0, "HRESULT")
        return ITfFunctionProvider(ppFuncProv)
    }

    /**
     * Obtains an enumerator for all of the function providers registered for the calling thread.
     * @returns {IEnumTfFunctionProviders} Address of a <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-ienumtffunctionproviders">IEnumTfFunctionProviders</a> interface that receives the function provider enumerator.
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itfthreadmgr2-enumfunctionproviders
     */
    EnumFunctionProviders() {
        result := ComCall(11, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumTfFunctionProviders(ppEnum)
    }

    /**
     * Obtains the global compartment manager object.
     * @returns {ITfCompartmentMgr} Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfcompartmentmgr">ITfCompartmentMgr</a> interface that receives the global compartment manager.
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itfthreadmgr2-getglobalcompartment
     */
    GetGlobalCompartment() {
        result := ComCall(12, this, "ptr*", &ppCompMgr := 0, "HRESULT")
        return ITfCompartmentMgr(ppCompMgr)
    }

    /**
     * Initializes and activates TSF for the calling thread with a flag that specifies how TSF is activated.
     * @param {Integer} dwFlags <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TF_TMAE_NOACTIVATETIP"></a><a id="tf_tmae_noactivatetip"></a><dl>
     * <dt><b>TF_TMAE_NOACTIVATETIP</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Text services will not be activated while this method is called. They will be activated when the calling thread has focus asynchronously.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TF_TMAE_SECUREMODE"></a><a id="tf_tmae_securemode"></a><dl>
     * <dt><b>TF_TMAE_SECUREMODE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * TSF is activated in secure mode. Only text services that support the secure mode will be activated.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TF_TMAE_UIELEMENTENABLEDONLY"></a><a id="tf_tmae_uielementenabledonly"></a><dl>
     * <dt><b>TF_TMAE_UIELEMENTENABLEDONLY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * TSF activates only text services that are categorized in GUID_TFCAT_TIPCAP_UIELEMENTENABLED.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TF_TMAE_COMLESS"></a><a id="tf_tmae_comless"></a><dl>
     * <dt><b>TF_TMAE_COMLESS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * TSF does not use COM. TSF activate only text services that are categorized in GUID_TFCAT_TIPCAP_COMLESS.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TF_TMAE_NOACTIVATEKEYBOARDLAYOUT"></a><a id="tf_tmae_noactivatekeyboardlayout"></a><dl>
     * <dt><b>TF_TMAE_NOACTIVATEKEYBOARDLAYOUT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * TSF does not sync the current keyboard layout while this method is called. The keyboard layout will be adjusted when the calling thread gets focus. This flag must be used with TF_TMAE_NOACTIVATETIP.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {Integer} [out] Pointer to a <a href="https://docs.microsoft.com/windows/desktop/TSF/tfclientid">TfClientId</a> value that receives a client identifier.
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itfthreadmgr2-activateex
     */
    ActivateEx(dwFlags) {
        result := ComCall(13, this, "uint*", &ptid := 0, "uint", dwFlags, "HRESULT")
        return ptid
    }

    /**
     * Gets the active flags of the calling thread.
     * @returns {Integer} The pointer to the DWORD value to receives the active flags of TSF.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TF_TMF_NOACTIVATETIP"></a><a id="tf_tmf_noactivatetip"></a><dl>
     * <dt><b>TF_TMF_NOACTIVATETIP</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * TSF was activated with the TF_TMAE_NOACTIVATETIP flag.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TF_TMF_SECUREMODE"></a><a id="tf_tmf_securemode"></a><dl>
     * <dt><b>TF_TMF_SECUREMODE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * TSF is running as secure mode.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TF_TMF_UIELEMENTENABLEDONLY"></a><a id="tf_tmf_uielementenabledonly"></a><dl>
     * <dt><b>TF_TMF_UIELEMENTENABLEDONLY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * TSF is running with text services that support only UIElement.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TF_TMF_COMLESS"></a><a id="tf_tmf_comless"></a><dl>
     * <dt><b>TF_TMF_COMLESS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * TSF is running without COM.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TF_TMF_WOW16"></a><a id="tf_tmf_wow16"></a><dl>
     * <dt><b>TF_TMF_WOW16</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * TSF is running in 16bit task.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TF_TMF_CONSOLE"></a><a id="tf_tmf_console"></a><dl>
     * <dt><b>TF_TMF_CONSOLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * TSF is running for console.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TF_TMF_IMMERSIVEMODE"></a><a id="tf_tmf_immersivemode"></a><dl>
     * <dt><b>TF_TMF_IMMERSIVEMODE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * TSF is active in a Windows Store app.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TF_TMF_ACTIVATED"></a><a id="tf_tmf_activated"></a><dl>
     * <dt><b>TF_TMF_ACTIVATED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * TSF is active.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itfthreadmgr2-getactiveflags
     */
    GetActiveFlags() {
        result := ComCall(14, this, "uint*", &lpdwFlags := 0, "HRESULT")
        return lpdwFlags
    }

    /**
     * Suspends handling keystrokes.
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
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itfthreadmgr2-suspendkeystrokehandling
     */
    SuspendKeystrokeHandling() {
        result := ComCall(15, this, "HRESULT")
        return result
    }

    /**
     * Resumes suspended keystroke handling.
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
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itfthreadmgr2-resumekeystrokehandling
     */
    ResumeKeystrokeHandling() {
        result := ComCall(16, this, "HRESULT")
        return result
    }
}
