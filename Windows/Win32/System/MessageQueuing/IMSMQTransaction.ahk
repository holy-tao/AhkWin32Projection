#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.System.MessageQueuing
 * @version v4.0.30319
 */
class IMSMQTransaction extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMSMQTransaction
     * @type {Guid}
     */
    static IID => Guid("{d7d6e07f-dccd-11d0-aa4b-0060970debae}")

    /**
     * The class identifier for MSMQTransaction
     * @type {Guid}
     */
    static CLSID => Guid("{d7d6e080-dccd-11d0-aa4b-0060970debae}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Transaction", "Commit", "Abort"]

    /**
     * @type {Integer} 
     */
    Transaction {
        get => this.get_Transaction()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Transaction() {
        result := ComCall(7, this, "int*", &plTransaction := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return plTransaction
    }

    /**
     * Indicates that a resource manager (RM) has finished committing a transaction that was requested by the transaction manager (TM).
     * @param {Pointer<VARIANT>} fRetaining 
     * @param {Pointer<VARIANT>} grfTC 
     * @param {Pointer<VARIANT>} grfRM 
     * @returns {HRESULT} If the function succeeds, the return value is nonzero. 
     * 
     * 
     *   
     * 
     * If the function fails, the return value is zero (0). To get extended error information, call the <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function.
     * 
     *  The following list identifies the possible error codes:
     * @see https://learn.microsoft.com/windows/win32/api//content/ktmw32/nf-ktmw32-commitcomplete
     */
    Commit(fRetaining, grfTC, grfRM) {
        result := ComCall(8, this, "ptr", fRetaining, "ptr", grfTC, "ptr", grfRM, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The AbortDoc function stops the current print job and erases everything drawn since the last call to the StartDoc function.
     * @remarks
     * <div class="alert"><b>Note</b>  This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation—factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.</div>
     * <div> </div>
     * Applications should call the <b>AbortDoc</b> function to stop a print job if an error occurs, or to stop a print job after the user cancels that job. To end a successful print job, an application should call the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-enddoc">EndDoc</a> function.
     * 
     * If Print Manager was used to start the print job, calling <b>AbortDoc</b> erases the entire spool job, so that the printer receives nothing. If Print Manager was not used to start the print job, the data may already have been sent to the printer. In this case, the printer driver resets the printer (when possible) and ends the print job.
     * @param {Pointer<VARIANT>} fRetaining 
     * @param {Pointer<VARIANT>} fAsync 
     * @returns {HRESULT} If the function succeeds, the return value is greater than zero.
     * 
     * If the function fails, the return value is SP_ERROR.
     * @see https://learn.microsoft.com/windows/win32/api//content/wingdi/nf-wingdi-abortdoc
     */
    Abort(fRetaining, fAsync) {
        result := ComCall(9, this, "ptr", fRetaining, "ptr", fAsync, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
