#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ID_PARAMETERS.ahk" { ID_PARAMETERS }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ILoadChangeContext.ahk" { ILoadChangeContext }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Represents the mechanism by which the destination provider retrieves item data from the source provider.
 * @see https://learn.microsoft.com/windows/win32/api/winsync/nn-winsync-isynchronousdataretriever
 * @namespace Windows.Win32.System.WindowsSync
 */
export default struct ISynchronousDataRetriever extends IUnknown {
    /**
     * The interface identifier for ISynchronousDataRetriever
     * @type {Guid}
     */
    static IID := Guid("{9b22f2a9-a4cd-4648-9d8e-3a510d4da04b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISynchronousDataRetriever interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetIdParameters : IntPtr
        LoadChangeData  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISynchronousDataRetriever.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the ID format schema of the provider. (ISynchronousDataRetriever.GetIdParameters)
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
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-isynchronousdataretriever-getidparameters
     */
    GetIdParameters(pIdParameters) {
        result := ComCall(3, this, ID_PARAMETERS.Ptr, pIdParameters, "HRESULT")
        return result
    }

    /**
     * Retrieves item data for a change. (ISynchronousDataRetriever.LoadChangeData)
     * @remarks
     * The source provider determines the data retrieval interface that is implemented by the object that is returned in <i>ppUnkData</i>. The destination provider can acquire this interface by using the <b>QueryInterface</b> method of <i>ppUnkData</i>.
     * @param {ILoadChangeContext} pLoadChangeContext Metadata that describes the change for which data should be retrieved.
     * @returns {IUnknown} Returns the item data for the change specified in <i>pLoadChangeContext</i>.
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-isynchronousdataretriever-loadchangedata
     */
    LoadChangeData(pLoadChangeContext) {
        result := ComCall(4, this, "ptr", pLoadChangeContext, "ptr*", &ppUnkData := 0, "HRESULT")
        return IUnknown(ppUnkData)
    }

    Query(iid) {
        if (ISynchronousDataRetriever.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetIdParameters := CallbackCreate(GetMethod(implObj, "GetIdParameters"), flags, 2)
        this.vtbl.LoadChangeData := CallbackCreate(GetMethod(implObj, "LoadChangeData"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetIdParameters)
        CallbackFree(this.vtbl.LoadChangeData)
    }
}
