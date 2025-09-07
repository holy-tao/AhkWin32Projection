#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains raw data in the form of an array of data blobs that are used by some Native Wifi functions.
 * @remarks
 * The <b>WLAN_RAW_DATA_LIST</b> structure is used to encapsulate a list of data blobs into a flat memory block. It should be interpreted as a list of headers followed by data blobs.
  * 
  * To create 	a <b>WLAN_RAW_DATA_LIST</b>, an application needs to allocate a memory block that is large enough to hold the headers and the data blobs, and then cast the memory block to a pointer to a  <b>WLAN_RAW_DATA_LIST</b> structure.
  * 
  * The following is the memory layout of an example <b>WLAN_RAW_DATA_LIST</b> structure that contains two data blobs.
  * 
  * <table>
  * <tr>
  * <td>Memory Offset</td>
  * <td>Field</td>
  * <td>Value</td>
  * <td>Comments</td>
  * </tr>
  * <tr>
  * <td>0</td>
  * <td>dwTotalSize</td>
  * <td>84</td>
  * <td></td>
  * </tr>
  * <tr>
  * <td>4</td>
  * <td>dwNumberOfItems</td>
  * <td> 2</td>
  * <td></td>
  * </tr>
  * <tr>
  * <td>8</td>
  * <td>dwDataOffset</td>
  * <td>16</td>
  * <td>Offset of the first blob: 16 = 24 - 8</td>
  * </tr>
  * <tr>
  * <td>12</td>
  * <td>dwDataSize</td>
  * <td>20</td>
  * <td>Size of the first blob.</td>
  * </tr>
  * <tr>
  * <td>16</td>
  * <td>dwDataOffset</td>
  * <td>28</td>
  * <td>Offset of the second blob: 44 - 16. </td>
  * </tr>
  * <tr>
  * <td>20</td>
  * <td>dwDataSize</td>
  * <td>24</td>
  * <td>Size of the second blob.</td>
  * </tr>
  * <tr>
  * <td>24</td>
  * <td></td>
  * <td>20</td>
  * <td>Start of the first blob. </td>
  * </tr>
  * <tr>
  * <td>44</td>
  * <td></td>
  * <td>40</td>
  * <td>Start of the second blob. </td>
  * </tr>
  * </table>
  *  
  * 
  * The <b>WLAN_RAW_DATA_LIST</b> structure is currently used by the <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlansetpsdiedatalist">WlanSetPsdIEDataList</a> function to set the proximity service discovery (PSD) information element (IE) data list for an application. 
  * 
  * When used to store a PSD IE data list, the <b>DOT11_PSD_IE_MAX_ENTRY_NUMBER</b> constant defined in the <i>Wlanapi.h</i> header file is the maximum value of the <b>dwNumberOfItems</b> member for the number of blobs in the <b>WLAN_RAW_DATA_LIST</b> structure. The <b>DOT11_PSD_IE_MAX_DATA_SIZE</b> constant defined in the <i>Wlanapi.h</i> header file is the maximum value of the <b>dwDataSize</b> member for any blob.<table>
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
  * <tr>
  * <td><b>DOT11_PSD_IE_MAX_ENTRY_NUMBER</b></td>
  * <td>5</td>
  * <td>The maximum number of PSD IE data entries.</td>
  * </tr>
  * </table>
  *  
  * 
  * 
  * 
  * For more information about PSD IEs, including a discussion of the format of an IE, see <a href="https://docs.microsoft.com/windows/desktop/api/wlanapi/nf-wlanapi-wlansetpsdiedatalist">WlanSetPsdIEDataList</a>.
 * @see https://learn.microsoft.com/windows/win32/api/wlanapi/ns-wlanapi-wlan_raw_data_list
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class WLAN_RAW_DATA_LIST extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The total size, in bytes, of the <b>WLAN_RAW_DATA_LIST</b> structure.
     * @type {Integer}
     */
    dwTotalSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The number of raw data entries or blobs in the <b>WLAN_RAW_DATA_LIST</b> structure. The maximum value of the <b>dwNumberOfItems</b> may be restricted by the type of data that is stored in the <b>WLAN_RAW_DATA_LIST</b> structure.
     * @type {Integer}
     */
    dwNumberOfItems {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    dwDataOffset {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    dwDataSize {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }
}
