#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\DRM_VAL16.ahk
#Include .\INSSBuffer.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IWMRegisteredDevice interface is the primary interface of the registered device object. It provides access to information about a playback device in the device registration database.
 * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nn-wmsdkidl-iwmregistereddevice
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class IWMRegisteredDevice extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMRegisteredDevice
     * @type {Guid}
     */
    static IID => Guid("{a4503bec-5508-4148-97ac-bfa75760a70d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDeviceSerialNumber", "GetDeviceCertificate", "GetDeviceType", "GetAttributeCount", "GetAttributeByIndex", "GetAttributeByName", "SetAttributeByName", "Approve", "IsValid", "IsApproved", "IsWmdrmCompliant", "IsOpened", "Open", "Close"]

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
        result := ComCall(3, this, "ptr", pSerialNumber, "HRESULT")
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
        result := ComCall(7, this, "uint", dwIndex, "ptr", pbstrName, "ptr", pbstrValue, "HRESULT")
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

        pbstrValue := BSTR()
        result := ComCall(8, this, "ptr", bstrName, "ptr", pbstrValue, "HRESULT")
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

        result := ComCall(9, this, "ptr", bstrName, "ptr", bstrValue, "HRESULT")
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
        result := ComCall(10, this, "int", fApprove, "HRESULT")
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
        result := ComCall(11, this, "int*", &pfValid := 0, "HRESULT")
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
        result := ComCall(12, this, "int*", &pfApproved := 0, "HRESULT")
        return pfApproved
    }

    /**
     * The IsWmdrmCompliant method retrieves the DRM compliance status of the device. Compliant devices can receive data using the Windows Media DRM 10 for Network Devices protocol.
     * @returns {BOOL} Address of a variable that receives the device DRM compliance status. <b>TRUE</b> indicates that Windows Media DRM 10 for Network Devices is supported.
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmregistereddevice-iswmdrmcompliant
     */
    IsWmdrmCompliant() {
        result := ComCall(13, this, "int*", &pfCompliant := 0, "HRESULT")
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
        result := ComCall(14, this, "int*", &pfOpened := 0, "HRESULT")
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
}
