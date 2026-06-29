#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\FILETIME.ahk" { FILETIME }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * The FAX_DEVICE_STATUS structure contains information about the current status of a fax device. (ANSI)
 * @remarks
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
 * @see https://learn.microsoft.com/windows/win32/api/winfax/ns-winfax-fax_device_statusa
 * @namespace Windows.Win32.Devices.Fax
 * @charset ANSI
 */
export default struct FAX_DEVICE_STATUSA {
    #StructPack 8

    /**
     * Type: <b>DWORD</b>
     * 
     * Specifies the size, in bytes, of the <b>FAX_DEVICE_STATUS</b> structure. The fax service sets this member to <b>sizeof(FAX_DEVICE_STATUS)</b>.
     */
    SizeOfStruct : UInt32

    /**
     * Type: <b>LPCTSTR</b>
     * 
     * If the <b>JobType</b> member is equal to the <b>JT_RECEIVE</b> job type, <b>CallerId</b> is a pointer to a null-terminated character string that identifies the calling device that sent the active fax document. This string can include the telephone number of the calling device.
     */
    CallerId : PSTR

    /**
     * Type: <b>LPCTSTR</b>
     * 
     * Pointer to a constant null-terminated character string that specifies the called station identifier of the device.
     */
    Csid : PSTR

    /**
     * Type: <b>DWORD</b>
     * 
     * Specifies a <b>DWORD</b> variable that indicates the number of the page in the fax transmission that the fax device is currently sending or receiving. The page count is relative to one.
     */
    CurrentPage : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * Specifies a <b>DWORD</b> variable that indicates the permanent line identifier for the fax device of interest.
     */
    DeviceId : UInt32

    /**
     * Type: <b>LPCTSTR</b>
     * 
     * Pointer to a constant null-terminated character string that specifies the name of the fax device of interest.
     */
    DeviceName : PSTR

    /**
     * Type: <b>LPCTSTR</b>
     * 
     * Pointer to a constant null-terminated character string to associate with the fax document that the device is currently sending or receiving. This is the user-friendly name that appears in the print spooler.
     */
    DocumentName : PSTR

    /**
     * Type: <b>DWORD</b>
     * 
     * Specifies a <b>DWORD</b> variable that identifies the type of fax job that is currently active on the device. This member can be one of the following job types.
     */
    JobType : UInt32

    /**
     * Type: <b>LPCTSTR</b>
     * 
     * If the <b>JobType</b> member is equal to the <b>JT_SEND</b> job type, <b>PhoneNumber</b> is a pointer to a constant null-terminated character string that is the fax number dialed for the outgoing fax transmission.
     */
    PhoneNumber : PSTR

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
     */
    RoutingString : PSTR

    /**
     * Type: <b>LPCTSTR</b>
     * 
     * Pointer to a constant null-terminated character string that specifies the name of the sender who initiated the fax transmission.
     */
    SenderName : PSTR

    /**
     * Type: <b>LPCTSTR</b>
     * 
     * Pointer to a constant null-terminated character string that specifies the name of the recipient of the fax transmission.
     */
    RecipientName : PSTR

    /**
     * Type: <b>DWORD</b>
     * 
     * Specifies a <b>DWORD</b> variable that indicates the size, in bytes, of the active fax document.
     */
    Size : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a></b>
     * 
     * Specifies a <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure that contains the starting time of the current fax job expressed in UTC.
     */
    StartTime : FILETIME

    /**
     * Type: <b>DWORD</b>
     * 
     * Specifies a <b>DWORD</b> variable that is a fax device status code or value. This member can be one of the predefined device status codes shown following.
     */
    Status : UInt32

    /**
     * Type: <b>LPCTSTR</b>
     * 
     * This member must be <b>NULL</b>.
     */
    StatusString : PSTR

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a></b>
     * 
     * Specifies a <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure that contains the time the client submitted the fax document for transmission to the fax job queue. The time is expressed in UTC.
     */
    SubmittedTime : FILETIME

    /**
     * Type: <b>DWORD</b>
     * 
     * Specifies a <b>DWORD</b> variable that indicates the total number of pages in the fax transmission.
     */
    TotalPages : UInt32

    /**
     * Type: <b>LPCTSTR</b>
     * 
     * Pointer to a constant null-terminated character string that specifies the transmitting station identifier (TSID). This identifier is usually a telephone number.
     */
    Tsid : PSTR

    /**
     * Type: <b>LPCTSTR</b>
     * 
     * Pointer to a constant null-terminated character string that specifies the name of the user who submitted the active fax job.
     */
    UserName : PSTR

}
