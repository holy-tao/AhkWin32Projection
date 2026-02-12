#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include ..\..\..\System\Com\IDispatch.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * The IUPnPDeviceControl interface is the central point of management for a device and its service objects.
 * @see https://learn.microsoft.com/windows/win32/api//content/upnphost/nn-upnphost-iupnpdevicecontrol
 * @namespace Windows.Win32.Devices.Enumeration.Pnp
 * @version v4.0.30319
 */
class IUPnPDeviceControl extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUPnPDeviceControl
     * @type {Guid}
     */
    static IID => Guid("{204810ba-73b2-11d4-bf42-00b0d0118b56}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Initialize", "GetServiceObject"]

    /**
     * The Initialize method is used to initialize the device. The device host invokes this method.
     * @remarks
     * This method is invoked immediately after the device control object is instantiated. It must be invoked before 
     * <a href="https://docs.microsoft.com/windows/desktop/api/upnphost/nf-upnphost-iupnpdevicecontrol-getserviceobject">IUPnPDeviceControl::GetServiceObject</a> is invoked.
     * 
     * The difference between a running device and a non-running device is when the 
     * <b>Initialize</b> method is invoked.
     * 
     * For running devices, 
     * <b>Initialize</b> is invoked when 
     * <a href="https://docs.microsoft.com/windows/desktop/api/upnphost/nf-upnphost-iupnpregistrar-registerrunningdevice">IUPnPRegistrar::RegisterRunningDevice</a> is invoked, and the initialization is completed before <b>IUPnPRegistrar::RegisterRunningDevice</b> returns.
     * 
     * For non-running devices, 
     * <b>Initialize</b> is not necessarily invoked when 
     * <a href="https://docs.microsoft.com/windows/desktop/api/upnphost/nf-upnphost-iupnpregistrar-registerdevice">IUPnPRegistrar::RegisterDevice</a> is invoked. 
     * <b>Initialize</b> is invoked when the first control or event request arrives.
     * 
     * The <i>bstrDeviceIdentifier</i> can also be used to call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/upnphost/nf-upnphost-iupnpregistrar-getuniquedevicename">IUPnPRegistrar::GetUniqueDeviceName</a>.
     * @param {BSTR} bstrXMLDesc Specifies the full XML device description, as published by the device host. The device description is based on the template provided by the device.
     * @param {BSTR} bstrDeviceIdentifier Identifies the device to initialize. This is the same identifier returned by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/upnphost/nf-upnphost-iupnpregistrar-registerdevice">IUPnPRegistrar::RegisterDevice</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/upnphost/nf-upnphost-iupnpregistrar-registerrunningdevice">IUPnPRegistrar::RegisterRunningDevice</a>. It is also used to retrieve the UDN of the device using 
     * <a href="https://docs.microsoft.com/windows/desktop/api/upnphost/nf-upnphost-iupnpregistrar-getuniquedevicename">IUPnPRegistrar::GetUniqueDeviceName</a>.
     * @param {BSTR} bstrInitString Specifies the initialization string used when this device was registered.
     * @returns {HRESULT} When implementing this method, return S_OK if the method succeeds. Otherwise, return one of the COM error codes defined in WinError.h.
     * @see https://learn.microsoft.com/windows/win32/api//content/upnphost/nf-upnphost-iupnpdevicecontrol-initialize
     */
    Initialize(bstrXMLDesc, bstrDeviceIdentifier, bstrInitString) {
        if(bstrXMLDesc is String) {
            pin := BSTR.Alloc(bstrXMLDesc)
            bstrXMLDesc := pin.Value
        }
        if(bstrDeviceIdentifier is String) {
            pin := BSTR.Alloc(bstrDeviceIdentifier)
            bstrDeviceIdentifier := pin.Value
        }
        if(bstrInitString is String) {
            pin := BSTR.Alloc(bstrInitString)
            bstrInitString := pin.Value
        }

        result := ComCall(3, this, "ptr", bstrXMLDesc, "ptr", bstrDeviceIdentifier, "ptr", bstrInitString, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The GetServiceObject method is used to obtain the IDispatch pointer to a specific service object. The device host invokes this method once per service, the first time it receives a request for a service.
     * @remarks
     * This method is invoked by the device host when a control request or event subscription is received for a particular service.
     * 
     * Embedded devices are differentiated by their UDNs.
     * @param {BSTR} bstrUDN Specifies the UDN of the device.
     * @param {BSTR} bstrServiceId Specifies the Service ID of the service for which to obtain the pointer.
     * @returns {IDispatch} Receives the <b>IDispatch</b> pointer to the service object.
     * @see https://learn.microsoft.com/windows/win32/api//content/upnphost/nf-upnphost-iupnpdevicecontrol-getserviceobject
     */
    GetServiceObject(bstrUDN, bstrServiceId) {
        if(bstrUDN is String) {
            pin := BSTR.Alloc(bstrUDN)
            bstrUDN := pin.Value
        }
        if(bstrServiceId is String) {
            pin := BSTR.Alloc(bstrServiceId)
            bstrServiceId := pin.Value
        }

        result := ComCall(4, this, "ptr", bstrUDN, "ptr", bstrServiceId, "ptr*", &ppdispService := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IDispatch(ppdispService)
    }
}
