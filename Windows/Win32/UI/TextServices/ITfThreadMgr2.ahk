#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ITfDocumentMgr.ahk" { ITfDocumentMgr }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IEnumTfFunctionProviders.ahk" { IEnumTfFunctionProviders }
#Import ".\ITfFunctionProvider.ahk" { ITfFunctionProvider }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\IEnumTfDocumentMgrs.ahk" { IEnumTfDocumentMgrs }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\ITfCompartmentMgr.ahk" { ITfCompartmentMgr }

/**
 * The ITfThreadMgr2 defines the primary object implemented by the TSF manager. ITfThreadMgr2 is used by applications and text services to activate and deactivate text services, create document managers, and maintain the document context focus.
 * @see https://learn.microsoft.com/windows/win32/api/msctf/nn-msctf-itfthreadmgr2
 * @namespace Windows.Win32.UI.TextServices
 */
export default struct ITfThreadMgr2 extends IUnknown {
    /**
     * The interface identifier for ITfThreadMgr2
     * @type {Guid}
     */
    static IID := Guid("{0ab198ef-6477-4ee8-8812-6780edb82d5e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITfThreadMgr2 interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Activate                 : IntPtr
        Deactivate               : IntPtr
        CreateDocumentMgr        : IntPtr
        EnumDocumentMgrs         : IntPtr
        GetFocus                 : IntPtr
        SetFocus                 : IntPtr
        IsThreadFocus            : IntPtr
        GetFunctionProvider      : IntPtr
        EnumFunctionProviders    : IntPtr
        GetGlobalCompartment     : IntPtr
        ActivateEx               : IntPtr
        GetActiveFlags           : IntPtr
        SuspendKeystrokeHandling : IntPtr
        ResumeKeystrokeHandling  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITfThreadMgr2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Activates TSF for the calling thread.
     * @remarks
     * This method can be called more than once from a thread, but each call must be matched with a corresponding call to <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfthreadmgr2-deactivate">Deactivate</a> from the same thread.
     * @returns {Integer} Pointer to a <a href="https://docs.microsoft.com/windows/desktop/TSF/tfclientid">TfClientId</a> value that receives a client identifier.
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfthreadmgr2-activate
     */
    Activate() {
        result := ComCall(3, this, "uint*", &ptid := 0, "HRESULT")
        return ptid
    }

    /**
     * Deactivates TSF for the calling thread.
     * @remarks
     * Each call to this method must be matched with a previous call to <b>Activate</b>. This method must be called from the same thread that the corresponding <b>Activate</b> call was made from.
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
     * This method was called while the thread was activated or this call had no corresponding <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfthreadmgr2-activate">Activate</a> call.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfthreadmgr2-deactivate
     */
    Deactivate() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * Creates a document manager object.
     * @remarks
     * The caller must release the document manager when it is no longer required.
     * @returns {ITfDocumentMgr} Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfdocumentmgr">ITfDocumentMgr</a> interface that receives the document manager object.
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfthreadmgr2-createdocumentmgr
     */
    CreateDocumentMgr() {
        result := ComCall(5, this, "ptr*", &ppdim := 0, "HRESULT")
        return ITfDocumentMgr(ppdim)
    }

    /**
     * Returns an enumerator for all the document managers within the calling thread.
     * @remarks
     * The caller must release the enumerator when it is no longer required.
     * @returns {IEnumTfDocumentMgrs} Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-ienumtfdocumentmgrs">IEnumTfDocumentMgrs</a> interface that receives the enumerator.
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfthreadmgr2-enumdocumentmgrs
     */
    EnumDocumentMgrs() {
        result := ComCall(6, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumTfDocumentMgrs(ppEnum)
    }

    /**
     * Returns the document manager that has the input focus.
     * @returns {ITfDocumentMgr} Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfdocumentmgr">ITfDocumentMgr</a> interface that receives the document manager with the current input focus. Receives <b>NULL</b> if no document manager has the focus.
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfthreadmgr2-getfocus
     */
    GetFocus() {
        result := ComCall(7, this, "ptr*", &ppdimFocus := 0, "HRESULT")
        return ITfDocumentMgr(ppdimFocus)
    }

    /**
     * Sets the input focus to the specified document manager.
     * @remarks
     * The application must call this method when the document window receives the input focus. If the application associates a window with a document manager using <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfthreadmgr-associatefocus">ITfThreadMgr::AssociateFocus</a>, the TSF manager calls this method for the application.
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
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfthreadmgr2-setfocus
     */
    SetFocus(pdimFocus) {
        result := ComCall(8, this, "ptr", pdimFocus, "HRESULT")
        return result
    }

    /**
     * Determines if the calling thread has the TSF input focus.
     * @returns {BOOL} Pointer to a BOOL that receives a value that indicates if the calling thread has input focus. This parameter receives a nonzero value if the calling thread has the focus or zero otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfthreadmgr2-isthreadfocus
     */
    IsThreadFocus() {
        result := ComCall(9, this, BOOL.Ptr, &pfThreadFocus := 0, "HRESULT")
        return pfThreadFocus
    }

    /**
     * Obtains the specified function provider object.
     * @remarks
     * A function provider registers by calling the TSF manager <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfsourcesingle-advisesinglesink">ITfSourceSingle::AdviseSingleSink</a> method with IID_ITfFunctionProvider.
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
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfthreadmgr2-getfunctionprovider
     */
    GetFunctionProvider(clsid) {
        result := ComCall(10, this, Guid.Ptr, clsid, "ptr*", &ppFuncProv := 0, "HRESULT")
        return ITfFunctionProvider(ppFuncProv)
    }

    /**
     * Obtains an enumerator for all of the function providers registered for the calling thread.
     * @remarks
     * The enumerator only contains the registered function providers. The enumerator will not contain the predefined function providers as described in <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfthreadmgr2-getfunctionprovider">GetFunctionProvider</a>.
     * 
     * A function provider registers itself by calling the TSF manager <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfsourcesingle-advisesinglesink">ITfSourceSingle::AdviseSingleSink</a> method with IID_ITfFunctionProvider.
     * @returns {IEnumTfFunctionProviders} Address of a <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-ienumtffunctionproviders">IEnumTfFunctionProviders</a> interface that receives the function provider enumerator.
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfthreadmgr2-enumfunctionproviders
     */
    EnumFunctionProviders() {
        result := ComCall(11, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumTfFunctionProviders(ppEnum)
    }

    /**
     * Obtains the global compartment manager object.
     * @returns {ITfCompartmentMgr} Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfcompartmentmgr">ITfCompartmentMgr</a> interface that receives the global compartment manager.
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfthreadmgr2-getglobalcompartment
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
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfthreadmgr2-activateex
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
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfthreadmgr2-getactiveflags
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
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfthreadmgr2-suspendkeystrokehandling
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
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfthreadmgr2-resumekeystrokehandling
     */
    ResumeKeystrokeHandling() {
        result := ComCall(16, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (ITfThreadMgr2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Activate := CallbackCreate(GetMethod(implObj, "Activate"), flags, 2)
        this.vtbl.Deactivate := CallbackCreate(GetMethod(implObj, "Deactivate"), flags, 1)
        this.vtbl.CreateDocumentMgr := CallbackCreate(GetMethod(implObj, "CreateDocumentMgr"), flags, 2)
        this.vtbl.EnumDocumentMgrs := CallbackCreate(GetMethod(implObj, "EnumDocumentMgrs"), flags, 2)
        this.vtbl.GetFocus := CallbackCreate(GetMethod(implObj, "GetFocus"), flags, 2)
        this.vtbl.SetFocus := CallbackCreate(GetMethod(implObj, "SetFocus"), flags, 2)
        this.vtbl.IsThreadFocus := CallbackCreate(GetMethod(implObj, "IsThreadFocus"), flags, 2)
        this.vtbl.GetFunctionProvider := CallbackCreate(GetMethod(implObj, "GetFunctionProvider"), flags, 3)
        this.vtbl.EnumFunctionProviders := CallbackCreate(GetMethod(implObj, "EnumFunctionProviders"), flags, 2)
        this.vtbl.GetGlobalCompartment := CallbackCreate(GetMethod(implObj, "GetGlobalCompartment"), flags, 2)
        this.vtbl.ActivateEx := CallbackCreate(GetMethod(implObj, "ActivateEx"), flags, 3)
        this.vtbl.GetActiveFlags := CallbackCreate(GetMethod(implObj, "GetActiveFlags"), flags, 2)
        this.vtbl.SuspendKeystrokeHandling := CallbackCreate(GetMethod(implObj, "SuspendKeystrokeHandling"), flags, 1)
        this.vtbl.ResumeKeystrokeHandling := CallbackCreate(GetMethod(implObj, "ResumeKeystrokeHandling"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Activate)
        CallbackFree(this.vtbl.Deactivate)
        CallbackFree(this.vtbl.CreateDocumentMgr)
        CallbackFree(this.vtbl.EnumDocumentMgrs)
        CallbackFree(this.vtbl.GetFocus)
        CallbackFree(this.vtbl.SetFocus)
        CallbackFree(this.vtbl.IsThreadFocus)
        CallbackFree(this.vtbl.GetFunctionProvider)
        CallbackFree(this.vtbl.EnumFunctionProviders)
        CallbackFree(this.vtbl.GetGlobalCompartment)
        CallbackFree(this.vtbl.ActivateEx)
        CallbackFree(this.vtbl.GetActiveFlags)
        CallbackFree(this.vtbl.SuspendKeystrokeHandling)
        CallbackFree(this.vtbl.ResumeKeystrokeHandling)
    }
}
