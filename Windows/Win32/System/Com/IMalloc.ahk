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
     * Allocates a block of memory.
     * @param {Pointer} cb The size of the memory block to be allocated, in bytes.
     * @returns {Pointer<Void>} If the method succeeds, the return value is a pointer to the allocated block of memory. Otherwise, it is <b>NULL</b>.
     * 
     * Applications should always check the return value from this method, even when requesting small amounts of memory, because there is no guarantee the memory will be allocated.
     * @see https://docs.microsoft.com/windows/win32/api//objidl/nf-objidl-imalloc-alloc
     */
    Alloc(cb) {
        result := ComCall(3, this, "ptr", cb, "ptr")
        return result
    }

    /**
     * Changes the size of a previously allocated block of memory.
     * @param {Pointer<Void>} pv A pointer to the block of memory to be reallocated. This parameter can be <b>NULL</b>, as discussed in the Remarks section below.
     * @param {Pointer} cb The size of the memory block to be reallocated, in bytes. This parameter can be 0, as discussed in the Remarks section below.
     * @returns {Pointer<Void>} If the method succeeds, the return value is a pointer to the reallocated block of memory. Otherwise, it is <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//objidl/nf-objidl-imalloc-realloc
     */
    Realloc(pv, cb) {
        pvMarshal := pv is VarRef ? "ptr" : "ptr"

        result := ComCall(4, this, pvMarshal, pv, "ptr", cb, "ptr")
        return result
    }

    /**
     * Frees a previously allocated block of memory.
     * @remarks
     * 
     * This method frees a block of memory previously allocated through a call to <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-imalloc-alloc">IMalloc::Alloc</a> or <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-imalloc-realloc">IMalloc::Realloc</a>. The number of bytes freed equals the number of bytes that were allocated. After the call, the block of memory pointed to by <i>pv</i> is invalid and can no longer be used.
     * 
     * 
     * @param {Pointer<Void>} pv A pointer to the memory block to be freed. If this parameter is <b>NULL</b>, this method has no effect.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//objidl/nf-objidl-imalloc-free
     */
    Free(pv) {
        pvMarshal := pv is VarRef ? "ptr" : "ptr"

        ComCall(5, this, pvMarshal, pv)
    }

    /**
     * Retrieves the size of a previously allocated block of memory.
     * @param {Pointer<Void>} pv A pointer to the block of memory.
     * @returns {Pointer} The size of the allocated memory block in bytes or, if <i>pv</i> is a <b>NULL</b> pointer, -1.
     * @see https://docs.microsoft.com/windows/win32/api//objidl/nf-objidl-imalloc-getsize
     */
    GetSize(pv) {
        pvMarshal := pv is VarRef ? "ptr" : "ptr"

        result := ComCall(6, this, pvMarshal, pv, "ptr")
        return result
    }

    /**
     * Determines whether this allocator was used to allocate the specified block of memory.
     * @param {Pointer<Void>} pv A pointer to the block of memory. If this parameter is a <b>NULL</b> pointer, -1 is returned.
     * @returns {Integer} This method can return the following values.
     * 
     * <table>
     * <tr>
     * <th>Return value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The block of memory was allocated by this allocator.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The block of memory was not allocated by this allocator.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>-1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This method cannot determine whether this allocator allocated the block of memory.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//objidl/nf-objidl-imalloc-didalloc
     */
    DidAlloc(pv) {
        pvMarshal := pv is VarRef ? "ptr" : "ptr"

        result := ComCall(7, this, pvMarshal, pv, "int")
        return result
    }

    /**
     * Minimizes the heap as much as possible by releasing unused memory to the operating system, coalescing adjacent free blocks, and committing free pages.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//objidl/nf-objidl-imalloc-heapminimize
     */
    HeapMinimize() {
        ComCall(8, this)
    }
}
