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
     * 
     * @param {Pointer} cb 
     * @returns {Pointer<Void>} 
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
     */
    Realloc(pv, cb) {
        result := ComCall(4, this, "ptr", pv, "ptr", cb, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} pv 
     * @returns {String} Nothing - always returns an empty string
     */
    Free(pv) {
        ComCall(5, this, "ptr", pv)
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} pv 
     * @returns {Pointer} 
     */
    GetSize(pv) {
        result := ComCall(6, this, "ptr", pv, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} pv 
     * @returns {Integer} 
     */
    DidAlloc(pv) {
        result := ComCall(7, this, "ptr", pv, "int")
        return result
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    HeapMinimize() {
        ComCall(8, this)
        return result
    }
}
