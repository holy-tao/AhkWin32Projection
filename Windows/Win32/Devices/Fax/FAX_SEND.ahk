#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * The FAX_SEND structure contains information about an outbound fax document.
 * @remarks
 * The FSP can reformat the <b>CallerName</b> and <b>CallerNumber</b> members. The FSP can then transmit the reformatted data to the remote sending device as the called subscriber identifier (CSI) to comply with the recommendation of the standards body of the International Telecommunication Union (ITU) from Study Group 8 (SG8). For more information, see the <b>RoutingInfo</b> and <b>CSI</b> members of the <a href="https://docs.microsoft.com/windows/desktop/api/faxdev/ns-faxdev-fax_dev_status">FAX_DEV_STATUS</a> structure.
  * 
  * The FSP can also use the reformatted data to add a brand to the fax transmission.
 * @see https://learn.microsoft.com/windows/win32/api/faxdev/ns-faxdev-fax_send
 * @namespace Windows.Win32.Devices.Fax
 * @version v4.0.30319
 */
class FAX_SEND extends Win32Struct
{
    static sizeof => 72

    static packingSize => 8

    /**
     * Type: <b>DWORD</b>
     * 
     * Specifies, in bytes, the size of the <b>FAX_SEND</b> structure. Before calling the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/faxdev/nf-faxdev-faxdevsend">FaxDevSend</a> function, the fax service sets this member to <b>sizeof</b>(<b>FAX_SEND</b>).
     * @type {Integer}
     */
    SizeOfStruct {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b>LPWSTR</b>
     * 
     * Pointer to a null-terminated Unicode character string that specifies the full path to the file that contains the data stream for an outbound fax document. The data stream is a TIFF Class F file. For more information, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-fax-image-format">Fax Image Format</a>.
     * @type {PWSTR}
     */
    FileName{
        get {
            if(!this.HasProp("__FileName"))
                this.__FileName := PWSTR(this.ptr + 8)
            return this.__FileName
        }
    }

    /**
     * Type: <b>LPWSTR</b>
     * 
     * Pointer to a null-terminated Unicode character string that specifies the name of the calling device. The FSP will send this name to the remote receiving device when the FSP sends the fax. For more information, see the following Remarks section.
     * @type {PWSTR}
     */
    CallerName{
        get {
            if(!this.HasProp("__CallerName"))
                this.__CallerName := PWSTR(this.ptr + 16)
            return this.__CallerName
        }
    }

    /**
     * Type: <b>LPWSTR</b>
     * 
     * Pointer to a null-terminated Unicode character string that specifies the telephone number of the calling device. (This number is also the TSID.) The FSP will send this number to the remote receiving device when the FSP sends the fax. For more information, see the following Remarks section.
     * @type {PWSTR}
     */
    CallerNumber{
        get {
            if(!this.HasProp("__CallerNumber"))
                this.__CallerNumber := PWSTR(this.ptr + 24)
            return this.__CallerNumber
        }
    }

    /**
     * Type: <b>LPWSTR</b>
     * 
     * Pointer to a null-terminated Unicode character string that specifies the name of the device that will receive the outbound fax document.
     * @type {PWSTR}
     */
    ReceiverName{
        get {
            if(!this.HasProp("__ReceiverName"))
                this.__ReceiverName := PWSTR(this.ptr + 32)
            return this.__ReceiverName
        }
    }

    /**
     * Type: <b>LPWSTR</b>
     * 
     * Pointer to a null-terminated Unicode character string that specifies the telephone number of the device that will receive the outbound fax document. This is the telephone number that the FSP will dial.
     * 
     * If you specify the <b>CallHandle</b> member, the <b>ReceiverNumber</b> member must be <b>NULL</b>.
     * @type {PWSTR}
     */
    ReceiverNumber{
        get {
            if(!this.HasProp("__ReceiverNumber"))
                this.__ReceiverNumber := PWSTR(this.ptr + 40)
            return this.__ReceiverNumber
        }
    }

    /**
     * Type: <b>BOOL</b>
     * 
     * Reserved.
     * @type {Integer}
     */
    Branding {
        get => NumGet(this, 48, "int")
        set => NumPut("int", value, this, 48)
    }

    /**
     * Type: <b>HCALL</b>
     * 
     * Reserved; must be set to <b>NULL</b>.
     * @type {Integer}
     */
    CallHandle {
        get => NumGet(this, 52, "uint")
        set => NumPut("uint", value, this, 52)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * This member is reserved  by Microsoft. It must be set to zero.
     * @type {Array<UInt32>}
     */
    Reserved{
        get {
            if(!this.HasProp("__ReservedProxyArray"))
                this.__ReservedProxyArray := Win32FixedArray(this.ptr + 56, 4, Primitive, "uint")
            return this.__ReservedProxyArray
        }
    }
}
