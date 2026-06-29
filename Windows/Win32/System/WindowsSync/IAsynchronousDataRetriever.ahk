#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ID_PARAMETERS.ahk" { ID_PARAMETERS }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ILoadChangeContext.ahk" { ILoadChangeContext }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import ".\IDataRetrieverCallback.ahk" { IDataRetrieverCallback }

/**
 * Represents the mechanism by which the destination provider asynchronously retrieves item data from the source provider.
 * @see https://learn.microsoft.com/windows/win32/api/winsync/nn-winsync-iasynchronousdataretriever
 * @namespace Windows.Win32.System.WindowsSync
 */
export default struct IAsynchronousDataRetriever extends IUnknown {
    /**
     * The interface identifier for IAsynchronousDataRetriever
     * @type {Guid}
     */
    static IID := Guid("{9fc7e470-61ea-4a88-9be4-df56a27cfef2}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAsynchronousDataRetriever interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetIdParameters  : IntPtr
        RegisterCallback : IntPtr
        RevokeCallback   : IntPtr
        LoadChangeData   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAsynchronousDataRetriever.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the ID format schema of the provider. (IAsynchronousDataRetriever.GetIdParameters)
     * @param {Pointer<ID_PARAMETERS>} pIdParameters Returns the ID format schema of the provider.
     * @returns {HRESULT} The possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Provider-determined error codes.</b></dt>
     * </dl>
     * </td>
     * <td width="60%"></td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-iasynchronousdataretriever-getidparameters
     */
    GetIdParameters(pIdParameters) {
        result := ComCall(3, this, ID_PARAMETERS.Ptr, pIdParameters, "HRESULT")
        return result
    }

    /**
     * Registers a callback interface that will be called by the IAsynchronousDataRetriever object when an asynchronous method finishes processing.
     * @param {IDataRetrieverCallback} pDataRetrieverCallback The callback interface to register.
     * @returns {HRESULT} The possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Provider-determined error codes.</b></dt>
     * </dl>
     * </td>
     * <td width="60%"></td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-iasynchronousdataretriever-registercallback
     */
    RegisterCallback(pDataRetrieverCallback) {
        result := ComCall(4, this, "ptr", pDataRetrieverCallback, "HRESULT")
        return result
    }

    /**
     * Indicates that the IAsynchronousDataRetriever object must no longer use the specified callback interface and must release any references to it.
     * @param {IDataRetrieverCallback} pDataRetrieverCallback The callback interface to release.
     * @returns {HRESULT} The possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Provider-determined error codes.</b></dt>
     * </dl>
     * </td>
     * <td width="60%"></td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-iasynchronousdataretriever-revokecallback
     */
    RevokeCallback(pDataRetrieverCallback) {
        result := ComCall(5, this, "ptr", pDataRetrieverCallback, "HRESULT")
        return result
    }

    /**
     * Retrieves item data for a change. (IAsynchronousDataRetriever.LoadChangeData)
     * @remarks
     * When <b>LoadChangeData</b> is called, the provider must take one of the following actions:
     * 
     * <ul>
     * <li>Return a success code from the method and later call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winsync/nf-winsync-idataretrievercallback-loadchangedatacomplete">IDataRetrieverCallback::LoadChangeDataComplete</a> to report that asynchronous processing finished successfully.</li>
     * <li>Return a success code from the method and later call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winsync/nf-winsync-idataretrievercallback-loadchangedataerror">IDataRetrieverCallback::LoadChangeDataError</a> to report that an error occurred during asynchronous processing.</li>
     * <li>Return an error code from the method. In this case, <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winsync/nn-winsync-idataretrievercallback">IDataRetrieverCallback</a> methods should not be called.</li>
     * </ul>
     * @param {ILoadChangeContext} pLoadChangeContext Metadata that describes the change for which data should be retrieved.
     * @returns {HRESULT} The possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Provider-determined error codes.</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * See Remarks.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-iasynchronousdataretriever-loadchangedata
     */
    LoadChangeData(pLoadChangeContext) {
        result := ComCall(6, this, "ptr", pLoadChangeContext, "HRESULT")
        return result
    }

    Query(iid) {
        if (IAsynchronousDataRetriever.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetIdParameters := CallbackCreate(GetMethod(implObj, "GetIdParameters"), flags, 2)
        this.vtbl.RegisterCallback := CallbackCreate(GetMethod(implObj, "RegisterCallback"), flags, 2)
        this.vtbl.RevokeCallback := CallbackCreate(GetMethod(implObj, "RevokeCallback"), flags, 2)
        this.vtbl.LoadChangeData := CallbackCreate(GetMethod(implObj, "LoadChangeData"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetIdParameters)
        CallbackFree(this.vtbl.RegisterCallback)
        CallbackFree(this.vtbl.RevokeCallback)
        CallbackFree(this.vtbl.LoadChangeData)
    }
}
