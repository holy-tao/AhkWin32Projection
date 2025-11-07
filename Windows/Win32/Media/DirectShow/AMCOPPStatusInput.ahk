#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The AMCOPPStatusInput structure contains a Certified Output Protection Protocol (COPP) status request.
 * @remarks
 * 
 * The following COPP status requests are defined.
 * 
 * <table>
 * <tr>
 * <th><b>GUID</b></th>
 * <th>Description
 *             </th>
 * </tr>
 * <tr>
 * <td><b>DXVA_COPPQueryConnectorType</b></td>
 * <td>Returns the type of physical connector to the output device.</td>
 * </tr>
 * <tr>
 * <td><b>DXVA_COPPQueryProtectionType</b></td>
 * <td>Returns the available protection mechanisms for the physical connector.</td>
 * </tr>
 * <tr>
 * <td><b>DXVA_COPPQueryLocalProtectionLevel</b></td>
 * <td>Returns the protection level that is currently set through the COPP mechanism in the context of this session.</td>
 * </tr>
 * <tr>
 * <td><b>DXVA_COPPQueryGlobalProtectionLevel</b></td>
 * <td>Returns the actual protection level that is currently set for the physical connector.</td>
 * </tr>
 * <tr>
 * <td><b>DXVA_COPPQueryDisplayData</b></td>
 * <td>Returns information describing the signal that is being transmitted over the connector associated with the COPP device.</td>
 * </tr>
 * <tr>
 * <td><b>DXVA_COPPQueryHDCPKeyData</b></td>
 * <td>Returns the High-bandwidth Digital Content Protection (HDCP) characteristics of the output device.</td>
 * </tr>
 * <tr>
 * <td><b>DXVA_COPPQueryBusData</b></td>
 * <td>Returns information about the type of bus used by the graphics hardware associated with this COPP device.</td>
 * </tr>
 * </table>
 *  
 * 
 * For more information, see the Windows DDK documentation.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//strmif/ns-strmif-amcoppstatusinput
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class AMCOPPStatusInput extends Win32Struct
{
    static sizeof => 4080

    static packingSize => 8

    /**
     * 128-bit random number.
     * @type {Pointer<Guid>}
     */
    rApp {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * GUID that defines the status request.
     * @type {Pointer<Guid>}
     */
    guidStatusRequestID {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Sequence number. The application must keep a running count of the COPP status requests issued. For each request, increment the sequence number by one.
     * @type {Integer}
     */
    dwSequence {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Number of bytes of valid data in the <b>StatusData</b> member.
     * @type {Integer}
     */
    cbSizeData {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * Data for the status request. The meaning of the data depends on the request.
     * @type {Array<Byte>}
     */
    StatusData{
        get {
            if(!this.HasProp("__StatusDataProxyArray"))
                this.__StatusDataProxyArray := Win32FixedArray(this.ptr + 24, 4056, Primitive, "char")
            return this.__StatusDataProxyArray
        }
    }
}
