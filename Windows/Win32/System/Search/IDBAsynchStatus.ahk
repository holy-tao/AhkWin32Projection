#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class IDBAsynchStatus extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDBAsynchStatus
     * @type {Guid}
     */
    static IID => Guid("{0c733a95-2a1c-11ce-ade5-00aa0044773d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Abort", "GetStatus"]

    /**
     * The AbortDoc function stops the current print job and erases everything drawn since the last call to the StartDoc function.
     * @remarks
     * <div class="alert"><b>Note</b>  This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation—factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.</div>
     * <div> </div>
     * Applications should call the <b>AbortDoc</b> function to stop a print job if an error occurs, or to stop a print job after the user cancels that job. To end a successful print job, an application should call the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-enddoc">EndDoc</a> function.
     * 
     * If Print Manager was used to start the print job, calling <b>AbortDoc</b> erases the entire spool job, so that the printer receives nothing. If Print Manager was not used to start the print job, the data may already have been sent to the printer. In this case, the printer driver resets the printer (when possible) and ends the print job.
     * @param {Pointer} hChapter 
     * @param {Integer} eOperation 
     * @returns {HRESULT} If the function succeeds, the return value is greater than zero.
     * 
     * If the function fails, the return value is SP_ERROR.
     * @see https://learn.microsoft.com/windows/win32/api//content/wingdi/nf-wingdi-abortdoc
     */
    Abort(hChapter, eOperation) {
        result := ComCall(3, this, "ptr", hChapter, "uint", eOperation, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Pointer} hChapter 
     * @param {Integer} eOperation 
     * @param {Pointer<Pointer>} pulProgress 
     * @param {Pointer<Pointer>} pulProgressMax 
     * @param {Pointer<Integer>} peAsynchPhase 
     * @param {Pointer<PWSTR>} ppwszStatusText 
     * @returns {HRESULT} 
     */
    GetStatus(hChapter, eOperation, pulProgress, pulProgressMax, peAsynchPhase, ppwszStatusText) {
        pulProgressMarshal := pulProgress is VarRef ? "ptr*" : "ptr"
        pulProgressMaxMarshal := pulProgressMax is VarRef ? "ptr*" : "ptr"
        peAsynchPhaseMarshal := peAsynchPhase is VarRef ? "uint*" : "ptr"
        ppwszStatusTextMarshal := ppwszStatusText is VarRef ? "ptr*" : "ptr"

        result := ComCall(4, this, "ptr", hChapter, "uint", eOperation, pulProgressMarshal, pulProgress, pulProgressMaxMarshal, pulProgressMax, peAsynchPhaseMarshal, peAsynchPhase, ppwszStatusTextMarshal, ppwszStatusText, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
