#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.ClrHosting
 * @version v4.0.30319
 */
class IHostMalloc extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHostMalloc
     * @type {Guid}
     */
    static IID => Guid("{1831991c-cc53-4a31-b218-04e910446479}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Alloc", "DebugAlloc", "Free"]

    /**
     * 
     * @param {Pointer} cbSize 
     * @param {Integer} eCriticalLevel 
     * @returns {Pointer<Void>} 
     */
    Alloc(cbSize, eCriticalLevel) {
        result := ComCall(3, this, "ptr", cbSize, "int", eCriticalLevel, "ptr*", &ppMem := 0, "HRESULT")
        return ppMem
    }

    /**
     * 
     * @param {Pointer} cbSize 
     * @param {Integer} eCriticalLevel 
     * @param {Pointer<Integer>} pszFileName 
     * @param {Integer} iLineNo 
     * @returns {Pointer<Void>} 
     */
    DebugAlloc(cbSize, eCriticalLevel, pszFileName, iLineNo) {
        pszFileNameMarshal := pszFileName is VarRef ? "char*" : "ptr"

        result := ComCall(4, this, "ptr", cbSize, "int", eCriticalLevel, pszFileNameMarshal, pszFileName, "int", iLineNo, "ptr*", &ppMem := 0, "HRESULT")
        return ppMem
    }

    /**
     * 
     * @param {Pointer<Void>} pMem 
     * @returns {HRESULT} 
     */
    Free(pMem) {
        pMemMarshal := pMem is VarRef ? "ptr" : "ptr"

        result := ComCall(5, this, pMemMarshal, pMem, "HRESULT")
        return result
    }
}
