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
     * Construct either an empty interface to be filled in, or an interface
     * implemented with some object. Pass a pointer to adopt it.
     * 
     * Note that calling `MyInterface.At` creates a boxed pointer which does
     * not call `__Delete` and thus will not correctly release the interface
     * pointer. Call `__New` with a pointer to adopt it.
     *
     * @param {Integer|Object} ptrOrImpl impl object or pointer to adopt
     * @param {String} flags CallbackCreate flags when implementing
     */
    __New(ptrOrImpl := 0, flags := "") {
        if IsObject(ptrOrImpl) {
            DefineProp(this, "refCount", { value: 0 })
            DefineProp(this, "owned", { get: (_) => true })

            this.Implement(ptrOrImpl, flags)
            this.AddRef()
        }
        else if IsInteger(ptrOrImpl) && ptrOrImpl != 0 {
            ; If passed a non-zero integer, treat as a pointer and copy
            ; the vtable pointer into our own
            this.vtbl := NumGet(ptrOrImpl, 0, "ptr")
        }

        ; Otherwise do nothing - generated constructor will have set the
        ; vtable, it'll be zeroed out
    }

    /**
     * Whether this instance is script-owned (i.e. we allocated the vtable and
     * installed callbacks). Unowned wrappers leave this false.
     * @type {Boolean}
     */
    owned => false

    /**
     * Reference count for script-implemented interfaces. -1 for wrappers around
     * external pointers (we don't own the lifecycle).
     * @type {Integer}
     */
    refCount => -1

    /**
     * Default QueryInterface implementation. Walks the inheritance chain looking
     * for a matching IID, AddRef's and returns S_OK on hit, E_NOINTERFACE on miss,
     * E_POINTER if comOutPtr is null (per the COM spec).
     */
    _DefaultQueryInterface(_, riid, comOutPtr) {
        if (comOutPtr == 0)
            return 0x80004003  ; E_POINTER

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
