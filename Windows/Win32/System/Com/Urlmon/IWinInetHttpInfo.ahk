#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\IWinInetInfo.ahk

/**
 * @namespace Windows.Win32.System.Com.Urlmon
 * @version v4.0.30319
 */
class IWinInetHttpInfo extends IWinInetInfo{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWinInetHttpInfo
     * @type {Guid}
     */
    static IID => Guid("{79eac9d8-bafa-11ce-8c82-00aa004ba90b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 4

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["QueryInfo"]

    /**
     * Retrieves limit and job state information from the job object.
     * @remarks
     * Use 
     * <b>QueryInformationJobObject</b> to obtain the current limits and modify them. Use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/jobapi2/nf-jobapi2-setinformationjobobject">SetInformationJobObject</a> function to set new limits.
     * 
     * To compile an application that uses this function, define <b>_WIN32_WINNT</b> as 0x0500 or later. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/WinProg/using-the-windows-headers">Using the Windows Headers</a>.
     * @param {Integer} dwOption 
     * @param {Pointer<Void>} pBuffer 
     * @param {Pointer<Integer>} pcbBuf 
     * @param {Pointer<Integer>} pdwFlags 
     * @param {Pointer<Integer>} pdwReserved 
     * @returns {HRESULT} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api//content/jobapi2/nf-jobapi2-queryinformationjobobject
     */
    QueryInfo(dwOption, pBuffer, pcbBuf, pdwFlags, pdwReserved) {
        pBufferMarshal := pBuffer is VarRef ? "ptr" : "ptr"
        pcbBufMarshal := pcbBuf is VarRef ? "uint*" : "ptr"
        pdwFlagsMarshal := pdwFlags is VarRef ? "uint*" : "ptr"
        pdwReservedMarshal := pdwReserved is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, "uint", dwOption, pBufferMarshal, pBuffer, pcbBufMarshal, pcbBuf, pdwFlagsMarshal, pdwFlags, pdwReservedMarshal, pdwReserved, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
