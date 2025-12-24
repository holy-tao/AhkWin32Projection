#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IWMPSyncDevice interface represents a device to which Windows Media Player 10 or later can copy digital media files.
 * @see https://docs.microsoft.com/windows/win32/api//wmp/nn-wmp-iwmpsyncdevice
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class IWMPSyncDevice extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMPSyncDevice
     * @type {Guid}
     */
    static IID => Guid("{82a2986c-0293-4fd0-b279-b21b86c058be}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_friendlyName", "put_friendlyName", "get_deviceName", "get_deviceId", "get_partnershipIndex", "get_connected", "get_status", "get_syncState", "get_progress", "getItemInfo", "createPartnership", "deletePartnership", "start", "stop", "showSettings", "isIdentical"]

    /**
     */
    friendlyName {
        get => this.get_friendlyName()
        set => this.put_friendlyName(value)
    }

    /**
     */
    deviceName {
        get => this.get_deviceName()
    }

    /**
     */
    deviceId {
        get => this.get_deviceId()
    }

    /**
     */
    partnershipIndex {
        get => this.get_partnershipIndex()
    }

    /**
     */
    connected {
        get => this.get_connected()
    }

    /**
     */
    status {
        get => this.get_status()
    }

    /**
     */
    syncState {
        get => this.get_syncState()
    }

    /**
     */
    progress {
        get => this.get_progress()
    }

    /**
     * The get_friendlyName method retrieves the user-defined name of the device.
     * @param {Pointer<BSTR>} pbstrName Pointer to a <b>BSTR</b> that contains the friendly name.
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
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NS_E_PDA_INITIALIZINGDEVICES (0xC00D118D)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Windows Media Player is currently busy initializing devices. Please try again later.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpsyncdevice-get_friendlyname
     */
    get_friendlyName(pbstrName) {
        result := ComCall(3, this, "ptr", pbstrName, "HRESULT")
        return result
    }

    /**
     * The put_friendlyName method specifies the user-defined name of the device.
     * @param {BSTR} bstrName String containing the friendly name.
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
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NS_E_PDA_INITIALIZINGDEVICES (0xC00D118D)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Windows Media Player is currently busy initializing devices. Please try again later.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpsyncdevice-put_friendlyname
     */
    put_friendlyName(bstrName) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName

        result := ComCall(4, this, "ptr", bstrName, "HRESULT")
        return result
    }

    /**
     * The get_deviceName method retrieves the name of the device.
     * @param {Pointer<BSTR>} pbstrName Pointer to a <b>BSTR</b> that contains the name of the device.
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
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NS_E_PDA_INITIALIZINGDEVICES (0xC00D118D)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Windows Media Player is currently busy initializing devices. Please try again later.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpsyncdevice-get_devicename
     */
    get_deviceName(pbstrName) {
        result := ComCall(5, this, "ptr", pbstrName, "HRESULT")
        return result
    }

    /**
     * The get_deviceId method retrieves the device identifier string.
     * @param {Pointer<BSTR>} pbstrDeviceId Address of a <b>BSTR</b> variable that receives a string containing the device identifier.
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
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NS_E_PDA_INITIALIZINGDEVICES (0xC00D118D)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Windows Media Player is currently busy initializing devices. Please try again later.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpsyncdevice-get_deviceid
     */
    get_deviceId(pbstrDeviceId) {
        result := ComCall(6, this, "ptr", pbstrDeviceId, "HRESULT")
        return result
    }

    /**
     * The get_partnershipIndex method retrieves the index of the device partnership.
     * @param {Pointer<Integer>} plIndex Pointer to a <b>long</b> that contains the partnership index value. Possible values range from 0 to 16.
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
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NS_E_PDA_INITIALIZINGDEVICES (0xC00D118D)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Windows Media Player is currently busy initializing devices. Please try again later.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpsyncdevice-get_partnershipindex
     */
    get_partnershipIndex(plIndex) {
        plIndexMarshal := plIndex is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, plIndexMarshal, plIndex, "HRESULT")
        return result
    }

    /**
     * The get_connected method retrieves a value indicating whether the device is connected to Windows Media Player.
     * @param {Pointer<VARIANT_BOOL>} pvbConnected <b>VARIANT_BOOL</b> indicating whether the device is connected. The following table describes the possible values.
     * 
     * <table>
     * <tr>
     * <th>Value
     *                 </th>
     * <th>Description
     *                 </th>
     * </tr>
     * <tr>
     * <td>VARIANT_TRUE</td>
     * <td>The device is connected.</td>
     * </tr>
     * <tr>
     * <td>VARIANT_FALSE</td>
     * <td>The device is not connected.</td>
     * </tr>
     * </table>
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
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NS_E_PDA_INITIALIZINGDEVICES (0xC00D118D)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Windows Media Player is currently busy initializing devices. Please try again later.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpsyncdevice-get_connected
     */
    get_connected(pvbConnected) {
        pvbConnectedMarshal := pvbConnected is VarRef ? "short*" : "ptr"

        result := ComCall(8, this, pvbConnectedMarshal, pvbConnected, "HRESULT")
        return result
    }

    /**
     * The get_status method retrieves a value that indicates the status of the relationship between Windows Media Player and the device.
     * @param {Pointer<Integer>} pwmpds Pointer to a <b>WMPDeviceStatus</b> enumeration value indicating the current status.
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
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NS_E_PDA_INITIALIZINGDEVICES (0xC00D118D)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Windows Media Player is currently busy initializing devices. Please try again later.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpsyncdevice-get_status
     */
    get_status(pwmpds) {
        pwmpdsMarshal := pwmpds is VarRef ? "int*" : "ptr"

        result := ComCall(9, this, pwmpdsMarshal, pwmpds, "HRESULT")
        return result
    }

    /**
     * The get_syncState method retrieves a value that indicates the current synchronization state for the device.
     * @param {Pointer<Integer>} pwmpss Pointer to a <b>WMPSyncState</b> enumeration value indicating the current synchronization state for the device.
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
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NS_E_PDA_INITIALIZINGDEVICES (0xC00D118D)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Windows Media Player is currently busy initializing devices. Please try again later.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpsyncdevice-get_syncstate
     */
    get_syncState(pwmpss) {
        pwmpssMarshal := pwmpss is VarRef ? "int*" : "ptr"

        result := ComCall(10, this, pwmpssMarshal, pwmpss, "HRESULT")
        return result
    }

    /**
     * The get_progress method retrieves a value that indicates the synchronization progress as percent complete.
     * @param {Pointer<Integer>} plProgress Pointer to a <b>long</b> that indicates the progress as percent complete. Possible values are 0 to 100.
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
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NS_E_PDA_INITIALIZINGDEVICES (0xC00D118D)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Windows Media Player is currently busy initializing devices. Please try again later.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpsyncdevice-get_progress
     */
    get_progress(plProgress) {
        plProgressMarshal := plProgress is VarRef ? "int*" : "ptr"

        result := ComCall(11, this, plProgressMarshal, plProgress, "HRESULT")
        return result
    }

    /**
     * The getItemInfo method retrieves a metadata value from the device.
     * @param {BSTR} bstrItemName <b>BSTR</b> containing the metadata item name. The following table lists the supported item names and describes the value that each retrieves.
     * 
     * <table>
     * <tr>
     * <th>Name
     *                 </th>
     * <th>Retrieves
     *                 </th>
     * </tr>
     * <tr>
     * <td>AutoSyncDefaultRules</td>
     * <td>
     * Whether automatic synchronization is done according to default rules or custom rules. A value of "True" indicates default rules, and a value of "False" indicates custom rules.
     * 
     * Use of this attribute is permitted only for devices that have a partnership with Windows Media Player.
     * 
     * Requires Windows Media Player 12.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>BackgroundSyncState</td>
     * <td>
     * Whether Windows Media Player is allowed to perform background operations for the device.
     * 
     * The value can be a string (<b>BSTR</b>) representation of a bitwise combination of one or more of the following flags.
     * 
     * <ul>
     * <li>1 Background synchronization is allowed.</li>
     * <li>2 Background transcoding is allowed.</li>
     * </ul>
     * The value can also be one of the following strings.
     * 
     * <ul>
     * <li>"0" No background operations are allowed.</li>
     * <li>"255" All background operations are allowed.</li>
     * </ul>
     * The value of this attribute lasts for the lifetime of Windows Media Player, but is not stored in the Windows Media Player library.
     * 
     * Use of this attribute is permitted only for devices that have a partnership with Windows Media Player.
     * 
     * Requires Windows Media Player 12.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>Connected</td>
     * <td>Whether the device is currently connected to Windows Media Player. Possible values are "True" and "False".</td>
     * </tr>
     * <tr>
     * <td>FreeSpace</td>
     * <td>The size, in bytes, of the available device memory.</td>
     * </tr>
     * <tr>
     * <td>FriendlyName</td>
     * <td>The friendly name for the device.</td>
     * </tr>
     * <tr>
     * <td>LastSyncErrorCount</td>
     * <td>The number of synchronization errors that occurred during the most recent synchronization.</td>
     * </tr>
     * <tr>
     * <td>LastSyncNoFitCount</td>
     * <td>The number of media items that would not fit on the device during the most recent synchronization.</td>
     * </tr>
     * <tr>
     * <td>LastSyncTime</td>
     * <td>The time of the most recent synchronization.</td>
     * </tr>
     * <tr>
     * <td>Name</td>
     * <td>The name of the device.</td>
     * </tr>
     * <tr>
     * <td>PercentSpaceReserved</td>
     * <td>Limits the amount of device storage that Windows Media Player uses for file synchronization by specifying a portion of the storage as reserved. The value is the numeric percentage of total storage on the device represented by a string (<b>BSTR</b>). Supported values range from "0" to "95" inclusive.Use of this attribute is permitted only for devices that have a partnership with Windows Media Player.
     * 
     * Requires Windows Media Player 11.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>PreferredAudio</td>
     * <td>
     * A string (<b>BSTR</b>) representation of the numeric identifier of the preferred storage for audio files on the device.  If the device supports hints, the preferred storage is the location specified by the hint. If the device does not support hints, the preferred storage is the largest storage.
     * 
     * Requires Windows Media Player 12.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>PreferredVideo</td>
     * <td>
     * A string (<b>BSTR</b>) representation of the numeric identifier of the preferred storage for video files on the device.  If the device supports hints, the preferred storage is the location specified by the hint. If the device does not support hints, the preferred storage is the largest storage.
     * 
     * Requires Windows Media Player 12.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>PreferredPhoto</td>
     * <td>
     * A string (<b>BSTR</b>) representation of the numeric identifier of the preferred storage for picture files on the device.  If the device supports hints, the preferred storage is the location specified by the hint. If the device does not support hints, the preferred storage is the largest storage.
     * 
     * Requires Windows Media Player 12.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>SerialNumber</td>
     * <td>The device serial number.</td>
     * </tr>
     * <tr>
     * <td>SkippedFiles</td>
     * <td>
     * Whether the device has any skipped files. A value of "1" indicates that the device has skipped files. A value of "0" indicates that the device does not have any skipped files.
     * 
     * Use of this attribute is permitted only for devices with which Windows Media Player has a partnership.
     * 
     * Requires Windows Media Player 12.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>SupportsAudio</td>
     * <td>Whether the device supports audio playback. Possible values are "True" and "False".</td>
     * </tr>
     * <tr>
     * <td>SupportsPhoto</td>
     * <td>Whether the device supports displaying photos. Possible values are "True" and "False".</td>
     * </tr>
     * <tr>
     * <td>SupportsVideo</td>
     * <td>Whether the device supports video playback. Possible values are "True" and "False".</td>
     * </tr>
     * <tr>
     * <td>SyncFilter </td>
     * <td>
     * The types of files that will be synchronized during the next synchronization session, and an indication of whether content can be acquired from the device during that synchronization session.
     * 
     * The value can be a string (<b>BSTR</b>) representation of a bitwise combination of one or more of the following flags.
     * 
     * <ul>
     * <li>"1" Music files will be synchronized.</li>
     * <li>"2"  Video files will be synchronized.</li>
     * <li>"4"  Picture files will be synchronized.</li>
     * <li>"8"  Content can be written to the device, but can not be acquired from the device.</li>
     * </ul>
     * For example, the string value "5" indicates that music and picture files will be synchronized.
     * 
     * The value can also be one of the following strings.
     * 
     * <ul>
     * <li>"0xFF"    No filter will be applied to the synchronization session. That is, files of all types will be synchronized, and content can be both written to the device and acquired from the device.</li>
     * <li>"0x07" Files of all types will be synchronized.</li>
     * </ul>
     * This attribute affects only the next synchronization session.
     * 
     * Use of this attribute is permitted only for devices that have a partnership with Windows Media Player.
     * 
     * Requires Windows Media Player 12.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>SyncIndex</td>
     * <td>The partnership index for the device. Possible values are the integers 0 through 16.</td>
     * </tr>
     * <tr>
     * <td>SyncItemCount</td>
     * <td>The count of items synchronized to the device.</td>
     * </tr>
     * <tr>
     * <td>SyncOnConnect</td>
     * <td>
     * Whether Windows Media Player will synchronize the device when the device gets connected. A value of "True" indicates that Windows Media Player will synchronize the device, and a value of "False" indicates that Windows Media Player will not synchronize the device.
     * 
     * Use of this attribute is permitted only for devices that have a partnership with Windows Media Player.
     * 
     * Requires Windows Media Player 12.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>SyncPercentComplete</td>
     * <td>The progress of synchronization as a percentage.</td>
     * </tr>
     * <tr>
     * <td>SyncRelationship</td>
     * <td>A number indicating how the device synchronizes with respect to the current instance of Windows Media Player. Possible values are:0, meaning no relationship.
     * 
     * 1, meaning manual synchronization.
     * 
     * 2, meaning a partnership exists with the current instance of Windows Media Player.
     * 
     * 3, meaning a partnership exists with another instance of Windows Media Player.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>TotalSpace</td>
     * <td>The size, in bytes, of the total memory for the device.</td>
     * </tr>
     * </table>
     * @param {Pointer<BSTR>} pbstrVal Pointer to a <b>BSTR</b> that contains the specified metadata item name.
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
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NS_E_PDA_INITIALIZINGDEVICES (0xC00D118D)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Windows Media Player is currently busy initializing devices. Please try again later.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpsyncdevice-getiteminfo
     */
    getItemInfo(bstrItemName, pbstrVal) {
        bstrItemName := bstrItemName is String ? BSTR.Alloc(bstrItemName).Value : bstrItemName

        result := ComCall(12, this, "ptr", bstrItemName, "ptr", pbstrVal, "HRESULT")
        return result
    }

    /**
     * The createPartnership method creates a partnership between Windows Media Player and the device.
     * @param {VARIANT_BOOL} vbShowUI <b>VARIANT_BOOL</b> that specifies whether Windows Media Player displays the <b>Device Setup</b> dialog box. The following table describes the behavior for each possible value.
     * 
     * <table>
     * <tr>
     * <th>Value
     *                 </th>
     * <th>Description
     *                 </th>
     * </tr>
     * <tr>
     * <td>VARIANT_TRUE</td>
     * <td>The remoted instance of Windows Media Player undocks, if necessary, and shows the device settings dialog box. If the Player is in skin mode, it returns to full mode. If the Player is locked in skin mode by corporate policy, the call fails.When the user closes the dialog box, Windows Media Player returns to its original docking state.
     * 
     * Note that the events for docking and undocking the Player will occur normally.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>VARIANT_FALSE</td>
     * <td>Windows Media Player attempts to create a partnership using a default set of device synchronization playlists. The Player does not change its current visible state or mode.</td>
     * </tr>
     * </table>
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
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ABORT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user canceled the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NS_E_NO_PDA (0xC00D1179L)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The device is not connected.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NS_E_PDA_INITIALIZINGDEVICES (0xC00D118D)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Windows Media Player is currently busy initializing devices. Please try again later.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NS_E_PDA_MANUALDEVICE (0xC00D1183)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The status for the current device is wmpdsManualDevice.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpsyncdevice-createpartnership
     */
    createPartnership(vbShowUI) {
        result := ComCall(13, this, "short", vbShowUI, "HRESULT")
        return result
    }

    /**
     * The deletePartnership method terminates the partnership between Windows Media Player and the device.
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
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded, but there was no partnership to delete. This occurs when the current status is wmpdsPartnershipDeclined or wmpdsNewDevice.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NS_E_PDA_INITIALIZINGDEVICES (0xC00D118D)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Windows Media Player is currently busy initializing devices. Please try again later.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NS_E_PDA_MANUALDEVICE (0xC00D1183)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The status for the current device is wmpdsManualDevice.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NS_E_PDA_PARTNERSHIPNOTEXIST (0xC00D1184)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method failed because the current status for the device is wmpdsPartnershipAnother. This method will only delete partnerships that exist for the current instance of Windows Media Player.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpsyncdevice-deletepartnership
     */
    deletePartnership() {
        result := ComCall(14, this, "HRESULT")
        return result
    }

    /**
     * The start method begins synchronization.
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
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NS_E_PDA_INITIALIZINGDEVICES (0xC00D118D)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Windows Media Player is currently busy initializing devices. Please try again later.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpsyncdevice-start
     */
    start() {
        result := ComCall(15, this, "HRESULT")
        return result
    }

    /**
     * The stop method ends synchronization.
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
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NS_E_PDA_INITIALIZINGDEVICES (0xC00D118D)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Windows Media Player is currently busy initializing devices. Please try again later.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpsyncdevice-stop
     */
    stop() {
        result := ComCall(16, this, "HRESULT")
        return result
    }

    /**
     * The showSettings method displays the Windows Media Player synchronization settings dialog box.
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
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NS_E_NO_PDA (0xC00D1179L)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The device is not connected.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NS_E_PDA_INITIALIZINGDEVICES (0xC00D118D)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Windows Media Player is currently busy initializing devices. Please try again later.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NS_E_PDA_MANUALDEVICE (0xC00D1183)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The status for the current device is wmpdsManualDevice.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NS_E_PDA_PARTNERSHIPNOTEXIST</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The current status for the device is wmpdsPartnershipDeclined, wmpdsPartnershipAnother, or wmpdsNewDevice. This method only shows the settings dialog box for devices for which a partnership exists with the current instance of Windows Media Player.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpsyncdevice-showsettings
     */
    showSettings() {
        result := ComCall(17, this, "HRESULT")
        return result
    }

    /**
     * The isIdentical method compares the current device to the specified device and retrieves a value indicating whether they are the same device.
     * @param {IWMPSyncDevice} pDevice Pointer to an <b>IWMPSyncDevice</b> interface that represents the device to which to compare the current device.
     * @param {Pointer<VARIANT_BOOL>} pvbool Pointer to a <b>VARIANT_BOOL</b> that indicates the result of the comparison.
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
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NS_E_PDA_INITIALIZINGDEVICES (0xC00D118D)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Windows Media Player is currently busy initializing devices. Please try again later.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmp/nf-wmp-iwmpsyncdevice-isidentical
     */
    isIdentical(pDevice, pvbool) {
        pvboolMarshal := pvbool is VarRef ? "short*" : "ptr"

        result := ComCall(18, this, "ptr", pDevice, pvboolMarshal, pvbool, "HRESULT")
        return result
    }
}
