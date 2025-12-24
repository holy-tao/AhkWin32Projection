#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\WMDMID.ahk
#Include .\IWMDMEnumStorage.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IWMDMDevice interface provides methods to examine and explore a single portable device. The interface can be used to get information about a device and enumerate its storages. IWMDMDevice2 extends the capabilities of this interface.
 * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nn-mswmdm-iwmdmdevice
 * @namespace Windows.Win32.Media.DeviceManager
 * @version v4.0.30319
 */
class IWMDMDevice extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMDMDevice
     * @type {Guid}
     */
    static IID => Guid("{1dcb3a02-33ed-11d3-8470-00c04f79dbc0}")

    /**
     * The class identifier for WMDMDevice
     * @type {Guid}
     */
    static CLSID => Guid("{807b3cdf-357a-11d3-8471-00c04f79dbc0}")

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
     * The GetName method retrieves the human-readable name of the media device.
     * @param {PWSTR} pwszName Pointer to a (Unicode) wide-character, null-terminated string specifying the device name. The buffer is allocated and released by the caller.
     * @param {Integer} nMaxChars Integer specifying the maximum number of characters that can be placed in <i>pwszName</i>, including the termination character.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. All the interface methods in Windows Media Device Manager can return any of the following classes of error codes:
     * 
     * <ul>
     * <li>Standard COM error codes </li>
     * <li>Windows error codes converted to HRESULT values </li>
     * <li>Windows Media Device Manager error codes </li>
     * </ul>
     * For an extensive list of possible error codes, see <a href="/windows/desktop/WMDM/error-codes">Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nf-mswmdm-iwmdmdevice-getname
     */
    GetName(pwszName, nMaxChars) {
        pwszName := pwszName is String ? StrPtr(pwszName) : pwszName

        result := ComCall(3, this, "ptr", pwszName, "uint", nMaxChars, "HRESULT")
        return result
    }

    /**
     * The GetManufacturer method retrieves the name of the manufacturer of the device.
     * @param {PWSTR} pwszName Pointer to a wide-character, null-terminated string specifying the manufacturer's name. The buffer must be allocated and released by the caller.
     * @param {Integer} nMaxChars Integer specifying the maximum number of characters that can be copied to <i>pwszName</i>, including the termination character.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. All the interface methods in Windows Media Device Manager can return any of the following classes of error codes:
     * 
     * <ul>
     * <li>Standard COM error codes </li>
     * <li>Windows error codes converted to HRESULT values </li>
     * <li>Windows Media Device Manager error codes </li>
     * </ul>
     * For an extensive list of possible error codes, see <a href="/windows/desktop/WMDM/error-codes">Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nf-mswmdm-iwmdmdevice-getmanufacturer
     */
    GetManufacturer(pwszName, nMaxChars) {
        pwszName := pwszName is String ? StrPtr(pwszName) : pwszName

        result := ComCall(4, this, "ptr", pwszName, "uint", nMaxChars, "HRESULT")
        return result
    }

    /**
     * The GetVersion method retrieves the manufacturer-defined version number of the device.
     * @returns {Integer} Pointer to a <b>DWORD</b> specifying the version number.
     * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nf-mswmdm-iwmdmdevice-getversion
     */
    GetVersion() {
        result := ComCall(5, this, "uint*", &pdwVersion := 0, "HRESULT")
        return pdwVersion
    }

    /**
     * The GetType method retrieves the operations supported by the device.
     * @returns {Integer} Pointer to a <b>DWORD</b> specifying the device type attributes. The possible values returned in <i>pdwType</i> are defined in the following table. Microsoft recommends setting both WMDM_DEVICE_TYPE_SDMI and WMDM_DEVICE_TYPE_NONSDMI flags.
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
     * <td>WMDM_DEVICE_TYPE_VIRTUAL</td>
     * <td>The media device is not a physical device.</td>
     * </tr>
     * <tr>
     * <td>WMDM_DEVICE_TYPE_SDMI</td>
     * <td>The media device can accept SDMI-protected content.</td>
     * </tr>
     * <tr>
     * <td>WMDM_DEVICE_TYPE_NONSDMI</td>
     * <td>The media device can accept non-SDMI content.</td>
     * </tr>
     * <tr>
     * <td>WMDM_DEVICE_TYPE_NONREENTRANT</td>
     * <td>The media device must synchronize access to Windows Media Device Manager services.</td>
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
     * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nf-mswmdm-iwmdmdevice-gettype
     */
    GetType() {
        result := ComCall(6, this, "uint*", &pdwType := 0, "HRESULT")
        return pdwType
    }

    /**
     * The GetSerialNumber method retrieves a serial number that uniquely identifies the device.
     * @param {Pointer<Integer>} abMac Array of bytes specifying the message authentication code for the parameter data of this method.
     * @returns {WMDMID} Pointer to a <a href="https://docs.microsoft.com/windows/desktop/WMDM/wmdmid">WMDMID</a> structure specifying the serial number information. The <b>WMDID</b> structure is allocated and released by the application.
     * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nf-mswmdm-iwmdmdevice-getserialnumber
     */
    GetSerialNumber(abMac) {
        abMacMarshal := abMac is VarRef ? "char*" : "ptr"

        pSerialNumber := WMDMID()
        result := ComCall(7, this, "ptr", pSerialNumber, abMacMarshal, abMac, "HRESULT")
        return pSerialNumber
    }

    /**
     * The GetPowerSource method retrieves information about the power source and the percentage of power remaining for the device.
     * @param {Pointer<Integer>} pdwPowerSource Pointer to a <b>DWORD</b> specifying information about the power source of the device.
     * @param {Pointer<Integer>} pdwPercentRemaining If <i>pdwPowerSource</i> contains WMDM_POWER_PERCENT_AVAILABLE, a pointer to a <b>DWORD</b> specifying the percentage of power remaining in the device.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. All the interface methods in Windows Media Device Manager can return any of the following classes of error codes:
     * 
     * <ul>
     * <li>Standard COM error codes </li>
     * <li>Windows error codes converted to HRESULT values </li>
     * <li>Windows Media Device Manager error codes </li>
     * </ul>
     * For an extensive list of possible error codes, see <a href="/windows/desktop/WMDM/error-codes">Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nf-mswmdm-iwmdmdevice-getpowersource
     */
    GetPowerSource(pdwPowerSource, pdwPercentRemaining) {
        pdwPowerSourceMarshal := pdwPowerSource is VarRef ? "uint*" : "ptr"
        pdwPercentRemainingMarshal := pdwPercentRemaining is VarRef ? "uint*" : "ptr"

        result := ComCall(8, this, pdwPowerSourceMarshal, pdwPowerSource, pdwPercentRemainingMarshal, pdwPercentRemaining, "HRESULT")
        return result
    }

    /**
     * The GetStatus method retrieves device status information.
     * @returns {Integer} Pointer to a <b>DWORD</b> specifying the device status. The possible values returned in <i>pdwStatus</i> are provided in the following table.
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
     * <td>An operation is ongoing. Evaluate status values to determine the operation.</td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nf-mswmdm-iwmdmdevice-getstatus
     */
    GetStatus() {
        result := ComCall(9, this, "uint*", &pdwStatus := 0, "HRESULT")
        return pdwStatus
    }

    /**
     * The GetDeviceIcon method retrieves a handle to the icon that the device manufacturer wants to display when the device is connected.
     * @returns {Integer} Handle to an icon object.
     * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nf-mswmdm-iwmdmdevice-getdeviceicon
     */
    GetDeviceIcon() {
        result := ComCall(10, this, "uint*", &hIcon := 0, "HRESULT")
        return hIcon
    }

    /**
     * The EnumStorage method retrieves an IWMDMEnumStorage interface to enumerate the storages on a device.
     * @returns {IWMDMEnumStorage} Pointer to a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/mswmdm/nn-mswmdm-iwmdmenumstorage">IWMDMEnumStorage</a> interface to enumerate the storages on a device. This points to the root storage on the device. The caller is responsible for calling <b>Release</b> on the retrieved interface.
     * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nf-mswmdm-iwmdmdevice-enumstorage
     */
    EnumStorage() {
        result := ComCall(11, this, "ptr*", &ppEnumStorage := 0, "HRESULT")
        return IWMDMEnumStorage(ppEnumStorage)
    }

    /**
     * The GetFormatSupport method retrieves all the formats supported by the device, including codecs and file formats.
     * @param {Pointer<Pointer<WAVEFORMATEX>>} ppFormatEx Pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/WMDM/-waveformatex">_WAVEFORMATEX</a> structures specifying information about codecs and bit rates supported by the device. Windows Media Device Manager allocates the memory for this parameter; the caller must free it using <b>CoTaskMemFree</b>.
     * @param {Pointer<Integer>} pnFormatCount Pointer to the number of elements in the <i>ppFormatEx</i> array.
     * @param {Pointer<Pointer<PWSTR>>} pppwszMimeType Pointer to an array describing file formats and digital rights management schemes supported by the device. Windows Media Device Manager allocates the memory for this parameter; the caller must free it using <b>CoTaskMemFree</b>.
     * @param {Pointer<Integer>} pnMimeTypeCount Pointer to the number of elements in the <i>pppwszMimeType</i> array.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. All the interface methods in Windows Media Device Manager can return any of the following classes of error codes:
     * 
     * <ul>
     * <li>Standard COM error codes </li>
     * <li>Windows error codes converted to HRESULT values </li>
     * <li>Windows Media Device Manager error codes </li>
     * </ul>
     * For an extensive list of possible error codes, see <a href="/windows/desktop/WMDM/error-codes">Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nf-mswmdm-iwmdmdevice-getformatsupport
     */
    GetFormatSupport(ppFormatEx, pnFormatCount, pppwszMimeType, pnMimeTypeCount) {
        ppFormatExMarshal := ppFormatEx is VarRef ? "ptr*" : "ptr"
        pnFormatCountMarshal := pnFormatCount is VarRef ? "uint*" : "ptr"
        pppwszMimeTypeMarshal := pppwszMimeType is VarRef ? "ptr*" : "ptr"
        pnMimeTypeCountMarshal := pnMimeTypeCount is VarRef ? "uint*" : "ptr"

        result := ComCall(12, this, ppFormatExMarshal, ppFormatEx, pnFormatCountMarshal, pnFormatCount, pppwszMimeTypeMarshal, pppwszMimeType, pnMimeTypeCountMarshal, pnMimeTypeCount, "HRESULT")
        return result
    }

    /**
     * The SendOpaqueCommand method sends a device-specific command to the device through Windows Media Device Manager. Windows Media Device Manager does not attempt to read the command.
     * @param {Pointer<OPAQUECOMMAND>} pCommand Pointer to an <a href="https://docs.microsoft.com/windows/desktop/WMDM/opaquecommand">OPAQUECOMMAND</a> structure specifying the information required to execute the command. If the device returns data, it is returned through the <i>pData</i> member of <i>pCommand</i>.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. All the interface methods in Windows Media Device Manager can return any of the following classes of error codes:
     * 
     * <ul>
     * <li>Standard COM error codes </li>
     * <li>Windows error codes converted to HRESULT values </li>
     * <li>Windows Media Device Manager error codes </li>
     * </ul>
     * For an extensive list of possible error codes, see <a href="/windows/desktop/WMDM/error-codes">Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//mswmdm/nf-mswmdm-iwmdmdevice-sendopaquecommand
     */
    SendOpaqueCommand(pCommand) {
        result := ComCall(13, this, "ptr", pCommand, "HRESULT")
        return result
    }
}
