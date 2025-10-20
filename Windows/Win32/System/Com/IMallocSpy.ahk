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
     * 
     * @param {Pointer} cbRequest 
     * @returns {Pointer} 
     */
    PreAlloc(cbRequest) {
        result := ComCall(3, this, "ptr", cbRequest, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} pActual 
     * @returns {Pointer<Void>} 
     */
    PostAlloc(pActual) {
        result := ComCall(4, this, "ptr", pActual, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} pRequest 
     * @param {BOOL} fSpyed 
     * @returns {Pointer<Void>} 
     */
    PreFree(pRequest, fSpyed) {
        result := ComCall(5, this, "ptr", pRequest, "int", fSpyed, "ptr")
        return result
    }

    /**
     * 
     * @param {BOOL} fSpyed 
     * @returns {String} Nothing - always returns an empty string
     */
    PostFree(fSpyed) {
        ComCall(6, this, "int", fSpyed)
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} pRequest 
     * @param {Pointer} cbRequest 
     * @param {Pointer<Void>} ppNewRequest 
     * @param {BOOL} fSpyed 
     * @returns {Pointer} 
     */
    PreRealloc(pRequest, cbRequest, ppNewRequest, fSpyed) {
        result := ComCall(7, this, "ptr", pRequest, "ptr", cbRequest, "ptr", ppNewRequest, "int", fSpyed, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} pActual 
     * @param {BOOL} fSpyed 
     * @returns {Pointer<Void>} 
     */
    PostRealloc(pActual, fSpyed) {
        result := ComCall(8, this, "ptr", pActual, "int", fSpyed, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} pRequest 
     * @param {BOOL} fSpyed 
     * @returns {Pointer<Void>} 
     */
    PreGetSize(pRequest, fSpyed) {
        result := ComCall(9, this, "ptr", pRequest, "int", fSpyed, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer} cbActual 
     * @param {BOOL} fSpyed 
     * @returns {Pointer} 
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
     */
    PreDidAlloc(pRequest, fSpyed) {
        result := ComCall(11, this, "ptr", pRequest, "int", fSpyed, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} pRequest 
     * @param {BOOL} fSpyed 
     * @param {Integer} fActual 
     * @returns {Integer} 
     */
    PostDidAlloc(pRequest, fSpyed, fActual) {
        result := ComCall(12, this, "ptr", pRequest, "int", fSpyed, "int", fActual, "int")
        return result
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    PreHeapMinimize() {
        ComCall(13, this)
        return result
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    PostHeapMinimize() {
        ComCall(14, this)
        return result
    }
}
