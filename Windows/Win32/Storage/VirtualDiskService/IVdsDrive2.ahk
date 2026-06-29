#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\VDS_DRIVE_PROP2.ahk" { VDS_DRIVE_PROP2 }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IVdsDrive2 (vdshwprv.h) interface provides a method for querying the properties of a drive.
 * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nn-vdshwprv-ivdsdrive2
 * @namespace Windows.Win32.Storage.VirtualDiskService
 */
export default struct IVdsDrive2 extends IUnknown {
    /**
     * The interface identifier for IVdsDrive2
     * @type {Guid}
     */
    static IID := Guid("{60b5a730-addf-4436-8ca7-5769e2d1ffa4}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IVdsDrive2 interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetProperties2 : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IVdsDrive2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The IVdsDrive2::GetProperties2 (vdshwprv.h) method returns the properties of a drive object.
     * @remarks
     * This method must return zero (S_OK) to indicate success, or an implementation-specific nonzero error code to indicate failure.
     * @returns {VDS_DRIVE_PROP2} The address of the <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/ns-vdshwprv-vds_drive_prop2">VDS_DRIVE_PROP2</a> structure 
     *       allocated and passed in by the caller. VDS allocates memory for the 
     *       <b>pwszFriendlyName</b> and <b>pwszIdentification</b> member strings. 
     *       Callers must free the strings by using the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> function. This parameter is required and cannot be <b>NULL</b>.
     * @see https://learn.microsoft.com/windows/win32/api/vdshwprv/nf-vdshwprv-ivdsdrive2-getproperties2
     */
    GetProperties2() {
        pDriveProp2 := VDS_DRIVE_PROP2()
        result := ComCall(3, this, VDS_DRIVE_PROP2.Ptr, pDriveProp2, "HRESULT")
        return pDriveProp2
    }

    Query(iid) {
        if (IVdsDrive2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetProperties2 := CallbackCreate(GetMethod(implObj, "GetProperties2"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetProperties2)
    }
}
