#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\SYSTEMTIME.ahk" { SYSTEMTIME }

/**
 * The FAX_JOB_PARAM structure contains the information necessary for the fax server to send an individual fax transmission. (Unicode)
 * @remarks
 * A fax client application passes the <b>FAX_JOB_PARAM</b> structure in a call to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winfax/nf-winfax-faxsenddocumenta">FaxSendDocument</a> function to inform the fax server how and when to send the fax transmission. For more information, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-sending-a-fax-to-one-recipient-win32-environment-">Sending a Fax to One Recipient (Win32 Environment)</a>.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The winfax.h header defines FAX_JOB_PARAM as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/winfax/ns-winfax-fax_job_paramw
 * @namespace Windows.Win32.Devices.Fax
 * @charset Unicode
 */
export default struct FAX_JOB_PARAMW {
    #StructPack 8

    /**
     * Type: <b>DWORD</b>
     * 
     * Specifies the size, in bytes, of the <b>FAX_JOB_PARAM</b> structure. The calling application must set this member to <b>sizeof(FAX_JOB_PARAM)</b>. This member is required.
     */
    SizeOfStruct : UInt32

    /**
     * Type: <b>LPCTSTR</b>
     * 
     * Pointer to a constant null-terminated character string that specifies the fax number of the recipient of the fax transmission. This member is required.
     */
    RecipientNumber : PWSTR

    /**
     * Type: <b>LPCTSTR</b>
     * 
     * Pointer to a constant null-terminated character string that specifies the name of the recipient of the fax transmission.
     */
    RecipientName : PWSTR

    /**
     * Type: <b>LPCTSTR</b>
     * 
     * Pointer to a constant null-terminated character string that specifies the transmitting station identifier (TSID). This identifier is usually a telephone number. Only printable characters such as English letters, numeric symbols, and punctuation marks (ASCII range 0x20 to 0x7F) can be used in a TSID.
     */
    Tsid : PWSTR

    /**
     * Type: <b>LPCTSTR</b>
     * 
     * Pointer to a constant null-terminated character string that specifies the name of the sender who initiated the fax transmission.
     */
    SenderName : PWSTR

    /**
     * Type: <b>LPCTSTR</b>
     * 
     * Pointer to a constant null-terminated character string that specifies the company name of the sender who initiated the fax transmission.
     */
    SenderCompany : PWSTR

    /**
     * Type: <b>LPCTSTR</b>
     * 
     * Pointer to a constant null-terminated character string that specifies the department name of the sender who initiated the fax transmission.
     */
    SenderDept : PWSTR

    /**
     * Type: <b>LPCTSTR</b>
     * 
     * Pointer to a constant null-terminated character string that indicates an application- or server-specific billing code that applies to the fax transmission. The fax server uses the string to generate an entry in the fax event log. Billing codes are optional.
     */
    BillingCode : PWSTR

    /**
     * Type: <b>DWORD</b>
     * 
     * Specifies a DWORD variable that indicates when to send the fax. This member is required, and can be one of the following predefined job scheduling actions.
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
    DeliveryReportAddress : PWSTR

    /**
     * Type: <b>LPCTSTR</b>
     * 
     * Pointer to a constant null-terminated character string to associate with the fax document. This is the user-friendly name that appears in the print spooler.
     */
    DocumentName : PWSTR

    /**
     * Type: <b>HCALL</b>
     * 
     * Reserved, and should be <b>NULL</b>.
     */
    CallHandle : UInt32

    /**
     * Type: <b>DWORD_PTR[3]</b>
     * 
     * This member is reserved for future use by Microsoft. It must be set to zero.
     */
    Reserved : IntPtr[3]

}
