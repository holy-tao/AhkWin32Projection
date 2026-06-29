#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\IEnumVdsObject.ahk" { IEnumVdsObject }

/**
 * Provides a method to query HBA ports on the local system.
 * @see https://learn.microsoft.com/windows/win32/api/vds/nn-vds-ivdsservicehba
 * @namespace Windows.Win32.Storage.VirtualDiskService
 */
export default struct IVdsServiceHba extends IUnknown {
    /**
     * The interface identifier for IVdsServiceHba
     * @type {Guid}
     */
    static IID := Guid("{0ac13689-3134-47c6-a17c-4669216801be}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IVdsServiceHba interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        QueryHbaPorts : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IVdsServiceHba.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Returns an IEnumVdsObject enumeration object containing a list of the HBA ports known to VDS on the local system.
     * @returns {IEnumVdsObject} The address of an <a href="https://docs.microsoft.com/windows/desktop/api/vdshwprv/nn-vdshwprv-ienumvdsobject">IEnumVdsObject</a> interface pointer that can be used to enumerate the HBA ports  as <a href="https://docs.microsoft.com/windows/desktop/VDS/startup-and-service-objects">HBA port objects</a>. For more information, see <a href="https://docs.microsoft.com/windows/desktop/VDS/working-with-enumeration-objects">Working with Enumeration Objects</a>. Callers must release the interface and each of the HBA port objects when they are no longer needed by calling the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">IUnknown::Release</a> method.
     * @see https://learn.microsoft.com/windows/win32/api/vds/nf-vds-ivdsservicehba-queryhbaports
     */
    QueryHbaPorts() {
        result := ComCall(3, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumVdsObject(ppEnum)
    }

    Query(iid) {
        if (IVdsServiceHba.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.QueryHbaPorts := CallbackCreate(GetMethod(implObj, "QueryHbaPorts"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.QueryHbaPorts)
    }
}
