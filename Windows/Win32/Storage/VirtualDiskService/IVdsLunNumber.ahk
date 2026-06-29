#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IVdsLunNumber interface (vdshwprv.h) provides a method to query the LUN number for a LUN.
 * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nn-vdshwprv-ivdslunnumber
 * @namespace Windows.Win32.Storage.VirtualDiskService
 */
export default struct IVdsLunNumber extends IUnknown {
    /**
     * The interface identifier for IVdsLunNumber
     * @type {Guid}
     */
    static IID := Guid("{d3f95e46-54b3-41f9-b678-0f1871443a08}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IVdsLunNumber interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetLunNumber : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IVdsLunNumber.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The IVdsLunNumber::GetLunNumber (vdshwprv.h) method retrieves the LUN number for a LUN.
     * @remarks
     * This method returns the LUN number that the VDS hardware provider assigned to the LUN. This number identifies the LUN  within the disk array.  It is not the same as the "Logical Unit Number" in the disk's SCSI address. Each LUN in the disk array is assigned exactly one LUN number.
     * 
     * This method exists because the DiskRAID utility assigns its own index to each LUN when it enumerates the LUNs in a subsystem. But these indexes can change each time DiskRAID is run, if the hardware provider enumerates the LUNs in a different order. This can be confusing to end users. For disk arrays that have their own (provider-assigned) LUN numbers, this method gives the caller the ability to map the LUN numbers to the LUN indexes that are assigned by DiskRAID.
     * 
     * If a subsystem supports LUN numbering, it can indicate this support by setting the <b>VDS_SF_SUPPORTS_LUN_NUMBER</b> flag in the <b>ulFlags</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ns-vdshwprv-vds_sub_system_prop">VDS_SUB_SYSTEM_PROP</a> or <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ns-vdshwprv-vds_sub_system_prop2">VDS_SUB_SYSTEM_PROP2</a> structure. For more information about this flag, see the <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ne-vdshwprv-vds_sub_system_flag">VDS_SUB_SYSTEM_FLAG</a> enumeration.
     * @returns {Integer} The address of a  variable that receives the LUN number. This value is required and cannot be <b>NULL</b>.
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ivdslunnumber-getlunnumber
     */
    GetLunNumber() {
        result := ComCall(3, this, "uint*", &pulLunNumber := 0, "HRESULT")
        return pulLunNumber
    }

    Query(iid) {
        if (IVdsLunNumber.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetLunNumber := CallbackCreate(GetMethod(implObj, "GetLunNumber"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetLunNumber)
    }
}
