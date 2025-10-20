#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/Stg/imemoryallocator
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
     * 
     * @param {Integer} cbSize 
     * @returns {Pointer<Void>} 
     * @see https://learn.microsoft.com/windows/win32/Stg/imemoryallocator-allocate
     */
    Allocate(cbSize) {
        result := ComCall(0, this, "uint", cbSize, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} pv 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/Stg/imemoryallocator-free
     */
    Free(pv) {
        ComCall(1, this, "ptr", pv)
    }
}
