#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * A fax client application calls the FaxAbort function to terminate a fax job.
 * @remarks
 * An application typically calls the <b>FaxAbort</b> function to terminate a fax transmission that is in progress. To manage a queued fax job, an application typically calls the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winfax/nf-winfax-faxsetjoba">FaxSetJob</a> function. <b>FaxSetJob</b> can cancel an active job; the function can also pause, resume, cancel, or restart a queued fax job.
 * 
 * Call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winfax/nf-winfax-faxenumjobsa">FaxEnumJobs</a> function to retrieve a valid value to use in the <i>JobId</i> parameter.
 * 
 * For more information, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-modifying-a-fax-job">Modifying a Fax Job</a> and <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-terminating-a-fax-job">Terminating a Fax Job</a>.
 * @see https://learn.microsoft.com/windows/win32/api//content/winfax/nc-winfax-pfaxabort
 * @namespace Windows.Win32.Devices.Fax
 * @version v4.0.30319
 */
class PFAXABORT extends IUnknown {

    static sizeof => A_PtrSize

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Invoke"]

    /**
     * Invokes helper functionality for the IDispatch interface.
     * @param {HANDLE} FaxHandle 
     * @param {Integer} JobId 
     * @returns {BOOL} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(FaxHandle, JobId) {
        FaxHandle := FaxHandle is Win32Handle ? NumGet(FaxHandle, "ptr") : FaxHandle

        result := ComCall(3, this, "ptr", FaxHandle, "uint", JobId, "int")
        return result
    }
}
