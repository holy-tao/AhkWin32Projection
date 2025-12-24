#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\WMDMID.ahk
#Include .\IMDSPEnumStorage.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IMDSPDevice interface provides an instance-based association with a media device.
 * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nn-mswmdm-imdspdevice
 * @namespace Windows.Win32.Media.DeviceManager
 * @version v4.0.30319
 */
class IMDSPDevice extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMDSPDevice
     * @type {Guid}
     */
    static IID => Guid("{1dcb3a12-33ed-11d3-8470-00c04f79dbc0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetName", "GetManufacturer", "GetVersion", "GetType", "GetSerialNumber", "GetPowerSource", "GetStatus", "GetDeviceIcon", "EnumStorage", "GetFormatSupport", "SendOpaqueCommand"]

    /**
     * The GetName method retrieves the name of the device.
     * @param {PWSTR} pwszName Pointer to an array of 16-bit Unicode characters that receives the device name string.
     * @param {Integer} nMaxChars Maximum number of characters to copy to the string.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. All the interface methods in Windows Media Device Manager can return any of the following classes of error codes:
     * 
     * <ul>
     * <li>Standard COM error codes </li>
     * <li>Windows error codes converted to HRESULT values </li>
     * <li>Windows Media Device Manager error codes </li>
     * </ul>
     * For an extensive list of possible error codes, see <a href="/windows/desktop/WMDM/error-codes">Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nf-mswmdm-imdspdevice-getname
     */
    GetName(pwszName, nMaxChars) {
        pwszName := pwszName is String ? StrPtr(pwszName) : pwszName

        result := ComCall(3, this, "ptr", pwszName, "uint", nMaxChars, "HRESULT")
        return result
    }

    /**
     * The GetManufacturer method retrieves the name of the manufacturer of the device.
     * @param {PWSTR} pwszName Pointer to a caller-allocated wide character array that receives the manufacturer name string.
     * @param {Integer} nMaxChars Maximum number of characters to copy to the string, including the termination character.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. All the interface methods in Windows Media Device Manager can return any of the following classes of error codes:
     * 
     * <ul>
     * <li>Standard COM error codes </li>
     * <li>Windows error codes converted to HRESULT values </li>
     * <li>Windows Media Device Manager error codes </li>
     * </ul>
     * For an extensive list of possible error codes, see <a href="/windows/desktop/WMDM/error-codes">Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nf-mswmdm-imdspdevice-getmanufacturer
     */
    GetManufacturer(pwszName, nMaxChars) {
        pwszName := pwszName is String ? StrPtr(pwszName) : pwszName

        result := ComCall(4, this, "ptr", pwszName, "uint", nMaxChars, "HRESULT")
        return result
    }

    /**
     * The GetVersion method retrieves the version number of the device.
     * @returns {Integer} Pointer to a <b>DWORD</b> to receive the version number of the device.
     * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nf-mswmdm-imdspdevice-getversion
     */
    GetVersion() {
        result := ComCall(5, this, "uint*", &pdwVersion := 0, "HRESULT")
        return pdwVersion
    }

    /**
     * The GetType method retrieves device type information.
     * @returns {Integer} Pointer to a <b>DWORD</b> that receives the type attributes of the device. The following table shows the types received.
     * 
     * <table>
     * <tr>
     * <th>Device type
     *                 </th>
     * <th>Description
     *                 </th>
     * </tr>
     * <tr>
     * <td>WMDM_DEVICE_TYPE_PLAYBACK</td>
     * <td>The media device supports audio playback.</td>
     * </tr>
     * <tr>
     * <td>WMDM_DEVICE_TYPE_RECORD</td>
     * <td>The media device supports audio recording.</td>
     * </tr>
     * <tr>
     * <td>WMDM_DEVICE_TYPE_DECODE</td>
     * <td>The media device supports audio format decoding.</td>
     * </tr>
     * <tr>
     * <td>WMDM_DEVICE_TYPE_ENCODE</td>
     * <td>The media device supports audio format encoding.</td>
     * </tr>
     * <tr>
     * <td>WMDM_DEVICE_TYPE_STORAGE</td>
     * <td>The media device has on-board storage for media files.</td>
     * </tr>
     * <tr>
     * <td>WMDM_DEVICE_TYPE_SDMI</td>
     * <td>The media device is SDMI compliant.</td>
     * </tr>
     * <tr>
     * <td>WMDM_DEVICE_TYPE_NONSDMI</td>
     * <td>The media device is not SDMI compliant.</td>
     * </tr>
     * <tr>
     * <td>WMDM_DEVICE_TYPE_VIRTUAL</td>
     * <td>The media device is not a physical device.</td>
     * </tr>
     * <tr>
     * <td>WMDM_DEVICE_TYPE_NONREENTRANT</td>
     * <td>The media device must synchronize access to the service provider services.</td>
     * </tr>
     * <tr>
     * <td>WMDM_DEVICE_TYPE_FILELISTRESYNC</td>
     * <td>The media device allows the file list to be resynchronized.</td>
     * </tr>
     * <tr>
     * <td>WMDM_DEVICE_TYPE_VIEW_PREF_METADATAVIEW</td>
     * <td>The media device prefers metadata views while its storages are enumerated.</td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nf-mswmdm-imdspdevice-gettype
     */
    GetType() {
        result := ComCall(6, this, "uint*", &pdwType := 0, "HRESULT")
        return pdwType
    }

    /**
     * The GetSerialNumber method retrieves the serial number that uniquely identifies the device.
     * @param {Pointer<Integer>} abMac Array of eight bytes containing the message authentication code for the parameter data of this method. (WMDM_MAC_LENGTH is defined as 8.)
     * @returns {WMDMID} Pointer to a <b>WMDMID</b> structure that receives the serial number for the device. This parameter is included in the output message authentication code.
     * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nf-mswmdm-imdspdevice-getserialnumber
     */
    GetSerialNumber(abMac) {
        abMacMarshal := abMac is VarRef ? "char*" : "ptr"

        pSerialNumber := WMDMID()
        result := ComCall(7, this, "ptr", pSerialNumber, abMacMarshal, abMac, "HRESULT")
        return pSerialNumber
    }

    /**
     * The GetPowerSource method reports whether the device is capable of running on batteries, external power, or both, and on which type of power source it is currently running.
     * @param {Pointer<Integer>} pdwPowerSource Pointer to a <b>DWORD</b> that receives a value indicating the current power source for the device. The value is one of the following flags.
     * 
     * <table>
     * <tr>
     * <th>Flag
     *                 </th>
     * <th>Description
     *                 </th>
     * </tr>
     * <tr>
     * <td>WMDM_POWER_CAP_BATTERY</td>
     * <td>The media device can run on batteries.</td>
     * </tr>
     * <tr>
     * <td>WMDM_POWER_CAP_EXTERNAL</td>
     * <td>The media device can run on external power.</td>
     * </tr>
     * <tr>
     * <td>WMDM_POWER_IS_BATTERY</td>
     * <td>The media device is currently running on batteries.</td>
     * </tr>
     * <tr>
     * <td>WMDM_POWER_IS_EXTERNAL</td>
     * <td>The media device is currently running on external power.</td>
     * </tr>
     * <tr>
     * <td>WMDM_POWER_PERCENT_AVAILABLE</td>
     * <td>The percentage of power remaining was returned in <i>pdwPercentRemaining</i>.</td>
     * </tr>
     * </table>
     * @param {Pointer<Integer>} pdwPercentRemaining If the device is running on batteries, <i>pdwPercentRemaining</i> specifies a pointer to a <b>DWORD</b> containing the percentage of total battery power remaining.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. All the interface methods in Windows Media Device Manager can return any of the following classes of error codes:
     * 
     * <ul>
     * <li>Standard COM error codes </li>
     * <li>Windows error codes converted to HRESULT values </li>
     * <li>Windows Media Device Manager error codes </li>
     * </ul>
     * For an extensive list of possible error codes, see <a href="/windows/desktop/WMDM/error-codes">Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nf-mswmdm-imdspdevice-getpowersource
     */
    GetPowerSource(pdwPowerSource, pdwPercentRemaining) {
        pdwPowerSourceMarshal := pdwPowerSource is VarRef ? "uint*" : "ptr"
        pdwPercentRemainingMarshal := pdwPercentRemaining is VarRef ? "uint*" : "ptr"

        result := ComCall(8, this, pdwPowerSourceMarshal, pdwPowerSource, pdwPercentRemainingMarshal, pdwPercentRemaining, "HRESULT")
        return result
    }

    /**
     * The GetStatus method retrieves all the device status information that the device can provide.
     * @returns {Integer} Pointer to a <b>DWORD</b> that receives the current device status. These status values are defined in the following table.
     * 
     * <table>
     * <tr>
     * <th>Status
     *                 </th>
     * <th>Description
     *                 </th>
     * </tr>
     * <tr>
     * <td>WMDM_STATUS_READY</td>
     * <td>Windows Media Device Manager and its subcomponents are in a ready state.</td>
     * </tr>
     * <tr>
     * <td>WMDM_STATUS_BUSY</td>
     * <td>An operation is ongoing. Check other status values to determine which operation it is.</td>
     * </tr>
     * <tr>
     * <td>WMDM_STATUS_DEVICE_NOTPRESENT</td>
     * <td>The device is not connected to the computer.</td>
     * </tr>
     * <tr>
     * <td>WMDM_STATUS_STORAGE_NOTPRESENT</td>
     * <td>The medium is not present. For devices that support more than one medium, this value is reported only from the <a href="https://docs.microsoft.com/windows/desktop/api/mswmdm/nn-mswmdm-iwmdmstorageglobals">IWMDMStorageGlobals</a> interface.</td>
     * </tr>
     * <tr>
     * <td>WMDM_STATUS_STORAGE_INITIALIZING</td>
     * <td>The device is currently busy formatting media on the device.</td>
     * </tr>
     * <tr>
     * <td>WMDM_STATUS_STORAGE_BROKEN</td>
     * <td>The medium is not working. For devices that support more than one medium, this value is reported only from the <b>IWMDMStorageGlobals</b> interface.</td>
     * </tr>
     * <tr>
     * <td>WMDM_STATUS_STORAGE_NOTSUPPORTED</td>
     * <td>The medium is not supported by the device. For devices that support more than one medium, this value is returned only from the <b>IWMDMStorageGlobals</b> interface.</td>
     * </tr>
     * <tr>
     * <td>WMDM_STATUS_STORAGE_UNFORMATTED</td>
     * <td>The medium is not formatted. For devices that support more than one medium, this value is returned only from the <b>IWMDMStorageGlobals</b> interface.</td>
     * </tr>
     * <tr>
     * <td>WMDM_STATUS_STORAGECONTROL_INSERTING</td>
     * <td>The <a href="https://docs.microsoft.com/windows/desktop/api/mswmdm/nf-mswmdm-iwmdmstoragecontrol-insert">IWMDMStorageControl::Insert</a> method is currently running.</td>
     * </tr>
     * <tr>
     * <td>WMDM_STATUS_STORAGECONTROL_DELETING</td>
     * <td>The <a href="https://docs.microsoft.com/windows/desktop/api/mswmdm/nf-mswmdm-iwmdmstoragecontrol-delete">IWMDMStorageControl::Delete</a> method is currently running.</td>
     * </tr>
     * <tr>
     * <td>WMDM_STATUS_STORAGECONTROL_MOVING</td>
     * <td>The <a href="https://docs.microsoft.com/windows/desktop/api/mswmdm/nf-mswmdm-iwmdmstoragecontrol-move">IWMDMStorageControl::Move</a> method is currently running.</td>
     * </tr>
     * <tr>
     * <td>WMDM_STATUS_STORAGECONTROL_READING</td>
     * <td>The <a href="https://docs.microsoft.com/windows/desktop/api/mswmdm/nf-mswmdm-iwmdmstoragecontrol-read">IWMDMStorageControl::Read</a> method is currently running.</td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nf-mswmdm-imdspdevice-getstatus
     */
    GetStatus() {
        result := ComCall(9, this, "uint*", &pdwStatus := 0, "HRESULT")
        return pdwStatus
    }

    /**
     * The GetDeviceIcon method returns a HICON that represents the icon that the device service provider indicates must be used to represent this device.
     * @returns {Integer} Handle to an <b>Icon</b> object that receives the icon for the device. Before using it, the caller must cast the value to a <b>HICON</b>*. When an application is finished with the icon, it should call <b>DestroyIcon</b> to free the resource. <b>DestroyIcon</b> is a standard Win32 function.
     * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nf-mswmdm-imdspdevice-getdeviceicon
     */
    GetDeviceIcon() {
        result := ComCall(10, this, "uint*", &hIcon := 0, "HRESULT")
        return hIcon
    }

    /**
     * The EnumStorage method retrieves a pointer to an IMDSPEnumStorage interface of an enumerator object that represents the top-level storage(s) on the device. Top-level storage for a device is the root directory of the storage medium.
     * @returns {IMDSPEnumStorage} Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/mswmdm/nn-mswmdm-imdspenumstorage">IMDSPEnumStorage</a> object.
     * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nf-mswmdm-imdspdevice-enumstorage
     */
    EnumStorage() {
        result := ComCall(11, this, "ptr*", &ppEnumStorage := 0, "HRESULT")
        return IMDSPEnumStorage(ppEnumStorage)
    }

    /**
     * The GetFormatSupport method retrieves all the formats supported by the device. The format information includes codecs, file formats, and digital rights management schemes.
     * @param {Pointer<Pointer<WAVEFORMATEX>>} pFormatEx Pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/WMDM/-waveformatex">_WAVEFORMATEX</a> structures containing information about codecs and bit rates supported by the device.
     * @param {Pointer<Integer>} pnFormatCount Pointer to the number of elements in the <i>pFormatEx</i> array.
     * @param {Pointer<Pointer<PWSTR>>} pppwszMimeType Pointer to an array that describes file formats and digital rights management schemes supported by the device.
     * @param {Pointer<Integer>} pnMimeTypeCount Pointer to the number of elements in the <i>pppwszMimeType</i> array.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. All the interface methods in Windows Media Device Manager can return any of the following classes of error codes:
     * 
     * <ul>
     * <li>Standard COM error codes </li>
     * <li>Windows error codes converted to HRESULT values </li>
     * <li>Windows Media Device Manager error codes </li>
     * </ul>
     * For an extensive list of possible error codes, see <a href="/windows/desktop/WMDM/error-codes">Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nf-mswmdm-imdspdevice-getformatsupport
     */
    GetFormatSupport(pFormatEx, pnFormatCount, pppwszMimeType, pnMimeTypeCount) {
        pFormatExMarshal := pFormatEx is VarRef ? "ptr*" : "ptr"
        pnFormatCountMarshal := pnFormatCount is VarRef ? "uint*" : "ptr"
        pppwszMimeTypeMarshal := pppwszMimeType is VarRef ? "ptr*" : "ptr"
        pnMimeTypeCountMarshal := pnMimeTypeCount is VarRef ? "uint*" : "ptr"

        result := ComCall(12, this, pFormatExMarshal, pFormatEx, pnFormatCountMarshal, pnFormatCount, pppwszMimeTypeMarshal, pppwszMimeType, pnMimeTypeCountMarshal, pnMimeTypeCount, "HRESULT")
        return result
    }

    /**
     * The SendOpaqueCommand method sends a command through Windows Media Device Manager. Without acting on it, Windows Media Device Manager passes the command through to a device.
     * @param {Pointer<OPAQUECOMMAND>} pCommand Pointer to an <a href="https://docs.microsoft.com/windows/desktop/WMDM/opaquecommand">OPAQUECOMMAND</a> structure containing the information required to execute the command.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. All the interface methods in Windows Media Device Manager can return any of the following classes of error codes:
     * 
     * <ul>
     * <li>Standard COM error codes </li>
     * <li>Windows error codes converted to HRESULT values </li>
     * <li>Windows Media Device Manager error codes </li>
     * </ul>
     * For an extensive list of possible error codes, see <a href="/windows/desktop/WMDM/error-codes">Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nf-mswmdm-imdspdevice-sendopaquecommand
     */
    SendOpaqueCommand(pCommand) {
        result := ComCall(13, this, "ptr", pCommand, "HRESULT")
        return result
    }
}
