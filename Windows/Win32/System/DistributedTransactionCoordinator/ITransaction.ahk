#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\XACTTRANSINFO.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Enables you to compose the work of multiple COM+ objects in a single transaction and explicitly commit or abort the transaction.
 * @remarks
 * Using the transaction context object to control a transaction limits the reuse of the business logic driving the transaction and should be used sparingly.
 * 
 * You obtain a reference to the <b>ITransactionContext</b> interface by creating a transaction context object with the appropriate call, as in the following example.
 * 
 * 
 * ``` syntax
 * hr = CoCreateInstance(
 *        CLSID_TransactionContext, 
 *        NULL, 
 *        CLSCTX_INPROC,
 *        IID_ITransactionContext, 
 *        (void**)&amp;m_pTransactionContext);
 * 
 * ```
 * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nn-comsvcs-itransactioncontext
 * @namespace Windows.Win32.System.DistributedTransactionCoordinator
 * @version v4.0.30319
 */
class ITransaction extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITransaction
     * @type {Guid}
     */
    static IID => Guid("{0fb15084-af41-11ce-bd2b-204c4f4f5020}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Commit", "Abort", "GetTransactionInfo"]

    /**
     * Indicates that a resource manager (RM) has finished committing a transaction that was requested by the transaction manager (TM).
     * @param {BOOL} fRetaining 
     * @param {Integer} grfTC 
     * @param {Integer} grfRM 
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
    Commit(fRetaining, grfTC, grfRM) {
        result := ComCall(3, this, "int", fRetaining, "uint", grfTC, "uint", grfRM, "HRESULT")
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
     * @param {Pointer<BOID>} pboidReason 
     * @param {BOOL} fRetaining 
     * @param {BOOL} fAsync 
     * @returns {HRESULT} If the function succeeds, the return value is greater than zero.
     * 
     * If the function fails, the return value is SP_ERROR.
     * @see https://learn.microsoft.com/windows/win32/api/wingdi/nf-wingdi-abortdoc
     */
    Abort(pboidReason, fRetaining, fAsync) {
        result := ComCall(4, this, "ptr", pboidReason, "int", fRetaining, "int", fAsync, "HRESULT")
        return result
    }

    /**
     * Returns the requested information about the specified transaction.
     * @returns {XACTTRANSINFO} 
     * @see https://learn.microsoft.com/windows/win32/api/ktmw32/nf-ktmw32-gettransactioninformation
     */
    GetTransactionInfo() {
        pinfo := XACTTRANSINFO()
        result := ComCall(5, this, "ptr", pinfo, "HRESULT")
        return pinfo
    }
}
