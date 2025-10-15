#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PSTR.ahk

/**
 * The FAX_PORT_INFO structure describes one fax port. The data includes, among other items, a device identifier, the port's name and current status, and station identifiers.
 * @remarks
 * 
  * A fax client application passes the <b>FAX_PORT_INFO</b> structure in a call to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winfax/nf-winfax-faxsetporta">FaxSetPort</a> function to modify the configuration of the fax port of interest.
  * 
  * If an application calls the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winfax/nf-winfax-faxenumportsa">FaxEnumPorts</a> function to enumerate all the fax devices currently attached to a fax server, the function returns an array of <b>FAX_PORT_INFO</b> structures. Each structure describes one device in detail. If an application calls the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winfax/nf-winfax-faxgetporta">FaxGetPort</a> function to query one device, that function returns information about the device in one <b>FAX_PORT_INFO</b> structure. For more information, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-fax-ports">Fax Ports</a> and <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-fax-device-management">Fax Device Management</a>.
  * 
  * 
  * 
  * 
  * 
  * > [!NOTE]
  * > The winfax.h header defines FAX_PORT_INFO as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//winfax/ns-winfax-fax_port_infoa
 * @namespace Windows.Win32.Devices.Fax
 * @version v4.0.30319
 * @charset ANSI
 */
class FAX_PORT_INFOA extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * Type: <b>DWORD</b>
     * 
     * Specifies the size, in bytes, of the <b>FAX_PORT_INFO</b> structure. The calling application should ensure that this member is set to <b>sizeof(FAX_PORT_INFO)</b> before it calls the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winfax/nf-winfax-faxsetporta">FaxSetPort</a> function.
     * @type {Integer}
     */
    SizeOfStruct {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * Specifies a <b>DWORD</b> variable that indicates the permanent line identifier for the fax device of interest.
     * @type {Integer}
     */
    DeviceId {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * Specifies a <b>DWORD</b> variable that is a fax device status code or value. This member can be one of the predefined device status codes shown following.
     * @type {Integer}
     */
    State {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Type: <b>DWORD</b>
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * Specifies a <b>DWORD</b> variable that indicates the number of times an incoming fax call should ring before the specified device answers the call. Possible values are from 0 to 99 inclusive. This value is ignored unless the <b>FPF_RECEIVE</b> port capability bit flag is set.
     * @type {Integer}
     */
    Rings {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * Specifies a <b>DWORD</b> variable that determines the relative order in which available fax devices send outgoing transmissions. Valid values for this member are 1 through <i>n</i>, where <i>n</i> is the value of the <i>PortsReturned</i> parameter returned by a call to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winfax/nf-winfax-faxenumportsa">FaxEnumPorts</a> function. 
     * 
     *                     
     * 
     * When the fax server initiates an outgoing fax transmission, it attempts to select the device with the highest priority and <b>FPF_SEND</b> port capability. If that device is not available, the server selects the next available device that follows in rank order, and so on. The value of the <b>Priority</b> member has no effect on incoming transmissions.
     * @type {Integer}
     */
    Priority {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
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
                this.__DeviceName := PSTR(this.ptr + 24)
            return this.__DeviceName
        }
    }

    /**
     * Type: <b>LPCTSTR</b>
     * 
     * Pointer to a constant null-terminated character string that specifies the TSID. This identifier is usually a telephone number. Only printable characters such as English letters, numeric symbols, and punctuation marks (ASCII range 0x20 to 0x7F) can be used in a TSID.
     * @type {PSTR}
     */
    Tsid{
        get {
            if(!this.HasProp("__Tsid"))
                this.__Tsid := PSTR(this.ptr + 32)
            return this.__Tsid
        }
    }

    /**
     * Type: <b>LPCTSTR</b>
     * 
     * Pointer to a constant null-terminated character string that specifies the called station identifier (CSID). This identifier is usually a telephone number. Only printable characters such as English letters, numeric symbols, and punctuation marks (ASCII range 0x20 to 0x7F) can be used in a CSID.
     * @type {PSTR}
     */
    Csid{
        get {
            if(!this.HasProp("__Csid"))
                this.__Csid := PSTR(this.ptr + 40)
            return this.__Csid
        }
    }
}
