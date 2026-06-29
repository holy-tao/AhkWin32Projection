#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IMFMediaSource.ahk" { IMFMediaSource }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IMFAttributes.ahk" { IMFAttributes }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\IMFSensorDevice.ahk" { IMFSensorDevice }

/**
 * Represents a group of sensor devices from which an IMFMediaSource can be created.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/nn-mfidl-imfsensorgroup
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFSensorGroup extends IUnknown {
    /**
     * The interface identifier for IMFSensorGroup
     * @type {Guid}
     */
    static IID := Guid("{4110243a-9757-461f-89f1-f22345bcab4e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFSensorGroup interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetSymbolicLink             : IntPtr
        GetFlags                    : IntPtr
        GetSensorGroupAttributes    : IntPtr
        GetSensorDeviceCount        : IntPtr
        GetSensorDevice             : IntPtr
        SetDefaultSensorDeviceIndex : IntPtr
        GetDefaultSensorDeviceIndex : IntPtr
        CreateMediaSource           : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFSensorGroup.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the symbolic link name of the sensor group.
     * @param {PWSTR} SymbolicLink Buffer of <i>cchSymbolicLink</i> characters where the symbolic link name will be written.  The buffer must be large enough to account for the null terminator.
     * @param {Integer} cchSymbolicLink Number of characters available in <i>SymbolicLink</i> buffer.
     * @returns {Integer} Output parameter containing the number of characters written to <i>SymbolicLink</i>.  This includes the null terminator.  If <i>SymbolicLink</i> is null and <i>cchSymbolicLink</i> is 0, <i>pcchWritten</i> will contain the number of characters needed (including the null terminator) to store the symbolic link name.
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfsensorgroup-getsymboliclink
     */
    GetSymbolicLink(SymbolicLink, cchSymbolicLink) {
        SymbolicLink := SymbolicLink is String ? StrPtr(SymbolicLink) : SymbolicLink

        result := ComCall(3, this, "ptr", SymbolicLink, "int", cchSymbolicLink, "int*", &pcchWritten := 0, "HRESULT")
        return pcchWritten
    }

    /**
     * Gets the flags set for the sensor group.
     * @remarks
     * Currently, no flags are defined for Sensor Groups.
     * @returns {Integer} The flags set for the sensor group
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfsensorgroup-getflags
     */
    GetFlags() {
        result := ComCall(4, this, "uint*", &pFlags := 0, "HRESULT")
        return pFlags
    }

    /**
     * Gets the IMFAttributes for the sensor group. The returned object is a live reference to the internal attribute store.
     * @remarks
     * The caller may optionally use this attribute store to query for attributes set on the sensor group or modify/add attributes to the sensor group.  Modification of this attribute set is not persisted and will only be valid for the instance of the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfsensorgroup">IMFSensorGroup</a>.
     * 
     * 
     * This attribute store can be used to add runtime attributes for the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfmediasource">IMFMediaSource</a> that can be created using the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfsensorgroup-createmediasource">IMFSensorGroup::CreateMediaSource</a> method.
     * @returns {IMFAttributes} The <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfattributes">IMFAttributes</a> interface representing the internal attribute store of the sensor group.
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfsensorgroup-getsensorgroupattributes
     */
    GetSensorGroupAttributes() {
        result := ComCall(5, this, "ptr*", &ppAttributes := 0, "HRESULT")
        return IMFAttributes(ppAttributes)
    }

    /**
     * Gets the number of devices that are virtualized by the sensor group.
     * @remarks
     * The term "device" in this context could refer to a physical device, a custom media source, or a frame provider.
     * @returns {Integer} The number of devices in the sensor group.
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfsensorgroup-getsensordevicecount
     */
    GetSensorDeviceCount() {
        result := ComCall(6, this, "uint*", &pdwCount := 0, "HRESULT")
        return pdwCount
    }

    /**
     * Gets the IMFSensorDevice corresponding to a device in the sensor group.
     * @remarks
     * The term "device" in this context could refer to a physical device, a custom media source, or a frame provider.
     * @param {Integer} dwIndex The 0-based index of the device to be retrieved.  The index must be between 0 and the value returned by <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfsensorgroup-getsensordevicecount">GetSensorDeviceCount</a> - 1.
     * @returns {IMFSensorDevice} If the call is successful, <i>ppDevice</i> will contain the retrieved sensor device.
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfsensorgroup-getsensordevice
     */
    GetSensorDevice(dwIndex) {
        result := ComCall(7, this, "uint", dwIndex, "ptr*", &ppDevice := 0, "HRESULT")
        return IMFSensorDevice(ppDevice)
    }

    /**
     * Configures one of the devices in the sensor group as the default device.
     * @remarks
     * The term "device" in this context could refer to a physical device, a custom media source, or a frame provider.
     * 
     * If this method is not called, the first device in the Sensor Group (i.e. the device with index 0) will be used.
     * @param {Integer} dwIndex 0-based index of the device to be set as default.  The index must be between 0 and the value returned by <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfsensorgroup-getsensordevicecount">GetSensorDeviceCount</a> - 1.
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
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfsensorgroup-setdefaultsensordeviceindex
     */
    SetDefaultSensorDeviceIndex(dwIndex) {
        result := ComCall(8, this, "uint", dwIndex, "HRESULT")
        return result
    }

    /**
     * Retrieves the index of the default device in the sensor group.
     * @remarks
     * The term "device" in this context could refer to a physical device, a custom media source, or a frame provider.
     * 
     * If this <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfsensorgroup-setdefaultsensordeviceindex">SetDefaultSensorDevice</a> has not been called, the first device in the Sensor Group (i.e. index 0) will be returned.
     * @returns {Integer} If the call succeeds, <i>pdwIndex</i> receives the index of the default device.
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfsensorgroup-getdefaultsensordeviceindex
     */
    GetDefaultSensorDeviceIndex() {
        result := ComCall(9, this, "uint*", &pdwIndex := 0, "HRESULT")
        return pdwIndex
    }

    /**
     * Creates an IMFMediaSource that virtualizes the sensor group.
     * @returns {IMFMediaSource} Receives a pointer to the created media source.
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfsensorgroup-createmediasource
     */
    CreateMediaSource() {
        result := ComCall(10, this, "ptr*", &ppSource := 0, "HRESULT")
        return IMFMediaSource(ppSource)
    }

    Query(iid) {
        if (IMFSensorGroup.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetSymbolicLink := CallbackCreate(GetMethod(implObj, "GetSymbolicLink"), flags, 4)
        this.vtbl.GetFlags := CallbackCreate(GetMethod(implObj, "GetFlags"), flags, 2)
        this.vtbl.GetSensorGroupAttributes := CallbackCreate(GetMethod(implObj, "GetSensorGroupAttributes"), flags, 2)
        this.vtbl.GetSensorDeviceCount := CallbackCreate(GetMethod(implObj, "GetSensorDeviceCount"), flags, 2)
        this.vtbl.GetSensorDevice := CallbackCreate(GetMethod(implObj, "GetSensorDevice"), flags, 3)
        this.vtbl.SetDefaultSensorDeviceIndex := CallbackCreate(GetMethod(implObj, "SetDefaultSensorDeviceIndex"), flags, 2)
        this.vtbl.GetDefaultSensorDeviceIndex := CallbackCreate(GetMethod(implObj, "GetDefaultSensorDeviceIndex"), flags, 2)
        this.vtbl.CreateMediaSource := CallbackCreate(GetMethod(implObj, "CreateMediaSource"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetSymbolicLink)
        CallbackFree(this.vtbl.GetFlags)
        CallbackFree(this.vtbl.GetSensorGroupAttributes)
        CallbackFree(this.vtbl.GetSensorDeviceCount)
        CallbackFree(this.vtbl.GetSensorDevice)
        CallbackFree(this.vtbl.SetDefaultSensorDeviceIndex)
        CallbackFree(this.vtbl.GetDefaultSensorDeviceIndex)
        CallbackFree(this.vtbl.CreateMediaSource)
    }
}
