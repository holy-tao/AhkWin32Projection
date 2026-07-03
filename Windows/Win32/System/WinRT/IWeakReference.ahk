#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Represents a weak reference to an object.
 * @see https://learn.microsoft.com/windows/win32/api/weakreference/nn-weakreference-iweakreference
 * @namespace Windows.Win32.System.WinRT
 */
export default struct IWeakReference extends IUnknown {
    /**
     * The interface identifier for IWeakReference
     * @type {Guid}
     */
    static IID := Guid("{00000037-0000-0000-c000-000000000046}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWeakReference interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Resolve : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWeakReference.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Resolves a weak reference by returning a strong reference to the implementing object.
     * @remarks
     * If you try to resolve a weak reference to a strong reference for an object that is no longer available, then <b>IWeakReference::Resolve</b> returns <b>S_OK</b>, but the <i>objectReference</i> parameter points to null.
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} Type: <b><a href="https://docs.microsoft.com/windows/win32/api/inspectable/nn-inspectable-iinspectable">IInspectable</a>**</b>
     * 
     * A strong reference to the object.
     * @see https://learn.microsoft.com/windows/win32/api/weakreference/nf-weakreference-iweakreference-resolve(t_)
     */
    Resolve(riid) {
        result := ComCall(3, this, Guid.Ptr, riid, "ptr*", &objectReference := 0, "HRESULT")
        return objectReference
    }

    Query(iid) {
        if (IWeakReference.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Resolve := CallbackCreate(GetMethod(implObj, "Resolve"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Resolve)
    }
}
