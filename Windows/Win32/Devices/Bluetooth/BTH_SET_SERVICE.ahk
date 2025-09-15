#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Provides service information for the specified Bluetooth service.
 * @remarks
 * When using the 
  * <b>BTH_SET_SERVICE</b> structure to query services and devices using the 
  * <a href="https://docs.microsoft.com/windows/desktop/Bluetooth/bluetooth-and-wsasetservice">WSASetService</a> function and 
  * <a href="https://docs.microsoft.com/windows/desktop/Bluetooth/bluetooth-and-wsaqueryset-for-service-inquiry">WSAQUERYSET</a> and 
  * <a href="https://docs.microsoft.com/windows/desktop/Bluetooth/bluetooth-and-blob">BLOB</a> structures. The following values for 
  * <b>BTH_SET_SERVICE</b> members must be used.
  * 
  * For more information about class of device (COD), see the Bluetooth specification at 
  * <a href="https://www.bluetooth.com/">www.bluetooth.com</a>.<table>
  * <tr>
  * <th>Member</th>
  * <th>Required value</th>
  * </tr>
  * <tr>
  * <td><b>pSdpVersion</b></td>
  * <td>Pointer to ULONG version, which is changed whenever the binary format of SDP records change, affecting the format of the <b>pRecord</b> member. Set to <b>BTH_SDP_VERSION</b> for the client, and returned by the system.</td>
  * </tr>
  * <tr>
  * <td><b>pRecordHandle</b></td>
  * <td>Handle to the SDP record; corresponds to SDP ServiceRecordHandle. Returned by the add record operations, and subsequently used to delete the record.</td>
  * </tr>
  * <tr>
  * <td><b>fOptions</b></td>
  * <td>Attributes defined by <b>BTHNS_SET_FLAGS</b>.</td>
  * </tr>
  * <tr>
  * <td><b>ulRecordLength</b></td>
  * <td>Length, in bytes, of the binary SDP record pointed to by <b>pRecord</b>.</td>
  * </tr>
  * <tr>
  * <td><b>pRecord</b></td>
  * <td>Pointer to a valid SDP record, in the format defined by the Bluetooth specification.</td>
  * </tr>
  * </table>
  *  
  * 
  * 
  * 
  * The <b>pRecordHandle</b> member must point to data that is null for new service registration. For service deletion, <b>pRecordHandle</b> must point to a valid handle. The <b>pRecord</b> member must contain the entire SD service record, as described in the Bluetooth specification. For RFCOMM protocol entries, the port number is the same as the port returned by the 
  * <a href="https://docs.microsoft.com/windows/desktop/Bluetooth/bluetooth-and-getsockname">getsockname</a> function call.
  * 
  * Bluetooth implements a one-to-one correlation between SDP records and server sockets. As such, there is no need for the <b>SERVICE_MULTIPLE</b> flag.
 * @see https://learn.microsoft.com/windows/win32/api/ws2bth/ns-ws2bth-bth_set_service
 * @namespace Windows.Win32.Devices.Bluetooth
 * @version v4.0.30319
 */
class BTH_SET_SERVICE extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * Version of the SDP. Clients set this member to 
     * BTH_SDP_VERSION.
     * @type {Pointer<UInt32>}
     */
    pSdpVersion {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Handle to the SDP record. Corresponds to SDP ServiceRecordHandle. Returned by the add record operations, and subsequently used to delete the record.
     * @type {Pointer<HANDLE>}
     */
    pRecordHandle {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Class of device (COD) information. A 32-bit field of COD_SERVICE_* class of device bits associated with this SDP record. The system  combines these bits with COD bits from other service records and system characteristics.  The resulting class of device for the local radio is advertised when the radio is found during device inquiry. When the last SDP record associated with a particular service bit is deleted, that service bit is no longer reported in responses to future device inquiries.
     * 
     * The format and possible values for the COD field are defined in the <i>Bluetooth Assigned Numbers 1.1</i> portion of the Bluetooth specification, Section 1.2. (This resource may not be available in some languages and countries.) Corresponding macros and definitions for COD_SERVICE_* bits used by Windows are defined in Bthdef.h. For more information about class of device (COD), see <a href="https://docs.microsoft.com/windows/desktop/api/bthdef/ns-bthdef-bth_device_info">BTH_DEVICE_INFO</a>.
     * @type {Integer}
     */
    fCodService {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Reserved. Must be set to zero.
     * @type {Array<UInt32>}
     */
    Reserved{
        get {
            if(!this.HasProp("__ReservedProxyArray"))
                this.__ReservedProxyArray := Win32FixedArray(this.ptr + 20, 5, Primitive, "uint")
            return this.__ReservedProxyArray
        }
    }

    /**
     * Size, in bytes, of <b>pRecord</b>.
     * @type {Integer}
     */
    ulRecordLength {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * SDP record, as defined by the Bluetooth specification.
     * @type {Array<Byte>}
     */
    pRecord{
        get {
            if(!this.HasProp("__pRecordProxyArray"))
                this.__pRecordProxyArray := Win32FixedArray(this.ptr + 44, 1, Primitive, "char")
            return this.__pRecordProxyArray
        }
    }
}
