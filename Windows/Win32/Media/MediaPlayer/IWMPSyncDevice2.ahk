#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IWMPSyncDevice.ahk

/**
 * The IWMPSyncDevice2 interface provides a method that supplements the IWMPSyncDevice interface.To use this interface, you must create a remoted instance of the Windows Media Player 10 or later control.
 * @see https://learn.microsoft.com/windows/win32/api/wmp/nn-wmp-iwmpsyncdevice2
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class IWMPSyncDevice2 extends IWMPSyncDevice{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMPSyncDevice2
     * @type {Guid}
     */
    static IID => Guid("{88afb4b2-140a-44d2-91e6-4543da467cd1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 19

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["setItemInfo"]

    /**
     * The setItemInfo method specifies an attribute value for a device.
     * @remarks
     * The following table lists the supported attributes.
     * 
     * <table>
     * <tr>
     * <th>Attribute
     *             </th>
     * <th>Description
     *             </th>
     * </tr>
     * <tr>
     * <td>AutoSyncDefaultRules</td>
     * <td>
     * Specifies whether automatic synchronization is done according to default rules or custom rules. A value of "true" specifies default rules, and a value of "false" specifies custom rules.
     * 
     * Use of this attribute is permitted only for devices with which Windows Media Player has a partnership.
     * 
     * Requires Windows Media Player 12.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>BackgroundSyncState</td>
     * <td>
     * Specifies whether Windows Media Player is allowed to perform background operations for the device.
     * 
     * The value can be a string (<b>BSTR</b>) representation of a bitwise combination of one or more of the following flags.
     * 
     * <ul>
     * <li>1 Allow background synchronization.</li>
     * <li>2 Allow background transcoding.</li>
     * </ul>
     * The value can also be one of the following strings.
     * 
     * <ul>
     * <li>"0" No background operations are allowed.</li>
     * <li>"255" Allow all background operations.</li>
     * </ul>
     * The value of this attribute lasts for the lifetime of Windows Media Player, but is not stored in the Windows Media Player library.
     * 
     * Use of this attribute is permitted only for devices with which Windows Media Player has a partnership.
     * 
     * Requires Windows Media Player 12.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>IncludeSkippedFiles</td>
     * <td>
     * When the user deletes files from the device, Windows Media Player marks those files as skipped and does not include them in future synchronization operations. Setting this attribute instructs Windows Media Player to include skipped files in the next synchronization.
     * 
     * Set the value of this attribute to the empty <b>BSTR</b>.
     * 
     * Use of this attribute is permitted only for devices with which Windows Media Player has a partnership.
     * 
     * Requires Windows Media Player 12.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>PercentSpaceReserved</td>
     * <td>
     * Limits the amount of device storage that Windows Media Player uses for file synchronization by specifying a portion of the storage as reserved. The value is a numeric percentage of total storage on the device represented by a string (<b>BSTR</b>). Supported values range from "0" to "95".
     * 
     * Use of this attribute is permitted only for devices with which Windows Media Player has a partnership.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>SyncFilter</td>
     * <td>
     * Specifies the types of files that will be synchronized during the next synchronization session, and specifies whether content can be acquired from the device during that synchronization session.
     * 
     * The value can be a string (BSTR) representation of a bitwise combination of one or more of the following flags.
     * 
     * <ul>
     * <li>1  Synchronize music files.</li>
     * <li>2  Synchronize video files.</li>
     * <li>4  Synchronize picture files.</li>
     * <li>8   Content can be written to the device, but cannot be acquired from the device.</li>
     * </ul>
     * For example, the string "5" specifies that music and picture files will be synchronized.
     * 
     * The value can also be one of the following strings.
     * 
     * <ul>
     * <li>"0xFF"  Apply no filter to the synchronization session. That is, synchronize all types of files and allow content to be both written to the device and acquired from the device.</li>
     * <li>"0x07" Synchronize files of all types.</li>
     * </ul>
     * This attribute affects only the next synchronization session.
     * 
     * Use of this attribute is permitted only for devices with which Windows Media Player has a partnership.
     * 
     * Requires Windows Media Player 12.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>SyncOnConnect</td>
     * <td>
     * Specifies whether Windows Media Player should synchronize the device when the device gets connected. The value "true" specifies that Windows Media Player should synchronize the device, and the value "false" specifies that Windows Media Player should not synchronize the device.
     * 
     * Use of this attribute is permitted only for devices with which Windows Media Player has a partnership.
     * 
     * Requires Windows Media Player 12.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <b>Windows Media Player 10 Mobile: </b>This method is not supported.
     * @param {BSTR} bstrItemName <b>BSTR</b> specifying the name of the attribute on which to set the new value. For supported attribute names, see Remarks.
     * @param {BSTR} bstrVal <b>BSTR</b> specifying the new value. For information about supported values, see Remarks.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded or a partnership exists.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/wmp/nf-wmp-iwmpsyncdevice2-setiteminfo
     */
    setItemInfo(bstrItemName, bstrVal) {
        bstrItemName := bstrItemName is String ? BSTR.Alloc(bstrItemName).Value : bstrItemName
        bstrVal := bstrVal is String ? BSTR.Alloc(bstrVal).Value : bstrVal

        result := ComCall(19, this, "ptr", bstrItemName, "ptr", bstrVal, "HRESULT")
        return result
    }
}
