#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\COMSVCSEVENTINFO.ahk" { COMSVCSEVENTINFO }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Notifies the subscriber if an object is created or released by a client.
 * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nn-comsvcs-icominstance2events
 * @namespace Windows.Win32.System.ComponentServices
 */
export default struct IComInstance2Events extends IUnknown {
    /**
     * The interface identifier for IComInstance2Events
     * @type {Guid}
     */
    static IID := Guid("{20e3bf07-b506-4ad5-a50c-d2ca5b9c158e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IComInstance2Events interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        OnObjectCreate2  : IntPtr
        OnObjectDestroy2 : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IComInstance2Events.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Generated when a client creates an object.
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/comsvcs/ns-comsvcs-comsvcseventinfo">COMSVCSEVENTINFO</a> structure.
     * @param {Pointer<Guid>} guidActivity The identifier of the activity in which the object is created.
     * @param {Pointer<Guid>} clsid The CLSID of the object being created.
     * @param {Pointer<Guid>} tsid The transaction stream identifier, which is unique for correlation to objects.
     * @param {Integer} CtxtID The context identifier for this object.
     * @param {Integer} _ObjectID The initial JIT-activated object.
     * @param {Pointer<Guid>} guidPartition The partition identifier for which this instance is created.
     * @returns {HRESULT} The user verifies the return values from this method.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icominstance2events-onobjectcreate2
     */
    OnObjectCreate2(pInfo, guidActivity, clsid, tsid, CtxtID, _ObjectID, guidPartition) {
        result := ComCall(3, this, COMSVCSEVENTINFO.Ptr, pInfo, Guid.Ptr, guidActivity, Guid.Ptr, clsid, Guid.Ptr, tsid, "uint", CtxtID, "uint", _ObjectID, Guid.Ptr, guidPartition, "HRESULT")
        return result
    }

    /**
     * Generated when a client releases an object.
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/comsvcs/ns-comsvcs-comsvcseventinfo">COMSVCSEVENTINFO</a> structure.
     * @param {Integer} CtxtID The context identifier of the object.
     * @returns {HRESULT} The user verifies the return values from this method.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icominstance2events-onobjectdestroy2
     */
    OnObjectDestroy2(pInfo, CtxtID) {
        result := ComCall(4, this, COMSVCSEVENTINFO.Ptr, pInfo, "uint", CtxtID, "HRESULT")
        return result
    }

    Query(iid) {
        if (IComInstance2Events.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnObjectCreate2 := CallbackCreate(GetMethod(implObj, "OnObjectCreate2"), flags, 8)
        this.vtbl.OnObjectDestroy2 := CallbackCreate(GetMethod(implObj, "OnObjectDestroy2"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnObjectCreate2)
        CallbackFree(this.vtbl.OnObjectDestroy2)
    }
}
