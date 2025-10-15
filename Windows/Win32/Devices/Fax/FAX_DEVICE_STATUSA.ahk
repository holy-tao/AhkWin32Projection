#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PSTR.ahk
#Include ..\..\Foundation\FILETIME.ahk

/**
 * The FAX_DEVICE_STATUS structure contains information about the current status of a fax device.
 * @remarks
 * 
  * The fax client application can call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winfax/nf-winfax-faxgetdevicestatusa">FaxGetDeviceStatus</a> function to retrieve status information for the fax device of interest. The function returns the information in a <b>FAX_DEVICE_STATUS</b> structure.
  * 
  * For more information, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-fax-device-management">Fax Device Management</a>. For information about the status information a fax service provider supplies for an active fax operation, see the <a href="https://docs.microsoft.com/windows/desktop/api/faxdev/ns-faxdev-fax_dev_status">FAX_DEV_STATUS</a> topic.
  * 
  * 
  * 
  * 
  * 
  * > [!NOTE]
  * > The winfax.h header defines FAX_DEVICE_STATUS as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//winfax/ns-winfax-fax_device_statusa
 * @namespace Windows.Win32.Devices.Fax
 * @version v4.0.30319
 * @charset ANSI
 */
class FAX_DEVICE_STATUSA extends Win32Struct
{
    static sizeof => 152

    static packingSize => 8

    /**
     * Type: <b>DWORD</b>
     * 
     * Specifies the size, in bytes, of the <b>FAX_DEVICE_STATUS</b> structure. The fax service sets this member to <b>sizeof(FAX_DEVICE_STATUS)</b>.
     * @type {Integer}
     */
    SizeOfStruct {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b>LPCTSTR</b>
     * 
     * If the <b>JobType</b> member is equal to the <b>JT_RECEIVE</b> job type, <b>CallerId</b> is a pointer to a null-terminated character string that identifies the calling device that sent the active fax document. This string can include the telephone number of the calling device.
     * @type {PSTR}
     */
    CallerId{
        get {
            if(!this.HasProp("__CallerId"))
                this.__CallerId := PSTR(this.ptr + 8)
            return this.__CallerId
        }
    }

    /**
     * Type: <b>LPCTSTR</b>
     * 
     * Pointer to a constant null-terminated character string that specifies the called station identifier of the device.
     * @type {PSTR}
     */
    Csid{
        get {
            if(!this.HasProp("__Csid"))
                this.__Csid := PSTR(this.ptr + 16)
            return this.__Csid
        }
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * Specifies a <b>DWORD</b> variable that indicates the number of the page in the fax transmission that the fax device is currently sending or receiving. The page count is relative to one.
     * @type {Integer}
     */
    CurrentPage {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * Specifies a <b>DWORD</b> variable that indicates the permanent line identifier for the fax device of interest.
     * @type {Integer}
     */
    DeviceId {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * Type: <b>LPCTSTR</b>
     * 
     * Pointer to a constant null-terminated character string that specifies the name of the fax device of interest.
     * @type {PSTR}
     */
    DeviceName{
        get {
            if(!this.HasProp("__DeviceName"))
                this.__DeviceName := PSTR(this.ptr + 32)
            return this.__DeviceName
        }
    }

    /**
     * Type: <b>LPCTSTR</b>
     * 
     * Pointer to a constant null-terminated character string to associate with the fax document that the device is currently sending or receiving. This is the user-friendly name that appears in the print spooler.
     * @type {PSTR}
     */
    DocumentName{
        get {
            if(!this.HasProp("__DocumentName"))
                this.__DocumentName := PSTR(this.ptr + 40)
            return this.__DocumentName
        }
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * Specifies a <b>DWORD</b> variable that identifies the type of fax job that is currently active on the device. This member can be one of the following job types.
     * @type {Integer}
     */
    JobType {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * Type: <b>LPCTSTR</b>
     * 
     * If the <b>JobType</b> member is equal to the <b>JT_SEND</b> job type, <b>PhoneNumber</b> is a pointer to a constant null-terminated character string that is the fax number dialed for the outgoing fax transmission.
     * @type {PSTR}
     */
    PhoneNumber{
        get {
            if(!this.HasProp("__PhoneNumber"))
                this.__PhoneNumber := PSTR(this.ptr + 56)
            return this.__PhoneNumber
        }
    }

    /**
     * Type: <b>LPCTSTR</b>
     * 
     * If the <b>JobType</b> member is equal to the <b>JT_RECEIVE</b> job type, <b>RoutingString</b> is a pointer to a constant null-terminated character string that specifies the routing string for an incoming fax. The string must be of the form: 
     * 
     *                     
     * 
     * <c>Canonical-Phone-Number[|Additional-Routing-Info]</c>
     * 
     * where <c>Canonical-Phone-Number</code> is defined in the <a href="https://docs.microsoft.com/windows/desktop/Tapi/address-ovr">Address</a> topic of the TAPI documentation (see the Canonical Address subheading); and <code>Additional-Routing-Info</c> is the <i>subaddress</i> of a Canonical Address, and uses the subaddress format.
     * @type {PSTR}
     */
    RoutingString{
        get {
            if(!this.HasProp("__RoutingString"))
                this.__RoutingString := PSTR(this.ptr + 64)
            return this.__RoutingString
        }
    }

    /**
     * Type: <b>LPCTSTR</b>
     * 
     * Pointer to a constant null-terminated character string that specifies the name of the sender who initiated the fax transmission.
     * @type {PSTR}
     */
    SenderName{
        get {
            if(!this.HasProp("__SenderName"))
                this.__SenderName := PSTR(this.ptr + 72)
            return this.__SenderName
        }
    }

    /**
     * Type: <b>LPCTSTR</b>
     * 
     * Pointer to a constant null-terminated character string that specifies the name of the recipient of the fax transmission.
     * @type {PSTR}
     */
    RecipientName{
        get {
            if(!this.HasProp("__RecipientName"))
                this.__RecipientName := PSTR(this.ptr + 80)
            return this.__RecipientName
        }
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * Specifies a <b>DWORD</b> variable that indicates the size, in bytes, of the active fax document.
     * @type {Integer}
     */
    Size {
        get => NumGet(this, 88, "uint")
        set => NumPut("uint", value, this, 88)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a></b>
     * 
     * Specifies a <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure that contains the starting time of the current fax job expressed in UTC.
     * @type {FILETIME}
     */
    StartTime{
        get {
            if(!this.HasProp("__StartTime"))
                this.__StartTime := FILETIME(this.ptr + 96)
            return this.__StartTime
        }
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * Specifies a <b>DWORD</b> variable that is a fax device status code or value. This member can be one of the predefined device status codes shown following.
     * @type {Integer}
     */
    Status {
        get => NumGet(this, 104, "uint")
        set => NumPut("uint", value, this, 104)
    }

    /**
     * Type: <b>LPCTSTR</b>
     * 
     * This member must be <b>NULL</b>.
     * @type {PSTR}
     */
    StatusString{
        get {
            if(!this.HasProp("__StatusString"))
                this.__StatusString := PSTR(this.ptr + 112)
            return this.__StatusString
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a></b>
     * 
     * Specifies a <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure that contains the time the client submitted the fax document for transmission to the fax job queue. The time is expressed in UTC.
     * @type {FILETIME}
     */
    SubmittedTime{
        get {
            if(!this.HasProp("__SubmittedTime"))
                this.__SubmittedTime := FILETIME(this.ptr + 120)
            return this.__SubmittedTime
        }
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * Specifies a <b>DWORD</b> variable that indicates the total number of pages in the fax transmission.
     * @type {Integer}
     */
    TotalPages {
        get => NumGet(this, 128, "uint")
        set => NumPut("uint", value, this, 128)
    }

    /**
     * Type: <b>LPCTSTR</b>
     * 
     * Pointer to a constant null-terminated character string that specifies the transmitting station identifier (TSID). This identifier is usually a telephone number.
     * @type {PSTR}
     */
    Tsid{
        get {
            if(!this.HasProp("__Tsid"))
                this.__Tsid := PSTR(this.ptr + 136)
            return this.__Tsid
        }
    }

    /**
     * Type: <b>LPCTSTR</b>
     * 
     * Pointer to a constant null-terminated character string that specifies the name of the user who submitted the active fax job.
     * @type {PSTR}
     */
    UserName{
        get {
            if(!this.HasProp("__UserName"))
                this.__UserName := PSTR(this.ptr + 144)
            return this.__UserName
        }
    }
}
