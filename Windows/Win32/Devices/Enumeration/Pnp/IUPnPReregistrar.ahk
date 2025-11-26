#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * The IUPnPReregistrar interface allows the application to re-register a UPnP-based device with the device host.
 * @see https://docs.microsoft.com/windows/win32/api//upnphost/nn-upnphost-iupnpreregistrar
 * @namespace Windows.Win32.Devices.Enumeration.Pnp
 * @version v4.0.30319
 */
class IUPnPReregistrar extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUPnPReregistrar
     * @type {Guid}
     */
    static IID => Guid("{204810b7-73b2-11d4-bf42-00b0d0118b56}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ReregisterDevice", "ReregisterRunningDevice"]

    /**
     * The ReregisterDevice method re-registers a device with the device host. The device information is stored by the device host. Then, the device host returns a device identifier and publishes and announces the device on the network.
     * @param {BSTR} bstrDeviceIdentifier Specifies the device identifier of the device. Use the identifier returned by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/upnphost/nf-upnphost-iupnpregistrar-registerdevice">IUPnPRegistrar::RegisterDevice</a>.
     * @param {BSTR} bstrXMLDesc Specifies the XML device description template of the device to register.
     * @param {BSTR} bstrProgIDDeviceControlClass Specifies the ProgID of a device control object that implements the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/upnphost/nn-upnphost-iupnpdevicecontrol">IUPnPDeviceControl</a> interface. This interface must be an in-process COM server (CLSCTX_INPROC_SERVER) and must be accessible to <a href="https://docs.microsoft.com/windows/desktop/Services/localservice-account">LocalService</a>.
     * @param {BSTR} bstrInitString Identifies the initialization string specific to the device. This string is later passed to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/upnphost/nf-upnphost-iupnpdevicecontrol-initialize">IUPnPDeviceControl::Initialize</a>.
     * @param {BSTR} bstrContainerId Specifies a string that identifies the process group in which the device belongs. All devices with the same container ID are contained in the same process.
     * @param {BSTR} bstrResourcePath Specifies the location of the resource directory of the device. This resource directory contains the icon files and service descriptions that are specified in the device description template <i>bstrXMLDesc</i>. The resource directory may also contain the presentation files. However, this is optional.
     * @param {Integer} nLifeTime Specifies the lifetime of the device announcement, in seconds. After the timeout expires, the announcements are refreshed. If you specify zero, the default value of 1800 (30 minutes) is used. The minimum allowable value is 900 (15 minutes); if you specify anything less than 900, an error is returned.
     * @returns {HRESULT} If the method succeeds, the return value is S_OK. Otherwise, the method returns one of the COM error codes defined in WinError.h, or one of the following UPnP-specific error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>UPNP_E_DEVICE_NOTREGISTERED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The device has not been registered. Use <a href="/windows/desktop/api/upnphost/nf-upnphost-iupnpregistrar-registerrunningdevice">RegisterRunningDevice</a> to register an unregistered device.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>UPNP_E_DEVICE_RUNNING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The device is currently running. Use <a href="/windows/desktop/api/upnphost/nf-upnphost-iupnpreregistrar-reregisterrunningdevice">ReregisterRunningDevice</a> to reregister a device while it is running.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>UPNP_E_DUPLICATE_NOT_ALLOWED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A duplicate element exists.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>UPNP_E_DUPLICATE_SERVICE_ID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A duplicate service ID for a service within the same parent device exists.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>UPNP_E_INVALID_DESCRIPTION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The device description is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>UPNP_E_INVALID_ICON</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error is present in the icon element of the device description.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>UPNP_E_INVALID_SERVICE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error is present in a service element in the device description.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>UPNP_E_REQUIRED_ELEMENT_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A required element is missing.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//upnphost/nf-upnphost-iupnpreregistrar-reregisterdevice
     */
    ReregisterDevice(bstrDeviceIdentifier, bstrXMLDesc, bstrProgIDDeviceControlClass, bstrInitString, bstrContainerId, bstrResourcePath, nLifeTime) {
        bstrDeviceIdentifier := bstrDeviceIdentifier is String ? BSTR.Alloc(bstrDeviceIdentifier).Value : bstrDeviceIdentifier
        bstrXMLDesc := bstrXMLDesc is String ? BSTR.Alloc(bstrXMLDesc).Value : bstrXMLDesc
        bstrProgIDDeviceControlClass := bstrProgIDDeviceControlClass is String ? BSTR.Alloc(bstrProgIDDeviceControlClass).Value : bstrProgIDDeviceControlClass
        bstrInitString := bstrInitString is String ? BSTR.Alloc(bstrInitString).Value : bstrInitString
        bstrContainerId := bstrContainerId is String ? BSTR.Alloc(bstrContainerId).Value : bstrContainerId
        bstrResourcePath := bstrResourcePath is String ? BSTR.Alloc(bstrResourcePath).Value : bstrResourcePath

        result := ComCall(3, this, "ptr", bstrDeviceIdentifier, "ptr", bstrXMLDesc, "ptr", bstrProgIDDeviceControlClass, "ptr", bstrInitString, "ptr", bstrContainerId, "ptr", bstrResourcePath, "int", nLifeTime, "HRESULT")
        return result
    }

    /**
     * The ReregisterRunningDevice method re-registers a running device with the device host.
     * @param {BSTR} bstrDeviceIdentifier Specifies the device identifier of the device. This must be the same identifier returned by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/upnphost/nf-upnphost-iupnpregistrar-registerrunningdevice">IUPnPRegistrar::RegisterRunningDevice</a> in the <i>pbstrDeviceIdentifier</i> parameter.
     * @param {BSTR} bstrXMLDesc Specifies the XML device description template of the device to register.
     * @param {IUnknown} punkDeviceControl Specifies the <b>IUnknown</b> pointer to the device's device control object.
     * @param {BSTR} bstrInitString Identifies the initialization string specific to the device. This string is later passed to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/upnphost/nf-upnphost-iupnpdevicecontrol-initialize">IUPnPDeviceControl::Initialize</a>.
     * @param {BSTR} bstrResourcePath Specifies the location of the resource directory of the device. This resource directory contains the icon files and service descriptions that are specified in the device description template <i>bstrXMLDesc</i>.
     * @param {Integer} nLifeTime Specifies the lifetime of the device announcement, in seconds. After the timeout expires, the announcements are refreshed. If you specify zero, the default value of 1800 (30 minutes) is used. The minimum allowable value is 900 (15 minutes); if you specify anything less than 900, an error is returned.
     * @returns {HRESULT} If the method succeeds, the return value is S_OK. Otherwise, the method returns one of the COM error codes defined in WinError.h, or one of the following UPnP-specific error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>UPNP_E_DEVICE_NOTREGISTERED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The device has not been registered. Use <a href="/windows/desktop/api/upnphost/nf-upnphost-iupnpregistrar-registerrunningdevice">RegisterRunningDevice</a> to register an unregistered device.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>UPNP_E_DUPLICATE_NOT_ALLOWED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A duplicate element exists.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>UPNP_E_DUPLICATE_SERVICE_ID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A duplicate service ID for a service within the same parent device exists.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>UPNP_E_INVALID_DESCRIPTION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The device description is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>UPNP_E_INVALID_ICON</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error is present in the icon element of the device description.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>UPNP_E_INVALID_SERVICE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error is present in a service element in the device description.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>UPNP_E_REQUIRED_ELEMENT_ERROR</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A required element is missing.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//upnphost/nf-upnphost-iupnpreregistrar-reregisterrunningdevice
     */
    ReregisterRunningDevice(bstrDeviceIdentifier, bstrXMLDesc, punkDeviceControl, bstrInitString, bstrResourcePath, nLifeTime) {
        bstrDeviceIdentifier := bstrDeviceIdentifier is String ? BSTR.Alloc(bstrDeviceIdentifier).Value : bstrDeviceIdentifier
        bstrXMLDesc := bstrXMLDesc is String ? BSTR.Alloc(bstrXMLDesc).Value : bstrXMLDesc
        bstrInitString := bstrInitString is String ? BSTR.Alloc(bstrInitString).Value : bstrInitString
        bstrResourcePath := bstrResourcePath is String ? BSTR.Alloc(bstrResourcePath).Value : bstrResourcePath

        result := ComCall(4, this, "ptr", bstrDeviceIdentifier, "ptr", bstrXMLDesc, "ptr", punkDeviceControl, "ptr", bstrInitString, "ptr", bstrResourcePath, "int", nLifeTime, "HRESULT")
        return result
    }
}
