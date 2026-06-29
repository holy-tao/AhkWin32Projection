#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IUPnPDeviceControl interface is the central point of management for a device and its service objects.
 * @see https://learn.microsoft.com/windows/win32/api/upnphost/nn-upnphost-iupnpdevicecontrol
 * @namespace Windows.Win32.Devices.Enumeration.Pnp
 */
export default struct IUPnPDeviceControl extends IUnknown {
    /**
     * The interface identifier for IUPnPDeviceControl
     * @type {Guid}
     */
    static IID := Guid("{204810ba-73b2-11d4-bf42-00b0d0118b56}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IUPnPDeviceControl interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Initialize       : IntPtr
        GetServiceObject : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IUPnPDeviceControl.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * @see https://learn.microsoft.com/windows/win32/api/upnphost/nf-upnphost-iupnpdevicecontrol-initialize
     */
    Initialize(bstrXMLDesc, bstrDeviceIdentifier, bstrInitString) {
        bstrXMLDesc := bstrXMLDesc is String ? BSTR.Alloc(bstrXMLDesc).Value : bstrXMLDesc
        bstrDeviceIdentifier := bstrDeviceIdentifier is String ? BSTR.Alloc(bstrDeviceIdentifier).Value : bstrDeviceIdentifier
        bstrInitString := bstrInitString is String ? BSTR.Alloc(bstrInitString).Value : bstrInitString

        result := ComCall(3, this, BSTR, bstrXMLDesc, BSTR, bstrDeviceIdentifier, BSTR, bstrInitString, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/upnphost/nf-upnphost-iupnpdevicecontrol-getserviceobject
     */
    GetServiceObject(bstrUDN, bstrServiceId) {
        bstrUDN := bstrUDN is String ? BSTR.Alloc(bstrUDN).Value : bstrUDN
        bstrServiceId := bstrServiceId is String ? BSTR.Alloc(bstrServiceId).Value : bstrServiceId

        result := ComCall(4, this, BSTR, bstrUDN, BSTR, bstrServiceId, "ptr*", &ppdispService := 0, "HRESULT")
        return IDispatch(ppdispService)
    }

    Query(iid) {
        if (IUPnPDeviceControl.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Initialize := CallbackCreate(GetMethod(implObj, "Initialize"), flags, 4)
        this.vtbl.GetServiceObject := CallbackCreate(GetMethod(implObj, "GetServiceObject"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Initialize)
        CallbackFree(this.vtbl.GetServiceObject)
    }
}
