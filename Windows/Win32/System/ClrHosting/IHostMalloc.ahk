#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.ClrHosting
 * @version v4.0.30319
 */
class IHostMalloc extends IUnknown{
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
     * 
     * @param {Pointer} cbSize 
     * @param {Integer} eCriticalLevel 
     * @param {Pointer<Void>} ppMem 
     * @returns {HRESULT} 
     */
    Alloc(cbSize, eCriticalLevel, ppMem) {
        result := ComCall(3, this, "ptr", cbSize, "int", eCriticalLevel, "ptr", ppMem, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer} cbSize 
     * @param {Integer} eCriticalLevel 
     * @param {Pointer<Byte>} pszFileName 
     * @param {Integer} iLineNo 
     * @param {Pointer<Void>} ppMem 
     * @returns {HRESULT} 
     */
    DebugAlloc(cbSize, eCriticalLevel, pszFileName, iLineNo, ppMem) {
        result := ComCall(4, this, "ptr", cbSize, "int", eCriticalLevel, "char*", pszFileName, "int", iLineNo, "ptr", ppMem, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} pMem 
     * @returns {HRESULT} 
     */
    Free(pMem) {
        result := ComCall(5, this, "ptr", pMem, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
