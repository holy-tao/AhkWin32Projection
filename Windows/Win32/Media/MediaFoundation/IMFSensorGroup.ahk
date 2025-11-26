#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMFAttributes.ahk
#Include .\IMFSensorDevice.ahk
#Include .\IMFMediaSource.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Represents a group of sensor devices from which an IMFMediaSource can be created.
 * @see https://docs.microsoft.com/windows/win32/api//mfidl/nn-mfidl-imfsensorgroup
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFSensorGroup extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFSensorGroup
     * @type {Guid}
     */
    static IID => Guid("{4110243a-9757-461f-89f1-f22345bcab4e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetSymbolicLink", "GetFlags", "GetSensorGroupAttributes", "GetSensorDeviceCount", "GetSensorDevice", "SetDefaultSensorDeviceIndex", "GetDefaultSensorDeviceIndex", "CreateMediaSource"]

    /**
     * Gets the symbolic link name of the sensor group.
     * @param {PWSTR} SymbolicLink Buffer of <i>cchSymbolicLink</i> characters where the symbolic link name will be written.  The buffer must be large enough to account for the null terminator.
     * @param {Integer} cchSymbolicLink Number of characters available in <i>SymbolicLink</i> buffer.
     * @returns {Integer} Output parameter containing the number of characters written to <i>SymbolicLink</i>.  This includes the null terminator.  If <i>SymbolicLink</i> is null and <i>cchSymbolicLink</i> is 0, <i>pcchWritten</i> will contain the number of characters needed (including the null terminator) to store the symbolic link name.
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfsensorgroup-getsymboliclink
     */
    GetSymbolicLink(SymbolicLink, cchSymbolicLink) {
        SymbolicLink := SymbolicLink is String ? StrPtr(SymbolicLink) : SymbolicLink

        result := ComCall(3, this, "ptr", SymbolicLink, "int", cchSymbolicLink, "int*", &pcchWritten := 0, "HRESULT")
        return pcchWritten
    }

    /**
     * Gets the flags set for the sensor group.
     * @returns {Integer} The flags set for the sensor group
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfsensorgroup-getflags
     */
    GetFlags() {
        result := ComCall(4, this, "uint*", &pFlags := 0, "HRESULT")
        return pFlags
    }

    /**
     * Gets the IMFAttributes for the sensor group. The returned object is a live reference to the internal attribute store.
     * @returns {IMFAttributes} The <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfattributes">IMFAttributes</a> interface representing the internal attribute store of the sensor group.
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfsensorgroup-getsensorgroupattributes
     */
    GetSensorGroupAttributes() {
        result := ComCall(5, this, "ptr*", &ppAttributes := 0, "HRESULT")
        return IMFAttributes(ppAttributes)
    }

    /**
     * Gets the number of devices that are virtualized by the sensor group.
     * @returns {Integer} The number of devices in the sensor group.
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfsensorgroup-getsensordevicecount
     */
    GetSensorDeviceCount() {
        result := ComCall(6, this, "uint*", &pdwCount := 0, "HRESULT")
        return pdwCount
    }

    /**
     * Gets the IMFSensorDevice corresponding to a device in the sensor group.
     * @param {Integer} dwIndex The 0-based index of the device to be retrieved.  The index must be between 0 and the value returned by <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfsensorgroup-getsensordevicecount">GetSensorDeviceCount</a> - 1.
     * @returns {IMFSensorDevice} If the call is successful, <i>ppDevice</i> will contain the retrieved sensor device.
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfsensorgroup-getsensordevice
     */
    GetSensorDevice(dwIndex) {
        result := ComCall(7, this, "uint", dwIndex, "ptr*", &ppDevice := 0, "HRESULT")
        return IMFSensorDevice(ppDevice)
    }

    /**
     * Configures one of the devices in the sensor group as the default device.
     * @param {Integer} dwIndex 0-based index of the device to be set as defaut.  The index must be between 0 and the value returned by <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfsensorgroup-getsensordevicecount">GetSensorDeviceCount</a> - 1.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     *           
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
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_INVALID_INDEX</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * the <i>dwIndex</i> parameter is not in the valid range.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_NOT_INITIALIZED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The sensor group has not been initialized.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfsensorgroup-setdefaultsensordeviceindex
     */
    SetDefaultSensorDeviceIndex(dwIndex) {
        result := ComCall(8, this, "uint", dwIndex, "HRESULT")
        return result
    }

    /**
     * Retrieves the index of the default device in the sensor group.
     * @returns {Integer} If the call succeeds, <i>pdwIndex</i> receives the index of the default device.
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfsensorgroup-getdefaultsensordeviceindex
     */
    GetDefaultSensorDeviceIndex() {
        result := ComCall(9, this, "uint*", &pdwIndex := 0, "HRESULT")
        return pdwIndex
    }

    /**
     * Creates an IMFMediaSource that virtualizes the sensor group.
     * @returns {IMFMediaSource} Receives a pointer to the created media source.
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfsensorgroup-createmediasource
     */
    CreateMediaSource() {
        result := ComCall(10, this, "ptr*", &ppSource := 0, "HRESULT")
        return IMFMediaSource(ppSource)
    }
}
