#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class IDCInfo extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDCInfo
     * @type {Guid}
     */
    static IID => Guid("{0c733a9c-2a1c-11ce-ade5-00aa0044773d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetInfo", "SetInfo"]

    /**
     * 
     * @param {Integer} cInfo 
     * @param {Pointer<Integer>} rgeInfoType 
     * @returns {Pointer<DCINFO>} 
     */
    GetInfo(cInfo, rgeInfoType) {
        rgeInfoTypeMarshal := rgeInfoType is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", cInfo, rgeInfoTypeMarshal, rgeInfoType, "ptr*", &prgInfo := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return prgInfo
    }

    /**
     * Sets limits for a job object.
     * @remarks
     * Use the <b>SetInformationJobObject</b> 
     *     function to set several limits in a single call. To establish the limits one at a time or change a 
     *     subset of the limits, call the 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/jobapi2/nf-jobapi2-queryinformationjobobject">QueryInformationJobObject</a> function to obtain 
     *     the current limits, modify these limits, and then call 
     *     <b>SetInformationJobObject</b>.
     * 
     * You must set security limits individually for each process associated with a job object, rather than setting 
     *     them for the job object itself. For information, see 
     *     <a href="https://docs.microsoft.com/windows/desktop/ProcThread/process-security-and-access-rights">Process Security and Access Rights</a>.
     * 
     * <b>Windows Server 2003 and Windows XP:  </b>Use the <b>SetInformationJobObject</b> 
     *       function to set security limits for the job object.
     * 
     * To compile an application that uses this function, define _WIN32_WINNT as 0x0500 or later. For more 
     *     information, see 
     *     <a href="https://docs.microsoft.com/windows/desktop/WinProg/using-the-windows-headers">Using the Windows Headers</a>.
     * @param {Integer} cInfo 
     * @param {Pointer<DCINFO>} rgInfo 
     * @returns {HRESULT} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api//content/jobapi2/nf-jobapi2-setinformationjobobject
     */
    SetInfo(cInfo, rgInfo) {
        result := ComCall(4, this, "uint", cInfo, "ptr", rgInfo, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
