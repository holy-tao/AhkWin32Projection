#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\COMSVCSEVENTINFO.ahk" { COMSVCSEVENTINFO }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Notifies the subscriber of an object's creation or release.
 * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nn-comsvcs-icominstanceevents
 * @namespace Windows.Win32.System.ComponentServices
 */
export default struct IComInstanceEvents extends IUnknown {
    /**
     * The interface identifier for IComInstanceEvents
     * @type {Guid}
     */
    static IID := Guid("{683130a7-2e50-11d2-98a5-00c04f8ee1c4}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IComInstanceEvents interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        OnObjectCreate  : IntPtr
        OnObjectDestroy : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IComInstanceEvents.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Generated when an object is created by a client.
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/comsvcs/ns-comsvcs-comsvcseventinfo">COMSVCSEVENTINFO</a> structure.
     * @param {Pointer<Guid>} guidActivity The identifier of the activity in which the object is created.
     * @param {Pointer<Guid>} clsid The CLSID of the object being created.
     * @param {Pointer<Guid>} tsid The transaction stream identifier, which is unique for correlation to objects.
     * @param {Integer} CtxtID The context identifier for this object.
     * @param {Integer} _ObjectID The initial just-in-time (JIT) activated object.
     * @returns {HRESULT} The user verifies the return values from this method.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icominstanceevents-onobjectcreate
     */
    OnObjectCreate(pInfo, guidActivity, clsid, tsid, CtxtID, _ObjectID) {
        result := ComCall(3, this, COMSVCSEVENTINFO.Ptr, pInfo, Guid.Ptr, guidActivity, Guid.Ptr, clsid, Guid.Ptr, tsid, "uint", CtxtID, "uint", _ObjectID, "HRESULT")
        return result
    }

    /**
     * Generated when an object is released by a client.
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/comsvcs/ns-comsvcs-comsvcseventinfo">COMSVCSEVENTINFO</a> structure.
     * @param {Integer} CtxtID The context identifier of the object.
     * @returns {HRESULT} The user verifies the return values from this method.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icominstanceevents-onobjectdestroy
     */
    OnObjectDestroy(pInfo, CtxtID) {
        result := ComCall(4, this, COMSVCSEVENTINFO.Ptr, pInfo, "uint", CtxtID, "HRESULT")
        return result
    }

    Query(iid) {
        if (IComInstanceEvents.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnObjectCreate := CallbackCreate(GetMethod(implObj, "OnObjectCreate"), flags, 7)
        this.vtbl.OnObjectDestroy := CallbackCreate(GetMethod(implObj, "OnObjectDestroy"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnObjectCreate)
        CallbackFree(this.vtbl.OnObjectDestroy)
    }
}
