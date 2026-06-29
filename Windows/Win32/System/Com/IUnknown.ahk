#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Enables clients to get pointers to other interfaces on a given object through the QueryInterface method, and manage the existence of the object through the AddRef and Release methods.
 * @see https://learn.microsoft.com/windows/win32/api/unknwn/nn-unknwn-iunknown
 * @namespace Windows.Win32.System.Com
 */
export default struct IUnknown extends Win32ComInterface {
    /**
     * The interface identifier for IUnknown
     * @type {Guid}
     */
    static IID := Guid("{00000000-0000-0000-c000-000000000046}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IUnknown interfaces
    */
    struct Vtbl {
        QueryInterface : IntPtr
        AddRef         : IntPtr
        Release        : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IUnknown.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves pointers to the supported interfaces on an object.
     * @remarks
     * For any given COM object (also known as a COM component), a specific query for the [IUnknown interface](/windows/desktop/api/unknwn/nn-unknwn-iunknown) on any of the object's interfaces must always return the same pointer value. This enables a client to determine whether two pointers point to the same component by calling **QueryInterface** with **IID_IUnknown** and comparing the results. It is specifically not the case that queries for interfaces other than **IUnknown** (even the same interface through the same pointer) must return the same pointer value.
     * 
     * There are four requirements for implementations of **QueryInterface** (In these cases, "must succeed" means "must succeed barring catastrophic failure.").
     * 
     * - The set of interfaces accessible on an object through **QueryInterface** must be static, not dynamic. This means that if a call to **QueryInterface** for a pointer to a specified interface succeeds the first time, then it must succeed again. If the call fails the first time, then it must fail on all subsequent calls.
     * - It must be reflexive&mdash;if a client holds a pointer to an interface on an object, and the client queries for that interface, then the call must succeed.
     * - It must be symmetric&mdash;if a client holding a pointer to one interface queries successfully for another, then a query through the obtained pointer for the first interface must succeed.
     * - It must be transitive&mdash;if a client holding a pointer to one interface queries successfully for a second, and through that pointer queries successfully for a third interface, then a query for the first interface through the pointer for the third interface must succeed.
     * @param {Pointer<Guid>} riid Type: **REFIID**
     * 
     * A reference to the interface identifier (IID) of the interface being queried for.
     * @param {Pointer<Pointer<Void>>} ppvObject Type: **[void](/windows/desktop/winprog/windows-data-types)\*\***
     * 
     * The address of a pointer to an interface with the IID specified in the *riid* parameter. Because you pass the address of an interface pointer, the method can overwrite that address with the pointer to the interface being queried for. Upon successful return, *\*ppvObject* (the dereferenced address) contains a pointer to the requested interface. If the object doesn't support the interface, the method sets *\*ppvObject* (the dereferenced address) to `nullptr`.
     * @returns {HRESULT} This method returns **S_OK** if the interface is supported, and **E_NOINTERFACE** otherwise. If *ppvObject* (the address) is `nullptr`, then this method returns **E_POINTER**.
     * @see https://learn.microsoft.com/windows/win32/api/unknwn/nf-unknwn-iunknown-queryinterface(refiid_void)
     */
    QueryInterface(riid, ppvObject) {
        ppvObjectMarshal := ppvObject is VarRef ? "ptr*" : "ptr"

        result := ComCall(0, this, Guid.Ptr, riid, ppvObjectMarshal, ppvObject, Int32)
        return result
    }

    /**
     * Increments the reference count for an interface pointer to a COM object. You should call this method whenever you make a copy of an interface pointer.
     * @remarks
     * A COM object uses a per-interface reference-counting mechanism to ensure that the object doesn't outlive references to it. You use **AddRef** to stabilize a copy of an interface pointer. It can also be called when the life of a cloned pointer must extend beyond the lifetime of the original pointer. The cloned pointer must be released by calling [IUnknown::Release](/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(refiid_void)) on it.
     * 
     * The internal reference counter that **AddRef** maintains should be a 32-bit unsigned integer.
     * @returns {Integer} The method returns the new reference count. This value is intended to be used only for test purposes.
     * @see https://learn.microsoft.com/windows/win32/api/unknwn/nf-unknwn-iunknown-addref
     */
    AddRef() {
        result := ComCall(1, this, UInt32)
        return result
    }

    /**
     * Decrements the reference count for an interface on a COM object.
     * @remarks
     * When the reference count on an object reaches zero, **Release** must cause the interface pointer to free itself. When the released pointer is the only (formerly) outstanding reference to an object (whether the object supports single or multiple interfaces), the implementation must free the object.
     * 
     * Note that aggregation of objects restricts the ability to recover interface pointers.
     * @returns {Integer} The method returns the new reference count. This value is intended to be used only for test purposes.
     * @see https://learn.microsoft.com/windows/win32/api/unknwn/nf-unknwn-iunknown-release
     */
    Release() {
        result := ComCall(2, this, UInt32)
        return result
    }

    Query(iid) {
        if (IUnknown.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    /**
     * Install the QueryInterface / AddRef / Release callbacks. Each slot honors a
     * user-supplied override on `implObj` if present, otherwise falls back to the
     * built-in `__Default*` implementation. The CallbackCreate paramCount is the
     * COM-ABI count (declared parameters + 1 for the C++ this pointer).
     */
    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
    
        qi := GetMethod(implObj, "QueryInterface") ?? ObjBindMethod(this, "_DefaultQueryInterface")
        this.vtbl.QueryInterface := CallbackCreate(qi, flags, 3)
    
        addRef := GetMethod(implObj, "AddRef") ?? ObjBindMethod(this, "_DefaultAddRef")            
        this.vtbl.AddRef := CallbackCreate(addRef, flags, 1)
    
        release := GetMethod(implObj, "Release") ?? ObjBindMethod(this, "_DefaultRelease")
        this.vtbl.Release := CallbackCreate(release, flags, 1)
    }
    
    /**
     * Free the three IUnknown callback slots, then chain to super.
     */
    Dispose() {
        super.Dispose()
        CallbackFree(this.vtbl.QueryInterface)
        CallbackFree(this.vtbl.AddRef)
        CallbackFree(this.vtbl.Release)
    }
    
    /**
     * Determines whether or not this interface and some other interface refer to the
     * same underlying object by comparing pointers retrieved from QueryInterface.
     * @param {IUnknown | ComObject} other the interface to compare this one to
     */
    Equals(other) {
        if (!(other is IUnknown || other is ComObject))
            throw TypeError("Expected a Win32ComInterface extending IUnknown or a ComObject, but got a(n) " . Type(other))
    
        thisPtrBuf := Buffer(A_PtrSize)
        this.QueryInterface(IUnknown.IID, thisPtrBuf)
        thisPtr := NumGet(thisPtrBuf, "ptr")
    
        otherPtr := 0
        if (other is IUnknown) {
            other.QueryInterface(IUnknown.IID, &otherPtr)
            otherInterface := IUnknown(otherPtr)  ; auto-released on scope exit
        } else {
            otherPtr := ComObjQuery(other, String(IUnknown.IID)).ptr
        }
    
        return thisPtr == otherPtr
    }
    
}
