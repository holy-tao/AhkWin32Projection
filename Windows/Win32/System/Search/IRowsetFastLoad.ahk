#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class IRowsetFastLoad extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRowsetFastLoad
     * @type {Guid}
     */
    static IID => Guid("{5cf4ca13-ef21-11d0-97e7-00c04fc2ad98}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["InsertRow", "Commit"]

    /**
     * 
     * @param {HACCESSOR} hAccessor 
     * @param {Pointer<Void>} pData 
     * @returns {HRESULT} 
     */
    InsertRow(hAccessor, pData) {
        hAccessor := hAccessor is Win32Handle ? NumGet(hAccessor, "ptr") : hAccessor

        pDataMarshal := pData is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, "ptr", hAccessor, pDataMarshal, pData, "HRESULT")
        return result
    }

    /**
     * Indicates that a resource manager (RM) has finished committing a transaction that was requested by the transaction manager (TM).
     * @param {BOOL} fDone 
     * @returns {HRESULT} If the function succeeds, the return value is nonzero. 
     * 
     * 
     *   
     * 
     * If the function fails, the return value is zero (0). To get extended error information, call the <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function.
     * 
     *  The following list identifies the possible error codes:
     * @see https://learn.microsoft.com/windows/win32/api/ktmw32/nf-ktmw32-commitcomplete
     */
    Commit(fDone) {
        result := ComCall(4, this, "int", fDone, "HRESULT")
        return result
    }
}
