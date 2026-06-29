#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ID2D1Factory.ahk" { ID2D1Factory }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Represents a Direct2D drawing resource.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1/nn-d2d1-id2d1resource
 * @namespace Windows.Win32.Graphics.Direct2D
 */
export default struct ID2D1Resource extends IUnknown {
    /**
     * The interface identifier for ID2D1Resource
     * @type {Guid}
     */
    static IID := Guid("{2cd90691-12e2-11dc-9fed-001143a055f9}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID2D1Resource interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetFactory : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID2D1Resource.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves the factory associated with this resource.
     * @param {Pointer<ID2D1Factory>} factory Type: <b><a href="https://docs.microsoft.com/windows/win32/api/d2d1/nn-d2d1-id2d1factory">ID2D1Factory</a>**</b>
     * 
     * When this method returns, contains a pointer to a pointer to the factory that created this resource. This parameter is passed uninitialized.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d2d1/nf-d2d1-id2d1resource-getfactory
     */
    GetFactory(factory) {
        ComCall(3, this, ID2D1Factory.Ptr, factory)
    }

    Query(iid) {
        if (ID2D1Resource.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetFactory := CallbackCreate(GetMethod(implObj, "GetFactory"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetFactory)
    }
}
