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

    static sizeof => A_PtrSize
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
        plFlagsMarshal := plFlags is VarRef ? "int*" : "ptr"
        pcchBufMarshal := pcchBuf is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, plFlagsMarshal, plFlags, pcchBufMarshal, pcchBuf, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} cchOffset 
     * @param {Integer} cchMaxLock 
     * @param {Pointer<Pointer<Integer>>} ppszBuf 
     * @param {Pointer<Integer>} pcchBuf 
     * @returns {HRESULT} 
     */
    LockBuf(cchOffset, cchMaxLock, ppszBuf, pcchBuf) {
        pcchBufMarshal := pcchBuf is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, "int", cchOffset, "int", cchMaxLock, "ptr*", ppszBuf, pcchBufMarshal, pcchBuf, "HRESULT")
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
        pcchActualMarshal := pcchActual is VarRef ? "int*" : "ptr"

        result := ComCall(6, this, "int", cchOffset, "int", cchMaxInsert, pcchActualMarshal, pcchActual, "HRESULT")
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
