#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class ICommandPrepare extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICommandPrepare
     * @type {Guid}
     */
    static IID => Guid("{0c733a26-2a1c-11ce-ade5-00aa0044773d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Prepare", "Unprepare"]

    /**
     * Indicates that the resource manager (RM) has completed all processing necessary to guarantee that a commit or abort operation will succeed for the specified transaction.
     * @param {Integer} cExpectedRuns 
     * @returns {HRESULT} If the function succeeds, the return value is nonzero. 
     * 
     * 
     *   
     * 
     * If the function fails, the return value is zero (0). To get extended error information, call the <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function.
     * 
     *  The following list identifies the possible error codes:
     * @see https://learn.microsoft.com/windows/win32/api/ktmw32/nf-ktmw32-preparecomplete
     */
    Prepare(cExpectedRuns) {
        result := ComCall(3, this, "uint", cExpectedRuns, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Unprepare() {
        result := ComCall(4, this, "HRESULT")
        return result
    }
}
