#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * @namespace Windows.Win32.System.Com.StructuredStorage
 * @version v4.0.30319
 */
class IMemoryAllocator extends Win32ComInterface{

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 0

    /**
     * 
     * @param {Integer} cbSize 
     * @returns {Pointer<Void>} 
     */
    Allocate(cbSize) {
        result := ComCall(0, this, "uint", cbSize, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} pv 
     * @returns {String} Nothing - always returns an empty string
     */
    Free(pv) {
        ComCall(1, this, "ptr", pv)
        return result
    }
}
