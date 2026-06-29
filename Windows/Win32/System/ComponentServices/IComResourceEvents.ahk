#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\COMSVCSEVENTINFO.ahk" { COMSVCSEVENTINFO }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Notifies the subscriber if a resource is created, allocated, tracked, or destroyed.
 * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nn-comsvcs-icomresourceevents
 * @namespace Windows.Win32.System.ComponentServices
 */
export default struct IComResourceEvents extends IUnknown {
    /**
     * The interface identifier for IComResourceEvents
     * @type {Guid}
     */
    static IID := Guid("{683130ab-2e50-11d2-98a5-00c04f8ee1c4}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IComResourceEvents interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        OnResourceCreate   : IntPtr
        OnResourceAllocate : IntPtr
        OnResourceRecycle  : IntPtr
        OnResourceDestroy  : IntPtr
        OnResourceTrack    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IComResourceEvents.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Generated when a new resource is created and allocated.
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/comsvcs/ns-comsvcs-comsvcseventinfo">COMSVCSEVENTINFO</a> structure.
     * @param {Integer} _ObjectID The just-in-time activated object.
     * @param {PWSTR} pszType A description of the resource.
     * @param {Integer} resId The unique identifier of the resource.
     * @param {BOOL} enlisted Indicates whether the resource is enlisted in a transaction.
     * @returns {HRESULT} The user verifies the return values from this method.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icomresourceevents-onresourcecreate
     */
    OnResourceCreate(pInfo, _ObjectID, pszType, resId, enlisted) {
        pszType := pszType is String ? StrPtr(pszType) : pszType

        result := ComCall(3, this, COMSVCSEVENTINFO.Ptr, pInfo, "uint", _ObjectID, "ptr", pszType, "uint", resId, BOOL, enlisted, "HRESULT")
        return result
    }

    /**
     * Generated when an existing resource is allocated.
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/comsvcs/ns-comsvcs-comsvcseventinfo">COMSVCSEVENTINFO</a> structure.
     * @param {Integer} _ObjectID The just-in-time activated object.
     * @param {PWSTR} pszType A description of the resource.
     * @param {Integer} resId The unique identifier for the resource.
     * @param {BOOL} enlisted Indicates whether the resource is enlisted in a transaction.
     * @param {Integer} NumRated The number of possible resources evaluated for a match.
     * @param {Integer} Rating The rating of the resource actually selected.
     * @returns {HRESULT} The user verifies the return values from this method.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icomresourceevents-onresourceallocate
     */
    OnResourceAllocate(pInfo, _ObjectID, pszType, resId, enlisted, NumRated, Rating) {
        pszType := pszType is String ? StrPtr(pszType) : pszType

        result := ComCall(4, this, COMSVCSEVENTINFO.Ptr, pInfo, "uint", _ObjectID, "ptr", pszType, "uint", resId, BOOL, enlisted, "uint", NumRated, "uint", Rating, "HRESULT")
        return result
    }

    /**
     * Generated when an object is finished with a resource.
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/comsvcs/ns-comsvcs-comsvcseventinfo">COMSVCSEVENTINFO</a> structure.
     * @param {Integer} _ObjectID The just-in-time activated object.
     * @param {PWSTR} pszType A description of the resource.
     * @param {Integer} resId The unique identifier of the resource.
     * @returns {HRESULT} The user verifies the return values from this method.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icomresourceevents-onresourcerecycle
     */
    OnResourceRecycle(pInfo, _ObjectID, pszType, resId) {
        pszType := pszType is String ? StrPtr(pszType) : pszType

        result := ComCall(5, this, COMSVCSEVENTINFO.Ptr, pInfo, "uint", _ObjectID, "ptr", pszType, "uint", resId, "HRESULT")
        return result
    }

    /**
     * Generated when a resource is destroyed.
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/comsvcs/ns-comsvcs-comsvcseventinfo">COMSVCSEVENTINFO</a> structure.
     * @param {Integer} _ObjectID The just-in-time activated object.
     * @param {HRESULT} hr The result from resource dispensers destroy call.
     * @param {PWSTR} pszType A description of the resource.
     * @param {Integer} resId The unique identifier of the resource.
     * @returns {HRESULT} The user verifies the return values from this method.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icomresourceevents-onresourcedestroy
     */
    OnResourceDestroy(pInfo, _ObjectID, hr, pszType, resId) {
        pszType := pszType is String ? StrPtr(pszType) : pszType

        result := ComCall(6, this, COMSVCSEVENTINFO.Ptr, pInfo, "uint", _ObjectID, "int", hr, "ptr", pszType, "uint", resId, "HRESULT")
        return result
    }

    /**
     * Generated when a resource is tracked.
     * @param {Pointer<COMSVCSEVENTINFO>} pInfo A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/comsvcs/ns-comsvcs-comsvcseventinfo">COMSVCSEVENTINFO</a> structure.
     * @param {Integer} _ObjectID The just-in-time activated object.
     * @param {PWSTR} pszType A description of the resource.
     * @param {Integer} resId The unique identifier of the resource.
     * @param {BOOL} enlisted Indicates whether the resource is enlisted in a transaction.
     * @returns {HRESULT} The user verifies the return values from this method.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-icomresourceevents-onresourcetrack
     */
    OnResourceTrack(pInfo, _ObjectID, pszType, resId, enlisted) {
        pszType := pszType is String ? StrPtr(pszType) : pszType

        result := ComCall(7, this, COMSVCSEVENTINFO.Ptr, pInfo, "uint", _ObjectID, "ptr", pszType, "uint", resId, BOOL, enlisted, "HRESULT")
        return result
    }

    Query(iid) {
        if (IComResourceEvents.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnResourceCreate := CallbackCreate(GetMethod(implObj, "OnResourceCreate"), flags, 6)
        this.vtbl.OnResourceAllocate := CallbackCreate(GetMethod(implObj, "OnResourceAllocate"), flags, 8)
        this.vtbl.OnResourceRecycle := CallbackCreate(GetMethod(implObj, "OnResourceRecycle"), flags, 5)
        this.vtbl.OnResourceDestroy := CallbackCreate(GetMethod(implObj, "OnResourceDestroy"), flags, 6)
        this.vtbl.OnResourceTrack := CallbackCreate(GetMethod(implObj, "OnResourceTrack"), flags, 6)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnResourceCreate)
        CallbackFree(this.vtbl.OnResourceAllocate)
        CallbackFree(this.vtbl.OnResourceRecycle)
        CallbackFree(this.vtbl.OnResourceDestroy)
        CallbackFree(this.vtbl.OnResourceTrack)
    }
}
