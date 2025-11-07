#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains raw data in the form of a blob that is used by some Native Wifi functions.
 * @remarks
 * 
 * The <b>WLAN_RAW_DATA</b> structure is a raw data structure used to hold a data entry used by some Native Wifi functions. The data structure is in the form of a generalized blob that can contain any type of data.
 * 
 * The <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlanscan">WlanScan</a> function uses the  <b>WLAN_RAW_DATA</b> structure. The  <i>pIeData</i> parameter passed to the <b>WlanScan</b> function points to a  <b>WLAN_RAW_DATA</b> structure currently used to contain an information element to include in probe requests. This <b>WLAN_RAW_DATA</b> structure passed to the <b>WlanScan</b> function can contain a proximity service discovery (PSD) information element (IE) data entry.   
 * 
 * When the <b>WLAN_RAW_DATA</b> structure is used to store a PSD IE, the <b>DOT11_PSD_IE_MAX_DATA_SIZE</b> constant defined in the <i>Wlanapi.h</i> header file is the maximum value of the <b>dwDataSize</b> member.<table>
 * <tr>
 * <th>Constant</th>
 * <th>Value</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td><b>DOT11_PSD_IE_MAX_DATA_SIZE</b></td>
 * <td>240</td>
 * <td>The maximum data size, in bytes, of a PSD IE data entry.</td>
 * </tr>
 * </table>
 *  
 * 
 * 
 * 
 * For more information about PSD IEs, including a discussion of the format of an IE, see the  <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlansetpsdiedatalist">WlanSetPsdIEDataList</a> function.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//wlanapi/ns-wlanapi-wlan_raw_data
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class WLAN_RAW_DATA extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * The size, in bytes, of the <b>DataBlob</b> member. The maximum value of the <b>dwDataSize</b> may be restricted by type of data that is stored in the <b>WLAN_RAW_DATA</b> structure.
     * @type {Integer}
     */
    dwDataSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The data blob.
     * @type {Array<Byte>}
     */
    DataBlob{
        get {
            if(!this.HasProp("__DataBlobProxyArray"))
                this.__DataBlobProxyArray := Win32FixedArray(this.ptr + 4, 1, Primitive, "char")
            return this.__DataBlobProxyArray
        }
    }
}
