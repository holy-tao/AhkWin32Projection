#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFHDCPStatus extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFHDCPStatus
     * @type {Guid}
     */
    static IID => Guid("{de400f54-5bf1-40cf-8964-0bea136b1e3d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Query", "Set"]

    /**
     * The Query object represents a compound query.
     * @param {Pointer<Integer>} pStatus 
     * @param {Pointer<BOOL>} pfStatus 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/WMP/query-object
     */
    Query(pStatus, pfStatus) {
        pStatusMarshal := pStatus is VarRef ? "int*" : "ptr"
        pfStatusMarshal := pfStatus is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, pStatusMarshal, pStatus, pfStatusMarshal, pfStatus, "HRESULT")
        return result
    }

    /**
     * The SetAbortProc function sets the application-defined abort function that allows a print job to be canceled during spooling.
     * @remarks
     * <div class="alert"><b>Note</b>  This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation—factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.</div>
     * <div> </div>
     * @param {Integer} status 
     * @returns {HRESULT} If the function succeeds, the return value is greater than zero.
     * 
     * If the function fails, the return value is SP_ERROR.
     * @see https://learn.microsoft.com/windows/win32/api/wingdi/nf-wingdi-setabortproc
     */
    Set(status) {
        result := ComCall(4, this, "int", status, "HRESULT")
        return result
    }
}
