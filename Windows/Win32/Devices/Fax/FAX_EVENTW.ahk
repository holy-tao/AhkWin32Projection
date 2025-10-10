#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\FILETIME.ahk

/**
 * The FAX_EVENT structure represents the contents of an I/O completion packet. The fax server sends the completion packet to notify a fax client application of an asynchronous fax server event.
 * @remarks
 * 
  * After a fax client application receives the <b>FEI_FAXSVC_ENDED</b> message from the fax service, it will no longer receive fax events. To resume receiving fax events, the application must call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winfax/nc-winfax-pfaxinitializeeventqueue">FaxInitializeEventQueue</a> function again when the fax service restarts. The application can determine if the fax service is running by using the service control manager.
  * 
  * If the application receives events using notification messages, it can use the <b>FEI_NEVENTS</b> event. If the message is between the application's base window message and the base window message + <b>FEI_NEVENTS</b>, then the application can process the message as a fax window message. An application specifies the base window message using the <i>MessageStart</i> parameter to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winfax/nc-winfax-pfaxinitializeeventqueue">FaxInitializeEventQueue</a> function; the base window message must be greater than the <a href="https://docs.microsoft.com/windows/desktop/winmsg/wm-user">WM_USER</a> message. For more information, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winfax/nc-winfax-pfaxclose">FaxClose</a> and <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-enabling-an-application-to-receive-notifications-of-fax-events">Enabling an Application to Receive Notifications of Fax Events</a>.
  * 
  * 
  * 
  * 
  * 
  * > [!NOTE]
  * > The winfax.h header defines FAX_EVENT as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//winfax/ns-winfax-fax_eventw
 * @namespace Windows.Win32.Devices.Fax
 * @version v4.0.30319
 * @charset Unicode
 */
class FAX_EVENTW extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Type: <b>DWORD</b>
     * 
     * Specifies the size, in bytes, of the <b>FAX_EVENT</b> structure. The fax server sets this member to <b>sizeof(FAX_EVENT)</b>.
     * @type {Integer}
     */
    SizeOfStruct {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a></b>
     * 
     * Specifies a <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure that contains the time at which the fax server generated the event.
     * @type {FILETIME}
     */
    TimeStamp{
        get {
            if(!this.HasProp("__TimeStamp"))
                this.__TimeStamp := FILETIME(this.ptr + 8)
            return this.__TimeStamp
        }
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * Specifies a <b>DWORD</b> variable that indicates the permanent line identifier for the fax device of interest.
     * @type {Integer}
     */
    DeviceId {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * Specifies a <b>DWORD</b> variable that identifies the current asynchronous event that occurred within the fax server. The following table lists the possible events and their meanings.
     * @type {Integer}
     */
    EventId {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * Specifies a unique number that identifies the fax job of interest. If this member is equal to the value 0xffffffff, it indicates an inactive fax job. Note that this number is not a print spooler identification number.
     * @type {Integer}
     */
    JobId {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }
}
