#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * The IUPnPRegistrar interface registers the devices that run in the context of the device host.
 * @see https://learn.microsoft.com/windows/win32/api/upnphost/nn-upnphost-iupnpregistrar
 * @namespace Windows.Win32.Devices.Enumeration.Pnp
 * @version v4.0.30319
 */
class IUPnPRegistrar extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUPnPRegistrar
     * @type {Guid}
     */
    static IID => Guid("{204810b6-73b2-11d4-bf42-00b0d0118b56}")

    /**
     * The class identifier for UPnPRegistrar
     * @type {Guid}
     */
    static CLSID => Guid("{204810b9-73b2-11d4-bf42-00b0d0118b56}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["RegisterDevice", "RegisterRunningDevice", "RegisterDeviceProvider", "GetUniqueDeviceName", "UnregisterDevice", "UnregisterDeviceProvider"]

    /**
     * The RegisterDevice method registers a device with the device host. The device information is stored by the device host. Then, the device host returns a device identifier and publishes and announces the device on the network.
     * @remarks
     * A device is instantiated and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/upnphost/nf-upnphost-iupnpdevicecontrol-initialize">IUPnPDeviceControl::Initialize</a> is invoked when a control or event request is received.
     * 
     * Use the identifier returned in <i>pbstrDeviceIdentifier</i> when invoking 
     * <a href="https://docs.microsoft.com/windows/desktop/api/upnphost/nf-upnphost-iupnpregistrar-unregisterdevice">UnregisterDevice</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/upnphost/nf-upnphost-iupnpreregistrar-reregisterdevice">IUPnPReregistrar::ReregisterDevice</a>.
     * 
     * 
     * Common errors that can occur when invoking this function include:
     * 
     * <ul>
     * <li>The necessary COM object was not found.</li>
     * <li>There is no access to the COM object for <a href="https://docs.microsoft.com/windows/desktop/Services/localservice-account">LocalService</a>.</li>
     * <li>Subordinate COM interfaces.</li>
     * <li>The XML description limits (see 
     * <a href="https://docs.microsoft.com/windows/desktop/UPnP/creating-a-device-description">Creating a Device Description</a>).</li>
     * <li>Evented variables did not return success codes and the device was shut down.</li>
     * <li>The service description was invalid. Use validatesd.exe to ensure that service descriptions are valid.</li>
     * <li>The service did not implement IUPnPEventSource and did not return a success code to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/upnphost/nf-upnphost-iupnpeventsource-advise">IUPnPEventSource::Advise</a> and the device was shut down.</li>
     * </ul>
     * @param {BSTR} bstrXMLDesc Specifies the XML device description template of the device to register.
     * @param {BSTR} bstrProgIDDeviceControlClass Specifies the ProgID of a device control object that implements the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/upnphost/nn-upnphost-iupnpdevicecontrol">IUPnPDeviceControl</a> interface. This interface must be an in-process COM server (CLSCTX_INPROC_SERVER) and must be accessible to <a href="https://docs.microsoft.com/windows/desktop/Services/localservice-account">LocalService</a>.
     * @param {BSTR} bstrInitString Identifies the initialization string specific to the device. This string is later passed to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/upnphost/nf-upnphost-iupnpdevicecontrol-initialize">IUPnPDeviceControl::Initialize</a>.
     * @param {BSTR} bstrContainerId Specifies a string that identifies the process group in which the device belongs. All devices with the same container ID are contained in the same process.
     * @param {BSTR} bstrResourcePath Specifies the location of the resource directory of the device. This resource directory contains the icon files and service descriptions that are specified in the device description template <i>bstrXMLDesc</i>. The resource directory may also contain the presentation files. However, this is optional.
     * @param {Integer} nLifeTime Specifies the lifetime of the device announcement, in seconds. After the timeout expires, the announcements are refreshed. If you specify zero, the default value of 1800 (30 minutes) is used. The minimum allowable value is 900 (15 minutes); if you specify anything less than 900, an error is returned.
     * @returns {BSTR} Receives the device identifier. Use this identifier when unregistering or re-registering the device. Save this Device ID; you must use it when calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/upnphost/nf-upnphost-iupnpregistrar-unregisterdevice">UnregisterDevice</a>.
     * @see https://learn.microsoft.com/windows/win32/api/upnphost/nf-upnphost-iupnpregistrar-registerdevice
     */
    RegisterDevice(bstrXMLDesc, bstrProgIDDeviceControlClass, bstrInitString, bstrContainerId, bstrResourcePath, nLifeTime) {
        bstrXMLDesc := bstrXMLDesc is String ? BSTR.Alloc(bstrXMLDesc).Value : bstrXMLDesc
        bstrProgIDDeviceControlClass := bstrProgIDDeviceControlClass is String ? BSTR.Alloc(bstrProgIDDeviceControlClass).Value : bstrProgIDDeviceControlClass
        bstrInitString := bstrInitString is String ? BSTR.Alloc(bstrInitString).Value : bstrInitString
        bstrContainerId := bstrContainerId is String ? BSTR.Alloc(bstrContainerId).Value : bstrContainerId
        bstrResourcePath := bstrResourcePath is String ? BSTR.Alloc(bstrResourcePath).Value : bstrResourcePath

        pbstrDeviceIdentifier := BSTR()
        result := ComCall(3, this, "ptr", bstrXMLDesc, "ptr", bstrProgIDDeviceControlClass, "ptr", bstrInitString, "ptr", bstrContainerId, "ptr", bstrResourcePath, "int", nLifeTime, "ptr", pbstrDeviceIdentifier, "HRESULT")
        return pbstrDeviceIdentifier
    }

    /**
     * The RegisterRunningDevice method registers a running device with the device host.
     * @remarks
     * The client that invokes this method must be able to impersonate <a href="https://docs.microsoft.com/windows/desktop/Services/localservice-account">LocalService</a> in order to complete the processing of this method.
     * 
     * The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/upnphost/nf-upnphost-iupnpdevicecontrol-initialize">IUPnPDeviceControl::Initialize</a> method is invoked when the first control or event request is received.
     * 
     * Use the identifier returned in <i>pbstrDeviceIdentifier</i> when invoking 
     * <a href="https://docs.microsoft.com/windows/desktop/api/upnphost/nf-upnphost-iupnpregistrar-unregisterdevice">UnregisterDevice</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/upnphost/nf-upnphost-iupnpreregistrar-reregisterrunningdevice">IUPnPReregistrar::ReregisterRunningDevice</a>.
     * 
     * The registration of this device does not persist across system boots.
     * 
     * 
     * Common errors that can occur when invoking this function include:
     * 
     * <ul>
     * <li>The necessary COM object was not found.</li>
     * <li>There is no access to the COM object for <a href="https://docs.microsoft.com/windows/desktop/Services/localservice-account">LocalService</a>.</li>
     * <li>Subordinate COM interfaces.</li>
     * <li>The XML description limits (see 
     * <a href="https://docs.microsoft.com/windows/desktop/UPnP/creating-a-device-description">Creating a Device Description</a>).</li>
     * <li>Evented variables did not return success codes and the device was shut down.</li>
     * <li>The service description was invalid. Use validatesd.exe to ensure that service descriptions are valid.</li>
     * <li>The service did not implement IUPnPEventSource and did not return a success code to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/upnphost/nf-upnphost-iupnpeventsource-advise">IUPnPEventSource::Advise</a> and the device was shut down.</li>
     * </ul>
     * @param {BSTR} bstrXMLDesc Specifies the XML device description template of the device to register.
     * @param {IUnknown} punkDeviceControl Specifies the <b>IUnknown</b> pointer to the device's device control object.
     * @param {BSTR} bstrInitString Identifies the initialization string specific to the device. This string is later passed to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/upnphost/nf-upnphost-iupnpdevicecontrol-initialize">IUPnPDeviceControl::Initialize</a>.
     * @param {BSTR} bstrResourcePath Specifies the location of the resource directory of the device. This resource directory contains the icon files and service descriptions that are specified in the device description template <i>bstrXMLDesc</i>.
     * @param {Integer} nLifeTime Specifies the lifetime of the device announcement, in seconds. After the timeout expires, the announcements are refreshed. If you specify zero, the default value of 1800 (30 minutes) is used. The minimum allowable value is 900 (15 minutes); if you specify anything less than 900, an error is returned.
     * @returns {BSTR} Receives the device identifier. Use this identifier when unregistering or re-registering the device. Save this Device ID; you must use it when calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/upnphost/nf-upnphost-iupnpregistrar-unregisterdevice">UnregisterDevice</a>.
     * @see https://learn.microsoft.com/windows/win32/api/upnphost/nf-upnphost-iupnpregistrar-registerrunningdevice
     */
    RegisterRunningDevice(bstrXMLDesc, punkDeviceControl, bstrInitString, bstrResourcePath, nLifeTime) {
        bstrXMLDesc := bstrXMLDesc is String ? BSTR.Alloc(bstrXMLDesc).Value : bstrXMLDesc
        bstrInitString := bstrInitString is String ? BSTR.Alloc(bstrInitString).Value : bstrInitString
        bstrResourcePath := bstrResourcePath is String ? BSTR.Alloc(bstrResourcePath).Value : bstrResourcePath

        pbstrDeviceIdentifier := BSTR()
        result := ComCall(4, this, "ptr", bstrXMLDesc, "ptr", punkDeviceControl, "ptr", bstrInitString, "ptr", bstrResourcePath, "int", nLifeTime, "ptr", pbstrDeviceIdentifier, "HRESULT")
        return pbstrDeviceIdentifier
    }

    /**
     * The RegisterDeviceProvider method registers a device provider with the device host. The device provider is not published on the network. Instead, it creates devices dynamically and registers them using RegisterRunningDevice.
     * @remarks
     * Common errors that can occur when invoking this function include:
     * 
     * <ul>
     * <li>The necessary COM object was not found.</li>
     * <li>There is no access to the COM object for <a href="https://docs.microsoft.com/windows/desktop/Services/localservice-account">LocalService</a>.</li>
     * <li>Subordinate COM interfaces.</li>
     * </ul>
     * @param {BSTR} bstrProviderName Specifies the name of the device provider.
     * @param {BSTR} bstrProgIDProviderClass Specifies the ProgID of object that implements the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/upnphost/nn-upnphost-iupnpdeviceprovider">IUPnPDeviceProvider</a> interface. This object must already be registered with COM. This object must be an in-process COM server (CLSCTX_INPROC_SERVER) and must be accessible to <a href="https://docs.microsoft.com/windows/desktop/Services/localservice-account">LocalService</a>.
     * @param {BSTR} bstrInitString Identifies an initialization string specific to a device provider.
     * @param {BSTR} bstrContainerId Specifies a string that identifies the process group in which the device provider belongs. All devices and device providers with the same container ID are contained in the same process.
     * @returns {HRESULT} If the method succeeds, the return value is S_OK. Otherwise, the method returns one of the COM error codes defined in WinError.h.
     * @see https://learn.microsoft.com/windows/win32/api/upnphost/nf-upnphost-iupnpregistrar-registerdeviceprovider
     */
    RegisterDeviceProvider(bstrProviderName, bstrProgIDProviderClass, bstrInitString, bstrContainerId) {
        bstrProviderName := bstrProviderName is String ? BSTR.Alloc(bstrProviderName).Value : bstrProviderName
        bstrProgIDProviderClass := bstrProgIDProviderClass is String ? BSTR.Alloc(bstrProgIDProviderClass).Value : bstrProgIDProviderClass
        bstrInitString := bstrInitString is String ? BSTR.Alloc(bstrInitString).Value : bstrInitString
        bstrContainerId := bstrContainerId is String ? BSTR.Alloc(bstrContainerId).Value : bstrContainerId

        result := ComCall(5, this, "ptr", bstrProviderName, "ptr", bstrProgIDProviderClass, "ptr", bstrInitString, "ptr", bstrContainerId, "HRESULT")
        return result
    }

    /**
     * The GetUniqueDeviceName method retrieves the UDN for the specified device.
     * @remarks
     * Each UDN specified for a device in the device description template is replaced during registration. The device host replaces each UDN with a globally unique one.
     * @param {BSTR} bstrDeviceIdentifier Specifies the identifier returned by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/upnphost/nf-upnphost-iupnpregistrar-registerdevice">RegisterDevice</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/upnphost/nf-upnphost-iupnpregistrar-registerrunningdevice">RegisterRunningDevice</a>.
     * @param {BSTR} bstrTemplateUDN Specifies the UDN from the device description template.
     * @returns {BSTR} Receives the device's UDN that was generated by the device host.
     * @see https://learn.microsoft.com/windows/win32/api/upnphost/nf-upnphost-iupnpregistrar-getuniquedevicename
     */
    GetUniqueDeviceName(bstrDeviceIdentifier, bstrTemplateUDN) {
        bstrDeviceIdentifier := bstrDeviceIdentifier is String ? BSTR.Alloc(bstrDeviceIdentifier).Value : bstrDeviceIdentifier
        bstrTemplateUDN := bstrTemplateUDN is String ? BSTR.Alloc(bstrTemplateUDN).Value : bstrTemplateUDN

        pbstrUDN := BSTR()
        result := ComCall(6, this, "ptr", bstrDeviceIdentifier, "ptr", bstrTemplateUDN, "ptr", pbstrUDN, "HRESULT")
        return pbstrUDN
    }

    /**
     * The UnregisterDevice method unregisters the device from the device host. A device is either temporarily or permanently unregistered.
     * @remarks
     * This method removes a device from the device host. If <i>fPermanent</i> is <b>TRUE</b>, then the device is permanently unregistered. Otherwise, the device persists in the device host's mapping of the device identifier (returned from 
     * <a href="https://docs.microsoft.com/windows/desktop/api/upnphost/nf-upnphost-iupnpregistrar-registerdevice">RegisterDevice</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/upnphost/nf-upnphost-iupnpregistrar-registerrunningdevice">RegisterRunningDevice</a>) to the UDN generated by the device host. If a device is unregistered temporarily, when the device is re-registered, use the previous UDN associated with the device.
     * @param {BSTR} bstrDeviceIdentifier Specifies the device identifier of the device to unregister. The device identifier was returned from a previous call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/upnphost/nf-upnphost-iupnpregistrar-registerdevice">RegisterDevice</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/upnphost/nf-upnphost-iupnpregistrar-registerrunningdevice">RegisterRunningDevice</a>.
     * @param {BOOL} fPermanent Specifies whether to permanently or temporarily unregister the device. Specify <b>TRUE</b> to unregister the device permanently from the device host. Specify <b>FALSE</b> to unregister it temporarily.
     * @returns {HRESULT} If the method succeeds, the return value is S_OK. Otherwise, the method returns one of the COM error codes defined in WinError.h.
     * @see https://learn.microsoft.com/windows/win32/api/upnphost/nf-upnphost-iupnpregistrar-unregisterdevice
     */
    UnregisterDevice(bstrDeviceIdentifier, fPermanent) {
        bstrDeviceIdentifier := bstrDeviceIdentifier is String ? BSTR.Alloc(bstrDeviceIdentifier).Value : bstrDeviceIdentifier

        result := ComCall(7, this, "ptr", bstrDeviceIdentifier, "int", fPermanent, "HRESULT")
        return result
    }

    /**
     * The UnregisterDeviceProvider method permanently unregisters and unloads the device provider from the device host. The IUPnPDeviceProvider::Stop method is invoked.
     * @param {BSTR} bstrProviderName Specifies the provider name. Use the same name that was used in the call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/upnphost/nf-upnphost-iupnpregistrar-registerdeviceprovider">RegisterDeviceProvider</a>.
     * @returns {HRESULT} If the method succeeds, the return value is S_OK. Otherwise, the method returns one of the COM error codes defined in WinError.h.
     * @see https://learn.microsoft.com/windows/win32/api/upnphost/nf-upnphost-iupnpregistrar-unregisterdeviceprovider
     */
    UnregisterDeviceProvider(bstrProviderName) {
        bstrProviderName := bstrProviderName is String ? BSTR.Alloc(bstrProviderName).Value : bstrProviderName

        result := ComCall(8, this, "ptr", bstrProviderName, "HRESULT")
        return result
    }
}
