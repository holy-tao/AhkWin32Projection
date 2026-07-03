#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\FAX_COVERPAGE_INFOA.ahk" { FAX_COVERPAGE_INFOA }
#Import ".\FAX_JOB_PARAMA.ahk" { FAX_JOB_PARAMA }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }

/**
 * The FAX_RECIPIENT_CALLBACK function is an application-defined or library-defined callback function that the FaxSendDocumentForBroadcast function calls to retrieve user-specific information for the transmission. (ANSI)
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
 * @see https://learn.microsoft.com/windows/win32/api/winfax/nc-winfax-pfax_recipient_callbacka
 * @namespace Windows.Win32.Devices.Fax
 * @charset ANSI
 */
export default struct PFAX_RECIPIENT_CALLBACKA {
    value : IntPtr

    __value {
        set {
            if (value is PFAX_RECIPIENT_CALLBACKA) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HANDLE} FaxHandle Type: <b>HANDLE</b>
     * 
     * Specifies a fax server handle returned by a call to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winfax/nf-winfax-faxconnectfaxservera">FaxConnectFaxServer</a> function.
     * @param {Integer} RecipientNumber Type: <b>DWORD</b>
     * 
     * Specifies a <b>DWORD</b> variable that indicates the number of times the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winfax/nf-winfax-faxsenddocumentforbroadcasta">FaxSendDocumentForBroadcast</a> function has called the <b>FAX_RECIPIENT_CALLBACK</b> function. Each function call corresponds to one designated fax recipient, and the index is relative to 1.
     * @param {Pointer<Void>} _Context Type: <b>LPVOID</b>
     * 
     * Pointer to a variable that contains application-specific context information or an application-defined value. <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winfax/nf-winfax-faxsenddocumentforbroadcasta">FaxSendDocumentForBroadcast</a> passes this data to the <b>FAX_RECIPIENT_CALLBACK</b> function.
     * @param {Pointer<FAX_JOB_PARAMA>} JobParams Type: <b>PFAX_JOB_PARAM</b>
     * 
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winfax/ns-winfax-fax_job_parama">FAX_JOB_PARAM</a> structure that contains the information necessary for the fax server to send the fax transmission to the designated recipient. The structure includes, among other items, the recipient's fax number, sender and recipient data, an optional billing code, and job scheduling information. The fax server queues the fax transmission according to the details specified by the <b>FAX_JOB_PARAM</b> structure.
     * @param {Pointer<FAX_COVERPAGE_INFOA>} CoverpageInfo Type: <b>PFAX_COVERPAGE_INFO</b>
     * 
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winfax/ns-winfax-fax_coverpage_infoa">FAX_COVERPAGE_INFO</a> structure that contains cover page data to display on the cover page of the fax document for the designated recipient. This parameter must be <b>NULL</b> if a cover page is not required.
     * @returns {BOOL} Type: <b>BOOL</b>
     * 
     * The function returns a value of nonzero to indicate that the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winfax/nf-winfax-faxsenddocumentforbroadcasta">FaxSendDocumentForBroadcast</a> function should queue an outbound fax transmission, using the data pointed to by the <i>JobParams</i> and <i>CoverpageInfo</i> parameters.
     * 
     * The function returns a value of zero to indicate that there are no more fax transmission jobs to queue, and calls to <b>FAX_RECIPIENT_CALLBACK</b> should be terminated. To get extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     */
    Call(FaxHandle, RecipientNumber, _Context, JobParams, CoverpageInfo) {
        _ContextMarshal := _Context is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, HANDLE, FaxHandle, UInt32, RecipientNumber, _ContextMarshal, _Context, FAX_JOB_PARAMA.Ptr, JobParams, FAX_COVERPAGE_INFOA.Ptr, CoverpageInfo, BOOL)
        return result
    }

    /**
     * A PFAX_RECIPIENT_CALLBACKA that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFAX_RECIPIENT_CALLBACKA {
        /**
         * Creates a PFAX_RECIPIENT_CALLBACKA pointer that invokes the given AHK function when called.
         * @param {Func(HANDLE, UInt32, "ptr", FAX_JOB_PARAMA, FAX_COVERPAGE_INFOA) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HANDLE, UInt32, "ptr", FAX_JOB_PARAMA.Ptr, FAX_COVERPAGE_INFOA.Ptr, BOOL])
        }

        __Delete() => CallbackFree(this.value)
    }
}
