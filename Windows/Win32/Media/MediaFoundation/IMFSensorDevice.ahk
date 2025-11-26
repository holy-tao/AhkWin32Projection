#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMFAttributes.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Represents a sensor device that can belong to a sensor group, which is represented by the IMFSensorGroup interface. The term &quot;device&quot; in this context could refer to a physical device, a custom media source, or a frame provider.
 * @see https://docs.microsoft.com/windows/win32/api//mfidl/nn-mfidl-imfsensordevice
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFSensorDevice extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFSensorDevice
     * @type {Guid}
     */
    static IID => Guid("{fb9f48f2-2a18-4e28-9730-786f30f04dc4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDeviceId", "GetDeviceType", "GetFlags", "GetSymbolicLink", "GetDeviceAttributes", "GetStreamAttributesCount", "GetStreamAttributes", "SetSensorDeviceMode", "GetSensorDeviceMode"]

    /**
     * Gets the unique identifier for the device. This value is currently unused.
     * @returns {Integer} The unique identifier for the device.
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfsensordevice-getdeviceid
     */
    GetDeviceId() {
        result := ComCall(3, this, "uint*", &pDeviceId := 0, "HRESULT")
        return pDeviceId
    }

    /**
     * Gets a value that specifies the type of sensor device represented by the object.
     * @returns {Integer} A value that specifies the type of sensor device represented by the object.
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfsensordevice-getdevicetype
     */
    GetDeviceType() {
        result := ComCall(4, this, "int*", &pType := 0, "HRESULT")
        return pType
    }

    /**
     * Gets the flags set for the sensor device. This method is reserved for future use.
     * @returns {Integer} The flags set for the sensor device.
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfsensordevice-getflags
     */
    GetFlags() {
        result := ComCall(5, this, "uint*", &pFlags := 0, "HRESULT")
        return pFlags
    }

    /**
     * Gets the symbolic link name of the sensor device.
     * @param {PWSTR} SymbolicLink Buffer of <i>cchSymbolicLink</i> characters where the symbolic link name will be written.  The buffer must be large enough to account for the null terminator.
     * @param {Integer} cchSymbolicLink Number of characters available in <i>SymbolicLink</i> buffer.
     * @returns {Integer} Output parameter containing the number of characters written to <i>SymbolicLink</i>.  This includes the null terminator.  If <i>SymbolicLink</i> is null and <i>cchSymbolicLink</i> is 0, <i>pcchWritten</i> will contain the number of characters needed (including the null terminator) to store the symbolic link name.
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfsensordevice-getsymboliclink
     */
    GetSymbolicLink(SymbolicLink, cchSymbolicLink) {
        SymbolicLink := SymbolicLink is String ? StrPtr(SymbolicLink) : SymbolicLink

        result := ComCall(6, this, "ptr", SymbolicLink, "int", cchSymbolicLink, "int*", &pcchWritten := 0, "HRESULT")
        return pcchWritten
    }

    /**
     * Gets the IMFAttributes for the sensor group.
     * @returns {IMFAttributes} The <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfattributes">IMFAttributes</a> interface representing the internal attribute store of the sensor device.
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfsensordevice-getdeviceattributes
     */
    GetDeviceAttributes() {
        result := ComCall(7, this, "ptr*", &ppAttributes := 0, "HRESULT")
        return IMFAttributes(ppAttributes)
    }

    /**
     * Gets the count of stream attribute stores for the sensor device. This number represents the number of total streams available for the device because every valid stream must have an attribute store that contains at least the stream ID and stream category.
     * @param {Integer} eType A member of the <a href="https://docs.microsoft.com/windows/win32/api/mfidl/ne-mfidl-mfsensorstreamtype">MFSensorStreamType</a> enumeration specifying whether the attribute store count is being requested for an input or output stream.
     * @returns {Integer} The number of stream attributes available for this sensor device.
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfsensordevice-getstreamattributescount
     */
    GetStreamAttributesCount(eType) {
        result := ComCall(8, this, "int", eType, "uint*", &pdwCount := 0, "HRESULT")
        return pdwCount
    }

    /**
     * Gets the stream attribute store with the specified index.
     * @param {Integer} eType A member of the <a href="https://docs.microsoft.com/windows/win32/api/mfidl/ne-mfidl-mfsensorstreamtype">MFSensorStreamType</a> enumeration specifying whether the attribute store is being requested for an input or output stream.
     * @param {Integer} dwIndex The 0-based index of the stream to be retrieved.  The index must be between 0 and the value returned by <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfsensordevice-getstreamattributescount">GetStreamAttributesCount</a> - 1.
     * @returns {IMFAttributes} The <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfattributes">IMFAttributes</a> interface representing a copy internal attribute store of the stream.
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfsensordevice-getstreamattributes
     */
    GetStreamAttributes(eType, dwIndex) {
        result := ComCall(9, this, "int", eType, "uint", dwIndex, "ptr*", &ppAttributes := 0, "HRESULT")
        return IMFAttributes(ppAttributes)
    }

    /**
     * Sets a value that specifies the sharing mode of the sensor device to either controller or shared.
     * @param {Integer} eMode A member of the <a href="https://docs.microsoft.com/windows/win32/api/mfidl/ne-mfidl-mfsensordevicemode">MFSensorDeviceMode</a> enumeration specifying wether the device is in shared or controller mode.
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
     * <dt><b>MF_E_NOT_INITIALIZED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The sensor group has not been initialized.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfsensordevice-setsensordevicemode
     */
    SetSensorDeviceMode(eMode) {
        result := ComCall(10, this, "int", eMode, "HRESULT")
        return result
    }

    /**
     * Gets a value that specifies the current sharing mode of the sensor device, which is either controller or shared.
     * @returns {Integer} If the call succeeds, receives a member of the <a href="https://docs.microsoft.com/windows/win32/api/mfidl/ne-mfidl-mfsensordevicemode">MFSensorDeviceMode</a>, specifying the current mode of the sendsor device.
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfsensordevice-getsensordevicemode
     */
    GetSensorDeviceMode() {
        result := ComCall(11, this, "int*", &peMode := 0, "HRESULT")
        return peMode
    }
}
