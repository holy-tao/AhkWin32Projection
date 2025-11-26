#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IPortableDeviceValues.ahk
#Include .\IPortableDeviceContent.ahk
#Include .\IPortableDeviceCapabilities.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IPortableDevice interface provides access to a portable device.
 * @remarks
 * 
 * The client interfaces are designed to be used for any WPD object; it is not necessary to create a new instance for each object referenced by the application. After an application opens an instance of the <b>IPortableDevice</b> interface, it should open and cache any other WPD client interfaces that it will require.
 *       
 * 
 * For Windows 7, <a href="https://docs.microsoft.com/windows/desktop/api/portabledeviceapi/nn-portabledeviceapi-iportabledeviceservice">IPortableDevice</a> supports two CLSIDs for <b>CoCreateInstance</b>. <b>CLSID_PortableDevice</b> returns an <b>IPortableDevice</b> pointer that does not aggregate the free-threaded marshaler; <b>CLSID_PortableDeviceFTM</b> is a new CLSID that returns an <b>IPortableDevice</b> pointer that aggregates the free-threaded marshaler.  Both pointers support the same functionality otherwise.
 * 
 * Applications that live in Single Threaded Apartments should use <b>CLSID_PortableDeviceFTM</b> as this eliminates the overhead of interface pointer marshaling.  <b>CLSID_PortableDevice</b> is still supported for legacy applications.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//portabledeviceapi/nn-portabledeviceapi-iportabledevice
 * @namespace Windows.Win32.Devices.PortableDevices
 * @version v4.0.30319
 */
class IPortableDevice extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPortableDevice
     * @type {Guid}
     */
    static IID => Guid("{625e2df8-6392-4cf0-9ad1-3cfa5f17775c}")

    /**
     * The class identifier for PortableDevice
     * @type {Guid}
     */
    static CLSID => Guid("{728a21c5-3d9e-48d7-9810-864848f0f404}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Open", "SendCommand", "Content", "Capabilities", "Cancel", "Close", "Advise", "Unadvise", "GetPnPDeviceID"]

    /**
     * The Open method opens a connection between the application and the device.
     * @param {PWSTR} pszPnPDeviceID A pointer to a null-terminated string that contains the Plug and Play ID string for the device. You can get this string by calling <a href="https://docs.microsoft.com/windows/desktop/api/portabledeviceapi/nf-portabledeviceapi-iportabledevicemanager-getdevices">IPortableDeviceManager::GetDevices</a>.
     * @param {IPortableDeviceValues} pClientInfo A pointer to an <a href="https://docs.microsoft.com/windows/desktop/wpd_sdk/iportabledevicevalues">IPortableDeviceValues</a> interface that holds information that identifies the application to the device. This interface holds <b>PROPERTYKEY</b>/value pairs that try to identify an application uniquely. Although the presence of a CoCreated interface is required, the application is not required to send any key/value pairs. However, sending data might improve performance. Typical key/value pairs include the application name, major and minor version, and build number.
     * 
     *  See properties beginning with "WPD_CLIENT_" in the <a href="https://docs.microsoft.com/windows/desktop/wpd_sdk/properties-and-attributes">Properties</a> section.
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
     * <dt><b>E_WPD_DEVICE_ALREADY_OPENED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The device connection has already been opened.
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
     * At least one of the arguments was a NULL pointer.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//portabledeviceapi/nf-portabledeviceapi-iportabledevice-open
     */
    Open(pszPnPDeviceID, pClientInfo) {
        pszPnPDeviceID := pszPnPDeviceID is String ? StrPtr(pszPnPDeviceID) : pszPnPDeviceID

        result := ComCall(3, this, "ptr", pszPnPDeviceID, "ptr", pClientInfo, "HRESULT")
        return result
    }

    /**
     * The SendCommand method sends a command to the device and retrieves the results synchronously.
     * @param {Integer} dwFlags Currently not used; specify zero.
     * @param {IPortableDeviceValues} pParameters Pointer to an <a href="https://docs.microsoft.com/windows/desktop/wpd_sdk/iportabledevicevalues">IPortableDeviceValues</a> interface that specifies the command and parameters to call on the device. This interface must include the following two values to indicate the command. Additional parameters vary depending on the command. For a list of the parameters that are required for each command, see <a href="https://docs.microsoft.com/windows/desktop/wpd_sdk/commands">Commands</a>.
     *             
     * 
     * <table>
     * <tr>
     * <th>Command or property</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>WPD_PROPERTY_COMMON_COMMAND_CATEGORY</td>
     * <td>The category <b>GUID</b> of the command to send. For example, to reset a device, you would send <b>WPD_COMMAND_COMMON_RESET_DEVICE.fmtid</b>.</td>
     * </tr>
     * <tr>
     * <td>WPD_PROPERTY_COMMON_COMMAND_ID</td>
     * <td>The PID of the command to send. For example, to reset a device, you would send <b>WPD_COMMAND_COMMON_RESET_DEVICE.pid</b>.</td>
     * </tr>
     * </table>
     * @returns {IPortableDeviceValues} Address of a variable that receives a pointer to an <a href="https://docs.microsoft.com/windows/desktop/wpd_sdk/iportabledevicevalues">IPortableDeviceValues</a> interface that indicates the results of the command results, including success or failure, and any command values returned by the device. The caller must release this interface when it is done with it. The retrieved values vary by command; see the appropriate command documentation in <a href="https://docs.microsoft.com/windows/desktop/wpd_sdk/commands">Commands</a> to learn what values are returned by each command call.
     * @see https://docs.microsoft.com/windows/win32/api//portabledeviceapi/nf-portabledeviceapi-iportabledevice-sendcommand
     */
    SendCommand(dwFlags, pParameters) {
        result := ComCall(4, this, "uint", dwFlags, "ptr", pParameters, "ptr*", &ppResults := 0, "HRESULT")
        return IPortableDeviceValues(ppResults)
    }

    /**
     * The Content method retrieves an interface that you can use to access objects on a device.
     * @returns {IPortableDeviceContent} Address of a variable that receives a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/portabledeviceapi/nn-portabledeviceapi-iportabledevicecontent">IPortableDeviceContent</a> interface that is used to access the content on a device. The caller must release this interface when it is done with it.
     * @see https://docs.microsoft.com/windows/win32/api//portabledeviceapi/nf-portabledeviceapi-iportabledevice-content
     */
    Content() {
        result := ComCall(5, this, "ptr*", &ppContent := 0, "HRESULT")
        return IPortableDeviceContent(ppContent)
    }

    /**
     * The Capabilities method retrieves an interface used to query the capabilities of a portable device.
     * @returns {IPortableDeviceCapabilities} Address of a variable that receives a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/portabledeviceapi/nn-portabledeviceapi-iportabledevicecapabilities">IPortableDeviceCapabilities</a> interface that can describe the device's capabilities. The caller must release this interface when it is done with it.
     * @see https://docs.microsoft.com/windows/win32/api//portabledeviceapi/nf-portabledeviceapi-iportabledevice-capabilities
     */
    Capabilities() {
        result := ComCall(6, this, "ptr*", &ppCapabilities := 0, "HRESULT")
        return IPortableDeviceCapabilities(ppCapabilities)
    }

    /**
     * The Cancel method cancels a pending operation on this interface.
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
     * The operation was canceled successfully.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//portabledeviceapi/nf-portabledeviceapi-iportabledevice-cancel
     */
    Cancel() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * The Close method closes the connection with the device.
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
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//portabledeviceapi/nf-portabledeviceapi-iportabledevice-close
     */
    Close() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    /**
     * The Advise method registers an application-defined callback that receives device events.
     * @param {Integer} dwFlags <b>DWORD</b> that specifies option flags.
     * @param {IPortableDeviceEventCallback} pCallback Pointer to a callback object.
     * @param {IPortableDeviceValues} pParameters This parameter is ignored and should be set to <b>NULL</b>.
     * @returns {PWSTR} A string that represents a unique context ID. This is used to unregister for callbacks when calling <a href="https://docs.microsoft.com/windows/desktop/api/portabledeviceapi/nf-portabledeviceapi-iportabledevice-unadvise">Unadvise</a>.
     * @see https://docs.microsoft.com/windows/win32/api//portabledeviceapi/nf-portabledeviceapi-iportabledevice-advise
     */
    Advise(dwFlags, pCallback, pParameters) {
        result := ComCall(9, this, "uint", dwFlags, "ptr", pCallback, "ptr", pParameters, "ptr*", &ppszCookie := 0, "HRESULT")
        return ppszCookie
    }

    /**
     * The Unadvise method unregisters a client from receiving callback notifications. You must call this method if you called Advise previously.
     * @param {PWSTR} pszCookie Pointer to a null-terminated string that is a unique context ID. This was retrieved in the initial call to <a href="https://docs.microsoft.com/windows/desktop/api/portabledeviceapi/nf-portabledeviceapi-iportabledevice-advise">IPortableDevice::Advise</a>.
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
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//portabledeviceapi/nf-portabledeviceapi-iportabledevice-unadvise
     */
    Unadvise(pszCookie) {
        pszCookie := pszCookie is String ? StrPtr(pszCookie) : pszCookie

        result := ComCall(10, this, "ptr", pszCookie, "HRESULT")
        return result
    }

    /**
     * The GetPnPDeviceID method retrieves the Plug and Play (PnP) device identifier that the application used to open the device.
     * @returns {PWSTR} Pointer to a null-terminated string that contains the Plug and Play ID string for the device.
     * @see https://docs.microsoft.com/windows/win32/api//portabledeviceapi/nf-portabledeviceapi-iportabledevice-getpnpdeviceid
     */
    GetPnPDeviceID() {
        result := ComCall(11, this, "ptr*", &ppszPnPDeviceID := 0, "HRESULT")
        return ppszPnPDeviceID
    }
}
