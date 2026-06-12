#Requires AutoHotkey v2.1-alpha.30+ 64-bit

#Import "./Guid.ahk" { Guid }


/**
 * Base struct for all generated COM interfaces. Holds shared functionality
 * and default implementations of the IUnknown methods.
 *
 * @see https://www.autohotkey.com/docs/v2/lib/ComValue.htm
 */
struct Win32ComInterface {

    /**
     * Pointer to the interface's virtual function table. Derived interfaces
     * shadow this property via `DefineProp` at file scope to give it a typed
     * `Vtbl.Ptr` so members are reachable by name.
     */
    vtbl : IntPtr

    /**
     * Reference count for script-implemented interfaces. -1 for wrappers around
     * external pointers (we don't own the lifecycle).
     */
    refCount : Int16

    /**
     * Whether this instance is script-owned (i.e. we allocated the vtable and
     * installed callbacks). Unowned wrappers leave this false.
     */
    owned : Int16

    /**
     * The interface pointer handed to native code. For script-implemented (or
     * empty) interfaces this is our own backing memory - its offset 0 holds the
     * vtbl, so the struct itself *is* a valid interface pointer. For wrappers it
     * is the adopted external pointer.
     */
    comPtr : IntPtr

    /**
     * Override the intrinsic struct `Ptr` so the wrapper marshals as the real
     * interface pointer everywhere: `ComCall`, `DllCall "ptr"` arguments and
     * `StructType.Ptr` parameters all see `comPtr`, while our bookkeeping fields
     * (`refCount`, `owned`) stay in our own memory, invisible to the callee. This
     * is what lets a wrapper be passed to native code that knows nothing about
     * this projection.
     */
    Ptr => this.comPtr

    /**
     * Construct an empty interface to be filled in, an interface implemented with
     * some object, or a wrapper that adopts an existing interface pointer.
     *
     * Unlike `At`, this allocates its own backing memory, so `refCount`/`owned`
     * never overlap the wrapped object and `__Delete` still runs.
     *
     * @param {Integer|Object} ptrOrImpl impl object or pointer to adopt
     * @param {String} flags CallbackCreate flags when implementing
     */
    __New(ptrOrImpl := 0, flags := "") {
        this.refCount := -1
        this.owned := false

        ; By default the struct *is* the object (offset 0 holds the vtbl), so our
        ; own backing address is the interface pointer. Wrapping overrides this.
        this.comPtr := ObjGetDataPtr(this)

        if IsObject(ptrOrImpl) {
            this.refCount := 0
            this.owned := true

            this.Implement(ptrOrImpl, flags)
            this.AddRef()
        }
        else if IsInteger(ptrOrImpl) && ptrOrImpl != 0 {
            ; Adopt an existing interface pointer. Dispatch goes straight to the
            ; real object through comPtr; we deliberately never touch its memory.
            this.comPtr := ptrOrImpl
        }

        ; Otherwise (empty) comPtr keeps pointing at our own (zeroed) vtbl slot.
    }
    
    /**
     * Default QueryInterface implementation. Walks the inheritance chain looking
     * for a matching IID, AddRef's and returns S_OK on hit, E_NOINTERFACE on miss,
     * E_POINTER if comOutPtr is null (per the COM spec).
     */
    _DefaultQueryInterface(_, riid, comOutPtr) {
        if (comOutPtr == 0)
            return 0x80004003  ; E_POINTER

        if !(riid is Guid) {
            if !(riid is Integer)
                throw TypeError("Expected a Guid or an Integer but go a(n) " Type(riid), , riid)
            riid := Guid.At(riid)
        }

        ; Per-instance IID (e.g. parameterized COM types)
        if (this.Query(riid) || (this.HasProp("IID") && this.IID.Equals(riid))) {
            NumPut("ptr", this.ptr, comOutPtr)
            this.AddRef()
            return 0  ; S_OK
        }

        NumPut("ptr", 0, comOutPtr)
        return 0x80004002  ; E_NOINTERFACE
    }

    _DefaultAddRef(_) {
        return ++this.refCount
    }

    _DefaultRelease(_) {
        return --this.refCount
    }

    Query(iid) => false

    /**
     * Chain target for derived `Implement` overrides. The most-derived class's
     * `Implement` calls `super.Implement(...)` to walk up the inheritance chain;
     * this no-op terminates that chain at Win32ComInterface.
     */
    Implement(implObj, flags := "") {
    }

    /**
     * Chain target for derived `Dispose` overrides. Generated `Dispose()` walks
     * up via `super.Dispose()` to free every CallbackCreate'd slot; this no-op
     * terminates the chain.
     */
    Dispose() {
    }

    /**
     * When an unowned interface falls out of scope, release the COM reference.
     * 
     * Owned interfaces must be disposed explicitly via `Dispose()`, since there
     * might be a reference cycle between it and the implementation object.
     */
    __Delete() {
        if !this.owned
            this.Release()
    }
}
