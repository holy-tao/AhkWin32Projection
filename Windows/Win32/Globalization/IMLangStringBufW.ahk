#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Globalization
 * @version v4.0.30319
 * @charset Unicode
 */
class IMLangStringBufW extends IUnknown{
    /**
     * The interface identifier for IMLangStringBufW
     * @type {Guid}
     */
    static IID => Guid("{d24acd21-ba72-11d0-b188-00aa0038c969}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<Int32>} plFlags 
     * @param {Pointer<Int32>} pcchBuf 
     * @returns {HRESULT} 
     */
    GetStatus(plFlags, pcchBuf) {
        result := ComCall(3, this, "int*", plFlags, "int*", pcchBuf, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} cchOffset 
     * @param {Integer} cchMaxLock 
     * @param {Pointer<UInt16>} ppszBuf 
     * @param {Pointer<Int32>} pcchBuf 
     * @returns {HRESULT} 
     */
    LockBuf(cchOffset, cchMaxLock, ppszBuf, pcchBuf) {
        result := ComCall(4, this, "int", cchOffset, "int", cchMaxLock, "ushort*", ppszBuf, "int*", pcchBuf, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pszBuf 
     * @param {Integer} cchOffset 
     * @param {Integer} cchWrite 
     * @returns {HRESULT} 
     */
    UnlockBuf(pszBuf, cchOffset, cchWrite) {
        pszBuf := pszBuf is String ? StrPtr(pszBuf) : pszBuf

        result := ComCall(5, this, "ptr", pszBuf, "int", cchOffset, "int", cchWrite, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} cchOffset 
     * @param {Integer} cchMaxInsert 
     * @param {Pointer<Int32>} pcchActual 
     * @returns {HRESULT} 
     */
    Insert(cchOffset, cchMaxInsert, pcchActual) {
        result := ComCall(6, this, "int", cchOffset, "int", cchMaxInsert, "int*", pcchActual, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} cchOffset 
     * @param {Integer} cchDelete 
     * @returns {HRESULT} 
     */
    Delete(cchOffset, cchDelete) {
        result := ComCall(7, this, "int", cchOffset, "int", cchDelete, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
