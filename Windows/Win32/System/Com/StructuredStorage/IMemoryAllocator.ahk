#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }

/**
 * Implemented by the memory allocator for the StgConvertPropertyToVariant function.
 * @remarks
 * This class is only used by the [**StgConvertPropertyToVariant**](/windows/desktop/api/propidl/nf-propidl-stgconvertpropertytovariant) function.
 * @see https://learn.microsoft.com/windows/win32/Stg/imemoryallocator
 * @namespace Windows.Win32.System.Com.StructuredStorage
 */
export default struct IMemoryAllocator extends Win32ComInterface {

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMemoryAllocator interfaces
    */
    struct Vtbl {
        Allocate : IntPtr
        Free     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMemoryAllocator.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The Allocate method allocates memory for the StgConvertPropertyToVariant function when the function converts a SERIALIZEDPROPERTYVALUE data type to a PROPVARIANT data type.
     * @param {Integer} cbSize Specifies the size of memory to be allocated.
     * @returns {Pointer<Void>} 
     * @see https://learn.microsoft.com/windows/win32/Stg/imemoryallocator-allocate
     */
    Allocate(cbSize) {
        result := ComCall(0, this, "uint", cbSize, IntPtr)
        return result
    }

    /**
     * The Free method frees the memory allocated by the Allocate method.
     * @param {Pointer<Void>} pv Pointer to the memory to be freed.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/Stg/imemoryallocator-free
     */
    Free(pv) {
        pvMarshal := pv is VarRef ? "ptr" : "ptr"

        ComCall(1, this, pvMarshal, pv)
    }

    Query(iid) {
        if (IMemoryAllocator.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }
}
