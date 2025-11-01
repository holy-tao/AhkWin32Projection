#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Globalization
 * @version v4.0.30319
 * @charset ANSI
 */
class IMLangStringBufA extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMLangStringBufA
     * @type {Guid}
     */
    static IID => Guid("{d24acd23-ba72-11d0-b188-00aa0038c969}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetStatus", "LockBuf", "UnlockBuf", "Insert", "Delete"]

    /**
     * 
     * @param {Pointer<Integer>} plFlags 
     * @param {Pointer<Integer>} pcchBuf 
     * @returns {HRESULT} 
     */
    GetStatus(plFlags, pcchBuf) {
        result := ComCall(3, this, "int*", plFlags, "int*", pcchBuf, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} cchOffset 
     * @param {Integer} cchMaxLock 
     * @param {Pointer<Pointer<CHAR>>} ppszBuf 
     * @param {Pointer<Integer>} pcchBuf 
     * @returns {HRESULT} 
     */
    LockBuf(cchOffset, cchMaxLock, ppszBuf, pcchBuf) {
        result := ComCall(4, this, "int", cchOffset, "int", cchMaxLock, "ptr*", ppszBuf, "int*", pcchBuf, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PSTR} pszBuf 
     * @param {Integer} cchOffset 
     * @param {Integer} cchWrite 
     * @returns {HRESULT} 
     */
    UnlockBuf(pszBuf, cchOffset, cchWrite) {
        pszBuf := pszBuf is String ? StrPtr(pszBuf) : pszBuf

        result := ComCall(5, this, "ptr", pszBuf, "int", cchOffset, "int", cchWrite, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} cchOffset 
     * @param {Integer} cchMaxInsert 
     * @param {Pointer<Integer>} pcchActual 
     * @returns {HRESULT} 
     */
    Insert(cchOffset, cchMaxInsert, pcchActual) {
        result := ComCall(6, this, "int", cchOffset, "int", cchMaxInsert, "int*", pcchActual, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} cchOffset 
     * @param {Integer} cchDelete 
     * @returns {HRESULT} 
     */
    Delete(cchOffset, cchDelete) {
        result := ComCall(7, this, "int", cchOffset, "int", cchDelete, "HRESULT")
        return result
    }
}
