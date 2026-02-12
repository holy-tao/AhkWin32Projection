#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The FAX_RECIPIENT_CALLBACK function is an application-defined or library-defined callback function that the FaxSendDocumentForBroadcast function calls to retrieve user-specific information for the transmission. (Unicode)
 * @remarks
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winfax/nf-winfax-faxsenddocumentforbroadcasta">FaxSendDocumentForBroadcast</a> calls <b>FAX_RECIPIENT_CALLBACK</b> multiple times, once for each designated fax recipient.
 * 
 * The <b>PFAX_RECIPIENT_CALLBACK</b> data type is a pointer to a <b>FAX_RECIPIENT_CALLBACK</b> function.
 * 
 * Call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winfax/nf-winfax-faxcompletejobparamsa">FaxCompleteJobParams</a> function before calling the <b>FAX_RECIPIENT_CALLBACK</b> function. <b>FaxCompleteJobParams</b> is a utility function that fills multiple members in the <a href="https://docs.microsoft.com/windows/desktop/api/winfax/ns-winfax-fax_coverpage_infoa">FAX_COVERPAGE_INFO</a> and <a href="https://docs.microsoft.com/windows/desktop/api/winfax/ns-winfax-fax_job_parama">FAX_JOB_PARAM</a> structures, with information such as the sender's name, fax number, and optional billing code information.
 * 
 * A fax client application must specify the <b>FAX_RECIPIENT_CALLBACK</b> function by passing its address when it calls the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winfax/nf-winfax-faxsenddocumentforbroadcasta">FaxSendDocumentForBroadcast</a> function.
 * 
 * For more information, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-transmitting-faxes">Transmitting Faxes</a>.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The winfax.h header defines PFAX_RECIPIENT_CALLBACK as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api//content/winfax/nc-winfax-pfax_recipient_callbackw
 * @namespace Windows.Win32.Devices.Fax
 * @version v4.0.30319
 * @charset Unicode
 */
class PFAX_RECIPIENT_CALLBACKW extends IUnknown {

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
     * @param {Integer} RecipientNumber 
     * @param {Pointer<Void>} Context_ 
     * @param {Pointer<FAX_JOB_PARAMW>} JobParams 
     * @param {Pointer<FAX_COVERPAGE_INFOW>} CoverpageInfo 
     * @returns {BOOL} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(FaxHandle, RecipientNumber, Context_, JobParams, CoverpageInfo) {
        FaxHandle := FaxHandle is Win32Handle ? NumGet(FaxHandle, "ptr") : FaxHandle

        Context_Marshal := Context_ is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, "ptr", FaxHandle, "uint", RecipientNumber, Context_Marshal, Context_, "ptr", JobParams, "ptr", CoverpageInfo, "int")
        return result
    }
}
