#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUnknown.ahk

/**
 * Enables application developers to monitor (spy on) memory allocation, detect memory leaks, and simulate memory failure in calls to IMalloc methods.
 * @see https://docs.microsoft.com/windows/win32/api//objidl/nn-objidl-imallocspy
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
     * 
     * @param {Pointer} cbRequest 
     * @returns {Pointer} 
     * @see https://learn.microsoft.com/windows/win32/api/objidl/nf-objidl-imallocspy-prealloc
     */
    PreAlloc(cbRequest) {
        result := ComCall(3, this, "ptr", cbRequest, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} pActual 
     * @returns {Pointer<Void>} 
     * @see https://learn.microsoft.com/windows/win32/api/objidl/nf-objidl-imallocspy-postalloc
     */
    PostAlloc(pActual) {
        pActualMarshal := pActual is VarRef ? "ptr" : "ptr"

        result := ComCall(4, this, pActualMarshal, pActual, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} pRequest 
     * @param {BOOL} fSpyed 
     * @returns {Pointer<Void>} 
     * @see https://learn.microsoft.com/windows/win32/api/objidl/nf-objidl-imallocspy-prefree
     */
    PreFree(pRequest, fSpyed) {
        pRequestMarshal := pRequest is VarRef ? "ptr" : "ptr"

        result := ComCall(5, this, pRequestMarshal, pRequest, "int", fSpyed, "ptr")
        return result
    }

    /**
     * 
     * @param {BOOL} fSpyed 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/objidl/nf-objidl-imallocspy-postfree
     */
    PostFree(fSpyed) {
        ComCall(6, this, "int", fSpyed)
    }

    /**
     * 
     * @param {Pointer<Void>} pRequest 
     * @param {Pointer} cbRequest 
     * @param {Pointer<Pointer<Void>>} ppNewRequest 
     * @param {BOOL} fSpyed 
     * @returns {Pointer} 
     * @see https://learn.microsoft.com/windows/win32/api/objidl/nf-objidl-imallocspy-prerealloc
     */
    PreRealloc(pRequest, cbRequest, ppNewRequest, fSpyed) {
        pRequestMarshal := pRequest is VarRef ? "ptr" : "ptr"

        result := ComCall(7, this, pRequestMarshal, pRequest, "ptr", cbRequest, "ptr*", ppNewRequest, "int", fSpyed, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} pActual 
     * @param {BOOL} fSpyed 
     * @returns {Pointer<Void>} 
     * @see https://learn.microsoft.com/windows/win32/api/objidl/nf-objidl-imallocspy-postrealloc
     */
    PostRealloc(pActual, fSpyed) {
        pActualMarshal := pActual is VarRef ? "ptr" : "ptr"

        result := ComCall(8, this, pActualMarshal, pActual, "int", fSpyed, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} pRequest 
     * @param {BOOL} fSpyed 
     * @returns {Pointer<Void>} 
     * @see https://learn.microsoft.com/windows/win32/api/objidl/nf-objidl-imallocspy-pregetsize
     */
    PreGetSize(pRequest, fSpyed) {
        pRequestMarshal := pRequest is VarRef ? "ptr" : "ptr"

        result := ComCall(9, this, pRequestMarshal, pRequest, "int", fSpyed, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer} cbActual 
     * @param {BOOL} fSpyed 
     * @returns {Pointer} 
     * @see https://learn.microsoft.com/windows/win32/api/objidl/nf-objidl-imallocspy-postgetsize
     */
    PostGetSize(cbActual, fSpyed) {
        result := ComCall(10, this, "ptr", cbActual, "int", fSpyed, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} pRequest 
     * @param {BOOL} fSpyed 
     * @returns {Pointer<Void>} 
     * @see https://learn.microsoft.com/windows/win32/api/objidl/nf-objidl-imallocspy-predidalloc
     */
    PreDidAlloc(pRequest, fSpyed) {
        pRequestMarshal := pRequest is VarRef ? "ptr" : "ptr"

        result := ComCall(11, this, pRequestMarshal, pRequest, "int", fSpyed, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} pRequest 
     * @param {BOOL} fSpyed 
     * @param {Integer} fActual 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/objidl/nf-objidl-imallocspy-postdidalloc
     */
    PostDidAlloc(pRequest, fSpyed, fActual) {
        pRequestMarshal := pRequest is VarRef ? "ptr" : "ptr"

        result := ComCall(12, this, pRequestMarshal, pRequest, "int", fSpyed, "int", fActual, "int")
        return result
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/objidl/nf-objidl-imallocspy-preheapminimize
     */
    PreHeapMinimize() {
        ComCall(13, this)
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/objidl/nf-objidl-imallocspy-postheapminimize
     */
    PostHeapMinimize() {
        ComCall(14, this)
    }
}
