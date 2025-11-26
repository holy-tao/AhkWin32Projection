#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IPortableDeviceServiceCapabilities.ahk
#Include .\IPortableDeviceContent2.ahk
#Include .\IPortableDeviceServiceMethods.ahk
#Include .\IPortableDeviceValues.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides access to a service.
 * @see https://docs.microsoft.com/windows/win32/api//portabledeviceapi/nn-portabledeviceapi-iportabledeviceservice
 * @namespace Windows.Win32.Devices.PortableDevices
 * @version v4.0.30319
 */
class IPortableDeviceService extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPortableDeviceService
     * @type {Guid}
     */
    static IID => Guid("{d3bd3a44-d7b5-40a9-98b7-2fa4d01dec08}")

    /**
     * The class identifier for PortableDeviceService
     * @type {Guid}
     */
    static CLSID => Guid("{ef5db4c2-9312-422c-9152-411cd9c4dd84}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Open", "Capabilities", "Content", "Methods", "Cancel", "Close", "GetServiceObjectID", "GetPnPServiceID", "Advise", "Unadvise", "SendCommand"]

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
     * @see https://docs.microsoft.com/windows/win32/api//portabledeviceapi/nf-portabledeviceapi-iportabledeviceservice-open
     */
    Open(pszPnPServiceID, pClientInfo) {
        pszPnPServiceID := pszPnPServiceID is String ? StrPtr(pszPnPServiceID) : pszPnPServiceID

        result := ComCall(3, this, "ptr", pszPnPServiceID, "ptr", pClientInfo, "HRESULT")
        return result
    }

    /**
     * Retrieves the service capabilities.
     * @returns {IPortableDeviceServiceCapabilities} The <a href="https://docs.microsoft.com/windows/desktop/api/portabledeviceapi/nn-portabledeviceapi-iportabledeviceservicecapabilities">IPortableDeviceServiceCapabilities</a> interface specifying the capabilities of the service.
     * @see https://docs.microsoft.com/windows/win32/api//portabledeviceapi/nf-portabledeviceapi-iportabledeviceservice-capabilities
     */
    Capabilities() {
        result := ComCall(4, this, "ptr*", &ppCapabilities := 0, "HRESULT")
        return IPortableDeviceServiceCapabilities(ppCapabilities)
    }

    /**
     * Retrieves access to the service content.
     * @returns {IPortableDeviceContent2} The <a href="https://docs.microsoft.com/windows/desktop/api/portabledeviceapi/nn-portabledeviceapi-iportabledevicecontent2">IPortableDeviceContent2</a> interface that accesses the service content.
     * @see https://docs.microsoft.com/windows/win32/api//portabledeviceapi/nf-portabledeviceapi-iportabledeviceservice-content
     */
    Content() {
        result := ComCall(5, this, "ptr*", &ppContent := 0, "HRESULT")
        return IPortableDeviceContent2(ppContent)
    }

    /**
     * Retrieves the IPortableDeviceServiceMethods interface that is used to invoke custom functionality on the service.
     * @returns {IPortableDeviceServiceMethods} The <a href="https://docs.microsoft.com/windows/desktop/api/portabledeviceapi/nn-portabledeviceapi-iportabledeviceservicemethods">IPortableDeviceServiceMethods</a> interface used for invoking methods on the given service.
     * @see https://docs.microsoft.com/windows/win32/api//portabledeviceapi/nf-portabledeviceapi-iportabledeviceservice-methods
     */
    Methods() {
        result := ComCall(6, this, "ptr*", &ppMethods := 0, "HRESULT")
        return IPortableDeviceServiceMethods(ppMethods)
    }

    /**
     * Cancels a pending operation on this interface.
     * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>. Any other <b>HRESULT</b> value indicates that the call failed.
     * @see https://docs.microsoft.com/windows/win32/api//portabledeviceapi/nf-portabledeviceapi-iportabledeviceservice-cancel
     */
    Cancel() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * Releases the connection to the service.
     * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>. Any other <b>HRESULT</b> value indicates that the call failed.
     * @see https://docs.microsoft.com/windows/win32/api//portabledeviceapi/nf-portabledeviceapi-iportabledeviceservice-close
     */
    Close() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    /**
     * Retrieves an object identifier for the service. This object identifier can be used to access the properties of the service, for example.
     * @returns {PWSTR} The retrieved service object identifier.
     * @see https://docs.microsoft.com/windows/win32/api//portabledeviceapi/nf-portabledeviceapi-iportabledeviceservice-getserviceobjectid
     */
    GetServiceObjectID() {
        result := ComCall(9, this, "ptr*", &ppszServiceObjectID := 0, "HRESULT")
        return ppszServiceObjectID
    }

    /**
     * Retrieves a Plug and Play (PnP) identifier for the service.
     * @returns {PWSTR} The retrieved PnP identifier, which is the same identifier that was passed to the <a href="https://docs.microsoft.com/windows/desktop/api/portabledeviceapi/nf-portabledeviceapi-iportabledeviceservice-open">Open</a> method.
     * @see https://docs.microsoft.com/windows/win32/api//portabledeviceapi/nf-portabledeviceapi-iportabledeviceservice-getpnpserviceid
     */
    GetPnPServiceID() {
        result := ComCall(10, this, "ptr*", &ppszPnPServiceID := 0, "HRESULT")
        return ppszPnPServiceID
    }

    /**
     * Registers an application-defined callback object that receives service events.
     * @param {Integer} dwFlags Not used.
     * @param {IPortableDeviceEventCallback} pCallback The  <a href="https://docs.microsoft.com/windows/desktop/api/portabledeviceapi/nn-portabledeviceapi-iportabledeviceeventcallback">IPortableDeviceEventCallback</a> interface specifying the callback object to register.
     * @param {IPortableDeviceValues} pParameters The <a href="https://docs.microsoft.com/windows/desktop/wpd_sdk/iportabledevicevalues">IPortableDeviceValues</a> interface specifying the event-registration parameters, or <b>NULL</b> if the callback object is to receive all service events.
     * @returns {PWSTR} The unique context ID for the callback object. This value matches that used by the <a href="https://docs.microsoft.com/windows/desktop/api/portabledeviceapi/nf-portabledeviceapi-iportabledeviceservice-unadvise">Unadvise</a> method to unregister the callback object.
     * @see https://docs.microsoft.com/windows/win32/api//portabledeviceapi/nf-portabledeviceapi-iportabledeviceservice-advise
     */
    Advise(dwFlags, pCallback, pParameters) {
        result := ComCall(11, this, "uint", dwFlags, "ptr", pCallback, "ptr", pParameters, "ptr*", &ppszCookie := 0, "HRESULT")
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
     * @see https://docs.microsoft.com/windows/win32/api//portabledeviceapi/nf-portabledeviceapi-iportabledeviceservice-unadvise
     */
    Unadvise(pszCookie) {
        pszCookie := pszCookie is String ? StrPtr(pszCookie) : pszCookie

        result := ComCall(12, this, "ptr", pszCookie, "HRESULT")
        return result
    }

    /**
     * Sends a standard WPD command and its parameters to the service.
     * @param {Integer} dwFlags Not used.
     * @param {IPortableDeviceValues} pParameters The <a href="https://docs.microsoft.com/windows/desktop/wpd_sdk/iportabledevicevalues">IPortableDeviceValues</a> interface specifying the command parameters.
     * @returns {IPortableDeviceValues} The <a href="https://docs.microsoft.com/windows/desktop/wpd_sdk/iportabledevicevalues">IPortableDeviceValues</a> interface specifying the command results.
     * @see https://docs.microsoft.com/windows/win32/api//portabledeviceapi/nf-portabledeviceapi-iportabledeviceservice-sendcommand
     */
    SendCommand(dwFlags, pParameters) {
        result := ComCall(13, this, "uint", dwFlags, "ptr", pParameters, "ptr*", &ppResults := 0, "HRESULT")
        return IPortableDeviceValues(ppResults)
    }
}
