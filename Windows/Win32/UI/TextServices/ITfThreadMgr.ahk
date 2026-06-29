#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ITfDocumentMgr.ahk" { ITfDocumentMgr }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IEnumTfFunctionProviders.ahk" { IEnumTfFunctionProviders }
#Import ".\ITfFunctionProvider.ahk" { ITfFunctionProvider }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\IEnumTfDocumentMgrs.ahk" { IEnumTfDocumentMgrs }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\ITfCompartmentMgr.ahk" { ITfCompartmentMgr }

/**
 * The ITfThreadMgr defines the primary object implemented by the TSF manager. ITfThreadMgr is used by applications and text services to activate and deactivate text services, create document managers, and maintain the document context focus.
 * @remarks
 * An application obtains a pointer to this interface by calling <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cocreateinstance">CoCreateInstance</a> with CLSID_TF_ThreadMgr as demonstrated below.
 * 
 * A text service receives a pointer to this interface in its <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itftextinputprocessor-activate">ITfTextInputProcessor::Activate</a> method.
 * @see https://learn.microsoft.com/windows/win32/api/msctf/nn-msctf-itfthreadmgr
 * @namespace Windows.Win32.UI.TextServices
 */
export default struct ITfThreadMgr extends IUnknown {
    /**
     * The interface identifier for ITfThreadMgr
     * @type {Guid}
     */
    static IID := Guid("{aa80e801-2021-11d2-93e0-0060b067b86e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITfThreadMgr interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Activate              : IntPtr
        Deactivate            : IntPtr
        CreateDocumentMgr     : IntPtr
        EnumDocumentMgrs      : IntPtr
        GetFocus              : IntPtr
        SetFocus              : IntPtr
        AssociateFocus        : IntPtr
        IsThreadFocus         : IntPtr
        GetFunctionProvider   : IntPtr
        EnumFunctionProviders : IntPtr
        GetGlobalCompartment  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITfThreadMgr.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * ITfThreadMgr::Activate method
     * @remarks
     * This method can be called more than once from a thread, but each call must be matched with a corresponding call to <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfthreadmgr-deactivate">ITfThreadMgr::Deactivate</a> from the same thread.
     * @returns {Integer} Pointer to a <a href="https://docs.microsoft.com/windows/desktop/TSF/tfclientid">TfClientId</a> value that receives a client identifier.
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfthreadmgr-activate
     */
    Activate() {
        result := ComCall(3, this, "uint*", &ptid := 0, "HRESULT")
        return ptid
    }

    /**
     * ITfThreadMgr::Deactivate method
     * @remarks
     * Each call to this method must be matched with a previous call to <b>ITfThreadMgr::Activate</b> . This method must be called from the same thread that the corresponding <b>ITfThreadMgr::Activate</b> call was made from.
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
     * This method was called while the thread was activating or this call had no corresponding <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfthreadmgr-activate">ITfThreadMgr::Activate</a> call.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfthreadmgr-deactivate
     */
    Deactivate() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * ITfThreadMgr::CreateDocumentMgr method
     * @remarks
     * The caller must release the document manager when it is no longer required.
     * @returns {ITfDocumentMgr} Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfdocumentmgr">ITfDocumentMgr</a> interface that receives the document manager object.
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfthreadmgr-createdocumentmgr
     */
    CreateDocumentMgr() {
        result := ComCall(5, this, "ptr*", &ppdim := 0, "HRESULT")
        return ITfDocumentMgr(ppdim)
    }

    /**
     * ITfThreadMgr::EnumDocumentMgrs method
     * @remarks
     * The caller must release the enumerator when it is no longer required.
     * @returns {IEnumTfDocumentMgrs} Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-ienumtfdocumentmgrs">IEnumTfDocumentMgrs</a> interface that receives the enumerator.
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfthreadmgr-enumdocumentmgrs
     */
    EnumDocumentMgrs() {
        result := ComCall(6, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumTfDocumentMgrs(ppEnum)
    }

    /**
     * ITfThreadMgr::GetFocus method
     * @returns {ITfDocumentMgr} Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfdocumentmgr">ITfDocumentMgr</a> interface that receives the document manager with the current input focus. Receives <b>NULL</b> if no document manager has the focus.
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfthreadmgr-getfocus
     */
    GetFocus() {
        result := ComCall(7, this, "ptr*", &ppdimFocus := 0, "HRESULT")
        return ITfDocumentMgr(ppdimFocus)
    }

    /**
     * ITfThreadMgr::SetFocus method
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
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfthreadmgr-setfocus
     */
    SetFocus(pdimFocus) {
        result := ComCall(8, this, "ptr", pdimFocus, "HRESULT")
        return result
    }

    /**
     * ITfThreadMgr::AssociateFocus method
     * @remarks
     * This method is provided as a convenience to the application developer. Associating the focus for a window with a document manager causes the TSF manager to automatically call <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfthreadmgr-setfocus">ITfThreadMgr::SetFocus</a> with the associated document manager when the associated window receives the focus.
     * 
     * This method can only associate a single window with a single document manager. If the implementation associates multiple document managers with a single window, or the opposite, the implementation must call <b>ITfThreadMgr::SetFocus</b> to set the focus to the proper document manager.
     * 
     * To restore the previous focus association, call this method with the same window handle and the value returned in the original call <i>ppdimPrev</i> for <i>pdimNew</i>. The following is an example.
     * 
     * 
     * ```cpp
     * 
     * //associate the focus for m_hwnd with m_pDocMgr 
     * pThreadMgr->AssociateFocus(m_hwnd, m_pDocMgr, &m_pPrevDocMgr);
     * 
     * 
     * 
     * //Restore the original focus association. 
     * ITfDocumentMgr *pTempDocMgr = NULL;
     * 
     * pThreadMgr->AssociateFocus(m_hwnd, m_pPrevDocMgr, &pTempDocMgr);
     * 
     * if(pTempDocMgr)
     * {
     *     pTempDocMgr->Release();
     * }
     *     
     * if(m_pPrevDocMgr)
     * {
     *     m_pPrevDocMgr->Release();
     * }
     * 
     * ```
     * @param {HWND} _hwnd Handle of the window to associate the focus with.
     * @param {ITfDocumentMgr} pdimNew Pointer to the document manager to associate the focus with. The TSF manager does not increment the object reference count. This value can be <b>NULL</b>.
     * @returns {ITfDocumentMgr} Receives the document manager previously associated with the window. Receives <b>NULL</b> if there is no previous association. This parameter cannot be <b>NULL</b>.
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfthreadmgr-associatefocus
     */
    AssociateFocus(_hwnd, pdimNew) {
        result := ComCall(9, this, HWND, _hwnd, "ptr", pdimNew, "ptr*", &ppdimPrev := 0, "HRESULT")
        return ITfDocumentMgr(ppdimPrev)
    }

    /**
     * ITfThreadMgr::IsThreadFocus method
     * @returns {BOOL} Pointer to a BOOL that receives a value that indicates if the calling thread has input focus. This parameter receives a nonzero value if the calling thread has the focus or zero otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfthreadmgr-isthreadfocus
     */
    IsThreadFocus() {
        result := ComCall(10, this, BOOL.Ptr, &pfThreadFocus := 0, "HRESULT")
        return pfThreadFocus
    }

    /**
     * ITfThreadMgr::GetFunctionProvider method
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
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfthreadmgr-getfunctionprovider
     */
    GetFunctionProvider(clsid) {
        result := ComCall(11, this, Guid.Ptr, clsid, "ptr*", &ppFuncProv := 0, "HRESULT")
        return ITfFunctionProvider(ppFuncProv)
    }

    /**
     * ITfThreadMgr::EnumFunctionProviders method
     * @remarks
     * The enumerator only contains the registered function providers. The enumerator will not contain the predefined function providers as described in <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfthreadmgr-getfunctionprovider">ITfThreadMgr::GetFunctionProvider</a>.
     * 
     * A function provider registers itself by calling the TSF manager <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfsourcesingle-advisesinglesink">ITfSourceSingle::AdviseSingleSink</a> method with IID_ITfFunctionProvider.
     * @returns {IEnumTfFunctionProviders} Address of a <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-ienumtffunctionproviders">IEnumTfFunctionProviders</a> interface that receives the function provider enumerator.
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfthreadmgr-enumfunctionproviders
     */
    EnumFunctionProviders() {
        result := ComCall(12, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumTfFunctionProviders(ppEnum)
    }

    /**
     * ITfThreadMgr::GetGlobalCompartment method
     * @returns {ITfCompartmentMgr} Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfcompartmentmgr">ITfCompartmentMgr</a> interface that receives the global compartment manager.
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfthreadmgr-getglobalcompartment
     */
    GetGlobalCompartment() {
        result := ComCall(13, this, "ptr*", &ppCompMgr := 0, "HRESULT")
        return ITfCompartmentMgr(ppCompMgr)
    }

    Query(iid) {
        if (ITfThreadMgr.IID.Equals(iid)) {
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
        this.vtbl.AssociateFocus := CallbackCreate(GetMethod(implObj, "AssociateFocus"), flags, 4)
        this.vtbl.IsThreadFocus := CallbackCreate(GetMethod(implObj, "IsThreadFocus"), flags, 2)
        this.vtbl.GetFunctionProvider := CallbackCreate(GetMethod(implObj, "GetFunctionProvider"), flags, 3)
        this.vtbl.EnumFunctionProviders := CallbackCreate(GetMethod(implObj, "EnumFunctionProviders"), flags, 2)
        this.vtbl.GetGlobalCompartment := CallbackCreate(GetMethod(implObj, "GetGlobalCompartment"), flags, 2)
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
        CallbackFree(this.vtbl.AssociateFocus)
        CallbackFree(this.vtbl.IsThreadFocus)
        CallbackFree(this.vtbl.GetFunctionProvider)
        CallbackFree(this.vtbl.EnumFunctionProviders)
        CallbackFree(this.vtbl.GetGlobalCompartment)
    }
}
