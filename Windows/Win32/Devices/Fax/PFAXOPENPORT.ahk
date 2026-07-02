#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * The FaxOpenPort function returns a fax port handle to a fax client application. The port handle is required when the application calls other fax client functions that facilitate device management and fax document routing.
 * @remarks
 * Call the <b>FaxOpenPort</b> function to obtain the handle to a fax port. Use the handle when you call the following functions:
 * 
 * <ul>
 * <li>
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winfax/nf-winfax-faxsetporta">FaxSetPort</a> to change the configuration of the port</li>
 * <li>
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winfax/nf-winfax-faxenumroutingmethodsa">FaxEnumRoutingMethods</a> to retrieve information about the fax routing methods associated with a device</li>
 * </ul>
 * The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winfax/nf-winfax-faxenumportsa">FaxEnumPorts</a> function returns an array of <a href="https://docs.microsoft.com/windows/desktop/api/winfax/ns-winfax-fax_port_infoa">FAX_PORT_INFO</a> structures. Each structure contains detailed information for one port, including a valid value to pass in the <i>DeviceId</i> parameter. An application should not save this device identifier in a persistent manner, because the identifier can change between function calls to the fax server.
 * 
 * For more information, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-fax-ports">Fax Ports</a>, <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-fax-device-management">Fax Device Management</a>, and <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-managing-fax-routing-data">Managing Fax Routing Data</a>.
 * @see https://learn.microsoft.com/windows/win32/api/winfax/nc-winfax-pfaxopenport
 * @namespace Windows.Win32.Devices.Fax
 */
export default struct PFAXOPENPORT {
    value : IntPtr

    __value {
        set {
            if (value is PFAXOPENPORT) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HANDLE} FaxHandle Type: <b>HANDLE</b>
     * 
     * Specifies a fax server handle returned by a call to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winfax/nf-winfax-faxconnectfaxservera">FaxConnectFaxServer</a> function.
     * @param {Integer} DeviceId Type: <b>DWORD</b>
     * 
     * Specifies a <b>DWORD</b> variable that is the permanent line identifier for the receiving device. Call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winfax/nf-winfax-faxenumportsa">FaxEnumPorts</a> function to retrieve a valid value for this parameter. For more information, see the following Remarks section.
     * @param {Integer} Flags Type: <b>DWORD</b>
     * @param {Pointer<HANDLE>} FaxPortHandle Type: <b>LPHANDLE</b>
     * 
     * Pointer to a variable that receives a fax port handle that is required on subsequent calls to other fax client functions. If the fax server returns a <b>NULL</b> handle, it indicates an error.
     * @returns {BOOL} Type: <b>BOOL</b>
     * 
     * If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. GetLastError can return one of the following errors.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Access is denied. <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-specific-fax-access-rights">FAX_PORT_QUERY</a> access is required.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An error occurred during memory allocation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The port has already been opened with <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-fax-port-access-levels">PORT_OPEN_MODIFY</a> access.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_BAD_UNIT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>DeviceId</i> parameter is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     */
    Call(FaxHandle, DeviceId, Flags, FaxPortHandle) {
        result := DllCall(this.value, HANDLE, FaxHandle, UInt32, DeviceId, UInt32, Flags, HANDLE.Ptr, FaxPortHandle, BOOL)
        return result
    }

    /**
     * A PFAXOPENPORT that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFAXOPENPORT {
        /**
         * Creates a PFAXOPENPORT pointer that invokes the given AHK function when called.
         * @param {Func(HANDLE, UInt32, UInt32, HANDLE) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HANDLE, UInt32, UInt32, HANDLE.Ptr, BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
