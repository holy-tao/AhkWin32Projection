#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUnknown.ahk

/**
 * Allocates, frees, and manages memory.
 * @see https://docs.microsoft.com/windows/win32/api//objidl/nn-objidl-imalloc
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class IMalloc extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMalloc
     * @type {Guid}
     */
    static IID => Guid("{00000002-0000-0000-c000-000000000046}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Alloc", "Realloc", "Free", "GetSize", "DidAlloc", "HeapMinimize"]

    /**
     * 
     * @param {Pointer} cb 
     * @returns {Pointer<Void>} 
     * @see https://learn.microsoft.com/windows/win32/api/objidl/nf-objidl-imalloc-alloc
     */
    Alloc(cb) {
        result := ComCall(3, this, "ptr", cb, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} pv 
     * @param {Pointer} cb 
     * @returns {Pointer<Void>} 
     * @see https://learn.microsoft.com/windows/win32/api/objidlbase/nf-objidlbase-imalloc-realloc
     */
    Realloc(pv, cb) {
        pvMarshal := pv is VarRef ? "ptr" : "ptr"

        result := ComCall(4, this, pvMarshal, pv, "ptr", cb, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} pv 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/objidlbase/nf-objidlbase-imalloc-free
     */
    Free(pv) {
        pvMarshal := pv is VarRef ? "ptr" : "ptr"

        ComCall(5, this, pvMarshal, pv)
    }

    /**
     * 
     * @param {Pointer<Void>} pv 
     * @returns {Pointer} 
     * @see https://learn.microsoft.com/windows/win32/api/objidlbase/nf-objidlbase-imalloc-getsize
     */
    GetSize(pv) {
        pvMarshal := pv is VarRef ? "ptr" : "ptr"

        result := ComCall(6, this, pvMarshal, pv, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} pv 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/objidlbase/nf-objidlbase-imalloc-didalloc
     */
    DidAlloc(pv) {
        pvMarshal := pv is VarRef ? "ptr" : "ptr"

        result := ComCall(7, this, pvMarshal, pv, "int")
        return result
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/objidlbase/nf-objidlbase-imalloc-heapminimize
     */
    HeapMinimize() {
        ComCall(8, this)
    }
}
