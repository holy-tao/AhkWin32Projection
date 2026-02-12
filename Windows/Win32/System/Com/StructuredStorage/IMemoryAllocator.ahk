#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Implemented by the memory allocator for the StgConvertPropertyToVariant function.
 * @remarks
 * This class is only used by the [**StgConvertPropertyToVariant**](/windows/desktop/api/propidl/nf-propidl-stgconvertpropertytovariant) function.
 * @see https://learn.microsoft.com/windows/win32/ktop-src/Stg/imemoryallocator
 * @namespace Windows.Win32.System.Com.StructuredStorage
 * @version v4.0.30319
 */
class IMemoryAllocator extends Win32ComInterface{

    static sizeof => A_PtrSize

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 0

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Allocate", "Free"]

    /**
     * The Allocate method allocates memory for the StgConvertPropertyToVariant function when the function converts a SERIALIZEDPROPERTYVALUE data type to a PROPVARIANT data type.
     * @param {Integer} cbSize Specifies the size of memory to be allocated.
     * @returns {Pointer<Void>} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/Stg/imemoryallocator-allocate
     */
    Allocate(cbSize) {
        result := ComCall(0, this, "uint", cbSize, "ptr")
        return result
    }

    /**
     * The Free method frees the memory allocated by the Allocate method.
     * @param {Pointer<Void>} pv Pointer to the memory to be freed.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/ktop-src/Stg/imemoryallocator-free
     */
    Free(pv) {
        pvMarshal := pv is VarRef ? "ptr" : "ptr"

        ComCall(1, this, pvMarshal, pv)
    }
}
