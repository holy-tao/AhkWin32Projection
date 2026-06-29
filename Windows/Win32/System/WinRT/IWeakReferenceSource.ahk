#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IWeakReference.ahk" { IWeakReference }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Represents a source object to which a weak reference can be retrieved.
 * @see https://learn.microsoft.com/windows/win32/api/weakreference/nn-weakreference-iweakreferencesource
 * @namespace Windows.Win32.System.WinRT
 */
export default struct IWeakReferenceSource extends IUnknown {
    /**
     * The interface identifier for IWeakReferenceSource
     * @type {Guid}
     */
    static IID := Guid("{00000038-0000-0000-c000-000000000046}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWeakReferenceSource interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetWeakReference : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWeakReferenceSource.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves a weak reference from an IWeakReferenceSource.
     * @returns {IWeakReference} Type: [out, retval] <b><a href="https://docs.microsoft.com/windows/win32/api/weakreference/nn-weakreference-iweakreference">IWeakReference</a>**</b>
     * 
     * The weak reference.
     * @see https://learn.microsoft.com/windows/win32/api/weakreference/nf-weakreference-iweakreferencesource-getweakreference
     */
    GetWeakReference() {
        result := ComCall(3, this, "ptr*", &weakReference := 0, "HRESULT")
        return IWeakReference(weakReference)
    }

    Query(iid) {
        if (IWeakReferenceSource.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetWeakReference := CallbackCreate(GetMethod(implObj, "GetWeakReference"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetWeakReference)
    }
}
