#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * The FAX_ROUTE structure contains information about a received fax document. The fax service passes the structure to a fax routing method in a call to the FaxRouteMethod function.
 * @remarks
 * A fax routing method can call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxroute/nc-faxroute-pfaxroutemodifyroutingdata">FaxRouteModifyRoutingData</a> callback function to change the routing information for a subsequent routing method. The function does this by modifying the <b>RoutingInfoData</b> member of the <b>FAX_ROUTE</b> structure that applies to the subsequent method. This allows a fax routing extension to retrieve user-defined routing data and to provide additional callback information to a different routing method. When the subsequent routing method executes, it processes the received fax transmission using the modified routing data. For more information, see <b>FaxRouteModifyRoutingData</b>.
 * 
 * The fax routing method can use the <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-filetimetolocalfiletime">FileTimeToLocalFileTime</a> function, to convert from UTC to local time, and then use the <a href="https://docs.microsoft.com/windows/desktop/api/timezoneapi/nf-timezoneapi-filetimetosystemtime">FileTimeToSystemTime</a> function to convert the local time to a <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-systemtime">SYSTEMTIME</a> structure. SYSTEMTIME contains individual members for month, day, year, weekday, hour, minute, second, and millisecond. See MSDN for descriptions of these functions and this structure.
 * @see https://learn.microsoft.com/windows/win32/api/faxroute/ns-faxroute-fax_route
 * @namespace Windows.Win32.Devices.Fax
 */
export default struct FAX_ROUTE {
    #StructPack 8

    /**
     * Type: <b>DWORD</b>
     * 
     * Specifies, in bytes, the size of the <b>FAX_ROUTE</b> structure. Before calling the <a href="https://docs.microsoft.com/windows/desktop/api/faxroute/nc-faxroute-pfaxroutemethod">FaxRouteMethod</a> function, the fax service sets this member to sizeof(FAX_ROUTE).
     */
    SizeOfStruct : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * Specifies a unique number that identifies the fax job that received the fax document.
     */
    JobId : UInt32

    /**
     * Type: <b>DWORDLONG</b>
     * 
     * Specifies a 64-bit unsigned integer that is the elapsed time, in UTC, for the fax job that received the fax document. This parameter represents the total time that elapses between the beginning of fax reception and the end of fax reception.
     */
    ElapsedTime : Int64

    /**
     * Type: <b>DWORDLONG</b>
     * 
     * Specifies a 64-bit unsigned integer that is the starting time, in UTC, for the fax job that received the fax document.
     */
    ReceiveTime : Int64

    /**
     * Type: <b>DWORD</b>
     * 
     * Specifies the number of pages in the received fax document.
     */
    PageCount : UInt32

    /**
     * Type: <b>LPCWSTR</b>
     * 
     * Pointer to a constant null-terminated Unicode character string that specifies the called station identifier of the local fax device that received the fax document. This identifier is usually a telephone number.
     */
    Csid : PWSTR

    /**
     * Type: <b>LPCWSTR</b>
     * 
     * Pointer to a constant null-terminated Unicode character string that specifies the transmitting station identifier of the remote fax device that sent the fax document. This identifier is usually a telephone number.
     */
    Tsid : PWSTR

    /**
     * Type: <b>LPCWSTR</b>
     * 
     * Pointer to a constant null-terminated Unicode character string that identifies the calling device that sent the fax document. This string may include the telephone number of the calling device.
     */
    CallerId : PWSTR

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
     */
    RoutingInfo : PWSTR

    /**
     * Type: <b>LPCWSTR</b>
     * 
     * Pointer to a constant null-terminated Unicode character string that specifies the name of the person who received the fax document.
     */
    ReceiverName : PWSTR

    /**
     * Type: <b>LPCWSTR</b>
     * 
     * Pointer to a constant null-terminated Unicode character string that specifies the telephone number of the fax device that received the fax document.
     */
    ReceiverNumber : PWSTR

    /**
     * Type: <b>LPCWSTR</b>
     * 
     * Pointer to a constant null-terminated Unicode character string that specifies the name of the device that received the fax document.
     */
    DeviceName : PWSTR

    /**
     * Type: <b>DWORD</b>
     * 
     * Specifies the permanent line identifier for the receiving fax device.
     */
    DeviceId : UInt32

    /**
     * Type: <b>LPBYTE</b>
     * 
     * Pointer to a buffer that contains additional routing data defined by the routing extension. For more information, see the following Remarks section.
     */
    RoutingInfoData : IntPtr

    /**
     * Type: <b>DWORD</b>
     * 
     * Specifies the size, in bytes, of the array pointed to by the <b>RoutingInfoData</b> member.
     */
    RoutingInfoDataSize : UInt32

}
