#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include ..\..\Foundation\SYSTEMTIME.ahk

/**
 * The FAX_JOB_ENTRY structure describes one fax job.
 * @remarks
 * 
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
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//winfax/ns-winfax-fax_job_entryw
 * @namespace Windows.Win32.Devices.Fax
 * @version v4.0.30319
 * @charset Unicode
 */
class FAX_JOB_ENTRYW extends Win32Struct
{
    static sizeof => 144

    static packingSize => 8

    /**
     * Type: <b>DWORD</b>
     * 
     * Specifies the size, in bytes, of the <b>FAX_JOB_ENTRY</b> structure. The calling application must set this member to <b>sizeof(FAX_JOB_ENTRY)</b> before it calls the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winfax/nf-winfax-faxsetjoba">FaxSetJob</a> function.
     * @type {Integer}
     */
    SizeOfStruct {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * Specifies a unique number that identifies the fax job of interest. This number must match the value the calling application passes in the JobId parameter to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winfax/nf-winfax-faxsetjoba">FaxSetJob</a> function.
     * @type {Integer}
     */
    JobId {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Type: <b>LPCTSTR</b>
     * 
     * Pointer to a constant null-terminated character string that specifies the name of the user who submitted the fax job.
     * @type {PWSTR}
     */
    UserName{
        get {
            if(!this.HasProp("__UserName"))
                this.__UserName := PWSTR(this.ptr + 8)
            return this.__UserName
        }
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * Specifies a <b>DWORD</b> variable that specifies the type of the fax job of interest. This member can be one of the following job types.
     * @type {Integer}
     */
    JobType {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Type: <b>DWORD</b>
     * @type {Integer}
     */
    QueueStatus {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * Specifies a <b>DWORD</b> variable that is a fax device status code or value. This value can be one of the following predefined device status codes.
     * @type {Integer}
     */
    Status {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * Specifies a <b>DWORD</b> variable that contains the size, in bytes, of the fax document to transmit. The size must not exceed 4 GB.
     * @type {Integer}
     */
    Size {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * Specifies a <b>DWORD</b> variable that indicates the total number of pages in the fax transmission.
     * @type {Integer}
     */
    PageCount {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * Type: <b>LPCTSTR</b>
     * 
     * Pointer to a constant null-terminated character string that specifies the fax number of the recipient of the fax transmission.
     * @type {PWSTR}
     */
    RecipientNumber{
        get {
            if(!this.HasProp("__RecipientNumber"))
                this.__RecipientNumber := PWSTR(this.ptr + 40)
            return this.__RecipientNumber
        }
    }

    /**
     * Type: <b>LPCTSTR</b>
     * 
     * Pointer to a constant null-terminated character string that specifies the name of the recipient of the fax transmission.
     * @type {PWSTR}
     */
    RecipientName{
        get {
            if(!this.HasProp("__RecipientName"))
                this.__RecipientName := PWSTR(this.ptr + 48)
            return this.__RecipientName
        }
    }

    /**
     * Type: <b>LPCTSTR</b>
     * 
     * Pointer to a constant null-terminated character string that specifies the transmitting station identifier. This identifier is usually a telephone number.
     * @type {PWSTR}
     */
    Tsid{
        get {
            if(!this.HasProp("__Tsid"))
                this.__Tsid := PWSTR(this.ptr + 56)
            return this.__Tsid
        }
    }

    /**
     * Type: <b>LPCTSTR</b>
     * 
     * Pointer to a constant null-terminated character string that specifies the name of the sender who initiated the fax transmission.
     * @type {PWSTR}
     */
    SenderName{
        get {
            if(!this.HasProp("__SenderName"))
                this.__SenderName := PWSTR(this.ptr + 64)
            return this.__SenderName
        }
    }

    /**
     * Type: <b>LPCTSTR</b>
     * 
     * Pointer to a constant null-terminated character string that specifies the company name of the sender who initiated the fax transmission.
     * @type {PWSTR}
     */
    SenderCompany{
        get {
            if(!this.HasProp("__SenderCompany"))
                this.__SenderCompany := PWSTR(this.ptr + 72)
            return this.__SenderCompany
        }
    }

    /**
     * Type: <b>LPCTSTR</b>
     * 
     * Pointer to a constant null-terminated character string that specifies the department name of the sender who initiated the fax transmission.
     * @type {PWSTR}
     */
    SenderDept{
        get {
            if(!this.HasProp("__SenderDept"))
                this.__SenderDept := PWSTR(this.ptr + 80)
            return this.__SenderDept
        }
    }

    /**
     * Type: <b>LPCTSTR</b>
     * 
     * Pointer to a constant null-terminated character string that indicates an application- or server-specific billing code that applies to the fax transmission. The fax server uses the string to generate an entry in the fax event log. Billing codes are optional.
     * @type {PWSTR}
     */
    BillingCode{
        get {
            if(!this.HasProp("__BillingCode"))
                this.__BillingCode := PWSTR(this.ptr + 88)
            return this.__BillingCode
        }
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * Specifies a <b>DWORD</b> variable that indicates when to send the fax. This member can be one of the following predefined job scheduling actions.
     * @type {Integer}
     */
    ScheduleAction {
        get => NumGet(this, 96, "uint")
        set => NumPut("uint", value, this, 96)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-systemtime">SYSTEMTIME</a></b>
     * 
     * If the <b>ScheduleAction</b> member is equal to the value <b>JSA_SPECIFIC_TIME</b>, specifies a <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-systemtime">SYSTEMTIME</a> structure that contains the date and time to send the fax. The time specified must be expressed in UTC.
     * @type {SYSTEMTIME}
     */
    ScheduleTime{
        get {
            if(!this.HasProp("__ScheduleTime"))
                this.__ScheduleTime := SYSTEMTIME(this.ptr + 104)
            return this.__ScheduleTime
        }
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * Specifies a <b>DWORD</b> variable that indicates the type of email delivery report (DR) or nondelivery report (NDR) that the fax server should generate. This member can be one of the following predefined delivery report types.
     * @type {Integer}
     */
    DeliveryReportType {
        get => NumGet(this, 120, "uint")
        set => NumPut("uint", value, this, 120)
    }

    /**
     * Type: <b>LPCTSTR</b>
     * 
     * Pointer to a constant null-terminated character string. If the <b>DeliveryReportType</b> member is equal to <b>DRT_EMAIL</b>, the string is the address to which the DR or NDR should be sent. If the <b>DeliveryReportType</b> member is equal to <b>DRT_NONE</b>, this member must be <b>NULL</b>.
     * @type {PWSTR}
     */
    DeliveryReportAddress{
        get {
            if(!this.HasProp("__DeliveryReportAddress"))
                this.__DeliveryReportAddress := PWSTR(this.ptr + 128)
            return this.__DeliveryReportAddress
        }
    }

    /**
     * Type: <b>LPCTSTR</b>
     * 
     * Pointer to a constant null-terminated character string to associate with the fax document. This is the user-friendly name that appears in the print spooler.
     * @type {PWSTR}
     */
    DocumentName{
        get {
            if(!this.HasProp("__DocumentName"))
                this.__DocumentName := PWSTR(this.ptr + 136)
            return this.__DocumentName
        }
    }
}
