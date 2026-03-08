#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUnknown.ahk

/**
 * Enables application developers to monitor (spy on) memory allocation, detect memory leaks, and simulate memory failure in calls to IMalloc methods.
 * @see https://learn.microsoft.com/windows/win32/api/objidl/nn-objidl-imallocspy
 * @namespace Windows.Win32.System.Com
 * @version v4.0.30319
 */
class IMallocSpy extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMallocSpy
     * @type {Guid}
     */
    static IID => Guid("{0000001d-0000-0000-c000-000000000046}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["PreAlloc", "PostAlloc", "PreFree", "PostFree", "PreRealloc", "PostRealloc", "PreGetSize", "PostGetSize", "PreDidAlloc", "PostDidAlloc", "PreHeapMinimize", "PostHeapMinimize"]

    /**
     * Performs operations required before calling IMalloc::Alloc.
     * @remarks
     * The <b>PreAlloc</b> implementation may extend and/or modify the allocation to store debug-specific information with the allocation.
     * 
     * <b>PreAlloc</b> can force memory allocation failure by returning 0, allowing testing to ensure that the application handles allocation failure gracefully in all cases. In this case, <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-imallocspy-postalloc">IMallocSpy::PostAlloc</a> is not called and <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-imalloc-alloc">Alloc</a> returns <b>NULL</b>. Forcing allocation failure is effective only if <i>cbRequest</i> is not equal to 0. If <b>PreAlloc</b> is forcing failure by returning <b>NULL</b>, <b>PostAlloc</b> is not called. However, <b>Alloc</b> encounters a real memory failure and returns <b>NULL</b>, <b>PostAlloc</b> is called.
     * 
     * 
     * 
     * The call to <b>PreAlloc</b> through the return from <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-imallocspy-postalloc">PostAlloc</a> is guaranteed to be thread-safe.
     * @param {Pointer} cbRequest The number of bytes specified in the allocation request the caller is passing to <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-imalloc-alloc">Alloc</a>.
     * @returns {Pointer} The number of bytes specified in the call to <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-imalloc-alloc">Alloc</a>, which can be greater than or equal to the value of <i>cbRequest</i>.
     * @see https://learn.microsoft.com/windows/win32/api/objidl/nf-objidl-imallocspy-prealloc
     */
    PreAlloc(cbRequest) {
        result := ComCall(3, this, "ptr", cbRequest, "ptr")
        return result
    }

    /**
     * Performs operations required after calling IMalloc::Alloc.
     * @remarks
     * When a spy object implementing <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-imallocspy">IMallocSpy</a> is registered using the <a href="https://docs.microsoft.com/windows/desktop/api/objbase/nf-objbase-coregistermallocspy">CoRegisterMallocSpy</a> function, COM calls <b>PostAlloc</b> after any call to <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-imalloc-alloc">Alloc</a>. It takes as input a pointer to the allocation done by the call to <b>Alloc</b>, and returns a pointer to the beginning of the total allocation, which could include a forward offset from the other value if <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-imallocspy-prealloc">IMallocSpy::PreAlloc</a> was implemented to attach debug information to the allocation in this way. If not, the same pointer is returned and also becomes the return value to the caller of <b>Alloc</b>.
     * @param {Pointer<Void>} pActual The pointer returned from <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-imalloc-alloc">Alloc</a>.
     * @returns {Pointer<Void>} This method returns a pointer to the beginning of the block of memory actually allocated. This pointer is also returned to the caller of <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-imalloc-alloc">Alloc</a>. If debug information is written at the front of the caller's allocation, this should be a forward offset from <i>pActual</i>. The value is the same as <i>pActual</i> if debug information is appended or if no debug information is attached.
     * @see https://learn.microsoft.com/windows/win32/api/objidl/nf-objidl-imallocspy-postalloc
     */
    PostAlloc(pActual) {
        pActualMarshal := pActual is VarRef ? "ptr" : "ptr"

        result := ComCall(4, this, pActualMarshal, pActual, "ptr")
        return result
    }

    /**
     * Performs operations required before calling IMalloc::Free. This method ensures that the pointer passed to Free points to the beginning of the actual allocation.
     * @remarks
     * If <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-imallocspy-prealloc">IMallocSpy::PreAlloc</a> modified the original allocation request passed to <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-imalloc-alloc">IMalloc::Alloc</a> (or <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-imalloc-realloc">IMalloc::Realloc</a>), <b>PreFree</b> must supply a pointer to the actual allocation, which COM will pass to <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-imalloc-free">IMalloc::Free</a>. For example, if the <b>PreAlloc</b>/<a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-imallocspy-postalloc">PostAlloc</a> pair attached a header used to store debug information to the beginning of the caller's allocation, <b>PreFree</b> must return a pointer to the beginning of this header so that all of the block that was allocated can be freed.
     * @param {Pointer<Void>} pRequest A pointer to the block of memory that the caller is passing to <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-imalloc-free">Free</a>.
     * @param {BOOL} fSpyed Indicates whether the block of memory to be freed was allocated while the current spy was active.
     * @returns {Pointer<Void>} The value to be passed  to <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-imalloc-free">IMalloc::Free</a>.
     * @see https://learn.microsoft.com/windows/win32/api/objidl/nf-objidl-imallocspy-prefree
     */
    PreFree(pRequest, fSpyed) {
        pRequestMarshal := pRequest is VarRef ? "ptr" : "ptr"

        result := ComCall(5, this, pRequestMarshal, pRequest, "int", fSpyed, "ptr")
        return result
    }

    /**
     * Performs operations required after calling IMalloc::Free.
     * @remarks
     * When a spy object implementing <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-imallocspy">IMallocSpy</a> is registered using <a href="https://docs.microsoft.com/windows/desktop/api/objbase/nf-objbase-coregistermallocspy">CoRegisterMallocSpy</a> function, COM calls this method immediately after any call to <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-imalloc-free">IMalloc::Free</a>. This method is included for completeness and consistency; it is not anticipated that developers will implement significant functionality in this method.
     * @param {BOOL} fSpyed Indicates whether the block of memory to be freed was allocated while the current spy was active.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/objidl/nf-objidl-imallocspy-postfree
     */
    PostFree(fSpyed) {
        ComCall(6, this, "int", fSpyed)
    }

    /**
     * Performs operations required before calling IMalloc::Realloc.
     * @remarks
     * The <b>PreRealloc</b> implementation may extend and/or modify the allocation to store debug-specific information with the allocation. Thus, the <i>ppNewRequest</i> parameter may differ from <i>pRequest</i>, a pointer to the request specified in the original call to <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-imalloc-realloc">Realloc</a>.
     * 
     * <b>PreRealloc</b> can force memory allocation failure by returning 0, allowing testing to ensure that the application handles allocation failure gracefully in all cases. In this case, <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-imallocspy-postrealloc">PostRealloc</a> is not called and <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-imalloc-realloc">Realloc</a> returns <b>NULL</b>. However, if <b>Realloc</b> encounters a real memory failure and returns <b>NULL</b>, <b>PostRealloc</b> is called. Forcing allocation failure is effective only if <i>cbRequest</i> is not equal to 0.
     * @param {Pointer<Void>} pRequest The pointer to the block of memory specified in the call to <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-imalloc-realloc">IMalloc::Realloc</a>.
     * @param {Pointer} cbRequest The byte count of the block of memory as specified in the original call to <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-imalloc-realloc">IMalloc::Realloc</a>.
     * @param {Pointer<Pointer<Void>>} ppNewRequest Address of pointer variable that receives a pointer to the memory block to be reallocated. This may be different from the pointer in <i>pRequest</i> if the implementation of <b>PreRealloc</b> extends or modifies the reallocation. This is pointer should always be stored by <b>PreRealloc</b>.
     * @param {BOOL} fSpyed Indicates whether the block of memory was allocated while this spy was active.
     * @returns {Pointer} The byte count to be passed to <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-imalloc-realloc">IMalloc::Realloc</a>.
     * @see https://learn.microsoft.com/windows/win32/api/objidl/nf-objidl-imallocspy-prerealloc
     */
    PreRealloc(pRequest, cbRequest, ppNewRequest, fSpyed) {
        pRequestMarshal := pRequest is VarRef ? "ptr" : "ptr"
        ppNewRequestMarshal := ppNewRequest is VarRef ? "ptr*" : "ptr"

        result := ComCall(7, this, pRequestMarshal, pRequest, "ptr", cbRequest, ppNewRequestMarshal, ppNewRequest, "int", fSpyed, "ptr")
        return result
    }

    /**
     * Performs operations required after calling IMalloc::Realloc.
     * @remarks
     * If memory is successfully reallocated while the spy is active, <i>fSpyed</i> will be <b>TRUE</b> in subsequent calls to <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-imallocspy">IMallocSpy</a> methods that track the reallocated memory, even if <i>fSpyed</i> was previously <b>FALSE</b>.
     * @param {Pointer<Void>} pActual The pointer specified in the call to <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-imalloc-realloc">Realloc</a>.
     * @param {BOOL} fSpyed Indicates whether the block of memory was allocated while the current spy was active.
     * @returns {Pointer<Void>} The method returns a pointer to the beginning of the block actually allocated. This pointer is also returned to the caller of <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-imalloc-realloc">IMalloc::Realloc</a>. If debug information is written at the front of the caller's allocation, it should be a forward offset from <i>pActual</i>. The value should be the same as <i>pActual</i> if debug information is appended or if no debug information is attached.
     * @see https://learn.microsoft.com/windows/win32/api/objidl/nf-objidl-imallocspy-postrealloc
     */
    PostRealloc(pActual, fSpyed) {
        pActualMarshal := pActual is VarRef ? "ptr" : "ptr"

        result := ComCall(8, this, pActualMarshal, pActual, "int", fSpyed, "ptr")
        return result
    }

    /**
     * Performs operations required before calling IMalloc::GetSize.
     * @remarks
     * The <b>PreGetSize</b> method receives as its <i>pRequest</i> parameter the pointer the caller is passing to <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-imalloc-getsize">IMalloc::GetSize</a>. It must then return a pointer to the actual allocation, which may have altered <i>pRequest</i> in the implementation of either the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-imallocspy-prealloc">PreAlloc</a> or the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-imallocspy-prerealloc">PreRealloc</a> method of <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-imallocspy">IMallocSpy</a>. The pointer to the true allocation is then passed to <b>GetSize</b> as its <i>pv</i> parameter.
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-imalloc-getsize">IMalloc::GetSize</a> then returns the size determined, and COM passes this value to <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-imallocspy-postgetsize">IMallocSpy::PostGetSize</a> in <i>cbActual</i>.
     * 
     * The size determined by <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-imalloc-getsize">GetSize</a> is the value returned by the <a href="https://docs.microsoft.com/windows/desktop/api/heapapi/nf-heapapi-heapsize">HeapSize</a> function. This is the size originally requested. For example, a memory allocation request of 27 bytes returns an allocation of 32 bytes and <b>GetSize</b> returns 27.
     * @param {Pointer<Void>} pRequest The pointer that the caller is passing to <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-imalloc-getsize">GetSize</a>.
     * @param {BOOL} fSpyed Indicates whether the block of memory was allocated while the current spy was active.
     * @returns {Pointer<Void>} A pointer to the actual allocation for which the size is to be determined.
     * @see https://learn.microsoft.com/windows/win32/api/objidl/nf-objidl-imallocspy-pregetsize
     */
    PreGetSize(pRequest, fSpyed) {
        pRequestMarshal := pRequest is VarRef ? "ptr" : "ptr"

        result := ComCall(9, this, pRequestMarshal, pRequest, "int", fSpyed, "ptr")
        return result
    }

    /**
     * Performs operations required after calling IMalloc::GetSize.
     * @remarks
     * The size determined by <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-imalloc-getsize">GetSize</a> is the value returned by the <a href="https://docs.microsoft.com/windows/desktop/api/heapapi/nf-heapapi-heapsize">HeapSize</a> function. This is the size originally requested. For example, a memory allocation request of 27 bytes returns an allocation of 32 bytes and <b>GetSize</b> returns 27.
     * @param {Pointer} cbActual The number of bytes in the allocation, as returned by <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-imalloc-getsize">GetSize</a>.
     * @param {BOOL} fSpyed Indicates whether the block of memory was allocated while the current spy was active.
     * @returns {Pointer} The value returned by <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-imalloc-getsize">IMalloc::GetSize</a>, which is the size of the allocated block of memory, in bytes.
     * @see https://learn.microsoft.com/windows/win32/api/objidl/nf-objidl-imallocspy-postgetsize
     */
    PostGetSize(cbActual, fSpyed) {
        result := ComCall(10, this, "ptr", cbActual, "int", fSpyed, "ptr")
        return result
    }

    /**
     * Performs operations required before calling IMalloc::DidAlloc.
     * @remarks
     * When a spy object implementing <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-imallocspy">IMallocSpy</a> is registered with the <a href="https://docs.microsoft.com/windows/desktop/api/objbase/nf-objbase-coregistermallocspy">CoRegisterMallocSpy</a> function, COM calls this method immediately before any call to <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-imalloc-didalloc">IMalloc::DidAlloc</a>. This method is included for completeness and consistency; it is not anticipated that developers will implement significant functionality in this method.
     * @param {Pointer<Void>} pRequest The pointer specified in the call to <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-imalloc-didalloc">DidAlloc</a>.
     * @param {BOOL} fSpyed Indicates whether the allocation was done while this spy was active.
     * @returns {Pointer<Void>} The value passed  to <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-imalloc-didalloc">DidAlloc</a> as the <i>fActual</i> parameter.
     * @see https://learn.microsoft.com/windows/win32/api/objidl/nf-objidl-imallocspy-predidalloc
     */
    PreDidAlloc(pRequest, fSpyed) {
        pRequestMarshal := pRequest is VarRef ? "ptr" : "ptr"

        result := ComCall(11, this, pRequestMarshal, pRequest, "int", fSpyed, "ptr")
        return result
    }

    /**
     * Performs operations required after calling IMalloc::DidAlloc.
     * @remarks
     * When a spy object implementing <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-imallocspy">IMallocSpy</a> is registered using the <a href="https://docs.microsoft.com/windows/desktop/api/objbase/nf-objbase-coregistermallocspy">CoRegisterMallocSpy</a> function, COM calls this method immediately after any call to <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-imalloc-didalloc">DidAlloc</a>. This method is included for completeness and consistency; it is not anticipated that developers will implement significant functionality in this method.
     * 
     * For convenience, <i>pRequest</i>, the original pointer passed in the call to <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-imalloc-didalloc">DidAlloc</a>, is passed to <b>PostDidAlloc</b>. In addition, the parameter <i>fActual</i> is a Boolean value that indicates whether this value was actually passed to <b>DidAlloc</b>. If not, it would indicate that <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-imallocspy-predidalloc">IMallocSpy::PreDidAlloc</a> was implemented to alter this pointer for some debugging purpose.
     * @param {Pointer<Void>} pRequest The pointer specified in the call to <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-imalloc-didalloc">DidAlloc</a>.
     * @param {BOOL} fSpyed Indicates whether the allocation was done while this spy was active.
     * @param {Integer} fActual The value returned by <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-imalloc-didalloc">DidAlloc</a>.
     * @returns {Integer} The value returned to the caller of <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-imalloc-didalloc">DidAlloc</a>.
     * @see https://learn.microsoft.com/windows/win32/api/objidl/nf-objidl-imallocspy-postdidalloc
     */
    PostDidAlloc(pRequest, fSpyed, fActual) {
        pRequestMarshal := pRequest is VarRef ? "ptr" : "ptr"

        result := ComCall(12, this, pRequestMarshal, pRequest, "int", fSpyed, "int", fActual, "int")
        return result
    }

    /**
     * Performs operations required before calling IMalloc::HeapMinimize.
     * @remarks
     * This method is included for completeness; it is not anticipated that developers will implement significant functionality in this method.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/objidl/nf-objidl-imallocspy-preheapminimize
     */
    PreHeapMinimize() {
        ComCall(13, this)
    }

    /**
     * Performs operations required after calling IMalloc::HeapMinimize.
     * @remarks
     * When a spy object implementing <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-imallocspy">IMallocSpy</a> is registered using the <a href="https://docs.microsoft.com/windows/desktop/api/objbase/nf-objbase-coregistermallocspy">CoRegisterMallocSpy</a> function, COM calls this method immediately after any call to <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-imalloc-free">IMalloc::Free</a>. This method is included for completeness and consistency; it is not anticipated that developers will implement significant functionality in this method.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/objidl/nf-objidl-imallocspy-postheapminimize
     */
    PostHeapMinimize() {
        ComCall(14, this)
    }
}
