#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The FAX_RECEIVE structure contains information about an inbound fax document. This information includes the name of the file that will receive the fax data stream, and the name and telephone number of the receiving device.
 * @remarks
 * The FSP must set the <b>ReceiverName</b> and <b>ReceiverNumber</b> members in this structure. The fax service allocates the memory for these strings. The size of the memory the service allocates is equal to <b>sizeof</b>(<b>FAX_RECEIVE</b>) + <b>FAXDEVRECEIVE_SIZE</b>. The FSP must place the strings in the block of memory that follows the <b>FAX_RECEIVE</b> structure. Note that you must allow for the size of the <b>FileName</b> string that follows immediately after the <b>FAX_RECEIVE</b> structure. The <b>ReceiverName</b> and <b>ReceiverNumber</b> members must point to the location of the strings in the memory block. 
  * 
  * The following code sample and diagram illustrate how to fill in the memory that the fax service allocates.
  * 
  * 
  * ```
  * PWSTR ReceiverName;
  * PWSTR ReceiverNumber;
  * 
  * //
  * // Routine to retrieve the receiver name
  * //   and receiver number here.
  * 
  * //
  * // Set the receiver name and receiver number data
  * //  in the FAX_RECEIVE structure; then
  * //  copy the data to the appropriate offset.
  * //
  * FaxReceive->ReceiverNumber = (LPWSTR) ( (LPBYTE)FaxReceive->FileName + sizeof(WCHAR)*(wcslen(FaxReceive->FileName) + 1));
  * wcscpy_s(  FaxReceive->ReceiverNumber, ReceiverNumber );
  * 
  * FaxReceive->ReceiverName = (LPWSTR) ( (LPBYTE)FaxReceive->ReceiverNumber+ sizeof(WCHAR)*(wcslen(FaxReceive->ReceiverNumber) + 1));
  * wcscpy_s(  FaxReceive->ReceiverName, ReceiverName );
  * 
  * ```
  * 
  * 
  * <img alt="Filling in the memory that the fax service allocates" src="images/faxover.png"/>
  * The FSP can reformat the <b>ReceiverName</b> and <b>ReceiverNumber</b> members and transmit the reformatted data to the remote sending device as the called subscriber identifier (CSI) to comply with the recommendation of the standards body of the International Telecommunication Union (ITU) from Study Group 8 (SG8). For more information, see the <b>RoutingInfo</b> and <b>CSI</b> members of the <a href="https://docs.microsoft.com/windows/desktop/api/faxdev/ns-faxdev-fax_dev_status">FAX_DEV_STATUS</a> structure.
 * @see https://learn.microsoft.com/windows/win32/api/faxdev/ns-faxdev-fax_receive
 * @namespace Windows.Win32.Devices.Fax
 * @version v4.0.30319
 */
class FAX_RECEIVE extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * Type: <b>DWORD</b>
     * 
     * Specifies the size, in bytes, of the <b>FAX_RECEIVE</b> structure. Before calling the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxdev/nf-faxdev-faxdevreceive">FaxDevReceive</a> function, the fax service sets this member to <b>sizeof</b>(<b>FAX_RECEIVE</b>). For more information, see the following Remarks section.
     * @type {Integer}
     */
    SizeOfStruct {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b>LPWSTR</b>
     * 
     * Pointer to a null-terminated Unicode character string that specifies the full path to the file in which the FSP must store the data stream of an inbound fax document. The data stream is a TIFF Class F file. For more information, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-fax-image-format">Fax Image Format</a>. The fax service creates the file before it calls the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxdev/nf-faxdev-faxdevreceive">FaxDevReceive</a> function. The FSP must specify the OPEN_EXISTING flag when opening this file.
     * @type {Pointer<Ptr>}
     */
    FileName {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Type: <b>LPWSTR</b>
     * 
     * Pointer to a null-terminated Unicode character string that specifies the name of the receiving device. The FSP will send the name to the remote sending device after the receiving device receives an inbound fax. For more information, see the following Remarks section.
     * @type {Pointer<Ptr>}
     */
    ReceiverName {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Type: <b>LPWSTR</b>
     * 
     * Pointer to a null-terminated Unicode character string that specifies the telephone number of the receiving device. The FSP will send the number to the remote sending device after the receiving device receives an inbound fax. For more information, see the following Remarks section.
     * @type {Pointer<Ptr>}
     */
    ReceiverNumber {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * This member is reserved for future use by Microsoft. It must be set to zero.
     * @type {Array<UInt32>}
     */
    Reserved{
        get {
            if(!this.HasProp("__ReservedProxyArray"))
                this.__ReservedProxyArray := Win32FixedArray(this.ptr + 32, 4, Primitive, "uint")
            return this.__ReservedProxyArray
        }
    }
}
