#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\DRM_VAL16.ahk" { DRM_VAL16 }
#Import ".\INSSBuffer.ahk" { INSSBuffer }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IWMRegisteredDevice interface is the primary interface of the registered device object. It provides access to information about a playback device in the device registration database.
 * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nn-wmsdkidl-iwmregistereddevice
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 */
export default struct IWMRegisteredDevice extends IUnknown {
    /**
     * The interface identifier for IWMRegisteredDevice
     * @type {Guid}
     */
    static IID := Guid("{a4503bec-5508-4148-97ac-bfa75760a70d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWMRegisteredDevice interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetDeviceSerialNumber : IntPtr
        GetDeviceCertificate  : IntPtr
        GetDeviceType         : IntPtr
        GetAttributeCount     : IntPtr
        GetAttributeByIndex   : IntPtr
        GetAttributeByName    : IntPtr
        SetAttributeByName    : IntPtr
        Approve               : IntPtr
        IsValid               : IntPtr
        IsApproved            : IntPtr
        IsWmdrmCompliant      : IntPtr
        IsOpened              : IntPtr
        Open                  : IntPtr
        Close                 : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWMRegisteredDevice.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The GetDeviceID method retrieves the 128-bit value that identifies the device.
     * @remarks
     * The serial number can be any value that can be stored in 128 bits of memory.
     * 
     * Together, the device serial number and the device certificate uniquely identify the device. Manufacturers are encouraged to use a separate certificate for each device. However, a manufacturer may share a certificate between all devices of a particular type, differentiating individual devices by serial number.
     * @returns {DRM_VAL16} Address of a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wmsdkidl/ns-wmsdkidl-drm_val16">DRM_VAL16</a> structure that receives the device serial number.
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmregistereddevice-getdeviceserialnumber
     */
    GetDeviceSerialNumber() {
        pSerialNumber := DRM_VAL16()
        result := ComCall(3, this, DRM_VAL16.Ptr, pSerialNumber, "HRESULT")
        return pSerialNumber
    }

    /**
     * The GetDeviceCertificate method retrieves the certificate of the device.
     * @remarks
     * The device certificate contains protection information related to the device.
     * 
     * Together, the device certificate and the device serial number uniquely identify the device. Manufacturers are encouraged to use a separate certificate for each device. However, a manufacturer may share a certificate between all devices of a particular type, differentiating individual devices by serial number.
     * @returns {INSSBuffer} Address of a variable that receives a pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wmsbuffer/nn-wmsbuffer-inssbuffer">INSSBuffer</a> interface of the buffer object that contains the certificate data.
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmregistereddevice-getdevicecertificate
     */
    GetDeviceCertificate() {
        result := ComCall(4, this, "ptr*", &ppCertificate := 0, "HRESULT")
        return INSSBuffer(ppCertificate)
    }

    /**
     * The GetDeviceType method retrieves the device type associated with the device.
     * @remarks
     * Devices that support Windows Media DRM 10 for Network Devices use the DRM_DEVICE_REGISTER_TYPE_STREAMING register type. To determine whether the device supports Windows Media DRM 10 for Network Devices, call <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmregistereddevice-iswmdrmcompliant">IsWmdrmCompliant</a>.
     * 
     * The DRM_DEVICE_REGISTER_TYPE_STORAGE register type is defined, but is not used in this release.
     * @returns {Integer} Address of a variable that receives the device type.
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmregistereddevice-getdevicetype
     */
    GetDeviceType() {
        result := ComCall(5, this, "uint*", &pdwType := 0, "HRESULT")
        return pdwType
    }

    /**
     * The GetAttributeCount method retrieves the total number of attributes associated with the device.
     * @remarks
     * To enumerate the device attributes, first call this method and then call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmregistereddevice-getattributebyindex">GetAttributeByIndex</a> for index values from zero through one less than the total number of attributes.
     * @returns {Integer} Address of a variable that receives the number of attributes.
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmregistereddevice-getattributecount
     */
    GetAttributeCount() {
        result := ComCall(6, this, "uint*", &pcAttributes := 0, "HRESULT")
        return pcAttributes
    }

    /**
     * The GetAttributeByIndex method retrieves an attribute associated with the device. This method uses the attribute index to specify the attribute to retrieve.
     * @param {Integer} dwIndex Attribute index. Valid indexes range from zero to one less than the number of attributes returned by <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmregistereddevice-getattributecount">GetAttributeCount</a>.
     * @param {Pointer<BSTR>} pbstrName Address of a variable that receives the attribute name.
     * @param {Pointer<BSTR>} pbstrValue Address of a variable that receives the attribute value.
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
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmregistereddevice-getattributebyindex
     */
    GetAttributeByIndex(dwIndex, pbstrName, pbstrValue) {
        result := ComCall(7, this, "uint", dwIndex, BSTR.Ptr, pbstrName, BSTR.Ptr, pbstrValue, "HRESULT")
        return result
    }

    /**
     * The GetAttributeByName method retrieves an attribute associated with the device. This method uses an attribute name to specify the attribute to retrieve.
     * @param {BSTR} bstrName Name of the attribute to retrieve.
     * @returns {BSTR} Address of a variable that receives the attribute value.
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmregistereddevice-getattributebyname
     */
    GetAttributeByName(bstrName) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName

        pbstrValue := BSTR.Owned()
        result := ComCall(8, this, BSTR, bstrName, BSTR.Ptr, pbstrValue, "HRESULT")
        return pbstrValue
    }

    /**
     * The SetAttributeByName method sets a device attribute.
     * @param {BSTR} bstrName Name of the attribute to set.
     * @param {BSTR} bstrValue Value of the attribute.
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
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmregistereddevice-setattributebyname
     */
    SetAttributeByName(bstrName, bstrValue) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName
        bstrValue := bstrValue is String ? BSTR.Alloc(bstrValue).Value : bstrValue

        result := ComCall(9, this, BSTR, bstrName, BSTR, bstrValue, "HRESULT")
        return result
    }

    /**
     * The Approve method sets the approval state of the device for receiving media data.
     * @remarks
     * Approval is a mechanism by which your application can approve a device for playback or prohibit it from being used for playback. A typical scenario would be to ask the user whether the device should be used, and to set approval accordingly.
     * 
     * To receive data, a device must be opened, validated, and approved.
     * 
     * You can find out whether the device is open by calling <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmregistereddevice-isopened">IsOpened</a>. To open the device call <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmregistereddevice-open">Open</a>.
     * 
     * The device is valid only if proximity detection has been performed on it within the past 48 hours. You can check the validity of the device by calling <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmregistereddevice-isvalid">IsValid</a>. For more information, see the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nn-wmsdkidl-iwmproximitydetection">IWMProximityDetection</a> interface.
     * 
     * Call the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmregistereddevice-isapproved">IsApproved</a> method to determine whether the device is approved. Use <b>Approve</b> to approve or restrict the device.
     * @param {BOOL} fApprove Set to <b>TRUE</b> to approve the device for receiving media data; set to <b>FALSE</b> to indicate that the device is not approved.
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
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmregistereddevice-approve
     */
    Approve(fApprove) {
        result := ComCall(10, this, BOOL, fApprove, "HRESULT")
        return result
    }

    /**
     * The IsValid method retrieves the validation status of the device.
     * @remarks
     * To receive data, a device must be opened, validated, and approved.
     * 
     * You can find out whether the device is open by calling <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmregistereddevice-isopened">IsOpened</a>. To open the device call <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmregistereddevice-open">Open</a>.
     * 
     * A device is validated by performing proximity detection. For more information, see the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nn-wmsdkidl-iwmproximitydetection">IWMProximityDetection</a> interface.
     * 
     * Call the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmregistereddevice-isapproved">IsApproved</a> method to determine whether the device is approved. To approve the device, call the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmregistereddevice-approve">Approve</a> method.
     * @returns {BOOL} Address of a variable that receives the validation status of the device. <b>TRUE</b> indicates that the device is valid. <b>FALSE</b> indicates that the device is not valid and needs to be revalidated before it can be used.
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmregistereddevice-isvalid
     */
    IsValid() {
        result := ComCall(11, this, BOOL.Ptr, &pfValid := 0, "HRESULT")
        return pfValid
    }

    /**
     * The IsApproved method retrieves the approval status of the device. Approved devices are able to receive and play media data.
     * @remarks
     * To receive data, a device must be opened, validated, and approved.
     * 
     * You can find out whether the device is open by calling <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmregistereddevice-isopened">IsOpened</a>. To open the device call <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmregistereddevice-open">Open</a>.
     * 
     * The device is valid only if proximity detection has been performed on it within the past 48 hours. You can check the validity of the device by calling <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmregistereddevice-isvalid">IsValid</a>. For more information, see the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nn-wmsdkidl-iwmproximitydetection">IWMProximityDetection</a> interface.
     * 
     * Use this method to discover whether the device is approved. To approve the device, call the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmregistereddevice-approve">Approve</a> method.
     * @returns {BOOL} Address of a variable that receives the device approval status. <b>TRUE</b> indicates approval.
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmregistereddevice-isapproved
     */
    IsApproved() {
        result := ComCall(12, this, BOOL.Ptr, &pfApproved := 0, "HRESULT")
        return pfApproved
    }

    /**
     * The IsWmdrmCompliant method retrieves the DRM compliance status of the device. Compliant devices can receive data using the Windows Media DRM 10 for Network Devices protocol.
     * @returns {BOOL} Address of a variable that receives the device DRM compliance status. <b>TRUE</b> indicates that Windows Media DRM 10 for Network Devices is supported.
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmregistereddevice-iswmdrmcompliant
     */
    IsWmdrmCompliant() {
        result := ComCall(13, this, BOOL.Ptr, &pfCompliant := 0, "HRESULT")
        return pfCompliant
    }

    /**
     * The IsOpened method retrieves the open status of the device. An open device is ready to receive media data.
     * @remarks
     * To receive data, a device must be opened, validated, and approved.
     * 
     * You can use this method to find out whether the device is open. To open the device call <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmregistereddevice-open">Open</a>.
     * 
     * The device is valid only if proximity detection has been performed on it within the past 48 hours. You can check the validity of the device by calling <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmregistereddevice-isvalid">IsValid</a>. For more information, see the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nn-wmsdkidl-iwmproximitydetection">IWMProximityDetection</a> interface.
     * 
     * Call the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmregistereddevice-isapproved">IsApproved</a> method to determine whether the device is approved. To approve the device, call the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmregistereddevice-approve">Approve</a> method.
     * @returns {BOOL} Address of a variable that receives the open status of the device. <b>TRUE</b> indicates that the device is open.
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmregistereddevice-isopened
     */
    IsOpened() {
        result := ComCall(14, this, BOOL.Ptr, &pfOpened := 0, "HRESULT")
        return pfOpened
    }

    /**
     * The Open method opens the device so that it can receive media data.
     * @remarks
     * To receive data, a device must be opened, validated, and approved.
     * 
     * Use this method to open the device. To determine whether the device is already open, call <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmregistereddevice-isopened">IsOpened</a>. Only 10 devices can be open on a computer at a time.
     * 
     * The device is valid only if proximity detection has been performed on it within the past 48 hours. You can check the validity of the device by calling <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmregistereddevice-isvalid">IsValid</a>. For more information, see the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nn-wmsdkidl-iwmproximitydetection">IWMProximityDetection</a> interface.
     * 
     * Call the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmregistereddevice-isapproved">IsApproved</a> method to determine whether the device is approved. To approve the device, call the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmregistereddevice-approve">Approve</a> method.
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
     * <dt><b>NS_E_DRM_DEVICE_LIMIT_REACHED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The client computer already has the maximum number of devices opened.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmregistereddevice-open
     */
    Open() {
        result := ComCall(15, this, "HRESULT")
        return result
    }

    /**
     * The Close method closes the device, if it is open. It also releases all resources associated with the device.
     * @remarks
     * Although this method returns immediately, it does not release resources associated with the device until after 30 to 60 seconds.
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
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmregistereddevice-close
     */
    Close() {
        result := ComCall(16, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWMRegisteredDevice.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetDeviceSerialNumber := CallbackCreate(GetMethod(implObj, "GetDeviceSerialNumber"), flags, 2)
        this.vtbl.GetDeviceCertificate := CallbackCreate(GetMethod(implObj, "GetDeviceCertificate"), flags, 2)
        this.vtbl.GetDeviceType := CallbackCreate(GetMethod(implObj, "GetDeviceType"), flags, 2)
        this.vtbl.GetAttributeCount := CallbackCreate(GetMethod(implObj, "GetAttributeCount"), flags, 2)
        this.vtbl.GetAttributeByIndex := CallbackCreate(GetMethod(implObj, "GetAttributeByIndex"), flags, 4)
        this.vtbl.GetAttributeByName := CallbackCreate(GetMethod(implObj, "GetAttributeByName"), flags, 3)
        this.vtbl.SetAttributeByName := CallbackCreate(GetMethod(implObj, "SetAttributeByName"), flags, 3)
        this.vtbl.Approve := CallbackCreate(GetMethod(implObj, "Approve"), flags, 2)
        this.vtbl.IsValid := CallbackCreate(GetMethod(implObj, "IsValid"), flags, 2)
        this.vtbl.IsApproved := CallbackCreate(GetMethod(implObj, "IsApproved"), flags, 2)
        this.vtbl.IsWmdrmCompliant := CallbackCreate(GetMethod(implObj, "IsWmdrmCompliant"), flags, 2)
        this.vtbl.IsOpened := CallbackCreate(GetMethod(implObj, "IsOpened"), flags, 2)
        this.vtbl.Open := CallbackCreate(GetMethod(implObj, "Open"), flags, 1)
        this.vtbl.Close := CallbackCreate(GetMethod(implObj, "Close"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetDeviceSerialNumber)
        CallbackFree(this.vtbl.GetDeviceCertificate)
        CallbackFree(this.vtbl.GetDeviceType)
        CallbackFree(this.vtbl.GetAttributeCount)
        CallbackFree(this.vtbl.GetAttributeByIndex)
        CallbackFree(this.vtbl.GetAttributeByName)
        CallbackFree(this.vtbl.SetAttributeByName)
        CallbackFree(this.vtbl.Approve)
        CallbackFree(this.vtbl.IsValid)
        CallbackFree(this.vtbl.IsApproved)
        CallbackFree(this.vtbl.IsWmdrmCompliant)
        CallbackFree(this.vtbl.IsOpened)
        CallbackFree(this.vtbl.Open)
        CallbackFree(this.vtbl.Close)
    }
}
