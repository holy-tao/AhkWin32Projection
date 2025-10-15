#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * The FAX_ROUTE structure contains information about a received fax document. The fax service passes the structure to a fax routing method in a call to the FaxRouteMethod function.
 * @remarks
 * 
  * A fax routing method can call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxroute/nc-faxroute-pfaxroutemodifyroutingdata">FaxRouteModifyRoutingData</a> callback function to change the routing information for a subsequent routing method. The function does this by modifying the <b>RoutingInfoData</b> member of the <b>FAX_ROUTE</b> structure that applies to the subsequent method. This allows a fax routing extension to retrieve user-defined routing data and to provide additional callback information to a different routing method. When the subsequent routing method executes, it processes the received fax transmission using the modified routing data. For more information, see <b>FaxRouteModifyRoutingData</b>.
  * 
  * The fax routing method can use the <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-filetimetolocalfiletime">FileTimeToLocalFileTime</a> function, to convert from UTC to local time, and then use the <a href="https://docs.microsoft.com/windows/desktop/api/timezoneapi/nf-timezoneapi-filetimetosystemtime">FileTimeToSystemTime</a> function to convert the local time to a <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-systemtime">SYSTEMTIME</a> structure. SYSTEMTIME contains individual members for month, day, year, weekday, hour, minute, second, and millisecond. See MSDN for descriptions of these functions and this structure.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//faxroute/ns-faxroute-fax_route
 * @namespace Windows.Win32.Devices.Fax
 * @version v4.0.30319
 */
class FAX_ROUTE extends Win32Struct
{
    static sizeof => 112

    static packingSize => 8

    /**
     * Type: <b>DWORD</b>
     * 
     * Specifies, in bytes, the size of the <b>FAX_ROUTE</b> structure. Before calling the <a href="https://docs.microsoft.com/windows/desktop/api/faxroute/nc-faxroute-pfaxroutemethod">FaxRouteMethod</a> function, the fax service sets this member to sizeof(FAX_ROUTE).
     * @type {Integer}
     */
    SizeOfStruct {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * Specifies a unique number that identifies the fax job that received the fax document.
     * @type {Integer}
     */
    JobId {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Type: <b>DWORDLONG</b>
     * 
     * Specifies a 64-bit unsigned integer that is the elapsed time, in UTC, for the fax job that received the fax document. This parameter represents the total time that elapses between the beginning of fax reception and the end of fax reception.
     * @type {Integer}
     */
    ElapsedTime {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Type: <b>DWORDLONG</b>
     * 
     * Specifies a 64-bit unsigned integer that is the starting time, in UTC, for the fax job that received the fax document.
     * @type {Integer}
     */
    ReceiveTime {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * Specifies the number of pages in the received fax document.
     * @type {Integer}
     */
    PageCount {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Type: <b>LPCWSTR</b>
     * 
     * Pointer to a constant null-terminated Unicode character string that specifies the called station identifier of the local fax device that received the fax document. This identifier is usually a telephone number.
     * @type {PWSTR}
     */
    Csid{
        get {
            if(!this.HasProp("__Csid"))
                this.__Csid := PWSTR(this.ptr + 32)
            return this.__Csid
        }
    }

    /**
     * Type: <b>LPCWSTR</b>
     * 
     * Pointer to a constant null-terminated Unicode character string that specifies the transmitting station identifier of the remote fax device that sent the fax document. This identifier is usually a telephone number.
     * @type {PWSTR}
     */
    Tsid{
        get {
            if(!this.HasProp("__Tsid"))
                this.__Tsid := PWSTR(this.ptr + 40)
            return this.__Tsid
        }
    }

    /**
     * Type: <b>LPCWSTR</b>
     * 
     * Pointer to a constant null-terminated Unicode character string that identifies the calling device that sent the fax document. This string may include the telephone number of the calling device.
     * @type {PWSTR}
     */
    CallerId{
        get {
            if(!this.HasProp("__CallerId"))
                this.__CallerId := PWSTR(this.ptr + 48)
            return this.__CallerId
        }
    }

    /**
     * Type: <b>LPCWSTR</b>
     * 
     * Pointer to a constant null-terminated Unicode character string that specifies the routing string for the received fax document. The string must be of the form: 
     * 
     *                     
     * 
     * <c>Canonical-Phone-Number[|Additional-Routing-Info]</c>
     * 
     * where <c>Canonical-Phone-Number</code> is defined in the <a href="https://docs.microsoft.com/windows/desktop/Tapi/address-ovr">Address</a> topic of the TAPI documentation (see the Canonical Address subheading); and <code>Additional-Routing-Info</c> is the <i>subaddress</i> of a Canonical Address, and uses the subaddress format.
     * @type {PWSTR}
     */
    RoutingInfo{
        get {
            if(!this.HasProp("__RoutingInfo"))
                this.__RoutingInfo := PWSTR(this.ptr + 56)
            return this.__RoutingInfo
        }
    }

    /**
     * Type: <b>LPCWSTR</b>
     * 
     * Pointer to a constant null-terminated Unicode character string that specifies the name of the person who received the fax document.
     * @type {PWSTR}
     */
    ReceiverName{
        get {
            if(!this.HasProp("__ReceiverName"))
                this.__ReceiverName := PWSTR(this.ptr + 64)
            return this.__ReceiverName
        }
    }

    /**
     * Type: <b>LPCWSTR</b>
     * 
     * Pointer to a constant null-terminated Unicode character string that specifies the telephone number of the fax device that received the fax document.
     * @type {PWSTR}
     */
    ReceiverNumber{
        get {
            if(!this.HasProp("__ReceiverNumber"))
                this.__ReceiverNumber := PWSTR(this.ptr + 72)
            return this.__ReceiverNumber
        }
    }

    /**
     * Type: <b>LPCWSTR</b>
     * 
     * Pointer to a constant null-terminated Unicode character string that specifies the name of the device that received the fax document.
     * @type {PWSTR}
     */
    DeviceName{
        get {
            if(!this.HasProp("__DeviceName"))
                this.__DeviceName := PWSTR(this.ptr + 80)
            return this.__DeviceName
        }
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * Specifies the permanent line identifier for the receiving fax device.
     * @type {Integer}
     */
    DeviceId {
        get => NumGet(this, 88, "uint")
        set => NumPut("uint", value, this, 88)
    }

    /**
     * Type: <b>LPBYTE</b>
     * 
     * Pointer to a buffer that contains additional routing data defined by the routing extension. For more information, see the following Remarks section.
     * @type {Pointer<Byte>}
     */
    RoutingInfoData {
        get => NumGet(this, 96, "ptr")
        set => NumPut("ptr", value, this, 96)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * Specifies the size, in bytes, of the array pointed to by the <b>RoutingInfoData</b> member.
     * @type {Integer}
     */
    RoutingInfoDataSize {
        get => NumGet(this, 104, "uint")
        set => NumPut("uint", value, this, 104)
    }
}
