#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\CSC_PartitionConfig.ahk" { CSC_PartitionConfig }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Configures how partitions are used for the work that is done when calling either CoCreateActivity or CoEnterServiceDomain.
 * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nn-comsvcs-iservicepartitionconfig
 * @namespace Windows.Win32.System.ComponentServices
 */
export default struct IServicePartitionConfig extends IUnknown {
    /**
     * The interface identifier for IServicePartitionConfig
     * @type {Guid}
     */
    static IID := Guid("{80182d03-5ea4-4831-ae97-55beffc2e590}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IServicePartitionConfig interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        PartitionConfig : IntPtr
        PartitionID     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IServicePartitionConfig.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Configures how partitions are used for the enclosed work.
     * @remarks
     * The user must belong to any partition that is used to run the enclosed work.
     * @param {CSC_PartitionConfig} partitionConfig A value from the <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/ne-comsvcs-csc_partitionconfig">CSC_PartitionConfig</a> enumeration.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_FAIL, and S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-iservicepartitionconfig-partitionconfig
     */
    PartitionConfig(partitionConfig) {
        result := ComCall(3, this, CSC_PartitionConfig, partitionConfig, "HRESULT")
        return result
    }

    /**
     * Sets the GUID for the partition that is used for the enclosed work.
     * @param {Pointer<Guid>} guidPartitionID A GUID that is used to specify the partition that is to be used to run the enclosed work.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_FAIL, and S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-iservicepartitionconfig-partitionid
     */
    PartitionID(guidPartitionID) {
        result := ComCall(4, this, Guid.Ptr, guidPartitionID, "HRESULT")
        return result
    }

    Query(iid) {
        if (IServicePartitionConfig.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.PartitionConfig := CallbackCreate(GetMethod(implObj, "PartitionConfig"), flags, 2)
        this.vtbl.PartitionID := CallbackCreate(GetMethod(implObj, "PartitionID"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.PartitionConfig)
        CallbackFree(this.vtbl.PartitionID)
    }
}
