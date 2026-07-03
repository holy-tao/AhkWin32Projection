#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IObjectContextInfo.ahk" { IObjectContextInfo }

/**
 * Provides additional information about an object's context. This interface extends the IObjectContextInfo interface.
 * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nn-comsvcs-iobjectcontextinfo2
 * @namespace Windows.Win32.System.ComponentServices
 */
export default struct IObjectContextInfo2 extends IObjectContextInfo {
    /**
     * The interface identifier for IObjectContextInfo2
     * @type {Guid}
     */
    static IID := Guid("{594be71a-4bc4-438b-9197-cfd176248b09}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IObjectContextInfo2 interfaces
    */
    struct Vtbl extends IObjectContextInfo.Vtbl {
        GetPartitionId           : IntPtr
        GetApplicationId         : IntPtr
        GetApplicationInstanceId : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IObjectContextInfo2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves the identifier of the partition of the current object context.
     * @param {Pointer<Guid>} pGuid A GUID that identifies the COM+ partition.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, and E_FAIL, as well as the following values.
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
     * The method completed successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>COMADMIN_E_PARTITIONS_DISABLED </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * COM+ partitions are not enabled.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-iobjectcontextinfo2-getpartitionid
     */
    GetPartitionId(pGuid) {
        result := ComCall(8, this, Guid.Ptr, pGuid, "HRESULT")
        return result
    }

    /**
     * Retrieves the identifier of the application of the current object context.
     * @param {Pointer<Guid>} pGuid A GUID that identifies the application.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, E_FAIL, and S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-iobjectcontextinfo2-getapplicationid
     */
    GetApplicationId(pGuid) {
        result := ComCall(9, this, Guid.Ptr, pGuid, "HRESULT")
        return result
    }

    /**
     * Retrieves the identifier of the application instance of the current object context.
     * @param {Pointer<Guid>} pGuid A GUID that identifies the application instance.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, E_FAIL, and S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-iobjectcontextinfo2-getapplicationinstanceid
     */
    GetApplicationInstanceId(pGuid) {
        result := ComCall(10, this, Guid.Ptr, pGuid, "HRESULT")
        return result
    }

    Query(iid) {
        if (IObjectContextInfo2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetPartitionId := CallbackCreate(GetMethod(implObj, "GetPartitionId"), flags, 2)
        this.vtbl.GetApplicationId := CallbackCreate(GetMethod(implObj, "GetApplicationId"), flags, 2)
        this.vtbl.GetApplicationInstanceId := CallbackCreate(GetMethod(implObj, "GetApplicationInstanceId"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetPartitionId)
        CallbackFree(this.vtbl.GetApplicationId)
        CallbackFree(this.vtbl.GetApplicationInstanceId)
    }
}
