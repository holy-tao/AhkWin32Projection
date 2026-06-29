#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\SYSTEMTIME.ahk" { SYSTEMTIME }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * The FAX_JOB_ENTRY structure describes one fax job. (ANSI)
 * @remarks
 * A fax client application passes the <b>FAX_JOB_ENTRY</b> structure in a call to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winfax/nf-winfax-faxsetjoba">FaxSetJob</a> function.
 * 
 * An application can call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winfax/nf-winfax-faxenumjobsa">FaxEnumJobs</a> function to enumerate all queued and active fax jobs on the fax server of interest. <b>FaxEnumJobs</b> returns an array of <b>FAX_JOB_ENTRY</b> structures. Each structure describes one fax job in detail.
 * 
 * For more information, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-managing-fax-jobs">Managing Fax Jobs</a>.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The winfax.h header defines FAX_JOB_ENTRY as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/winfax/ns-winfax-fax_job_entrya
 * @namespace Windows.Win32.Devices.Fax
 * @charset ANSI
 */
export default struct FAX_JOB_ENTRYA {
    #StructPack 8

    /**
     * Type: <b>DWORD</b>
     * 
     * Specifies the size, in bytes, of the <b>FAX_JOB_ENTRY</b> structure. The calling application must set this member to <b>sizeof(FAX_JOB_ENTRY)</b> before it calls the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winfax/nf-winfax-faxsetjoba">FaxSetJob</a> function.
     */
    SizeOfStruct : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * Specifies a unique number that identifies the fax job of interest. This number must match the value the calling application passes in the JobId parameter to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winfax/nf-winfax-faxsetjoba">FaxSetJob</a> function.
     */
    JobId : UInt32

    /**
     * Type: <b>LPCTSTR</b>
     * 
     * Pointer to a constant null-terminated character string that specifies the name of the user who submitted the fax job.
     */
    UserName : PSTR

    /**
     * Type: <b>DWORD</b>
     * 
     * Specifies a <b>DWORD</b> variable that specifies the type of the fax job of interest. This member can be one of the following job types.
     */
    JobType : UInt32

    /**
     * Type: <b>DWORD</b>
     */
    QueueStatus : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * Specifies a <b>DWORD</b> variable that is a fax device status code or value. This value can be one of the following predefined device status codes.
     */
    Status : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * Specifies a <b>DWORD</b> variable that contains the size, in bytes, of the fax document to transmit. The size must not exceed 4 GB.
     */
    Size : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * Specifies a <b>DWORD</b> variable that indicates the total number of pages in the fax transmission.
     */
    PageCount : UInt32

    /**
     * Type: <b>LPCTSTR</b>
     * 
     * Pointer to a constant null-terminated character string that specifies the fax number of the recipient of the fax transmission.
     */
    RecipientNumber : PSTR

    /**
     * Type: <b>LPCTSTR</b>
     * 
     * Pointer to a constant null-terminated character string that specifies the name of the recipient of the fax transmission.
     */
    RecipientName : PSTR

    /**
     * Type: <b>LPCTSTR</b>
     * 
     * Pointer to a constant null-terminated character string that specifies the transmitting station identifier. This identifier is usually a telephone number.
     */
    Tsid : PSTR

    /**
     * Type: <b>LPCTSTR</b>
     * 
     * Pointer to a constant null-terminated character string that specifies the name of the sender who initiated the fax transmission.
     */
    SenderName : PSTR

    /**
     * Type: <b>LPCTSTR</b>
     * 
     * Pointer to a constant null-terminated character string that specifies the company name of the sender who initiated the fax transmission.
     */
    SenderCompany : PSTR

    /**
     * Type: <b>LPCTSTR</b>
     * 
     * Pointer to a constant null-terminated character string that specifies the department name of the sender who initiated the fax transmission.
     */
    SenderDept : PSTR

    /**
     * Type: <b>LPCTSTR</b>
     * 
     * Pointer to a constant null-terminated character string that indicates an application- or server-specific billing code that applies to the fax transmission. The fax server uses the string to generate an entry in the fax event log. Billing codes are optional.
     */
    BillingCode : PSTR

    /**
     * Type: <b>DWORD</b>
     * 
     * Specifies a <b>DWORD</b> variable that indicates when to send the fax. This member can be one of the following predefined job scheduling actions.
     */
    ScheduleAction : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-systemtime">SYSTEMTIME</a></b>
     * 
     * If the <b>ScheduleAction</b> member is equal to the value <b>JSA_SPECIFIC_TIME</b>, specifies a <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-systemtime">SYSTEMTIME</a> structure that contains the date and time to send the fax. The time specified must be expressed in UTC.
     */
    ScheduleTime : SYSTEMTIME

    /**
     * Type: <b>DWORD</b>
     * 
     * Specifies a <b>DWORD</b> variable that indicates the type of email delivery report (DR) or nondelivery report (NDR) that the fax server should generate. This member can be one of the following predefined delivery report types.
     */
    DeliveryReportType : UInt32

    /**
     * Type: <b>LPCTSTR</b>
     * 
     * Pointer to a constant null-terminated character string. If the <b>DeliveryReportType</b> member is equal to <b>DRT_EMAIL</b>, the string is the address to which the DR or NDR should be sent. If the <b>DeliveryReportType</b> member is equal to <b>DRT_NONE</b>, this member must be <b>NULL</b>.
     */
    DeliveryReportAddress : PSTR

    /**
     * Type: <b>LPCTSTR</b>
     * 
     * Pointer to a constant null-terminated character string to associate with the fax document. This is the user-friendly name that appears in the print spooler.
     */
    DocumentName : PSTR

}
