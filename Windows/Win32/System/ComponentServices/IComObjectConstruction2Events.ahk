#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\COMSVCSEVENTINFO.ahk" { COMSVCSEVENTINFO }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Notifies the subscriber if a constructed object is created.
 * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nn-comsvcs-icomobjectconstruction2events
 * @namespace Windows.Win32.System.ComponentServices
 */
export default struct IComObjectConstruction2Events extends IUnknown {
    /**
     * The interface identifier for IComObjectConstruction2Events
     * @type {Guid}
     */
    static IID := Guid("{4b5a7827-8df2-45c0-8f6f-57ea1f856a9f}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IComObjectConstruction2Events interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        OnObjectConstruct2 : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IComObjectConstruction2Events.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Generated when a constructed object is created. (IComObjectConstruction2Events.OnObjectConstruct2)
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/comsvcs/ns-comsvcs-comsvcseventinfo">COMSVCSEVENTINFO</a> structure.
     * @param {Pointer<Guid>} guidObject The CLSID for the objects in the pool.
     * @param {PWSTR} sConstructString The object construction string.
     * @param {Integer} oid The unique constructed object identifier.
     * @param {Pointer<Guid>} guidPartition The partition identifier for which this instance is created.
     * @returns {HRESULT} The user verifies the return values from this method.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icomobjectconstruction2events-onobjectconstruct2
     */
    OnObjectConstruct2(pInfo, guidObject, sConstructString, oid, guidPartition) {
        sConstructString := sConstructString is String ? StrPtr(sConstructString) : sConstructString

        result := ComCall(3, this, COMSVCSEVENTINFO.Ptr, pInfo, Guid.Ptr, guidObject, "ptr", sConstructString, "uint", oid, Guid.Ptr, guidPartition, "HRESULT")
        return result
    }

    Query(iid) {
        if (IComObjectConstruction2Events.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnObjectConstruct2 := CallbackCreate(GetMethod(implObj, "OnObjectConstruct2"), flags, 6)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnObjectConstruct2)
    }
}
