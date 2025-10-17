#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\FAX_TIME.ahk

/**
 * The FAX_CONFIGURATION structure contains information about the global configuration settings of a fax server.
 * @remarks
 * 
  * The fax client application passes the <b>FAX_CONFIGURATION</b> structure in a call to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winfax/nf-winfax-faxsetconfigurationa">FaxSetConfiguration</a> function to change the global configuration settings for the fax server of interest. If the application calls the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winfax/nf-winfax-faxgetconfigurationa">FaxGetConfiguration</a> function, it returns the current settings in a <b>FAX_CONFIGURATION</b> structure. For more information, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-fax-server-configuration-management">Fax Server Configuration Management</a>.
  * 
  * 
  * 
  * 
  * 
  * > [!NOTE]
  * > The winfax.h header defines FAX_CONFIGURATION as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//winfax/ns-winfax-fax_configurationw
 * @namespace Windows.Win32.Devices.Fax
 * @version v4.0.30319
 * @charset Unicode
 */
class FAX_CONFIGURATIONW extends Win32Struct
{
    static sizeof => 64

    static packingSize => 8

    /**
     * Type: <b>DWORD</b>
     * 
     * Specifies the size, in bytes, of the <b>FAX_CONFIGURATION</b> structure. The calling application must set this member to <b>sizeof(FAX_CONFIGURATION)</b> before it calls the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winfax/nf-winfax-faxsetconfigurationa">FaxSetConfiguration</a> function.
     * @type {Integer}
     */
    SizeOfStruct {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * Specifies a <b>DWORD</b> variable that indicates the number of times the fax server will attempt to retransmit an outgoing fax if the initial transmission fails.
     * @type {Integer}
     */
    Retries {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * Specifies a <b>DWORD</b> variable that indicates the number of minutes that will elapse between retransmission attempts by the fax server.
     * @type {Integer}
     */
    RetryDelay {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * Specifies a <b>DWORD</b> variable that indicates the number of days the fax server will retain an unsent job in the fax job queue. A transmission might not be sent, for example, if an invalid fax number or date is specified, or if the sending device receives a busy signal multiple times.
     * @type {Integer}
     */
    DirtyDays {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Type: <b>BOOL</b>
     * 
     * Specifies a Boolean variable that indicates whether the fax server should generate a brand (banner) at the top of outgoing fax transmissions. If this member is <b>TRUE</b>, the fax server generates a brand that contains transmission-related information like the transmitting station identifier, date, time, and page count.
     * @type {BOOL}
     */
    Branding {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * Type: <b>BOOL</b>
     * 
     * Specifies a Boolean variable that indicates whether the fax server will use the device's transmitting station identifier instead of the value specified in the <b>Tsid</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/winfax/ns-winfax-fax_job_parama">FAX_JOB_PARAM</a> structure. If this member is <b>TRUE</b>, the server uses the device's transmitting station identifier.
     * @type {BOOL}
     */
    UseDeviceTsid {
        get => NumGet(this, 20, "int")
        set => NumPut("int", value, this, 20)
    }

    /**
     * Type: <b>BOOL</b>
     * 
     * Specifies a Boolean variable that indicates whether fax client applications can include a user-designed cover page with the fax transmission. If this member is <b>TRUE</b>, the client must use a common cover page stored on the fax server. If this member is <b>FALSE</b>, the client can use a personal cover page file.
     * @type {BOOL}
     */
    ServerCp {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }

    /**
     * Type: <b>BOOL</b>
     * 
     * Specifies a Boolean variable that indicates whether the fax server has paused the fax job queue. If this member is <b>TRUE</b>, the queue has been paused.
     * @type {BOOL}
     */
    PauseServerQueue {
        get => NumGet(this, 28, "int")
        set => NumPut("int", value, this, 28)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/winfax/ns-winfax-fax_time">FAX_TIME</a></b>
     * 
     * Specifies a <a href="https://docs.microsoft.com/windows/desktop/api/winfax/ns-winfax-fax_time">FAX_TIME</a> structure that indicates the hour and minute at which the discount period begins. The discount period applies only to outgoing transmissions.
     * @type {FAX_TIME}
     */
    StartCheapTime{
        get {
            if(!this.HasProp("__StartCheapTime"))
                this.__StartCheapTime := FAX_TIME(32, this)
            return this.__StartCheapTime
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/winfax/ns-winfax-fax_time">FAX_TIME</a></b>
     * 
     * Specifies a <a href="https://docs.microsoft.com/windows/desktop/api/winfax/ns-winfax-fax_time">FAX_TIME</a> structure that indicates the hour and minute at which the discount period ends. The discount period applies only to outgoing transmissions.
     * @type {FAX_TIME}
     */
    StopCheapTime{
        get {
            if(!this.HasProp("__StopCheapTime"))
                this.__StopCheapTime := FAX_TIME(36, this)
            return this.__StopCheapTime
        }
    }

    /**
     * Type: <b>BOOL</b>
     * 
     * Specifies a Boolean variable that indicates whether the fax server should archive outgoing fax transmissions. If this member is <b>TRUE</b>, the server archives outgoing transmissions in the directory specified by the <b>ArchiveDirectory</b> member.
     * @type {BOOL}
     */
    ArchiveOutgoingFaxes {
        get => NumGet(this, 40, "int")
        set => NumPut("int", value, this, 40)
    }

    /**
     * Type: <b>LPCTSTR</b>
     * 
     * Pointer to a constant null-terminated character string that contains the fully qualified path of the directory in which outgoing fax transmissions will be archived. The path can be a UNC path or a path beginning with a drive letter. The fax server ignores this member if the <b>ArchiveOutgoingFaxes</b> member is <b>FALSE</b>. This member can be <b>NULL</b> if the <b>ArchiveOutgoingFaxes</b> member is <b>FALSE</b>.
     * @type {PWSTR}
     */
    ArchiveDirectory {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * 
     * @type {PWSTR}
     */
    Reserved {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }
}
