#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IPortableDeviceServiceMethods.ahk" { IPortableDeviceServiceMethods }
#Import ".\IPortableDeviceValues.ahk" { IPortableDeviceValues }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\IPortableDeviceContent2.ahk" { IPortableDeviceContent2 }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\IPortableDeviceServiceCapabilities.ahk" { IPortableDeviceServiceCapabilities }
#Import ".\IPortableDeviceEventCallback.ahk" { IPortableDeviceEventCallback }

/**
 * Provides access to a service.
 * @see https://learn.microsoft.com/windows/win32/api/portabledeviceapi/nn-portabledeviceapi-iportabledeviceservice
 * @namespace Windows.Win32.Devices.PortableDevices
 */
export default struct IPortableDeviceService extends IUnknown {
    /**
     * The interface identifier for IPortableDeviceService
     * @type {Guid}
     */
    static IID := Guid("{d3bd3a44-d7b5-40a9-98b7-2fa4d01dec08}")

    /**
     * The class identifier for PortableDeviceService
     * @type {Guid}
     */
    static CLSID := Guid("{ef5db4c2-9312-422c-9152-411cd9c4dd84}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPortableDeviceService interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Open               : IntPtr
        Capabilities       : IntPtr
        Content            : IntPtr
        Methods            : IntPtr
        Cancel             : IntPtr
        Close              : IntPtr
        GetServiceObjectID : IntPtr
        GetPnPServiceID    : IntPtr
        Advise             : IntPtr
        Unadvise           : IntPtr
        SendCommand        : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPortableDeviceService.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Opens a connection to the service.
     * @param {PWSTR} pszPnPServiceID The Plug and Play (PnP) identifier for the service, which is the same identifier that is retrieved by the <a href="https://docs.microsoft.com/windows/desktop/api/portabledeviceapi/nf-portabledeviceapi-iportabledeviceservice-getpnpserviceid">GetPnPServiceId</a> method.
     * @param {IPortableDeviceValues} pClientInfo The <a href="https://docs.microsoft.com/windows/desktop/wpd_sdk/iportabledevicevalues">IPortableDeviceValues</a> interface specifying the client information.
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
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The PnP identifier specified by the <i>pszPnPServiceID</i> parameter is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A <b>NULL</b> parameter was specified.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_WPD_SERVICE_ALREADY_OPENED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This method has already been called for the service.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/portabledeviceapi/nf-portabledeviceapi-iportabledeviceservice-open
     */
    Open(pszPnPServiceID, pClientInfo) {
        pszPnPServiceID := pszPnPServiceID is String ? StrPtr(pszPnPServiceID) : pszPnPServiceID

        result := ComCall(3, this, "ptr", pszPnPServiceID, "ptr", pClientInfo, "HRESULT")
        return result
    }

    /**
     * Retrieves the service capabilities.
     * @returns {IPortableDeviceServiceCapabilities} The <a href="https://docs.microsoft.com/windows/desktop/api/portabledeviceapi/nn-portabledeviceapi-iportabledeviceservicecapabilities">IPortableDeviceServiceCapabilities</a> interface specifying the capabilities of the service.
     * @see https://learn.microsoft.com/windows/win32/api/portabledeviceapi/nf-portabledeviceapi-iportabledeviceservice-capabilities
     */
    Capabilities() {
        result := ComCall(4, this, "ptr*", &ppCapabilities := 0, "HRESULT")
        return IPortableDeviceServiceCapabilities(ppCapabilities)
    }

    /**
     * Retrieves access to the service content.
     * @returns {IPortableDeviceContent2} The <a href="https://docs.microsoft.com/windows/desktop/api/portabledeviceapi/nn-portabledeviceapi-iportabledevicecontent2">IPortableDeviceContent2</a> interface that accesses the service content.
     * @see https://learn.microsoft.com/windows/win32/api/portabledeviceapi/nf-portabledeviceapi-iportabledeviceservice-content
     */
    Content() {
        result := ComCall(5, this, "ptr*", &ppContent := 0, "HRESULT")
        return IPortableDeviceContent2(ppContent)
    }

    /**
     * Retrieves the IPortableDeviceServiceMethods interface that is used to invoke custom functionality on the service.
     * @returns {IPortableDeviceServiceMethods} The <a href="https://docs.microsoft.com/windows/desktop/api/portabledeviceapi/nn-portabledeviceapi-iportabledeviceservicemethods">IPortableDeviceServiceMethods</a> interface used for invoking methods on the given service.
     * @see https://learn.microsoft.com/windows/win32/api/portabledeviceapi/nf-portabledeviceapi-iportabledeviceservice-methods
     */
    Methods() {
        result := ComCall(6, this, "ptr*", &ppMethods := 0, "HRESULT")
        return IPortableDeviceServiceMethods(ppMethods)
    }

    /**
     * Cancels a pending operation on this interface.
     * @remarks
     * This method cancels all pending operations on the current device handle, which corresponds to a session associated with an <a href="https://docs.microsoft.com/windows/desktop/api/portabledeviceapi/nn-portabledeviceapi-iportabledeviceservice">IPortableDeviceService</a> interface. The Windows Portable Devices (WPD) API does not support targeted cancellation of specific operations.
     * 
     * If your application invokes the WPD API from multiple threads, each thread should create a new instance of the <a href="https://docs.microsoft.com/windows/desktop/api/portabledeviceapi/nn-portabledeviceapi-iportabledeviceservice">IPortableDeviceService</a> interface. Doing this ensures that any cancel operation affects only the I/O for the affected thread.
     * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>. Any other <b>HRESULT</b> value indicates that the call failed.
     * @see https://learn.microsoft.com/windows/win32/api/portabledeviceapi/nf-portabledeviceapi-iportabledeviceservice-cancel
     */
    Cancel() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * Releases the connection to the service.
     * @remarks
     * Applications typically won't call this method, as the Windows Portable Devices (WPD) API automatically calls it when the last reference to a service is removed.
     * 
     * When an application does call this method, the WPD API releases the service connection, so that any WPD objects attached to the service will return the <b>E_WPD_SERVICE_NOT_OPEN</b> error.
     * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>. Any other <b>HRESULT</b> value indicates that the call failed.
     * @see https://learn.microsoft.com/windows/win32/api/portabledeviceapi/nf-portabledeviceapi-iportabledeviceservice-close
     */
    Close() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    /**
     * Retrieves an object identifier for the service. This object identifier can be used to access the properties of the service, for example.
     * @returns {PWSTR} The retrieved service object identifier.
     * @see https://learn.microsoft.com/windows/win32/api/portabledeviceapi/nf-portabledeviceapi-iportabledeviceservice-getserviceobjectid
     */
    GetServiceObjectID() {
        result := ComCall(9, this, PWSTR.Ptr, &ppszServiceObjectID := 0, "HRESULT")
        return ppszServiceObjectID
    }

    /**
     * Retrieves a Plug and Play (PnP) identifier for the service.
     * @remarks
     * The <a href="https://docs.microsoft.com/windows/desktop/api/portabledeviceapi/nf-portabledeviceapi-iportabledeviceservice-open">Open</a> method must be called on the service before a PnP identifier can be retrieved.
     * 
     * When an application no longer needs the PnP identifier, it should call the <b>CoTaskMemFree</b> function to free the identifier memory.
     * @returns {PWSTR} The retrieved PnP identifier, which is the same identifier that was passed to the <a href="https://docs.microsoft.com/windows/desktop/api/portabledeviceapi/nf-portabledeviceapi-iportabledeviceservice-open">Open</a> method.
     * @see https://learn.microsoft.com/windows/win32/api/portabledeviceapi/nf-portabledeviceapi-iportabledeviceservice-getpnpserviceid
     */
    GetPnPServiceID() {
        result := ComCall(10, this, PWSTR.Ptr, &ppszPnPServiceID := 0, "HRESULT")
        return ppszPnPServiceID
    }

    /**
     * Registers an application-defined callback object that receives service events.
     * @remarks
     * During cleanup, an application should unregister the callback object by calling the <a href="https://docs.microsoft.com/windows/desktop/api/portabledeviceapi/nf-portabledeviceapi-iportabledeviceservice-unadvise">Unadvise</a> method, and then release the memory referenced by the <i>ppszCookie</i> parameter by calling the <b>CoTaskMemFree</b> function.
     * @param {Integer} dwFlags Not used.
     * @param {IPortableDeviceEventCallback} pCallback The  <a href="https://docs.microsoft.com/windows/desktop/api/portabledeviceapi/nn-portabledeviceapi-iportabledeviceeventcallback">IPortableDeviceEventCallback</a> interface specifying the callback object to register.
     * @param {IPortableDeviceValues} pParameters The <a href="https://docs.microsoft.com/windows/desktop/wpd_sdk/iportabledevicevalues">IPortableDeviceValues</a> interface specifying the event-registration parameters, or <b>NULL</b> if the callback object is to receive all service events.
     * @returns {PWSTR} The unique context ID for the callback object. This value matches that used by the <a href="https://docs.microsoft.com/windows/desktop/api/portabledeviceapi/nf-portabledeviceapi-iportabledeviceservice-unadvise">Unadvise</a> method to unregister the callback object.
     * @see https://learn.microsoft.com/windows/win32/api/portabledeviceapi/nf-portabledeviceapi-iportabledeviceservice-advise
     */
    Advise(dwFlags, pCallback, pParameters) {
        result := ComCall(11, this, "uint", dwFlags, "ptr", pCallback, "ptr", pParameters, PWSTR.Ptr, &ppszCookie := 0, "HRESULT")
        return ppszCookie
    }

    /**
     * Unregisters a service event callback object.
     * @param {PWSTR} pszCookie The unique context ID for the application-supplied callback object. This value matches that yielded by the <i>ppszCookie</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/portabledeviceapi/nf-portabledeviceapi-iportabledeviceservice-advise">Advise</a> method.
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
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A <b>NULL</b> parameter was specified.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/portabledeviceapi/nf-portabledeviceapi-iportabledeviceservice-unadvise
     */
    Unadvise(pszCookie) {
        pszCookie := pszCookie is String ? StrPtr(pszCookie) : pszCookie

        result := ComCall(12, this, "ptr", pszCookie, "HRESULT")
        return result
    }

    /**
     * Sends a standard WPD command and its parameters to the service.
     * @remarks
     * This method should only be used to send standard WPD commands to the service. To invoke service methods, use the <a href="https://docs.microsoft.com/windows/desktop/api/portabledeviceapi/nn-portabledeviceapi-iportabledeviceservicemethods">IPortableDeviceServiceMethods</a> interface.
     * 
     * This method may fail even though it returns <b>S_OK</b> as its <b>HRESULT</b> value. To determine if a command succeeded, an application should always examine the properties referenced by the <i>ppResults</i> parameter:
     * 
     * <ul>
     * <li>The <a href="https://docs.microsoft.com/windows/desktop/wpd_sdk/common-properties">WPD_PROPERTY_COMMON_HRESULT</a> property indicates if the command succeeded.</li>
     * <li>If the command failed, the <a href="https://docs.microsoft.com/windows/desktop/wpd_sdk/common-properties">WPD_PROPERTY_COMMON_DRIVER_ERROR_CODE</a> property will contain driver-specific error codes.</li>
     * </ul>
     * The object referenced by the <i>pParameters</i> parameter must specify at least these properties:
     * 
     * <ul>
     * <li><a href="https://docs.microsoft.com/windows/desktop/wpd_sdk/common-properties">WPD_PROPERTY_COMMON_COMMAND_CATEGORY</a>, which should contain a command category, such as the <b>fmtid</b> member of the <a href="https://docs.microsoft.com/windows/desktop/wpd_sdk/wpd-command-common-reset-device-command">WPD_COMMAND_COMMON_RESET_DEVICE</a> property</li>
     * <li><a href="https://docs.microsoft.com/windows/desktop/wpd_sdk/common-properties">WPD_PROPERTY_COMMON_COMMAND_ID</a>, which should contain a command identifier, such as the <b>pid</b> member of the  <a href="https://docs.microsoft.com/windows/desktop/wpd_sdk/wpd-command-common-reset-device-command">WPD_COMMAND_COMMON_RESET_DEVICE</a> property.</li>
     * </ul>
     * @param {Integer} dwFlags Not used.
     * @param {IPortableDeviceValues} pParameters The <a href="https://docs.microsoft.com/windows/desktop/wpd_sdk/iportabledevicevalues">IPortableDeviceValues</a> interface specifying the command parameters.
     * @returns {IPortableDeviceValues} The <a href="https://docs.microsoft.com/windows/desktop/wpd_sdk/iportabledevicevalues">IPortableDeviceValues</a> interface specifying the command results.
     * @see https://learn.microsoft.com/windows/win32/api/portabledeviceapi/nf-portabledeviceapi-iportabledeviceservice-sendcommand
     */
    SendCommand(dwFlags, pParameters) {
        result := ComCall(13, this, "uint", dwFlags, "ptr", pParameters, "ptr*", &ppResults := 0, "HRESULT")
        return IPortableDeviceValues(ppResults)
    }

    Query(iid) {
        if (IPortableDeviceService.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Open := CallbackCreate(GetMethod(implObj, "Open"), flags, 3)
        this.vtbl.Capabilities := CallbackCreate(GetMethod(implObj, "Capabilities"), flags, 2)
        this.vtbl.Content := CallbackCreate(GetMethod(implObj, "Content"), flags, 2)
        this.vtbl.Methods := CallbackCreate(GetMethod(implObj, "Methods"), flags, 2)
        this.vtbl.Cancel := CallbackCreate(GetMethod(implObj, "Cancel"), flags, 1)
        this.vtbl.Close := CallbackCreate(GetMethod(implObj, "Close"), flags, 1)
        this.vtbl.GetServiceObjectID := CallbackCreate(GetMethod(implObj, "GetServiceObjectID"), flags, 2)
        this.vtbl.GetPnPServiceID := CallbackCreate(GetMethod(implObj, "GetPnPServiceID"), flags, 2)
        this.vtbl.Advise := CallbackCreate(GetMethod(implObj, "Advise"), flags, 5)
        this.vtbl.Unadvise := CallbackCreate(GetMethod(implObj, "Unadvise"), flags, 2)
        this.vtbl.SendCommand := CallbackCreate(GetMethod(implObj, "SendCommand"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Open)
        CallbackFree(this.vtbl.Capabilities)
        CallbackFree(this.vtbl.Content)
        CallbackFree(this.vtbl.Methods)
        CallbackFree(this.vtbl.Cancel)
        CallbackFree(this.vtbl.Close)
        CallbackFree(this.vtbl.GetServiceObjectID)
        CallbackFree(this.vtbl.GetPnPServiceID)
        CallbackFree(this.vtbl.Advise)
        CallbackFree(this.vtbl.Unadvise)
        CallbackFree(this.vtbl.SendCommand)
    }
}
