#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit

#Import ".\BLUETOOTH_ADDRESS.ahk" { BLUETOOTH_ADDRESS }
#Import ".\BLUETOOTH_DEVICE_INFO.ahk" { BLUETOOTH_DEVICE_INFO }
#Import ".\BLUETOOTH_LOCAL_SERVICE_INFO.ahk" { BLUETOOTH_LOCAL_SERVICE_INFO }
#Import ".\BTH_LE_GATT_DESCRIPTOR.ahk" { BTH_LE_GATT_DESCRIPTOR }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\BTH_LE_GATT_DESCRIPTOR_VALUE.ahk" { BTH_LE_GATT_DESCRIPTOR_VALUE }
#Import ".\BLUETOOTH_OOB_DATA_INFO.ahk" { BLUETOOTH_OOB_DATA_INFO }
#Import ".\BLUETOOTH_AUTHENTICATE_RESPONSE.ahk" { BLUETOOTH_AUTHENTICATE_RESPONSE }
#Import ".\SDP_ELEMENT_DATA.ahk" { SDP_ELEMENT_DATA }
#Import ".\AUTHENTICATION_REQUIREMENTS.ahk" { AUTHENTICATION_REQUIREMENTS }
#Import ".\BTH_LE_GATT_CHARACTERISTIC.ahk" { BTH_LE_GATT_CHARACTERISTIC }
#Import ".\HBLUETOOTH_RADIO_FIND.ahk" { HBLUETOOTH_RADIO_FIND }
#Import ".\BLUETOOTH_RADIO_INFO.ahk" { BLUETOOTH_RADIO_INFO }
#Import ".\BLUETOOTH_FIND_RADIO_PARAMS.ahk" { BLUETOOTH_FIND_RADIO_PARAMS }
#Import ".\HBLUETOOTH_DEVICE_FIND.ahk" { HBLUETOOTH_DEVICE_FIND }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\BTH_LE_GATT_SERVICE.ahk" { BTH_LE_GATT_SERVICE }
#Import ".\BLUETOOTH_DEVICE_SEARCH_PARAMS.ahk" { BLUETOOTH_DEVICE_SEARCH_PARAMS }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import ".\BTH_LE_GATT_EVENT_TYPE.ahk" { BTH_LE_GATT_EVENT_TYPE }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\BTH_LE_GATT_CHARACTERISTIC_VALUE.ahk" { BTH_LE_GATT_CHARACTERISTIC_VALUE }
#Import ".\SDP_STRING_TYPE_DATA.ahk" { SDP_STRING_TYPE_DATA }
#Import ".\BLUETOOTH_SELECT_DEVICE_PARAMS.ahk" { BLUETOOTH_SELECT_DEVICE_PARAMS }

/**
 * @namespace Windows.Win32.Devices.Bluetooth
 */

;@region Functions
/**
 * The BluetoothFindFirstRadio function begins the enumeration of local Bluetooth radios.
 * @param {Pointer<BLUETOOTH_FIND_RADIO_PARAMS>} pbtfrp Pointer to a <a href="https://docs.microsoft.com/windows/win32/api/bluetoothapis/ns-bluetoothapis-bluetooth_find_radio_params">BLUETOOTH_FIND_RADIO_PARAMS</a> structure. The <b>dwSize</b> member of the <b>BLUETOOTH_FIND_RADIO_PARAMS</b> structure pointed to by <i>pbtfrp</i> must match the size of the structure.
 * @param {Pointer<HANDLE>} phRadio Pointer to where the first enumerated radio handle will be returned. When no longer needed, this handle must be closed via <a href="https://docs.microsoft.com/windows/desktop/api/handleapi/nf-handleapi-closehandle">CloseHandle</a>.
 * @returns {HBLUETOOTH_RADIO_FIND} In addition to the handle indicated by <i>phRadio</i>, calling this function will also create a HBLUETOOTH_RADIO_FIND handle for use with the <a href="https://docs.microsoft.com/windows/desktop/api/bluetoothapis/nf-bluetoothapis-bluetoothfindnextradio">BluetoothFindNextRadio</a> function. When this handle is no longer needed, it must be closed via the <a href="https://docs.microsoft.com/windows/desktop/api/bluetoothapis/nf-bluetoothapis-bluetoothfindradioclose">BluetoothFindRadioClose</a>.
 * 
 * Returns <b>NULL</b> upon failure. Call the  <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function for more information on the error. The following table  describe common errors:
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NO_MORE_ITEMS</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * No Bluetooth radios found.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The <i>pbtfrp</i> parameter is <b>NULL</b>.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_REVISION_MISMATCH</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The structure pointed to by <i>pbtfrp</i> is not the correct size.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_OUTOFMEMORY</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Out of memory.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/bluetoothapis/nf-bluetoothapis-bluetoothfindfirstradio
 * @since windows6.0.6000
 */
export BluetoothFindFirstRadio(pbtfrp, phRadio) {
    A_LastError := 0

    result := DllCall("BluetoothApis.dll\BluetoothFindFirstRadio", BLUETOOTH_FIND_RADIO_PARAMS.Ptr, pbtfrp, HANDLE.Ptr, phRadio, HBLUETOOTH_RADIO_FIND.Owned)
    if(A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * The BluetoothFindNextRadio function finds the next Bluetooth radio.
 * @param {HBLUETOOTH_RADIO_FIND} hFind Handle returned by a previous call to the <a href="https://docs.microsoft.com/windows/desktop/api/bluetoothapis/nf-bluetoothapis-bluetoothfindfirstradio">BluetoothFindFirstRadio</a> function. Use <a href="https://docs.microsoft.com/windows/desktop/api/bluetoothapis/nf-bluetoothapis-bluetoothfindradioclose">BluetoothFindRadioClose</a> to close this handle when it is no longer needed.
 * @param {Pointer<HANDLE>} phRadio Pointer to where the next enumerated radio handle will be returned.  When no longer needed, this handle must be released via <a href="https://docs.microsoft.com/windows/desktop/api/handleapi/nf-handleapi-closehandle">CloseHandle</a>.
 * @returns {BOOL} Returns <b>TRUE</b> when the next available radio is found.
 * 
 * Returns <b>FALSE</b> when no new radios are found.  Call the  <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function for more information on the error. The following table  describe common errors:
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_HANDLE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The handle is <b>NULL</b>.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NO_MORE_ITEMS</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * No more radios were found.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_OUTOFMEMORY</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Out of memory.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/bluetoothapis/nf-bluetoothapis-bluetoothfindnextradio
 * @since windows6.0.6000
 */
export BluetoothFindNextRadio(hFind, phRadio) {
    A_LastError := 0

    result := DllCall("BluetoothApis.dll\BluetoothFindNextRadio", HBLUETOOTH_RADIO_FIND, hFind, HANDLE.Ptr, phRadio, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * The BluetoothFindRadioClose function closes the enumeration handle associated with finding Bluetooth radios.
 * @param {HBLUETOOTH_RADIO_FIND} hFind Enumeration handle to close, obtained with a previous call to the <a href="https://docs.microsoft.com/windows/desktop/api/bluetoothapis/nf-bluetoothapis-bluetoothfindfirstradio">BluetoothFindFirstRadio</a> function.
 * @returns {BOOL} Returns <b>TRUE</b> when the handle is successfully closed. Returns <b>FALSE</b> if the attempt fails to close the enumeration handle. For additional information on possible errors associated with closing the handle, call the <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function.
 * @see https://learn.microsoft.com/windows/win32/api/bluetoothapis/nf-bluetoothapis-bluetoothfindradioclose
 * @since windows6.0.6000
 */
export BluetoothFindRadioClose(hFind) {
    A_LastError := 0

    result := DllCall("BluetoothApis.dll\BluetoothFindRadioClose", HBLUETOOTH_RADIO_FIND, hFind, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Obtains information about a Bluetooth radio.
 * @param {HANDLE} hRadio A handle to a local Bluetooth radio, obtained by calling the <a href="https://docs.microsoft.com/windows/desktop/api/bluetoothapis/nf-bluetoothapis-bluetoothfindfirstradio">BluetoothFindFirstRadio</a> or similar functions, or the <b>SetupDiEnumerateDeviceInterfances</b> function.
 * @param {Pointer<BLUETOOTH_RADIO_INFO>} pRadioInfo A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/bluetoothapis/ns-bluetoothapis-bluetooth_radio_info">BLUETOOTH_RADIO_INFO</a> structure into which information about the radio will be placed. The <b>dwSize</b> member of the <b>BLUETOOTH_RADIO_INFO</b> structure must match the size of the structure.
 * @returns {Integer} The following table  lists common return values.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_SUCCESS</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The radio information was retrieved successfully.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The <i>hRadio</i> or <i>pRadioInfo</i> parameter is <b>NULL</b>.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_REVISION_MISMATCH</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The <b>dwSize</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/bluetoothapis/ns-bluetoothapis-bluetooth_radio_info">BLUETOOTH_RADIO_INFO</a> structure pointed to by <i>pRadioInfo</i> is not valid.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/bluetoothapis/nf-bluetoothapis-bluetoothgetradioinfo
 * @since windows6.0.6000
 */
export BluetoothGetRadioInfo(hRadio, pRadioInfo) {
    A_LastError := 0

    result := DllCall("BluetoothApis.dll\BluetoothGetRadioInfo", HANDLE, hRadio, BLUETOOTH_RADIO_INFO.Ptr, pRadioInfo, UInt32)
    if(A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * The BluetoothFindFirstDevice function begins the enumeration Bluetooth devices.
 * @remarks
 * The BluetoothFindFirstDevice function does not find Bluetooth Low Energy (LE) devices.
 * To access Bluetooth LE devices, use the
 * <a href="https://docs.microsoft.com/windows/uwp/devices-sensors/bluetooth-low-energy-overview">Windows Runtime Bluetooth Low Energy APIs</a>.
 * The Windows Runtime APIs for Bluetooth work in both UWP and classic desktop apps.
 * @param {Pointer<BLUETOOTH_DEVICE_SEARCH_PARAMS>} pbtsp Pointer to a <a href="https://docs.microsoft.com/windows/win32/api/bluetoothapis/ns-bluetoothapis-bluetooth_device_search_params">BLUETOOTH_DEVICE_SEARCH_PARAMS</a> structure. The <b>dwSize</b> member of the <b>BLUETOOTH_DEVICE_SEARCH_PARAMS</b> structure pointed to by <i>pbtsp</i> must match the size of the structure.
 * @param {Pointer<BLUETOOTH_DEVICE_INFO>} pbtdi Pointer to a <a href="https://docs.microsoft.com/windows/win32/api/bluetoothapis/ns-bluetoothapis-bluetooth_device_info_struct">BLUETOOTH_DEVICE_INFO</a> structure into which information about the first Bluetooth device found is placed. The <b>dwSize</b> member of the <b>BLUETOOTH_DEVICE_INFO</b> structure pointed to by <i>pbtdi</i> must match the size of the structure, or the call to the <b>BluetoothFindFirstDevice</b> function fails.
 * @returns {HBLUETOOTH_DEVICE_FIND} Returns a valid handle to the first Bluetooth device upon successful completion, and the <i>pbtdi</i> parameter points to information about the device. When this handle is no longer needed, it must be closed via the <a href="https://docs.microsoft.com/windows/desktop/api/bluetoothapis/nf-bluetoothapis-bluetoothfinddeviceclose">BluetoothFindDeviceClose</a>.
 * 
 * Returns <b>NULL</b> upon failure. Call the  <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function for more information on the error. The following table  describe common errors:
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The <i>pbtsp</i> or <i>pbtdi</i> parameter is <b>NULL</b>.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_REVISION_MISMATCH</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The structure pointed to by <i>pbtsp</i> or <i>pbtdi</i> is not the correct size.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/bluetoothapis/nf-bluetoothapis-bluetoothfindfirstdevice
 * @since windows6.0.6000
 */
export BluetoothFindFirstDevice(pbtsp, pbtdi) {
    A_LastError := 0

    result := DllCall("BluetoothApis.dll\BluetoothFindFirstDevice", BLUETOOTH_DEVICE_SEARCH_PARAMS.Ptr, pbtsp, BLUETOOTH_DEVICE_INFO.Ptr, pbtdi, HBLUETOOTH_DEVICE_FIND.Owned)
    if(A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * The BluetoothFindNextDevice function finds the next Bluetooth device.
 * @param {HBLUETOOTH_DEVICE_FIND} hFind Handle for the query obtained in a previous call to the <a href="https://docs.microsoft.com/windows/desktop/api/bluetoothapis/nf-bluetoothapis-bluetoothfindfirstdevice">BluetoothFindFirstDevice</a> function.
 * @param {Pointer<BLUETOOTH_DEVICE_INFO>} pbtdi Pointer to a <a href="https://docs.microsoft.com/windows/win32/api/bluetoothapis/ns-bluetoothapis-bluetooth_device_info_struct">BLUETOOTH_DEVICE_INFO</a> structure into which information about the next Bluetooth device found is placed. The <b>dwSize</b> member of the <b>BLUETOOTH_DEVICE_INFO</b> structure pointed to by <i>pbtdi</i> must match the size of the structure, or the call to <b>BluetoothFindNextDevice</b> fails.
 * @returns {BOOL} Returns <b>TRUE</b> when the next device is successfully found, and the <i>pbtdi</i> parameter points to information about the device. Returns <b>FALSE</b> upon error. Call the  <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function for more information on the error. The following table  describe common errors:
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_HANDLE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The handle is <b>NULL</b>.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NO_MORE_ITEMS</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * No more devices were found.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_OUTOFMEMORY</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Out of memory.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/bluetoothapis/nf-bluetoothapis-bluetoothfindnextdevice
 * @since windows6.0.6000
 */
export BluetoothFindNextDevice(hFind, pbtdi) {
    A_LastError := 0

    result := DllCall("BluetoothApis.dll\BluetoothFindNextDevice", HBLUETOOTH_DEVICE_FIND, hFind, BLUETOOTH_DEVICE_INFO.Ptr, pbtdi, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * The BluetoothFindDeviceClose function closes an enumeration handle associated with a device query.
 * @param {HBLUETOOTH_DEVICE_FIND} hFind Handle for the query to be closed. Obtained in a previous call to the <a href="https://docs.microsoft.com/windows/desktop/api/bluetoothapis/nf-bluetoothapis-bluetoothfindfirstdevice">BluetoothFindFirstDevice</a> function.
 * @returns {BOOL} Returns <b>TRUE</b> when the handle is successfully closed. Returns <b>FALSE</b> upon error. Call the <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function for more information on the failure.
 * @see https://learn.microsoft.com/windows/win32/api/bluetoothapis/nf-bluetoothapis-bluetoothfinddeviceclose
 * @since windows6.0.6000
 */
export BluetoothFindDeviceClose(hFind) {
    A_LastError := 0

    result := DllCall("BluetoothApis.dll\BluetoothFindDeviceClose", HBLUETOOTH_DEVICE_FIND, hFind, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Retrieves information about a remote Bluetooth device.
 * @remarks
 * The Bluetooth device for which data is obtained must have been previously identified through a successful device inquiry function call.
 * 
 * In the <a href="https://docs.microsoft.com/windows/win32/api/bluetoothapis/ns-bluetoothapis-bluetooth_device_info_struct">BLUETOOTH_DEVICE_INFO</a> structure pointed to by <i>pbtdi</i>, the  <b>dwSize</b> member must be equivalent to the size, in bytes, of the structure. The <b>Address</b>          member of the <b>BLUETOOTH_DEVICE_INFO</b> structure must contain the Bluetooth address of the remote
 * device.
 * @param {HANDLE} hRadio A handle to a local radio, obtained from a call to the <a href="https://docs.microsoft.com/windows/desktop/api/bluetoothapis/nf-bluetoothapis-bluetoothfindfirstradio">BluetoothFindFirstRadio</a> or similar functions, or from a call to the <b>SetupDiEnumerateDeviceInterfaces</b> function.
 * @param {Pointer<BLUETOOTH_DEVICE_INFO>} pbtdi A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/bluetoothapis/ns-bluetoothapis-bluetooth_device_info_struct">BLUETOOTH_DEVICE_INFO</a> structure into which data about the first Bluetooth device will be placed. For more information, see Remarks.
 * @returns {Integer} Returns <b>ERROR_SUCCESS</b> upon success, indicating that data about the remote Bluetooth device was retrieved. Returns error codes upon failure. The following table lists common error codes associated with the <b>BluetoothGetDeviceInfo</b> function.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_REVISION_MISMATCH</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The size of the BLUETOOTH_DEVICE_INFO is not compatible. Check
 * the <b>dwSize</b> member of the <a href="https://docs.microsoft.com/windows/win32/api/bluetoothapis/ns-bluetoothapis-bluetooth_device_info_struct">BLUETOOTH_DEVICE_INFO</a> structure.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NOT_FOUND</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The radio is not known by the system, or the <b>Address</b> member of the <a href="https://docs.microsoft.com/windows/win32/api/bluetoothapis/ns-bluetoothapis-bluetooth_device_info_struct">BLUETOOTH_DEVICE_INFO</a> structure is all zeros.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The <i>pbtdi</i> parameter is <b>NULL</b>.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/bluetoothapis/nf-bluetoothapis-bluetoothgetdeviceinfo
 * @since windows6.0.6000
 */
export BluetoothGetDeviceInfo(hRadio, pbtdi) {
    result := DllCall("BluetoothApis.dll\BluetoothGetDeviceInfo", HANDLE, hRadio, BLUETOOTH_DEVICE_INFO.Ptr, pbtdi, UInt32)
    return result
}

/**
 * Updates the local computer cache about a Bluetooth device.
 * @remarks
 * When updating a Bluetooth device record, the requirements for members of the <a href="https://docs.microsoft.com/windows/win32/api/bluetoothapis/ns-bluetoothapis-bluetooth_device_info_struct">BLUETOOTH_DEVICE_INFO</a> structure, listed in the following table, must be observed.<table>
 * <tr>
 * <th>Member</th>
 * <th>Requirement</th>
 * </tr>
 * <tr>
 * <td><b>dwSize</b></td>
 * <td>Must match the structure size.</td>
 * </tr>
 * <tr>
 * <td><b>Address</b></td>
 * <td>Must be a previously found radio address.</td>
 * </tr>
 * <tr>
 * <td><b>szName</b></td>
 * <td>Must contain the new name to be stored.</td>
 * </tr>
 * </table>
 * @param {Pointer<BLUETOOTH_DEVICE_INFO>} pbtdi A pointer to the <a href="https://docs.microsoft.com/windows/win32/api/bluetoothapis/ns-bluetoothapis-bluetooth_device_info_struct">BLUETOOTH_DEVICE_INFO</a> structure to update. For more information, see the Remarks section.
 * @returns {Integer} Returns <b>ERROR_SUCCESS</b> upon success. The following table  lists common errors.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The <i>pbtdi</i> parameter is <b>NULL</b>.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_REVISION_MISMATCH</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The <b>dwSize</b> member of the structure pointed to in the <i>pbtdi</i> parameter is not valid.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/bluetoothapis/nf-bluetoothapis-bluetoothupdatedevicerecord
 * @since windows6.0.6000
 */
export BluetoothUpdateDeviceRecord(pbtdi) {
    result := DllCall("BluetoothApis.dll\BluetoothUpdateDeviceRecord", BLUETOOTH_DEVICE_INFO.Ptr, pbtdi, UInt32)
    return result
}

/**
 * Removes authentication between a Bluetooth device and the computer and clears cached service information for the device.
 * @remarks
 * The <b>BluetoothRemoveDevice</b> function fails if the device indicated by <i>pAddress</i> is not a remembered device.
 * @param {Pointer<BLUETOOTH_ADDRESS>} pAddress A pointer to the address of the Bluetooth device to be removed.
 * @returns {Integer} Returns <b>ERROR_SUCCESS</b> upon successful removal of the Bluetooth device. Returns <b>ERROR_NOT_FOUND</b> if the device was not found.
 * @see https://learn.microsoft.com/windows/win32/api/bluetoothapis/nf-bluetoothapis-bluetoothremovedevice
 * @since windows6.0.6000
 */
export BluetoothRemoveDevice(pAddress) {
    result := DllCall("BluetoothApis.dll\BluetoothRemoveDevice", BLUETOOTH_ADDRESS.Ptr, pAddress, UInt32)
    return result
}

/**
 * Enables Bluetooth device selection.
 * @remarks
 * The <b>BluetoothSelectDevices</b> function opens a common dialog box for selecting Bluetooth devices. The list of devices displayed to the user is determined by the flags and settings the caller specifies in the <i>pbtsdp</i> parameter.
 * 
 * If 
 * <b>BluetoothSelectDevices</b> returns <b>TRUE</b>, the <b>pDevices</b> member of the 
 * <a href="https://docs.microsoft.com/windows/win32/api/bluetoothapis/ns-bluetoothapis-bluetooth_select_device_params">BLUETOOTH_SELECT_DEVICE_PARAMS</a> structure points to valid data. The caller should verify that  the <b>fAuthenticated</b> and <b>fRemembered</b> flags in the 
 * <b>BLUETOOTH_SELECT_DEVICE_PARAMS</b> structure to determine which devices were successfully authenticated, and which devices are valid selections for the user. Call the 
 * <b>BluetoothSelectDevicesFree</b> function to free resources only if the 
 * <b>BluetoothSelectDevices</b> function returns <b>TRUE</b>.
 * @param {Pointer<BLUETOOTH_SELECT_DEVICE_PARAMS>} pbtsdp A pointer to a 
 * <a href="https://docs.microsoft.com/windows/win32/api/bluetoothapis/ns-bluetoothapis-bluetooth_select_device_params">BLUETOOTH_SELECT_DEVICE_PARAMS</a> structure that identifies Bluetooth devices.
 * @returns {BOOL} Returns <b>TRUE</b> if a user selected a device.
 * 
 * Returns <b>FALSE</b> if no valid data was returned. Call the <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function to retrieve error information. The following conditions apply to returned error information.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_CANCELLED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The user canceled the request.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The <i>pbtsdp</i> parameter is <b>NULL</b>.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_REVISION_MISMATCH</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The structure passed in <i>pbtsdp</i> is of unknown size.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/bluetoothapis/nf-bluetoothapis-bluetoothselectdevices
 * @since windows6.0.6000
 */
export BluetoothSelectDevices(pbtsdp) {
    A_LastError := 0

    result := DllCall("bthprops.cpl\BluetoothSelectDevices", BLUETOOTH_SELECT_DEVICE_PARAMS.Ptr, pbtsdp, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Frees resources associated with a previous call to BluetoothSelectDevices.
 * @remarks
 * Only call the <b>BluetoothSelectDevicesFree</b> function if a previous call to the <a href="https://docs.microsoft.com/windows/desktop/api/bluetoothapis/nf-bluetoothapis-bluetoothselectdevices">BluetoothSelectDevices</a> function returned <b>TRUE</b>.
 * @param {Pointer<BLUETOOTH_SELECT_DEVICE_PARAMS>} pbtsdp A pointer to a 
 * <a href="https://docs.microsoft.com/windows/win32/api/bluetoothapis/ns-bluetoothapis-bluetooth_select_device_params">BLUETOOTH_SELECT_DEVICE_PARAMS</a> structure that identifies the Bluetooth device resources to free.
 * @returns {BOOL} Returns <b>TRUE</b> upon success. Returns <b>FALSE</b> if there are no resources to free.
 * @see https://learn.microsoft.com/windows/win32/api/bluetoothapis/nf-bluetoothapis-bluetoothselectdevicesfree
 * @since windows6.0.6000
 */
export BluetoothSelectDevicesFree(pbtsdp) {
    result := DllCall("bthprops.cpl\BluetoothSelectDevicesFree", BLUETOOTH_SELECT_DEVICE_PARAMS.Ptr, pbtsdp, BOOL)
    return result
}

/**
 * Starts Control Panel device information property sheet.
 * @param {HWND} hwndParent A handle to the parent window of the property sheet.
 * @param {Pointer<BLUETOOTH_DEVICE_INFO>} pbtdi A pointer to the <a href="https://docs.microsoft.com/windows/win32/api/bluetoothapis/ns-bluetoothapis-bluetooth_device_info_struct">BLUETOOTH_DEVICE_INFO</a> structure that contains information about the Bluetooth device.
 * @returns {BOOL} Returns <b>TRUE</b> if the property sheet is successfully displayed. Returns <b>FALSE</b> if the property sheet was not displayed successfully; call the <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function for additional error information.
 * @see https://learn.microsoft.com/windows/win32/api/bluetoothapis/nf-bluetoothapis-bluetoothdisplaydeviceproperties
 * @since windows6.0.6000
 */
export BluetoothDisplayDeviceProperties(hwndParent, pbtdi) {
    A_LastError := 0

    result := DllCall("bthprops.cpl\BluetoothDisplayDeviceProperties", HWND, hwndParent, BLUETOOTH_DEVICE_INFO.Ptr, pbtdi, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Sends an authentication request to a remote Bluetooth device.
 * @remarks
 * Some remote Bluetooth devices can only accept numeric passkeys. There is no way to identify which devices only accept numeric passkeys in advance.
 * 
 * The Bluetooth authentication process has two modes: Wizard mode and Transparent mode.
 * 
 * Wizard mode is started when <i>pszPasskey</i> is set to <b>NULL</b>, and      the Bluetooth Connection Wizard is  started. The user is prompted to enter a passkey as a step in the wizard, after which the      authentication request is sent. The user interface displays whether the authentication attempt succeeds or fails, and provides the user with an opportunity to reattempt a failed authentication.
 * 
 * Transparent mode is started when <i>pszPasskey</i> is not <b>NULL</b>. In Transparent mode the authentication request is sent to the remote Bluetooth device without displaying any user interface. In Transparent mode, the Bluetooth status code is mapped to a Win32 error code; the following table lists this mapping information.<table>
 * <tr>
 * <th>Bluetooth status code</th>
 * <th>Win32 error code</th>
 * </tr>
 * <tr>
 * <td>BTH_ERROR_SUCCESS</td>
 * <td>ERROR_SUCCESS</td>
 * </tr>
 * <tr>
 * <td>BTH_ERROR_NO_CONNECTION</td>
 * <td>ERROR_DEVICE_NOT_CONNECTED</td>
 * </tr>
 * <tr>
 * <td>BTH_ERROR_PAGE_TIMEOUT</td>
 * <td>WAIT_TIMEOUT</td>
 * </tr>
 * <tr>
 * <td>BTH_ERROR_HARDWARE_FAILURE</td>
 * <td>ERROR_GEN_FAILURE</td>
 * </tr>
 * <tr>
 * <td>BTH_ERROR_AUTHENTICATION_FAILURE</td>
 * <td>ERROR_NOT_AUTHENTICATED</td>
 * </tr>
 * <tr>
 * <td>BTH_ERROR_MEMORY_FULL</td>
 * <td>ERROR_NOT_ENOUGH_MEMORY</td>
 * </tr>
 * <tr>
 * <td>BTH_ERROR_CONNECTION_TIMEOUT</td>
 * <td>WAIT_TIMEOUT</td>
 * </tr>
 * <tr>
 * <td>BTH_ERROR_LMP_RESPONSE_TIMEOUT</td>
 * <td>WAIT_TIMEOUT</td>
 * </tr>
 * <tr>
 * <td>BTH_ERROR_MAX_NUMBER_OF_CONNECTIONS</td>
 * <td>ERROR_REQ_NOT_ACCEP</td>
 * </tr>
 * <tr>
 * <td>BTH_ERROR_PAIRING_NOT_ALLOWED</td>
 * <td>ERROR_ACCESS_DENIED</td>
 * </tr>
 * <tr>
 * <td>BTH_ERROR_UNSPECIFIED_ERROR</td>
 * <td>ERROR_NOT_READY</td>
 * </tr>
 * <tr>
 * <td>BTH_ERROR_LOCAL_HOST_TERMINATED_CONNECTION</td>
 * <td>ERROR_VC_DISCONNECTED</td>
 * </tr>
 * </table>
 * @param {HWND} hwndParent A window to be the parent of the Authentication wizard. If set to <b>NULL</b>, the wizard is removed from the desktop.
 * @param {HANDLE} hRadio A valid local radio handle, or <b>NULL</b>. If <b>NULL</b>, authentication is attempted on all local radios; if any radio succeeds, the function call succeeds.
 * @param {Pointer<BLUETOOTH_DEVICE_INFO>} pbtbi A structure of type <a href="https://docs.microsoft.com/windows/win32/api/bluetoothapis/ns-bluetoothapis-bluetooth_device_info_struct">BLUETOOTH_DEVICE_INFO</a> that contains the record of the Bluetooth device to be authenticated.
 * @param {PWSTR} pszPasskey A Personal Identification Number (PIN) to be used for device authentication. If set to <b>NULL</b>, the user interface is displayed and the user must follow the authentication process provided in the user interface. If <i>pszPasskey</i> is not <b>NULL</b>, no user interface is displayed. If the passkey is not  <b>NULL</b>, it must be a <b>NULL</b>-terminated string. For more information, see the Remarks section.
 * @param {Integer} ulPasskeyLength The size, in characters, of <i>pszPasskey</i>. The size of <i>pszPasskey</i> must be less than or equal to <b>BLUETOOTH_MAX_PASSKEY_SIZE</b>.
 * @returns {Integer} Returns <b>ERROR_SUCCESS</b> upon successful completion.
 * 
 * Common errors are listed in the following table.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_CANCELLED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The user canceled the operation.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The device structure in the <i>pbtdi</i> parameter is not valid.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NO_MORE_ITEMS</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The device pointed to by <i>pbtdi</i>  is already marked as authenticated.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/bluetoothapis/nf-bluetoothapis-bluetoothauthenticatedevice
 * @since windows6.0.6000
 */
export BluetoothAuthenticateDevice(hwndParent, hRadio, pbtbi, pszPasskey, ulPasskeyLength) {
    pszPasskey := pszPasskey is String ? StrPtr(pszPasskey) : pszPasskey

    result := DllCall("bthprops.cpl\BluetoothAuthenticateDevice", HWND, hwndParent, HANDLE, hRadio, BLUETOOTH_DEVICE_INFO.Ptr, pbtbi, "ptr", pszPasskey, "uint", ulPasskeyLength, UInt32)
    return result
}

/**
 * The BluetoothAuthenticateDeviceEx function sends an authentication request to a remote Bluetooth device.
 * @remarks
 * The <a href="https://docs.microsoft.com/windows/win32/api/bluetoothapis/ns-bluetoothapis-bluetooth_device_info_struct">BLUETOOTH_DEVICE_INFO</a> structure specified by <i>pbtdilInOut</i> must contain the address of a device to authenticate.  If the value of <i>pbtOobData</i> is not <b>NULL</b>, an attempt  will be made to authenticate the remote device with the provided out-of-band data.
 * 
 * For all other types of  authentication, the caller should register an authentication callback using <a href="https://docs.microsoft.com/windows/desktop/api/bluetoothapis/nf-bluetoothapis-bluetoothregisterforauthenticationex">BluetoothRegisterForAuthenticationEx</a> and then respond to the relevant authentication method using <a href="https://docs.microsoft.com/windows/desktop/api/bluetoothapis/nf-bluetoothapis-bluetoothsendauthenticationresponseex">BluetoothSendAuthenticationResponseEx</a>.
 * @param {HWND} hwndParentIn The window to parent the authentication wizard. If <b>NULL</b>, the 
 * wizard will be parented off the desktop.
 * @param {HANDLE} hRadioIn A valid local radio handle or <b>NULL</b>. If <b>NULL</b>, then all radios will
 *           be tried. If any of the radios succeed, then the call will
 * succeed.
 * @param {Pointer<BLUETOOTH_DEVICE_INFO>} pbtdiInout A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/bluetoothapis/ns-bluetoothapis-bluetooth_device_info_struct">BLUETOOTH_DEVICE_INFO</a> structure describing the device          being authenticated.
 * @param {Pointer<BLUETOOTH_OOB_DATA_INFO>} pbtOobData Pointer to device specific out-of-band data to be provided with this API call.  If <b>NULL</b>, then a UI is
 *           displayed to continue the authentication process.
 * If not <b>NULL</b>, no UI is displayed.
 * 
 * <div class="alert"><b>Note</b>  If a callback is registered using <a href="https://docs.microsoft.com/windows/desktop/api/bluetoothapis/nf-bluetoothapis-bluetoothregisterforauthenticationex">BluetoothRegisterForAuthenticationEx</a>, then a UI will not be displayed.</div>
 * <div> </div>
 * @param {AUTHENTICATION_REQUIREMENTS} authenticationRequirement An <a href="https://docs.microsoft.com/windows/win32/api/bluetoothapis/ne-bluetoothapis-bluetooth_authentication_requirements">BLUETOOTH_AUTHENTICATION_REQUIREMENTS</a> value that specifies the protection required for authentication.
 * @returns {Integer} Returns ERROR_SUCCESS upon successful completion; returns the following error codes upon failure:
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_CANCELLED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The user aborted the operation.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The device structure specified in <i>pbdti</i> is invalid.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NO_MORE_ITEMS</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The device in pbtdi is already been marked as authenticated.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/bluetoothapis/nf-bluetoothapis-bluetoothauthenticatedeviceex
 * @since windows5.1.2600
 */
export BluetoothAuthenticateDeviceEx(hwndParentIn, hRadioIn, pbtdiInout, pbtOobData, authenticationRequirement) {
    result := DllCall("bthprops.cpl\BluetoothAuthenticateDeviceEx", HWND, hwndParentIn, HANDLE, hRadioIn, BLUETOOTH_DEVICE_INFO.Ptr, pbtdiInout, BLUETOOTH_OOB_DATA_INFO.Ptr, pbtOobData, AUTHENTICATION_REQUIREMENTS, authenticationRequirement, UInt32)
    return result
}

/**
 * Enables the caller to prompt for multiple devices to be authenticated during a single instance of the Bluetooth Connection wizard.
 * @param {HWND} hwndParent A window to be the parent of the Authentication wizard. If set to <b>NULL</b>, the wizard is parented off the desktop.
 * @param {HANDLE} hRadio The valid local radio handle, or <b>NULL</b>. If <b>NULL</b>, authentication is attempted on all local radios; if any radio succeeds, the function call succeeds.
 * @param {Integer} cDevices The number of devices in the <i>pbtdi</i> array of <a href="https://docs.microsoft.com/windows/win32/api/bluetoothapis/ns-bluetoothapis-bluetooth_device_info_struct">BLUETOOTH_DEVICE_INFO</a> structures.
 * @param {Pointer<BLUETOOTH_DEVICE_INFO>} rgbtdi An array of <a href="https://docs.microsoft.com/windows/win32/api/bluetoothapis/ns-bluetoothapis-bluetooth_device_info_struct">BLUETOOTH_DEVICE_INFO</a> structures that contain records for the Bluetooth devices to be authenticated.
 * @returns {Integer} Returns <b>ERROR_SUCCESS</b> upon successful completion; check the <b>fAuthenticate</b> flag for each device.
 * 
 * The following table  lists common errors.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_CANCELLED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The user canceled the operation. Check the <b>fAuthenticate</b> flag for each Bluetooth device to determine whether any devices were authenticated before the user canceled the operation.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * One or more of the devices in the <i>pbtdi</i> array was not valid.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NO_MORE_ITEMS</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * All  devices pointed to by <i>pbtdi</i>  are already marked as authenticated.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/bluetoothapis/nf-bluetoothapis-bluetoothauthenticatemultipledevices
 * @since windows6.0.6000
 */
export BluetoothAuthenticateMultipleDevices(hwndParent, hRadio, cDevices, rgbtdi) {
    result := DllCall("bthprops.cpl\BluetoothAuthenticateMultipleDevices", HWND, hwndParent, HANDLE, hRadio, "uint", cDevices, BLUETOOTH_DEVICE_INFO.Ptr, rgbtdi, UInt32)
    return result
}

/**
 * Enables or disables services for a Bluetooth device.
 * @remarks
 * Windows maintains a mapping of  service Globally Unique Identifiers (GUIDs) to supported drivers for
 * Bluetooth-enabled devices. Enabling a service installs the corresponding
 * device driver and disabling a service removes the corresponding device driver.
 * If a non-supported service is enabled, a driver is not installed.
 * @param {HANDLE} hRadio A handle of the local Bluetooth radio.
 * @param {Pointer<BLUETOOTH_DEVICE_INFO>} pbtdi A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/bluetoothapis/ns-bluetoothapis-bluetooth_device_info_struct">BLUETOOTH_DEVICE_INFO</a> structure. Must be a previously found radio address.
 * @param {Pointer<Guid>} pGuidService A pointer to the service GUID on the remote device.
 * @param {Integer} dwServiceFlags The flags that adjust the service. To disable the service, set to <b>BLUETOOTH_SERVICE_DISABLE</b>; to enable the service, set to <b>BLUETOOTH_SERVICE_ENABLE</b>.
 * @returns {Integer} Returns <b>ERROR_SUCCESS</b> upon successful completion. The following table  lists common errors.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The <i>dwServiceFlags</i> are not valid.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_SERVICE_DOES_NOT_EXIST</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The GUID specified in <i>pGuidService</i> is not supported.
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
 * <i>dwServiceFlags</i>  is set to <b>BLUETOOTH_SERVICE_DISABLE</b> and the service is already disabled, or <i>dwServiceFlags</i>  is set to  <b>BLUETOOTH_SERVICE_ENABLE</b> and the service is already enabled.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/bluetoothapis/nf-bluetoothapis-bluetoothsetservicestate
 * @since windows6.0.6000
 */
export BluetoothSetServiceState(hRadio, pbtdi, pGuidService, dwServiceFlags) {
    result := DllCall("BluetoothApis.dll\BluetoothSetServiceState", HANDLE, hRadio, BLUETOOTH_DEVICE_INFO.Ptr, pbtdi, Guid.Ptr, pGuidService, "uint", dwServiceFlags, UInt32)
    return result
}

/**
 * The BluetoothEnumerateInstalledServices function enumerates the services GUIDs (Globally Unique Identifiers) enabled on a Bluetooth device.
 * @param {HANDLE} hRadio Handle of the local Bluetooth radio device. If <b>NULL</b>,   all local radios are searched for enabled services that match the radio address in <i>pbtdi</i>.
 * @param {Pointer<BLUETOOTH_DEVICE_INFO>} pbtdi Pointer to a <a href="https://docs.microsoft.com/windows/win32/api/bluetoothapis/ns-bluetoothapis-bluetooth_device_info_struct">BLUETOOTH_DEVICE_INFO</a> structure.
 * @param {Pointer<Integer>} pcServiceInout On input, the number of records pointed to by the <i>pGuidServices</i> parameter. On output, the number of valid records returned in the <i>pGuidServices</i> parameter. If pGuidServices is <b>NULL</b>, on output <i>pcServices</i> contains the number of services enabled.
 * @param {Pointer<Guid>} pGuidServices Pointer to a buffer in memory to receive GUIDs for installed services. The buffer must be at least *<i>pcServices</i> *<b>sizeof</b>(GUID) bytes.
 * @returns {Integer} Returns ERROR_SUCCESS upon successful completion, and the pGuidServices parameter contains a complete list of enabled service GUIDs.
 * 
 * The following table  describes a common error:
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_MORE_DATA</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The call succeeded. The <i>pGuidServices</i> parameter contains an incomplete list of enabled service GUIDs.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/bluetoothapis/nf-bluetoothapis-bluetoothenumerateinstalledservices
 * @since windows6.0.6000
 */
export BluetoothEnumerateInstalledServices(hRadio, pbtdi, pcServiceInout, pGuidServices) {
    pcServiceInoutMarshal := pcServiceInout is VarRef ? "uint*" : "ptr"

    result := DllCall("BluetoothApis.dll\BluetoothEnumerateInstalledServices", HANDLE, hRadio, BLUETOOTH_DEVICE_INFO.Ptr, pbtdi, pcServiceInoutMarshal, pcServiceInout, Guid.Ptr, pGuidServices, UInt32)
    return result
}

/**
 * The BluetoothEnableDiscovery function changes the discovery state of a local Bluetooth radio or radios.
 * @remarks
 * Use the <a href="https://docs.microsoft.com/windows/desktop/api/bluetoothapis/nf-bluetoothapis-bluetoothisdiscoverable">BluetoothIsDiscoverable</a> function  to determine the current state of a Bluetooth radio.
 * Windows ensures that a discoverable system is connectable, and as such, the radio must allow incoming connections prior to making a radio 
 * discoverable. Failure to allow incoming connections results in the <b>BluetoothEnableDiscovery</b> function call failing.
 * 
 * When <b>BluetoothEnableDiscovery</b> changes the discovery state, the new state is valid for the lifetime of the calling application. Additionally, if a Bluetooth radio previously made discoverable with this function is disabled and re-enabled via the application, discoverability will not persist. Once the calling application terminates, the discovery  state of the specified Bluetooth radio reverts to the state it was in before <b>BluetoothEnableDiscovery</b> was called.
 * @param {HANDLE} hRadio Valid local radio handle, or <b>NULL</b>. If <b>NULL</b>, discovery is modified on all local radios; if any radio is modified by the call, the function call succeeds.
 * @param {BOOL} fEnabled Flag specifying whether discovery is to be enabled or disabled. Set to <b>TRUE</b> to enable discovery, set to <b>FALSE</b> to disable discovery.
 * @returns {BOOL} Returns <b>TRUE</b> if the discovery state was successfully changed. If <i>hRadio</i> is <b>NULL</b>, a return value of <b>TRUE</b> indicates that at least one local radio state was successfully changed. Returns <b>FALSE</b> if discovery state was not changed; if <i>hRadio</i> was <b>NULL</b>, no radio accepted the state change.
 * @see https://learn.microsoft.com/windows/win32/api/bluetoothapis/nf-bluetoothapis-bluetoothenablediscovery
 * @since windows6.0.6000
 */
export BluetoothEnableDiscovery(hRadio, fEnabled) {
    result := DllCall("BluetoothApis.dll\BluetoothEnableDiscovery", HANDLE, hRadio, BOOL, fEnabled, BOOL)
    return result
}

/**
 * The BluetoothIsDiscoverable function determines whether a Bluetooth radio or radios is discoverable.
 * @param {HANDLE} hRadio Valid local radio handle, or <b>NULL</b>. If <b>NULL</b>, discovery is determined for all local radios; if any radio is discoverable, the function call succeeds.
 * @returns {BOOL} Returns <b>TRUE</b> if at least one Bluetooth radio is discoverable. Returns <b>FALSE</b> if no Bluetooth radios are discoverable.
 * @see https://learn.microsoft.com/windows/win32/api/bluetoothapis/nf-bluetoothapis-bluetoothisdiscoverable
 * @since windows6.0.6000
 */
export BluetoothIsDiscoverable(hRadio) {
    result := DllCall("BluetoothApis.dll\BluetoothIsDiscoverable", HANDLE, hRadio, BOOL)
    return result
}

/**
 * The BluetoothEnableIncomingConnections function modifies whether a local Bluetooth radio accepts incoming connections.
 * @remarks
 * A  radio that is non-connectable is non-discoverable. The radio must be made non-discoverable  prior to making a radio non-connectable. Failure to make a radio non-discoverable prior to making it non-connectable will result in failure of the <b>BluetoothEnableIncomingConnections</b> function call.
 * @param {HANDLE} hRadio Valid local radio handle for which to change whether incoming connections are enabled, or <b>NULL</b>. If <b>NULL</b>, the attempt to modify incoming connection acceptance iterates through all local radios; if any radio is modified by the call, the function call succeeds.
 * @param {BOOL} fEnabled Flag specifying whether incoming connection acceptance is to be enabled or disabled. Set to <b>TRUE</b> to enable incoming connections, set to <b>FALSE</b> to disable incoming connections.
 * @returns {BOOL} Returns <b>TRUE</b> if the incoming connection  state was successfully changed. If <i>hRadio</i> is <b>NULL</b>, a return value of <b>TRUE</b> indicates that at least one local radio state was successfully changed. Returns <b>FALSE</b> if incoming connection  state was not changed; if <i>hRadio</i> was <b>NULL</b>, no radio accepted the state change.
 * @see https://learn.microsoft.com/windows/win32/api/bluetoothapis/nf-bluetoothapis-bluetoothenableincomingconnections
 * @since windows6.0.6000
 */
export BluetoothEnableIncomingConnections(hRadio, fEnabled) {
    result := DllCall("BluetoothApis.dll\BluetoothEnableIncomingConnections", HANDLE, hRadio, BOOL, fEnabled, BOOL)
    return result
}

/**
 * The BluetoothIsConnectable function determines whether a Bluetooth radio or radios is connectable.
 * @remarks
 * If multiple Bluetooth radios exist, the first radio to return that it is connectable causes the <b>BluetoothIsConnectable</b> function to succeed.
 * @param {HANDLE} hRadio Valid local radio handle, or <b>NULL</b>. If <b>NULL</b>, all local radios are checked for connectability; if any radio is connectable, the function call succeeds.
 * @returns {BOOL} Returns <b>TRUE</b> if at least one Bluetooth radio is accepting incoming connections. Returns <b>FALSE</b> if no radios are accepting incoming connections.
 * @see https://learn.microsoft.com/windows/win32/api/bluetoothapis/nf-bluetoothapis-bluetoothisconnectable
 * @since windows6.0.6000
 */
export BluetoothIsConnectable(hRadio) {
    result := DllCall("BluetoothApis.dll\BluetoothIsConnectable", HANDLE, hRadio, BOOL)
    return result
}

/**
 * The BluetoothRegisterForAuthentication function registers a callback function that is called when a particular Bluetooth device requests authentication.
 * @param {Pointer<BLUETOOTH_DEVICE_INFO>} pbtdi Pointer to a  <a href="https://docs.microsoft.com/windows/win32/api/bluetoothapis/ns-bluetoothapis-bluetooth_device_info_struct">BLUETOOTH_DEVICE_INFO</a> structure. The Address member is used for comparison.
 * @param {Pointer<Pointer>} phRegHandle Pointer to a structure in which the registration HANDLE is stored. Call the <a href="https://docs.microsoft.com/windows/desktop/api/bluetoothapis/nf-bluetoothapis-bluetoothunregisterauthentication">BluetoothUnregisterAuthentication</a> to close the handle.
 * @param {Pointer<PFN_AUTHENTICATION_CALLBACK>} _pfnCallback Function to be called when the authentication event occurs. The function should match the prototype described in PFN_AUTHENTICATION_CALLBACK.
 * @param {Pointer<Void>} pvParam Optional parameter to be passed through the callback function.
 * @returns {Integer} Returns ERROR_SUCCESS upon successful completion, and a valid registration handle was returned in <i>phRegHandle</i>. Any other return value indicates failure.
 * 
 * Call the <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function to obtain more information about the error. The following table  describes a common error:
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_OUTOFMEMORY</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Out of memory.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/bluetoothapis/nf-bluetoothapis-bluetoothregisterforauthentication
 * @since windows6.0.6000
 */
export BluetoothRegisterForAuthentication(pbtdi, phRegHandle, _pfnCallback, pvParam) {
    phRegHandleMarshal := phRegHandle is VarRef ? "ptr*" : "ptr"
    pvParamMarshal := pvParam is VarRef ? "ptr" : "ptr"

    A_LastError := 0

    result := DllCall("BluetoothApis.dll\BluetoothRegisterForAuthentication", BLUETOOTH_DEVICE_INFO.Ptr, pbtdi, phRegHandleMarshal, phRegHandle, "ptr", _pfnCallback, pvParamMarshal, pvParam, UInt32)
    if(A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * The BluetoothRegisterForAuthenticationEx function registers an application for a pin request, numeric comparison and callback function.
 * @remarks
 * The caller must provide a valid callback address and must unregister the callback once notification is no longer required.  The deregistration of an authenticated device can be accomplished by calling <a href="https://docs.microsoft.com/windows/desktop/api/bluetoothapis/nf-bluetoothapis-bluetoothunregisterauthentication">BluetoothUnregisterAuthentication</a>.
 * 
 * In scenarios where an application registers for authentication more than once, only the first callback function registered via this function will be called in the application while authentication is in progress.
 * @param {Pointer<BLUETOOTH_DEVICE_INFO>} pbtdiIn A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/bluetoothapis/ns-bluetoothapis-bluetooth_device_info_struct">BLUETOOTH_DEVICE_INFO</a> structure that specifies the bluetooth address to be utilized for comparison.
 * @param {Pointer<Pointer>} phRegHandleOut A pointer to a <b>HBLUETOOTH_AUTHENTICATION_REGISTRATION</b> handle associated with the registered application. Call <a href="https://docs.microsoft.com/windows/desktop/api/bluetoothapis/nf-bluetoothapis-bluetoothunregisterauthentication">BluetoothUnregisterAuthentication</a> to close
 * the handle.
 * @param {Pointer<PFN_AUTHENTICATION_CALLBACK_EX>} pfnCallbackIn The function that will be called when the authentication event          occurs. This function should match the prototype of <a href="https://docs.microsoft.com/windows/desktop/api/bluetoothapis/nc-bluetoothapis-pfn_authentication_callback_ex">PFN_AUTHENTICATION_CALLBACK_EX</a>.
 * @param {Pointer<Void>} pvParam Optional parameter to be passed through to the callback function specified by <i>pfnCallbackIn</i>.          This parameter  can be anything the application is required to define.
 * @returns {Integer} Returns ERROR_SUCCESS upon successful completion; returns the following error codes upon failure:
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_OUTOFMEMORY</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Out of memory.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>Win32 Error</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The registration handle that was provided is invalid.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/bluetoothapis/nf-bluetoothapis-bluetoothregisterforauthenticationex
 * @since windows6.0.6000
 */
export BluetoothRegisterForAuthenticationEx(pbtdiIn, phRegHandleOut, pfnCallbackIn, pvParam) {
    phRegHandleOutMarshal := phRegHandleOut is VarRef ? "ptr*" : "ptr"
    pvParamMarshal := pvParam is VarRef ? "ptr" : "ptr"

    result := DllCall("BluetoothApis.dll\BluetoothRegisterForAuthenticationEx", BLUETOOTH_DEVICE_INFO.Ptr, pbtdiIn, phRegHandleOutMarshal, phRegHandleOut, "ptr", pfnCallbackIn, pvParamMarshal, pvParam, UInt32)
    return result
}

/**
 * The BluetoothUnregisterAuthentication function removes registration for a callback routine that was previously registered with a call to the BluetoothRegisterForAuthentication function.
 * @param {Pointer} hRegHandle Handle returned by a previous call to the <a href="https://docs.microsoft.com/windows/desktop/api/bluetoothapis/nf-bluetoothapis-bluetoothregisterforauthentication">BluetoothRegisterForAuthentication</a> function.
 * @returns {BOOL} Returns <b>TRUE</b> when the authentication registration is successfully removed. Returns <b>FALSE</b> if the specified handle is not successfully closed.
 * 
 * Call the <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function to obtain more information about the error. The following table  describes a common error:
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_HANDLE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The handle is <b>NULL</b>.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/bluetoothapis/nf-bluetoothapis-bluetoothunregisterauthentication
 * @since windows6.0.6000
 */
export BluetoothUnregisterAuthentication(hRegHandle) {
    A_LastError := 0

    result := DllCall("BluetoothApis.dll\BluetoothUnregisterAuthentication", "ptr", hRegHandle, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * The BluetoothSendAuthenticationResponse function is called when an authentication request to send the passkey response is received.
 * @param {HANDLE} hRadio Optional handle to the local radio handle, or <b>NULL</b>. If <b>NULL</b>, the function attempts to send an authentication response on all local radios.
 * @param {Pointer<BLUETOOTH_DEVICE_INFO>} pbtdi Pointer to a <a href="https://docs.microsoft.com/windows/win32/api/bluetoothapis/ns-bluetoothapis-bluetooth_device_info_struct">BLUETOOTH_DEVICE_INFO</a> structure describing the Bluetooth device being authenticated. This can be the same structure passed to the callback function.
 * @param {PWSTR} pszPasskey Pointer to a UNICODE zero-terminated string of the passkey response
 * to be sent back to the authenticating device. the <i>pszPasskey</i> parameter can be no larger than BLUETOOTH_MAX_PASSKEY_SIZE, excluding <b>NULL</b>. If translation to ANSI is performed, the <i>pszPasskey</i> parameter cannot be larger than 16 bytes, excluding <b>NULL</b>.
 * @returns {Integer} Returns ERROR_SUCCESS when the device accepts the passkey response; the device is authenticated. Any other return value indicates failure. The following table  describes common errors:
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_CANCELLED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The Bluetooth device denied the passkey response. This error is also returned if a communication problem exists with the local radio.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_FAIL</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The device returned a failure code during authentication.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/bluetoothapis/nf-bluetoothapis-bluetoothsendauthenticationresponse
 * @since windows6.0.6000
 */
export BluetoothSendAuthenticationResponse(hRadio, pbtdi, pszPasskey) {
    pszPasskey := pszPasskey is String ? StrPtr(pszPasskey) : pszPasskey

    result := DllCall("BluetoothApis.dll\BluetoothSendAuthenticationResponse", HANDLE, hRadio, BLUETOOTH_DEVICE_INFO.Ptr, pbtdi, "ptr", pszPasskey, UInt32)
    return result
}

/**
 * The BluetoothSendAuthenticationResponseEx function is called when an authentication request to send the passkey or a Numeric Comparison response is made.
 * @remarks
 * Callers can only use this function to respond to a pending authentication request.  Applications should register with <a href="https://docs.microsoft.com/windows/desktop/api/bluetoothapis/nf-bluetoothapis-bluetoothregisterforauthentication">BluetoothRegisterForAuthenticationEx</a> in order to be notified of incoming authentication requests.  
 * 
 * Only the <b>BLUETOOTH_AUTHENTICATION_METHOD_LEGACY</b>, <b>BLUETOOTH_AUTHENTICATION_METHOD_NUMERIC_COMPARISON</b> and <b>BLUETOOTH_AUTHENTICATION_METHOD_PASSKEY_NOTIFICATION</b> response types are valid.
 * @param {HANDLE} hRadioIn A handle of the Bluetooth radio device to specify local service information for.
 * @param {Pointer<BLUETOOTH_AUTHENTICATE_RESPONSE>} pauthResponse Pointer to a <a href="https://docs.microsoft.com/windows/win32/api/bluetoothapis/ns-bluetoothapis-bluetooth_authenticate_response">BLUETOOTH_AUTHENTICATE_RESPONSE</a> structure containing the response to the <b>BTH_REMOTE_AUTHENTICATE_REQUEST</b> event.
 * @returns {Integer} Returns ERROR_SUCCESS upon successful completion; returns the following error codes upon failure:
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_CANCELLED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The device was denied the passkey response. This may also indicate a communications problem with the local radio device.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_FAIL</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The device returned a failure code during authentication.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/bluetoothapis/nf-bluetoothapis-bluetoothsendauthenticationresponseex
 * @since windows6.0.6000
 */
export BluetoothSendAuthenticationResponseEx(hRadioIn, pauthResponse) {
    result := DllCall("BluetoothApis.dll\BluetoothSendAuthenticationResponseEx", HANDLE, hRadioIn, BLUETOOTH_AUTHENTICATE_RESPONSE.Ptr, pauthResponse, UInt32)
    return result
}

/**
 * Retrieves and parses a single element from an SDP stream.
 * @param {Integer} pSdpStream A pointer to a valid SDP stream.
 * @param {Integer} cbSdpStreamLength The length, in bytes, of <i>pSdpStream</i>.
 * @param {Pointer<SDP_ELEMENT_DATA>} pData A pointer to a buffer to be filled with the data of the SDP element found at the beginning of the <i>pSdpStream</i> SDP stream.
 * @returns {Integer} Returns <b>ERROR_SUCCESS</b> when the SDP element is parsed correctly. Returns <b>ERROR_INVALID_PARAMETER</b> if one of the required parameters is <b>NULL</b>, or if the SDP stream pointed to by <i>pSdpStream</i> is not valid.
 * @see https://learn.microsoft.com/windows/win32/api/bluetoothapis/nf-bluetoothapis-bluetoothsdpgetelementdata
 * @since windows6.0.6000
 */
export BluetoothSdpGetElementData(pSdpStream, cbSdpStreamLength, pData) {
    result := DllCall("BluetoothApis.dll\BluetoothSdpGetElementData", "ptr", pSdpStream, "uint", cbSdpStreamLength, SDP_ELEMENT_DATA.Ptr, pData, UInt32)
    return result
}

/**
 * Iterates a container stream and returns each element contained within the container element.
 * @param {Integer} pContainerStream A pointer to valid SDP stream. The first element in the stream must be a sequence
 * or an alternative.
 * @param {Integer} cbContainerLength The size, in bytes, of the <i>pContainerStream</i> parameter.
 * @param {Pointer<Pointer>} pElement A value used to track the  location in the stream.  The first
 *           time the <b>BluetoothSdpGetContainerElementData</b> function is called for a  container, *<i>pElement</i> should be <b>NULL</b>.  For subsequent calls, the value should be
 * unmodified.
 * @param {Pointer<SDP_ELEMENT_DATA>} pData A pointer to a buffer filled with data from  the
 * current SDP element of <i>pContainerStream</i>.
 * @returns {Integer} Returns <b>ERROR_SUCCESS</b> upon success, indicating that the <i>pData</i> parameter contains the data. Returns error codes upon failure. The following table describes common error codes associated with the <b>BluetoothSdpGetContainerElementData</b> function:
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NO_MORE_ITEMS</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * There are no more items in the list. The caller should stop calling
 * the <a href="https://docs.microsoft.com/windows/desktop/api/bluetoothapis/nf-bluetoothapis-bluetoothsdpgetcontainerelementdata">BluetoothSdpGetContainerElementData</a> function for this container.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A required pointer is <b>NULL</b>, or the container is not a valid SDP
 * stream.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/bluetoothapis/nf-bluetoothapis-bluetoothsdpgetcontainerelementdata
 * @since windows6.0.6000
 */
export BluetoothSdpGetContainerElementData(pContainerStream, cbContainerLength, pElement, pData) {
    pElementMarshal := pElement is VarRef ? "ptr*" : "ptr"

    result := DllCall("BluetoothApis.dll\BluetoothSdpGetContainerElementData", "ptr", pContainerStream, "uint", cbContainerLength, pElementMarshal, pElement, SDP_ELEMENT_DATA.Ptr, pData, UInt32)
    return result
}

/**
 * The BluetoothSdpGetAttributeValue function retrieves the attribute value for an attribute identifier.
 * @remarks
 * The record stream in <i>pRecordStream</i> must be an SDP stream formatted as an SDP record, a SEQUENCE
 * containing attribute ID (UINT16) plus attribute value (any SDP element type) pairs.
 * 
 * The attribute identifier provided in the <i>usAttributeId</i> parameter can be one of the many SDP_ATTRIB_Xxx universal attribute identifiers provided in the bthdef.h file, or a custom attribute value defined by a Bluetooth profile. All values greater than or equal to 0x200 are profile-specific attribute identifiers, and are specific to the profile. See the bthdef.h header file for a list of universal SDP attribute identifiers.
 * @param {Integer} pRecordStream Pointer to a valid record stream that is formatted as a single SDP record.
 * @param {Integer} cbRecordLength Length of <i>pRecordStream</i>, in bytes.
 * @param {Integer} usAttributeId Attribute identifier to search for. See Remarks.
 * @param {Pointer<SDP_ELEMENT_DATA>} pAttributeData Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/bluetoothapis/ns-bluetoothapis-sdp_element_data">SDP_ELEMENT_DATA</a> structure into which the attribute's identifier value is placed.
 * @returns {Integer} Returns ERROR_SUCCESS upon successful completion; the <i>pAddributeData</i> parameter contains the attribute value. Any other return value indicates error. The following table describes common error codes associated with the <b>BluetoothSdpGetAttributeValue</b> function:
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Either one of the required pointers was <b>NULL</b>, the <i>pRecordStream</i> parameter was not a valid SDP stream, or the <i>pRecordStream</i> parameter was not a properly formatted SDP record.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_FILE_NOT_FOUND</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The identifier provided in <i>usAttributeId</i> was not found in the record.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/bluetoothapis/nf-bluetoothapis-bluetoothsdpgetattributevalue
 * @since windows6.0.6000
 */
export BluetoothSdpGetAttributeValue(pRecordStream, cbRecordLength, usAttributeId, pAttributeData) {
    result := DllCall("BluetoothApis.dll\BluetoothSdpGetAttributeValue", "ptr", pRecordStream, "uint", cbRecordLength, "ushort", usAttributeId, SDP_ELEMENT_DATA.Ptr, pAttributeData, UInt32)
    return result
}

/**
 * Converts a raw string embedded in the SDP record into a Unicode string.
 * @param {Integer} pRecordStream A pointer to a valid record stream formatted as a single SDP record.
 * @param {Integer} cbRecordLength The length, in bytes, of <i>pRecordStream</i>.
 * @param {Pointer<SDP_STRING_TYPE_DATA>} pStringData When set to <b>NULL</b>, the calling thread locale is used to search          for a matching string in the SDP record.  If not <b>NULL</b>, the <b>mibeNum</b> and <b>attributeId</b> members of the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/bluetoothapis/ns-bluetoothapis-sdp_string_type_data">SDP_STRING_TYPE_DATA</a> structure are used to find the string to convert.
 * @param {Integer} usStringOffset SDP string type offset to convert.  The <i>usStringOffset</i> is added to the base attribute identifier  of the string.   SDP specification-defined offsets are: STRING_NAME_OFFSET, STRING_DESCRIPTION_OFFSET, and STRING_PROVIDER_NAME_OFFSET. These offsets can be found in the bthdef.h header file.
 * @param {PWSTR} pszString If not <b>NULL</b>, contains the converted string on output. When set to <b>NULL</b>, the <i>pcchStringLength</i> parameter is filled with the required number of characters, not bytes, to retrieve the converted string.
 * @param {Pointer<Integer>} pcchStringLength On input, contains the length of
 * <i>pszString</i> if <i>pszString</i> is not <b>NULL</b>, in characters.
 * 
 * Upon output, contains the
 * number of required characters including <b>NULL</b> if an error is returned,
 * or the number of characters written to <i>pszString</i>, including <b>NULL</b>.
 * @returns {Integer} Returns ERROR_SUCCESS upon successful completion; the <i>pszString</i> parameter contains the converted string. Returns error codes upon failure. Common errors are listed in the following table.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_MORE_DATA</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The <i>pszString</i> parameter was <b>NULL</b> or too small to contain the converted string; the <i>pcchStringLength</i> parameter contains, in characters, the required length.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_DATA</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The conversion cannot be performed.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NO_SYSTEM_RESOURCES</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The system cannot allocate memory internally to perform the conversion.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * One of the required pointers was <b>NULL</b>, the <i>pRecordStream</i> parameter was not a valid
 * SDP stream, the <i>pRecordStream</i> was not a properly formatted record, or
 * the requested attribute plus offset was not a string.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/bluetoothapis/nf-bluetoothapis-bluetoothsdpgetstring
 * @since windows6.0.6000
 */
export BluetoothSdpGetString(pRecordStream, cbRecordLength, pStringData, usStringOffset, pszString, pcchStringLength) {
    pszString := pszString is String ? StrPtr(pszString) : pszString

    pcchStringLengthMarshal := pcchStringLength is VarRef ? "uint*" : "ptr"

    result := DllCall("BluetoothApis.dll\BluetoothSdpGetString", "ptr", pRecordStream, "uint", cbRecordLength, SDP_STRING_TYPE_DATA.Ptr, pStringData, "ushort", usStringOffset, "ptr", pszString, pcchStringLengthMarshal, pcchStringLength, UInt32)
    return result
}

/**
 * The BluetoothSdpEnumAttributes function enumerates through the SDP record stream, and calls the callback function for each attribute in the record.
 * @remarks
 * If the callback function returns
 * <b>FALSE</b>, the enumeration initiated by the <b>BluetoothSdpEnumAttributes</b> function is stopped.
 * 
 * The record stream in <i>pSDPStream</i> must be an SDP stream formatted as an SDP record, a SEQUENCE
 * containing attribute ID (UINT16) plus attribute value (any SDP element type) pairs.
 * @param {Integer} pSDPStream Pointer to a valid record stream that is formatted as a single SDP record.
 * @param {Integer} cbStreamSize Size of the stream pointed to by <i>pSDPStream</i>, in bytes.
 * @param {Pointer<PFN_BLUETOOTH_ENUM_ATTRIBUTES_CALLBACK>} _pfnCallback Pointer to the callback routine. See <a href="https://docs.microsoft.com/windows/desktop/api/bluetoothapis/nc-bluetoothapis-pfn_bluetooth_enum_attributes_callback">PFN_BLUETOOTH_ENUM_ATTRIBUTES_CALLBACK</a> for more information about the callback.
 * @param {Pointer<Void>} pvParam Optional parameter to be passed to the callback routine.
 * @returns {BOOL} Returns <b>TRUE</b> if an enumeration occurred. Returns <b>FALSE</b> upon failure. Call the <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function for more information. The following table describes common error codes associated with the <b>BluetoothSdpEnumAttributes</b> function:
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The <i>pSDPStream</i> or <i>pfnCallback</i> parameter is <b>NULL</b>.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_DATA</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The SDP stream is corrupt.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/bluetoothapis/nf-bluetoothapis-bluetoothsdpenumattributes
 * @since windows6.0.6000
 */
export BluetoothSdpEnumAttributes(pSDPStream, cbStreamSize, _pfnCallback, pvParam) {
    pvParamMarshal := pvParam is VarRef ? "ptr" : "ptr"

    A_LastError := 0

    result := DllCall("BluetoothApis.dll\BluetoothSdpEnumAttributes", "ptr", pSDPStream, "uint", cbStreamSize, "ptr", _pfnCallback, pvParamMarshal, pvParam, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * Sets local service information for a specific Bluetooth radio.
 * @remarks
 * <b>BluetoothSetLocalServiceInfo</b> is a user-mode API that is used only by profile driver developers to
 *     trigger the installation of a local service that is described by the service <b>GUID</b> in 
 *     <i>pClassGuid</i>.
 * 
 * <b>BluetoothSetLocalServiceInfo</b> generates a Plug and Play (PnP) device ID in the form of "BTHENUM\{<i>ClassGuid</i>}". For example, "BTHENUM\{xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx}". User-mode applications
 *     can call 
 *     <b>BluetoothSetLocalServiceInfo</b> subsequent times with the same service GUID but with a different
 *     instance ID to create multiple instances of the specified server-side profile.
 * 
 * To use Bluetooth APIs like 
 *     <b>BluetoothSetLocalServiceInfo</b>, user-mode applications should link with 
 *     BthProps.lib.
 * 
 * <div class="alert"><b>Warning</b>  The process that calls 
 *     <b>BluetoothSetLocalServiceInfo</b> must have the <b>SE_LOAD_DRIVER_NAME</b> privilege. A process running in the
 *     system or an administrator context can elevate its privilege by using the SDK 
 *     <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-lookupprivilegevaluea">LookupPrivilegeValue</a> and 
 *     <a href="https://docs.microsoft.com/windows/desktop/api/securitybaseapi/nf-securitybaseapi-adjusttokenprivileges">AdjustTokenPrivileges</a> functions. For more information about this see 
 *     <a href="https://docs.microsoft.com/previous-versions/ff536681(v=vs.85)">Installing a Bluetooth
 *     Device</a>.</div>
 * <div> </div>
 * The <a href="https://docs.microsoft.com/windows/win32/api/bluetoothapis/ns-bluetoothapis-bluetooth_local_service_info_struct">BLUETOOTH_LOCAL_SERVICE_INFO</a> structure is defined in the SDK 
 *     BluetoothApis.h header file.
 * @param {HANDLE} hRadioIn A handle of the Bluetooth radio device to specify local service information for. If <b>NULL</b>, 
 *      <b>BluetoothSetLocalServiceInfo</b> searches for the first available local Bluetooth radio.
 * @param {Pointer<Guid>} pClassGuid The GUID of the service to expose. This should match the <b>GUID</b> in the server-side INF file.
 * @param {Integer} ulInstance An instance ID for the device node of the Plug and Play (PnP) ID.
 * @param {Pointer<BLUETOOTH_LOCAL_SERVICE_INFO>} pServiceInfoIn A pointer to a <a href="https://docs.microsoft.com/windows/win32/api/bluetoothapis/ns-bluetoothapis-bluetooth_local_service_info_struct">BLUETOOTH_LOCAL_SERVICE_INFO</a> structure that describes the local service to
 *      set.
 * @returns {Integer} The 
 *      <b>BluetoothSetLocalServiceInfo</b> function returns the following values:
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NOT_FOUND</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The specified Bluetooth radio was not detected.
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
 * No Bluetooth radios were detected.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>STATUS_INSUFFICIENT_RESOURCES</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Sufficient resources were not available to complete the operation. You can receive this error
 *        when more than 100 local physical device objects (PDOs) correspond to Bluetooth services.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>STATUS_PRIVILEGE_NOT_HELD</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The caller does not have the required privileges. See the Remarks section for information about
 *        how to elevate privileges.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/bluetoothapis/nf-bluetoothapis-bluetoothsetlocalserviceinfo
 * @since windows6.0.6000
 */
export BluetoothSetLocalServiceInfo(hRadioIn, pClassGuid, ulInstance, pServiceInfoIn) {
    result := DllCall("BluetoothApis.dll\BluetoothSetLocalServiceInfo", HANDLE, hRadioIn, Guid.Ptr, pClassGuid, "uint", ulInstance, BLUETOOTH_LOCAL_SERVICE_INFO.Ptr, pServiceInfoIn, UInt32)
    return result
}

/**
 * BluetoothIsVersionAvailable function indicates if the installed Bluetooth binary set supports the requested version.
 * @remarks
 * This functionality is only exported in Bluetooth for Windows version 2.1 and later.
 * @param {Integer} MajorVersion The major version number.
 * @param {Integer} MinorVersion The minor version number.
 * @returns {BOOL} <b>TRUE</b> if the installed bluetooth binaries support the specified <i>MajorVersion</i> and <i>MinorVersion</i>; otherwise, <b>FALSE</b>.
 * @see https://learn.microsoft.com/windows/win32/api/bluetoothapis/nf-bluetoothapis-bluetoothisversionavailable
 * @since windows6.0.6000
 */
export BluetoothIsVersionAvailable(MajorVersion, MinorVersion) {
    result := DllCall("BluetoothApis.dll\BluetoothIsVersionAvailable", "char", MajorVersion, "char", MinorVersion, BOOL)
    return result
}

/**
 * The BluetoothGATTGetServices function gets all the primary services available for a server.
 * @remarks
 * Returned services are cached upon successful retrieval of services from the device directly.  Unless a service-change event is received, the list of returned services is not expected to change.
 * 
 * Profile drivers should pre-allocate  a sufficiently large buffer for the array of
 *     primary services to be returned in.  Callers can determine the necessary buffer size by passing a non-<b>NULL</b> value in <i>ServicesBufferActual</i> and <b>NULL</b> in <i>ServicesBuffer</i>.
 * 
 * Do not modify the returned service structure,
 *     and then use the modified structure in subsequent function calls.  Behavior is undefined
 *     if the caller does this.
 * 
 * <b>Example</b>
 * 
 * 
 * ```cpp
 * 
 * ////////////////////////////////////////////////////////////////////////////
 * // Determine Services Buffer Size
 * ////////////////////////////////////////////////////////////////////////////
 * 
 *     hr = BluetoothGATTGetServices(
 *             hLEDevice,
 *             0,
 *             NULL,
 *             &serviceBufferCount,
 *             BLUETOOTH_GATT_FLAG_NONE);
 *     
 *     if (HRESULT_FROM_WIN32(ERROR_MORE_DATA) != hr) {
 *         PrintHr("BluetoothGATTGetServices - Buffer Size", hr);
 *         goto Done;
 *     }
 * 
 *     pServiceBuffer = (PBTH_LE_GATT_SERVICE)
 *             malloc(sizeof(BTH_LE_GATT_SERVICE) * serviceBufferCount);
 *     
 *     if (NULL == pServiceBuffer) {
 *         printf("pServiceBuffer out of memory\r\n");
 *         goto Done;
 *     } else {
 *         RtlZeroMemory(pServiceBuffer, 
 *                 sizeof(BTH_LE_GATT_SERVICE) * serviceBufferCount);
 *     }
 *     
 * ////////////////////////////////////////////////////////////////////////////
 * // Retrieve Services
 * ////////////////////////////////////////////////////////////////////////////
 *     
 *     hr = BluetoothGATTGetServices(
 *             hLEDevice,
 *             serviceBufferCount,
 *             pServiceBuffer,
 *             &numServices,
 *             BLUETOOTH_GATT_FLAG_NONE);
 *     
 *     if (S_OK != hr) {
 *         PrintHr("BluetoothGATTGetServices - Actual Data", hr);
 *         goto Done;
 *     }
 * 
 * ```
 * @param {HANDLE} hDevice Handle to the Bluetooth device from which to obtain the list of primary services.
 * @param {Integer} ServicesBufferCount The number of elements allocated for the <i>ServicesBuffer</i> parameter.
 * @param {Pointer<BTH_LE_GATT_SERVICE>} ServicesBuffer Pointer to buffer containing a <a href="https://docs.microsoft.com/windows/desktop/api/bthledef/ns-bthledef-bth_le_gatt_service">BTH_LE_GATT_SERVICE</a> structure into which to return services.
 * @param {Integer} Flags Flags to modify the behavior of <b>BluetoothGATTGetServices</b>:
 * 
 * <table>
 * <tr>
 * <th>Flag</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td>
 * <b>BLUETOOTH_GATT_FLAG_NONE</b>
 * 
 * </td>
 * <td>
 * The client does not have specific GATT requirements (default).
 * 
 * </td>
 * </tr>
 * </table>
 * @returns {Integer} Pointer to buffer into which the actual number of services were returned in the <i>ServicesBuffer</i> parameter.
 * @see https://learn.microsoft.com/windows/win32/api/bluetoothleapis/nf-bluetoothleapis-bluetoothgattgetservices
 * @since windows8.0
 */
export BluetoothGATTGetServices(hDevice, ServicesBufferCount, ServicesBuffer, Flags) {
    result := DllCall("BluetoothApis.dll\BluetoothGATTGetServices", HANDLE, hDevice, "ushort", ServicesBufferCount, BTH_LE_GATT_SERVICE.Ptr, ServicesBuffer, "ushort*", &ServicesBufferActual := 0, "uint", Flags, "HRESULT")
    return ServicesBufferActual
}

/**
 * Gets all the included services available for a given service.
 * @remarks
 * Returned services are cached upon successful retrieval of services from the device directly.  Unless a service-change event is received, the list of returned services is not expected to change.
 * 
 * Profile drivers should pre-allocate  a sufficiently large buffer for the array of
 *     primary services to be returned in.  Callers can determine the necessary buffer size by passing a non-<b>NULL</b> value in <i>IncludedServicesBufferActual</i> and <b>NULL</b> in <i>IncludedServicesBuffer</i>.
 * 
 * Do not modify the returned service structure,
 *     and then use the modified structure in subsequent function calls.  Behavior is undefined
 *     if the caller does this.
 * 
 * <b>Example</b>
 * 
 * 
 * ```cpp
 * 
 * ////////////////////////////////////////////////////////////////////////////
 * // Determine Included Services Buffer Size
 * ////////////////////////////////////////////////////////////////////////////
 * hr = BluetoothGATTGetIncludedServices(
 *      hLEDevice,
 *      gattService,
 *      0,
 *      NULL,
 *      &inclServicesBufferSize,
 *      BLUETOOTH_GATT_FLAG_NONE);
 * 
 *      if (HRESULT_FROM_WIN32(ERROR_MORE_DATA) != hr) {
 *          PrintHr("BluetoothGATTGetIncludedServices - Buffer Size", hr);
 *          goto Done;
 *      }
 * 
 *      if (inclServicesBufferSize > 0) {
 *          pInclServicesBuffer = (PBTH_LE_GATT_ PBTH_LE_GATT_SERVICE)
 *                     malloc(inclServicesBufferSize * sizeof(BTH_LE_GATT_SERVICE));
 * 
 *          if (NULL == pInclServicesBuffer) {
 *              printf("pInclServicesBuffer out of memory\r\n");
 *              goto Done;
 *          } else {
 *              RtlZeroMemory(pInclServicesBuffer, 
 *                     inclServicesBufferSize * sizeof(BTH_LE_GATT_SERVICE));
 *          }
 * 
 *          ////////////////////////////////////////////////////////////////////////////
 *          // Retrieve Included Services
 *          ////////////////////////////////////////////////////////////////////////////
 * 
 *          hr = BluetoothGATTGetIncludedServices (
 *               hLEDevice,
 *               gattService,
 *               inclServicesBufferSize,
 *               pInclServicesBuffer,
 *               &numIncludedServices
 *               BLUETOOTH_GATT_FLAG_NONE);
 * 
 *          if (S_OK != hr) {
 *              PrintHr("BluetoothGATTGetIncludedServices - Actual Data", hr);
 *              goto Done;
 *          }
 *      }
 * ```
 * @param {HANDLE} hDevice Handle to the Bluetooth device or parent service.
 * @param {Pointer<BTH_LE_GATT_SERVICE>} ParentService Address of a <a href="https://docs.microsoft.com/windows/desktop/api/bthledef/ns-bthledef-bth_le_gatt_service">BTH_LE_GATT_SERVICE</a> structure that contains the parent service of the included services to be retrieved. This parameter is required if a device handle is passed to <i>hDevice</i>. This parameter is optional if a service handle was passed to <i>hDevice</i>, in which case the service specified by the service handle will be treated as the parent.
 * @param {Integer} IncludedServicesBufferCount The number of elements allocated for the <i>IncludedServicesBuffer</i> parameter.
 * @param {Pointer<BTH_LE_GATT_SERVICE>} IncludedServicesBuffer Address of a buffer containing a <a href="https://docs.microsoft.com/windows/desktop/api/bthledef/ns-bthledef-bth_le_gatt_service">BTH_LE_GATT_SERVICE</a> structure into which to return included services.
 * @param {Integer} Flags Flags to modify the behavior of <b>BluetoothGATTGetIncludedServices</b>:
 * 
 * <table>
 * <tr>
 * <th>Flag</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td>
 * <b>BLUETOOTH_GATT_FLAG_NONE</b>
 * 
 * </td>
 * <td>
 * The client does not have specific GATT requirements (default).
 * 
 * </td>
 * </tr>
 * </table>
 * @returns {Integer} Pointer to buffer into which the actual number of included services were returned in the <i>IncludedServicesBuffer</i> parameter.
 * @see https://learn.microsoft.com/windows/win32/api/bluetoothleapis/nf-bluetoothleapis-bluetoothgattgetincludedservices
 * @since windows8.0
 */
export BluetoothGATTGetIncludedServices(hDevice, ParentService, IncludedServicesBufferCount, IncludedServicesBuffer, Flags) {
    result := DllCall("BluetoothApis.dll\BluetoothGATTGetIncludedServices", HANDLE, hDevice, BTH_LE_GATT_SERVICE.Ptr, ParentService, "ushort", IncludedServicesBufferCount, BTH_LE_GATT_SERVICE.Ptr, IncludedServicesBuffer, "ushort*", &IncludedServicesBufferActual := 0, "uint", Flags, "HRESULT")
    return IncludedServicesBufferActual
}

/**
 * Gets all the characteristics available for the specified service.
 * @remarks
 * Returned characteristics are cached upon successful retrieval of characteristics from the device directly.  Unless a service-change event is received, the list of returned characteristics is not expected to change.
 * 
 * Profile drivers should pre-allocate  a sufficiently large buffer for the array of
 *     characteristics to be returned in.  Callers can determine the necessary buffer size by passing a non-<b>NULL</b> value in <i>CharacteristicsBufferActual</i> and <b>NULL</b> in <i>CharacteristicsBuffer</i>.
 * 
 * Do not modify the returned characteristic structure,
 *     and then use the modified  structure in subsequent function calls.  Behavior is undefined
 *     if the caller does this.
 * 
 * The parent service must be present in the
 *     cache, otherwise the function will fail.  The parent service must be a service returned by either <a href="https://docs.microsoft.com/windows/win32/api/bluetoothleapis/nf-bluetoothleapis-bluetoothgattgetservices">BluetoothGATTGetServices</a> or
 *     <a href="https://docs.microsoft.com/windows/win32/api/bluetoothleapis/nf-bluetoothleapis-bluetoothgattgetincludedservices">BluetoothGATTGetIncludedServices</a>.
 * 
 * <b>Example</b>
 * 
 * 
 * ```cpp
 * ////////////////////////////////////////////////////////////////////////////
 * // Determine Characteristic Buffer Size
 * ////////////////////////////////////////////////////////////////////////////
 * 
 *         hr = BluetoothGATTGetCharacteristics(
 *                 hCurrService,
 *                 currGattService,
 *                 0,
 *                 NULL,
 *                 &charBufferSize,
 *                 BLUETOOTH_GATT_FLAG_NONE);
 *         
 *         if (HRESULT_FROM_WIN32(ERROR_MORE_DATA) != hr) {
 *             PrintHr("BluetoothGATTGetCharacteristics - Buffer Size", hr);
 *             goto Done;
 *         }
 *         
 *         if (charBufferSize > 0) {
 *             pCharBuffer = (PBTH_LE_GATT_CHARACTERISTIC)
 *                     malloc(charBufferSize * sizeof(BTH_LE_GATT_CHARACTERISTIC));
 *         
 *             if (NULL == pCharBuffer) {
 *                 printf("pCharBuffer out of memory\r\n");
 *                 goto Done;
 *             } else {
 *                 RtlZeroMemory(pCharBuffer, 
 *                         charBufferSize * sizeof(BTH_LE_GATT_CHARACTERISTIC));
 *             }
 * 
 * ////////////////////////////////////////////////////////////////////////////
 * // Retrieve Characteristics
 * ////////////////////////////////////////////////////////////////////////////
 *     
 *             hr = BluetoothGATTGetCharacteristics(
 *                     hCurrService,
 *                     currGattService,
 *                     charBufferSize,
 *                     pCharBuffer,
 *                     &numChars,
 *                     BLUETOOTH_GATT_FLAG_NONE);
 * 
 *             if (S_OK != hr) {
 *                 PrintHr("BluetoothGATTGetCharacteristics - Actual Data", hr);
 *                 goto Done; // Allow continuation
 *             }
 * 
 *             if (numChars != charBufferSize) {
 *                 printf("buffer size and buffer size actual size mismatch\r\n");
 *                 goto Done;
 *             }
 *         }
 * ```
 * @param {HANDLE} hDevice Handle to the Bluetooth device or service.
 * @param {Pointer<BTH_LE_GATT_SERVICE>} Service Address of a <a href="https://docs.microsoft.com/windows/win32/api/bthledef/ns-bthledef-bth_le_gatt_service">BTH_LE_GATT_SERVICE</a> structure containing the parent service of the included services to be retrieved. This parameter is required if a device handle is passed to <i>hDevice</i>. This parameter is optional if a service handle was passed to <i>hDevice</i>, in which case the service specified by the service handle will be treated as the parent.
 * @param {Integer} CharacteristicsBufferCount The number of elements allocated for the <i>CharacteristicsBuffer</i> parameter.
 * @param {Pointer<BTH_LE_GATT_CHARACTERISTIC>} CharacteristicsBuffer Pointer to a buffer into which to return characteristics as an array of [BTH_LE_GATT_CHARACTERISTIC](/windows/win32/api/bthledef/ns-bthledef-bth_le_gatt_characteristic) structures.
 * @param {Integer} Flags Flags to modify the behavior of <b>BluetoothGATTGetCharacteristics</b>:
 * 
 * <table>
 * <tr>
 * <th>Flag</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td>
 * <b>BLUETOOTH_GATT_FLAG_NONE</b>
 * 
 * </td>
 * <td>
 * The client does not have specific GATT requirements (default).
 * 
 * </td>
 * </tr>
 * </table>
 * @returns {Integer} Pointer to buffer into which is returned the actual number of characteristics that were returned in the <i>CharacteristicsBuffer</i> parameter.
 * @see https://learn.microsoft.com/windows/win32/api/bluetoothleapis/nf-bluetoothleapis-bluetoothgattgetcharacteristics
 * @since windows8.0
 */
export BluetoothGATTGetCharacteristics(hDevice, Service, CharacteristicsBufferCount, CharacteristicsBuffer, Flags) {
    result := DllCall("BluetoothApis.dll\BluetoothGATTGetCharacteristics", HANDLE, hDevice, BTH_LE_GATT_SERVICE.Ptr, Service, "ushort", CharacteristicsBufferCount, BTH_LE_GATT_CHARACTERISTIC.Ptr, CharacteristicsBuffer, "ushort*", &CharacteristicsBufferActual := 0, "uint", Flags, "HRESULT")
    return CharacteristicsBufferActual
}

/**
 * Gets all the descriptors available for the specified characteristic.
 * @remarks
 * Returned characteristics are cached upon successful retrieval of characteristics from the device directly.  Unless a service-change event is received, the list of returned characteristics is not expected to change.
 * 
 * Profile drivers should pre-allocate  a sufficiently large buffer for the array of
 *     characteristics to be returned in.  Callers can determine the necessary buffer size by passing a non-<b>NULL</b> value in <i>DescriptorsBufferActual</i> and <b>NULL</b> in <i>DescriptorsBuffer</i>.
 * 
 * Do not modify the returned characteristic structure,
 *     and then use the modified  structure in subsequent function calls.  Behavior is undefined
 *     if the caller does this.
 * 
 * The parent characteristic must be present in the
 *     cache, otherwise the function will fail.  The parent service must be a service returned by either <a href="https://docs.microsoft.com/windows/desktop/api/bluetoothleapis/nf-bluetoothleapis-bluetoothgattgetservices">BluetoothGATTGetServices</a> or
 *     <a href="https://docs.microsoft.com/windows/desktop/api/bluetoothleapis/nf-bluetoothleapis-bluetoothgattgetincludedservices">BluetoothGATTGetIncludedServices</a>.
 * 
 * <b>Example</b>
 * 
 * 
 * ```cpp
 * 
 * ////////////////////////////////////////////////////////////////////////////
 * // Determine Descriptor Buffer Size
 * ////////////////////////////////////////////////////////////////////////////
 * GetDescriptors:
 *             hr = BluetoothGATTGetDescriptors(
 *                     hCurrService,
 *                     currGattChar,
 *                     0,
 *                     NULL,
 *                     &descriptorBufferSize,
 *                     BLUETOOTH_GATT_FLAG_NONE);
 *             
 *             if (HRESULT_FROM_WIN32(ERROR_MORE_DATA) != hr) {
 *                 PrintHr("BluetoothGATTGetDescriptors - Buffer Size", hr);
 *                 goto Done; // Allow continuation
 *             }
 *             
 *             if (descriptorBufferSize > 0) {
 *                 pDescriptorBuffer = (PBTH_LE_GATT_DESCRIPTOR)
 *                         malloc(descriptorBufferSize 
 *                             * sizeof(BTH_LE_GATT_DESCRIPTOR));
 *             
 *                 if (NULL == pDescriptorBuffer) {
 *                     printf("pDescriptorBuffer out of memory\r\n");
 *                     goto Done;
 *                 } else {
 *                     RtlZeroMemory(pDescriptorBuffer, descriptorBufferSize);
 *                 }
 *             
 * ////////////////////////////////////////////////////////////////////////////
 * // Retrieve Descriptors
 * ////////////////////////////////////////////////////////////////////////////
 *     
 *                 hr = BluetoothGATTGetDescriptors(
 *                         hCurrService,
 *                         currGattChar,
 *                         descriptorBufferSize,
 *                         pDescriptorBuffer,
 *                         &numDescriptors,
 *                         BLUETOOTH_GATT_FLAG_NONE);
 *             
 *                 if (S_OK != hr) {
 *                     PrintHr("BluetoothGATTGetDescriptors - Actual Data", hr);
 *                     goto Done;
 *                 }
 * 
 *                 if (numDescriptors != descriptorBufferSize) {
 *                     printf("buffer size and buffer size actual size mismatch\r\n");
 *                     goto Done;
 *                 }
 *             }
 * 
 * ```
 * @param {HANDLE} hDevice Handle to the Bluetooth device or service.  If a service handle is passed, then the service must be the grandparent of the descriptor.
 * @param {Pointer<BTH_LE_GATT_CHARACTERISTIC>} Characteristic Pointer to <a href="https://docs.microsoft.com/windows/desktop/api/bthledef/ns-bthledef-bth_le_gatt_characteristic">BTH_LE_GATT_CHARACTERISTIC</a> structure containing the parent characteristic of the descriptors to be retrieved.
 * @param {Integer} DescriptorsBufferCount The number of elements allocated for the <i>DescriptorsBuffer</i> parameter.
 * @param {Pointer<BTH_LE_GATT_DESCRIPTOR>} DescriptorsBuffer Pointer to buffer containing a <a href="https://docs.microsoft.com/windows/desktop/api/bthledef/ns-bthledef-bth_le_gatt_descriptor">BTH_LE_GATT_DESCRIPTOR</a> structure into which to return descriptors.
 * @param {Integer} Flags Flags to modify the behavior of <b>BluetoothGATTGetDescriptors</b>:
 * 
 * <table>
 * <tr>
 * <th>Flag</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td>
 * <b>BLUETOOTH_GATT_FLAG_NONE</b>
 * 
 * </td>
 * <td>
 * The client does not have specific GATT requirements (default).
 * 
 * </td>
 * </tr>
 * </table>
 * @returns {Integer} Pointer to buffer into which the actual number of descriptors were returned in the <i>DescriptorsBuffer</i> parameter.
 * @see https://learn.microsoft.com/windows/win32/api/bluetoothleapis/nf-bluetoothleapis-bluetoothgattgetdescriptors
 * @since windows8.0
 */
export BluetoothGATTGetDescriptors(hDevice, Characteristic, DescriptorsBufferCount, DescriptorsBuffer, Flags) {
    result := DllCall("BluetoothApis.dll\BluetoothGATTGetDescriptors", HANDLE, hDevice, BTH_LE_GATT_CHARACTERISTIC.Ptr, Characteristic, "ushort", DescriptorsBufferCount, BTH_LE_GATT_DESCRIPTOR.Ptr, DescriptorsBuffer, "ushort*", &DescriptorsBufferActual := 0, "uint", Flags, "HRESULT")
    return DescriptorsBufferActual
}

/**
 * Gets the value of the specified characteristic.
 * @remarks
 * The characteristic value is returned from the cache if one is already present. This would be the case most of the time, as all the device attributes are cached at the time of pairing or association.  However, if it is not present, the characteristic value is read directly from the device, and will be cached upon successfully reading it from the device.  If <b>BLUETOOTH_GATT_FLAG_FORCE_READ_FROM_CACHE</b> or <b>BLUETOOTH_GATT_FLAG_FORCE_READ_FROM_DEVICE</b> is present, the characteristic value is read using the specified method.
 * 
 * Returned characteristics are cached upon successful retrieval of characteristics from the device directly.  Unless a service-change event is received, the list of returned characteristics is not expected to change.
 * 
 * Profile drivers should pre-allocate  a sufficiently large buffer for the array of
 *     characteristics to be returned in.  Callers can determine the necessary buffer size by passing a non-<b>NULL</b> value in <i>CharacteristicValueSizeRequired</i> and <b>NULL</b> in <i>CharacteristicValue</i>.
 * 
 * The parent service must be present in the
 *     cache, otherwise the function will fail.  The parent service must be a service returned by either <a href="https://docs.microsoft.com/windows/desktop/api/bluetoothleapis/nf-bluetoothleapis-bluetoothgattgetservices">BluetoothGATTGetServices</a> or
 *     <a href="https://docs.microsoft.com/windows/desktop/api/bluetoothleapis/nf-bluetoothleapis-bluetoothgattgetincludedservices">BluetoothGATTGetIncludedServices</a>.
 * 
 * <b>Example</b>
 * 
 * 
 * ```cpp
 * 
 *             if (currGattChar->IsReadable) {
 * ////////////////////////////////////////////////////////////////////////////
 * // Determine Characteristic Value Buffer Size
 * ////////////////////////////////////////////////////////////////////////////
 * 
 *                 hr = BluetoothGATTGetCharacteristicValue(
 *                         hCurrService,
 *                         currGattChar,
 *                         0,
 *                         NULL,
 *                         &charValueDataSize,
 *                         BLUETOOTH_GATT_FLAG_NONE);
 * 
 *                 if (HRESULT_FROM_WIN32(ERROR_MORE_DATA) != hr) {
 *                     PrintHr("BluetoothGATTGetCharacteristicValue - Buffer Size", hr);
 *                     goto GetDescriptors; // Proceed to retrieving descriptors
 *                 }
 * 
 *                 pCharValueBuffer = (PBTH_LE_GATT_CHARACTERISTIC_VALUE)malloc(charValueDataSize);
 * 
 *                 if (NULL == pCharValueBuffer) {
 *                     printf("pCharValueBuffer out of memory\r\n");
 *                     goto Done;
 *                 } else {
 *                     RtlZeroMemory(pCharValueBuffer, charValueDataSize);
 *                 }
 * 
 * ////////////////////////////////////////////////////////////////////////////
 * // Retrieve the Characteristic Value
 * ////////////////////////////////////////////////////////////////////////////
 * 
 *                 hr = BluetoothGATTGetCharacteristicValue(
 *                         hCurrService,
 *                         currGattChar,
 *                         (ULONG)charValueDataSize,
 *                         pCharValueBuffer,
 *                         NULL,
 *                         BLUETOOTH_GATT_FLAG_NONE);
 * 
 *                 if (S_OK != hr) {
 *                     PrintHr("BluetoothGATTGetCharacteristicValue - Actual Data", hr);
 *                     goto GetDescriptors; // Proceed to retrieving descriptors
 *                 }
 * 
 *                 PrintCharacteristicValue(pCharValueBuffer, 2, currGattChar->CharacteristicUuid);
 * 
 *                 // Free before going to next iteration, or memory leak.
 *                 free(pCharValueBuffer);
 *                 pCharValueBuffer = NULL;
 *             }
 * 
 * ```
 * @param {HANDLE} hDevice Handle to the service.
 * @param {Pointer<BTH_LE_GATT_CHARACTERISTIC>} Characteristic Pointer to the parent characteristic of the characteristic value to be retrieved.
 * @param {Integer} CharacteristicValueDataSize The number of bytes allocated for the <i>CharacteristicValue</i> parameter.
 * @param {Pointer<BTH_LE_GATT_CHARACTERISTIC_VALUE>} CharacteristicValue Pointer to buffer into which to return the characteristic value.
 * @param {Integer} Flags Flags to modify the behavior of <b>BluetoothGATTGetCharacteristicValue</b>:
 * 
 * <table>
 * <tr>
 * <th>Flag</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td>
 * <b>BLUETOOTH_GATT_FLAG_NONE</b>
 * 
 * </td>
 * <td>
 * The client does not have specific GATT requirements (default).
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>
 * <b>BLUETOOTH_GATT_FLAG_CONNECTION_ENCRYPTED</b>
 * 
 * </td>
 * <td>
 * The client requests the data to be transmitted over an encrypted channel.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>
 * <b>BLUETOOTH_GATT_FLAG_CONNECTION_AUTHENTICATED</b>
 * 
 * </td>
 * <td>
 * The client requests the data to be transmitted over an authenticated channel.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>
 * <b>BLUETOOTH_GATT_FLAG_FORCE_READ_FROM_DEVICE</b>
 * 
 * </td>
 * <td>
 * The characteristic value is to be read directly from the device.  This overwrites the one in the cache if one is already present.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>
 * <b>BLUETOOTH_GATT_FLAG_FORCE_READ_FROM_CACHE</b>
 * 
 * </td>
 * <td>
 * The characteristic value is to be read from the cache (regardless of whether it is present in the cache or not).
 * 
 * </td>
 * </tr>
 * </table>
 * @returns {Integer} Pointer to buffer into which to store the number of bytes needed to return data in the buffer pointed to by <i>CharacteristicValue</i>.
 * @see https://learn.microsoft.com/windows/win32/api/bluetoothleapis/nf-bluetoothleapis-bluetoothgattgetcharacteristicvalue
 * @since windows8.0
 */
export BluetoothGATTGetCharacteristicValue(hDevice, Characteristic, CharacteristicValueDataSize, CharacteristicValue, Flags) {
    result := DllCall("BluetoothApis.dll\BluetoothGATTGetCharacteristicValue", HANDLE, hDevice, BTH_LE_GATT_CHARACTERISTIC.Ptr, Characteristic, "uint", CharacteristicValueDataSize, BTH_LE_GATT_CHARACTERISTIC_VALUE.Ptr, CharacteristicValue, "ushort*", &CharacteristicValueSizeRequired := 0, "uint", Flags, "HRESULT")
    return CharacteristicValueSizeRequired
}

/**
 * Gets the value of the specified descriptor.
 * @remarks
 * The descriptor value is returned from the cache if one is already present. This would be the case most of the time, as all the device attributes are cached at the time of pairing or association.  However, if it is not present, the descriptor value is read directly from the device, and will be cached upon successfully reading it from the device.  If <b>BLUETOOTH_GATT_FLAG_FORCE_READ_FROM_CACHE</b> or <b>BLUETOOTH_GATT_FLAG_FORCE_READ_FROM_DEVICE</b> is present, the descriptor value is read using the specified method.
 * 
 * Returned descriptor values are cached upon successful retrieval of descriptor values from the device directly.  Unless a service-change event is received, the descriptor values is not expected to change.
 * 
 * Profile drivers should pre-allocate  a sufficiently large buffer for the array of
 *     descriptor values to be returned in.  Callers can determine the necessary buffer size by passing a non-<b>NULL</b> value in <i>DescriptorValueSizeRequired</i> and <b>NULL</b> in <i>DescriptorValue</i>.
 * 
 * The parent service must be present in the
 *     cache, otherwise the function will fail.  The parent service must be a service returned by either <a href="https://docs.microsoft.com/windows/desktop/api/bluetoothleapis/nf-bluetoothleapis-bluetoothgattgetservices">BluetoothGATTGetServices</a> or
 *     <a href="https://docs.microsoft.com/windows/desktop/api/bluetoothleapis/nf-bluetoothleapis-bluetoothgattgetincludedservices">BluetoothGATTGetIncludedServices</a>.
 * 
 * <b>Example</b>
 * 
 * 
 * ```cpp
 * 
 * ////////////////////////////////////////////////////////////////////////////
 * // Determine Descriptor Value Buffer Size
 * ////////////////////////////////////////////////////////////////////////////
 *                 hr = BluetoothGATTGetDescriptorValue(
 *                         hCurrService,
 *                         currGattDescriptor,
 *                         0,
 *                         NULL,
 *                         &descValueDataSize,
 *                         BLUETOOTH_GATT_FLAG_NONE);
 * 
 *                 if (HRESULT_FROM_WIN32(ERROR_MORE_DATA) != hr) {
 *                     PrintHr("BluetoothGATTGetDescriptorValue - Buffer Size", hr);
 *                     goto Done; // allow continuation
 *                 }
 * 
 *                 pDescValueBuffer = (PBTH_LE_GATT_DESCRIPTOR_VALUE)malloc(descValueDataSize);
 * 
 *                 if (NULL == pDescValueBuffer) {
 *                     printf("pDescValueBuffer out of memory\r\n");
 *                     goto Done;
 *                 } else {
 *                     RtlZeroMemory(pDescValueBuffer, descValueDataSize);
 *                 }
 * 
 * ////////////////////////////////////////////////////////////////////////////
 * // Retrieve the Descriptor Value
 * ////////////////////////////////////////////////////////////////////////////
 * 
 *                 hr = BluetoothGATTGetDescriptorValue(
 *                         hCurrService,
 *                         currGattDescriptor,
 *                         (ULONG)descValueDataSize,
 *                         pDescValueBuffer,
 *                         NULL,
 *                         BLUETOOTH_GATT_FLAG_NONE);
 * 
 *                 if (S_OK != hr) {
 *                     PrintHr("BluetoothGATTGetDescriptorValue - Actual Data", hr);
 *                     goto Done; // allow continuation
 *                 }
 * 
 * ```
 * @param {HANDLE} hDevice Handle to the service.
 * @param {Pointer<BTH_LE_GATT_DESCRIPTOR>} Descriptor Pointer to <a href="https://docs.microsoft.com/windows/desktop/api/bthledef/ns-bthledef-bth_le_gatt_descriptor">BTH_LE_GATT_DESCRIPTOR</a> structure containing the parent descriptor of the descriptor value to be retrieved.
 * @param {Integer} DescriptorValueDataSize The number of bytes allocated for the <i>DescriptorValue</i> parameter.
 * @param {Pointer<BTH_LE_GATT_DESCRIPTOR_VALUE>} DescriptorValue Pointer to <a href="https://docs.microsoft.com/windows/desktop/api/bthledef/ns-bthledef-bth_le_gatt_descriptor_value">BTH_LE_GATT_DESCRIPTOR_VALUE</a> structure into which to return the descriptor value.
 * @param {Integer} Flags Flags to modify the behavior of <b>BluetoothGATTGetDescriptorValue</b>:
 * 
 * <table>
 * <tr>
 * <th>Flag</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td>
 * <b>BLUETOOTH_GATT_FLAG_NONE</b>
 * 
 * </td>
 * <td>
 * The client does not have specific GATT requirements (default).
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>
 * <b>BLUETOOTH_GATT_FLAG_CONNECTION_ENCRYPTED</b>
 * 
 * </td>
 * <td>
 * The client requests the data to be transmitted over an encrypted channel.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>
 * <b>BLUETOOTH_GATT_FLAG_CONNECTION_AUTHENTICATED</b>
 * 
 * </td>
 * <td>
 * The client requests the data to be transmitted over an authenticated channel.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>
 * <b>BLUETOOTH_GATT_FLAG_FORCE_READ_FROM_DEVICE</b>
 * 
 * </td>
 * <td>
 * The descriptor value is to be read directly from the device.  This overwrites the one in the cache if one is already present.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>
 * <b>BLUETOOTH_GATT_FLAG_FORCE_READ_FROM_CACHE</b>
 * 
 * </td>
 * <td>
 * The descriptor value is to be read from the cache (regardless of whether it is present in the cache or not).
 * 
 * </td>
 * </tr>
 * </table>
 * @returns {Integer} Pointer to buffer into which to store the number of additional bytes needed to return data in the buffer pointed to by <i>DescriptorValue</i>.
 * @see https://learn.microsoft.com/windows/win32/api/bluetoothleapis/nf-bluetoothleapis-bluetoothgattgetdescriptorvalue
 * @since windows8.0
 */
export BluetoothGATTGetDescriptorValue(hDevice, Descriptor, DescriptorValueDataSize, DescriptorValue, Flags) {
    result := DllCall("BluetoothApis.dll\BluetoothGATTGetDescriptorValue", HANDLE, hDevice, BTH_LE_GATT_DESCRIPTOR.Ptr, Descriptor, "uint", DescriptorValueDataSize, BTH_LE_GATT_DESCRIPTOR_VALUE.Ptr, DescriptorValue, "ushort*", &DescriptorValueSizeRequired := 0, "uint", Flags, "HRESULT")
    return DescriptorValueSizeRequired
}

/**
 * The BluetoothGATTBeginReliableWrite function specifies that reliable writes are about to begin.
 * @remarks
 * The <b>BluetoothGATTBeginReliableWrite</b> function notifies the Bluetooth stack that procedures that are to be called after the function returns are reliable write operations.  Any operations that do not support reliable writes will return an <b>ERROR_INVALID_FUNCTION</b> error. Only the following functions support reliable write operations:
 * 
 * <ul>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/bluetoothleapis/nf-bluetoothleapis-bluetoothgattsetcharacteristicvalue">BluetoothGATTSetCharacteristicValue</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/bluetoothleapis/nf-bluetoothleapis-bluetoothgattendreliablewrite">BluetoothGATTEndReliableWrite</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/bluetoothleapis/nf-bluetoothleapis-bluetoothgattabortreliablewrite">BluetoothGATTAbortReliableWrite</a>
 * </li>
 * </ul>
 * @param {HANDLE} hDevice Handle to the service.
 * @param {Integer} Flags Flags to modify the behavior of <b>BluetoothGATTBeginReliableWrite</b>:
 * 
 * <table>
 * <tr>
 * <th>Flag</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td>
 * <b>BLUETOOTH_GATT_FLAG_NONE</b>
 * 
 * </td>
 * <td>
 * The client does not have specific GATT requirements (default).
 * 
 * </td>
 * </tr>
 * </table>
 * @returns {Integer} Address of a <b>BTH_LE_GATT_RELIABLE_WRITE_CONTEXT</b> structure containing the context describing the reliable write operation.
 * @see https://learn.microsoft.com/windows/win32/api/bluetoothleapis/nf-bluetoothleapis-bluetoothgattbeginreliablewrite
 * @since windows8.0
 */
export BluetoothGATTBeginReliableWrite(hDevice, Flags) {
    result := DllCall("BluetoothApis.dll\BluetoothGATTBeginReliableWrite", HANDLE, hDevice, "uint*", &ReliableWriteContext := 0, "uint", Flags, "HRESULT")
    return ReliableWriteContext
}

/**
 * Writes the specified characteristic value to the Bluetooth device.
 * @remarks
 * Calling <b>BluetoothGATTSetCharacteristicValue</b> after <a href="https://docs.microsoft.com/windows/desktop/api/bluetoothleapis/nf-bluetoothleapis-bluetoothgattbeginreliablewrite">BluetoothGATTBeginReliableWrite</a>, notifies the remote Bluetooth device to store this request into a prepare queue on the device.
 * 
 * If signing is required, then the operation must not require a response, and must not occur over a secure channel.
 * 
 * The parent characteristic is returned from a previous call to <a href="https://docs.microsoft.com/windows/desktop/api/bluetoothleapis/nf-bluetoothleapis-bluetoothgattgetcharacteristics">BluetoothGATTGetCharacteristics</a>, and must not be altered.  Behavior is undefined
 *     if the caller does this.
 * 
 * <b>Example</b>
 * 
 * 
 * ```cpp
 * 
 * BTH_LE_GATT_CHARACTERISTIC_VALUE newValue;
 * 
 * RtlZeroMemory(&newValue,(sizeof(newValue)));
 * 
 * newValue.DataSize = sizeof(valueData);
 * newValue.Data = (UCHAR*)&valueData;
 * 
 * // Set the new characteristic value
 * hr = BluetoothGATTSetCharacteristicValue(hDevice,
 *                                     parentCharacteristic,
 *                                     &newValue,
 *                                     NULL,
 *                                     BLUETOOTH_GATT_FLAG_NONE);
 * 
 * ```
 * @param {HANDLE} hDevice Handle to the service.
 * @param {Pointer<BTH_LE_GATT_CHARACTERISTIC>} Characteristic Pointer to <a href="https://docs.microsoft.com/windows/desktop/api/bthledef/ns-bthledef-bth_le_gatt_characteristic">BTH_LE_GATT_CHARACTERISTIC</a> structure containing the parent characteristic.
 * @param {Pointer<BTH_LE_GATT_CHARACTERISTIC_VALUE>} CharacteristicValue Pointer to <a href="https://docs.microsoft.com/windows/desktop/api/bthledef/ns-bthledef-bth_le_gatt_characteristic_value">BTH_LE_GATT_CHARACTERISTIC_VALUE</a> structure containing the characteristic value.
 * @param {Integer} ReliableWriteContext BTH_LE_GATT_RELIABLE_WRITE_CONTEXT structure containing the context describing the reliable write operation returned from a previous call to <a href="https://docs.microsoft.com/windows/desktop/api/bluetoothleapis/nf-bluetoothleapis-bluetoothgattbeginreliablewrite">BluetoothGATTBeginReliableWrite</a>.
 * @param {Integer} Flags Flags to modify the behavior of BluetoothGATTSetCharacteristicValue:
 * 
 * <table>
 * <tr>
 * <th>Flag</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td>
 * <b>BLUETOOTH_GATT_FLAG_NONE</b>
 * 
 * </td>
 * <td>
 * The client does not have specific GATT requirements (default).
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>
 * <b>BLUETOOTH_GATT_FLAG_CONNECTION_ENCRYPTED</b>
 * 
 * </td>
 * <td>
 * The client requests the data to be transmitted over an encrypted channel.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>
 * <b>BLUETOOTH_GATT_FLAG_CONNECTION_AUTHENTICATED</b>
 * 
 * </td>
 * <td>
 * The client requests the data to be transmitted over an authenticated channel.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>
 * <b>BLUETOOTH_GATT_FLAG_WRITE_WITHOUT_RESPONSE</b>
 * 
 * </td>
 * <td>
 * Write without response.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>
 * <b>BLUETOOTH_GATT_FLAG_SIGNED_WRITE</b>
 * 
 * </td>
 * <td>
 * Signed write. Profile drivers must use with <b>BLUETOOTH_GATT_FLAG_WRITE_WITHOUT_RESPONSE</b> in order to produce signed write without a response.
 * 
 * </td>
 * </tr>
 * </table>
 * @returns {HRESULT} The <b>BluetoothGATTSetCharacteristicValue</b> function returns the following values:
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
 * The operation completed successfully.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_ACCESS_DENIED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Returned if both a parent service and a service handle are provided and the service hierarchy does not roll up to the provided parent service handle.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A parameter was invalid.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_BAD_NET_RESP</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The target server did not provide an
 *             appropriate network response.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_SEM_TIMEOUT</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The request timed-out.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NO_SYSTEM_RESOURCES</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The operation ran out of memory.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_FUNCTION</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A reliable write operation is already presently underway.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_BLUETOOTH_ATT_INVALID_HANDLE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The attribute handle given was not valid on this server.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_BLUETOOTH_ATT_READ_NOT_PERMITTED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The attribute cannot be read.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_BLUETOOTH_ATT_WRITE_NOT_PERMITTED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The attribute cannot be written.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_BLUETOOTH_ATT_INVALID_PDU</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The attribute PDU was invalid.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_BLUETOOTH_ATT_INSUFFICIENT_AUTHENTICATION</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The attribute requires authentication before it can be read or written.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_BLUETOOTH_ATT_REQUEST_NOT_SUPPORTED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Attribute server does not support the request received from the client.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_BLUETOOTH_ATT_INVALID_OFFSET</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Offset specified was past the end of the attribute.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_BLUETOOTH_ATT_INSUFFICIENT_AUTHORIZATION</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The attribute requires authorization before it can be read or written.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_BLUETOOTH_ATT_PREPARE_QUEUE_FULL</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Too many prepare writes have been queued.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_BLUETOOTH_ATT_ATTRIBUTE_NOT_FOUND</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * No attribute found within the given attribute handle range.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_BLUETOOTH_ATT_ATTRIBUTE_NOT_LONG</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The attribute cannot be read or written using the Read Blob Request.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_BLUETOOTH_ATT_INSUFFICIENT_ENCRYPTION_KEY_SIZE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The Encryption Key Size used for encrypting this link is insufficient.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_BLUETOOTH_ATT_INVALID_ATTRIBUTE_VALUE_LENGTH</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The attribute value length is invalid for the operation.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_BLUETOOTH_ATT_UNLIKELY</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The attribute request that was requested has encountered an error that was unlikely, and therefore could not be completed as requested.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_BLUETOOTH_ATT_INSUFFICIENT_ENCRYPTION</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The attribute requires encryption before it can be read or written.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_BLUETOOTH_ATT_UNSUPPORTED_GROUP_TYPE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The attribute type is not a supported grouping attribute as defined by a higher layer specification.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_BLUETOOTH_ATT_INSUFFICIENT_RESOURCES</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Insufficient Resources to complete the request.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_BLUETOOTH_ATT_UNKNOWN_ERROR</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * An error that lies in the reserved range has been received.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/bluetoothleapis/nf-bluetoothleapis-bluetoothgattsetcharacteristicvalue
 * @since windows8.0
 */
export BluetoothGATTSetCharacteristicValue(hDevice, Characteristic, CharacteristicValue, ReliableWriteContext, Flags) {
    result := DllCall("BluetoothApis.dll\BluetoothGATTSetCharacteristicValue", HANDLE, hDevice, BTH_LE_GATT_CHARACTERISTIC.Ptr, Characteristic, BTH_LE_GATT_CHARACTERISTIC_VALUE.Ptr, CharacteristicValue, "uint", ReliableWriteContext, "uint", Flags, "HRESULT")
    return result
}

/**
 * Specifies the end of reliable writes, and the writes should be committed.
 * @param {HANDLE} hDevice Handle to the service.
 * @param {Integer} ReliableWriteContext The context describing the reliable write operation returned from a previous call to <a href="https://docs.microsoft.com/windows/desktop/api/bluetoothleapis/nf-bluetoothleapis-bluetoothgattbeginreliablewrite">BluetoothGATTBeginReliableWrite</a>.
 * @param {Integer} Flags Flags to modify the behavior of <b>BluetoothGATTEndReliableWrite</b>:
 * 
 * <table>
 * <tr>
 * <th>Flag</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td>
 * <b>BLUETOOTH_GATT_FLAG_NONE</b>
 * 
 * </td>
 * <td>
 * The client does not have specific GATT requirements (default).
 * 
 * </td>
 * </tr>
 * </table>
 * @returns {HRESULT} The <b>BluetoothGATTEndReliableWrite</b> function returns the following values:
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
 * The operation completed successfully.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_ACCESS_DENIED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Returned if both a parent service and a service handle are provided and the service hierarchy does not roll up to the provided parent service handle.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_FUNCTION</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A reliable write operation is not presently underway.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_BAD_NET_RESP</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The target server did not provide an
 *             appropriate network response.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_SEM_TIMEOUT</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The request timed-out.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NO_SYSTEM_RESOURCES</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The operation ran out of memory.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_BLUETOOTH_ATT_INVALID_HANDLE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The attribute handle given was not valid on this server.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_BLUETOOTH_ATT_READ_NOT_PERMITTED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The attribute cannot be read.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_BLUETOOTH_ATT_WRITE_NOT_PERMITTED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The attribute cannot be written.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_BLUETOOTH_ATT_INVALID_PDU</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The attribute PDU was invalid.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_BLUETOOTH_ATT_INSUFFICIENT_AUTHENTICATION</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The attribute requires authentication before it can be read or written.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_BLUETOOTH_ATT_REQUEST_NOT_SUPPORTED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Attribute server does not support the request received from the client.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_BLUETOOTH_ATT_INVALID_OFFSET</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Offset specified was past the end of the attribute.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_BLUETOOTH_ATT_INSUFFICIENT_AUTHORIZATION</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The attribute requires authorization before it can be read or written.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_BLUETOOTH_ATT_PREPARE_QUEUE_FULL</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Too many prepare writes have been queued.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_BLUETOOTH_ATT_ATTRIBUTE_NOT_FOUND</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * No attribute found within the given attribute handle range.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_BLUETOOTH_ATT_ATTRIBUTE_NOT_LONG</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The attribute cannot be read or written using the Read Blob Request.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_BLUETOOTH_ATT_INSUFFICIENT_ENCRYPTION_KEY_SIZE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The Encryption Key Size used for encrypting this link is insufficient.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_BLUETOOTH_ATT_INVALID_ATTRIBUTE_VALUE_LENGTH</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The attribute value length is invalid for the operation.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_BLUETOOTH_ATT_UNLIKELY</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The attribute request that was requested has encountered an error that was unlikely, and therefore could not be completed as requested.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_BLUETOOTH_ATT_INSUFFICIENT_ENCRYPTION</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The attribute requires encryption before it can be read or written.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_BLUETOOTH_ATT_UNSUPPORTED_GROUP_TYPE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The attribute type is not a supported grouping attribute as defined by a higher layer specification.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_BLUETOOTH_ATT_INSUFFICIENT_RESOURCES</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Insufficient Resources to complete the request.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_BLUETOOTH_ATT_UNKNOWN_ERROR</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * An error that lies in the reserved range has been received.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/bluetoothleapis/nf-bluetoothleapis-bluetoothgattendreliablewrite
 * @since windows8.0
 */
export BluetoothGATTEndReliableWrite(hDevice, ReliableWriteContext, Flags) {
    result := DllCall("BluetoothApis.dll\BluetoothGATTEndReliableWrite", HANDLE, hDevice, "uint", ReliableWriteContext, "uint", Flags, "HRESULT")
    return result
}

/**
 * Specifies the end of reliable write procedures, and the writes should be aborted.
 * @param {HANDLE} hDevice Handle to the service.
 * @param {Integer} ReliableWriteContext The context describing the reliable write operation returned from a previous call to <a href="https://docs.microsoft.com/windows/desktop/api/bluetoothleapis/nf-bluetoothleapis-bluetoothgattbeginreliablewrite">BluetoothGATTBeginReliableWrite</a>.
 * @param {Integer} Flags Flags to modify the behavior of <b>BluetoothGATTAbortReliableWrite</b>:
 * 
 * <table>
 * <tr>
 * <th>Flag</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td>
 * <b>BLUETOOTH_GATT_FLAG_NONE</b>
 * 
 * </td>
 * <td>
 * The client does not have specific GATT requirements (default).
 * 
 * </td>
 * </tr>
 * </table>
 * @returns {HRESULT} The <b>BluetoothGATTAbortReliableWrite</b> function returns the following values:
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
 * The operation completed successfully.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_ACCESS_DENIED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Returned if both a parent service and a service handle are provided and the service hierarchy does not roll up to the provided parent service handle.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_FUNCTION</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A reliable write operation is not presently underway.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_BAD_NET_RESP</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The target server did not provide an
 *             appropriate network response.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_SEM_TIMEOUT</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The request timed-out.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NO_SYSTEM_RESOURCES</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The operation ran out of memory.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_BLUETOOTH_ATT_INVALID_HANDLE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The attribute handle given was not valid on this server.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_BLUETOOTH_ATT_READ_NOT_PERMITTED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The attribute cannot be read.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_BLUETOOTH_ATT_WRITE_NOT_PERMITTED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The attribute cannot be written.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_BLUETOOTH_ATT_INVALID_PDU</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The attribute PDU was invalid.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_BLUETOOTH_ATT_INSUFFICIENT_AUTHENTICATION</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The attribute requires authentication before it can be read or written.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_BLUETOOTH_ATT_REQUEST_NOT_SUPPORTED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Attribute server does not support the request received from the client.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_BLUETOOTH_ATT_INVALID_OFFSET</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Offset specified was past the end of the attribute.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_BLUETOOTH_ATT_INSUFFICIENT_AUTHORIZATION</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The attribute requires authorization before it can be read or written.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_BLUETOOTH_ATT_PREPARE_QUEUE_FULL</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Too many prepare writes have been queued.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_BLUETOOTH_ATT_ATTRIBUTE_NOT_FOUND</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * No attribute found within the given attribute handle range.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_BLUETOOTH_ATT_ATTRIBUTE_NOT_LONG</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The attribute cannot be read or written using the Read Blob Request.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_BLUETOOTH_ATT_INSUFFICIENT_ENCRYPTION_KEY_SIZE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The Encryption Key Size used for encrypting this link is insufficient.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_BLUETOOTH_ATT_INVALID_ATTRIBUTE_VALUE_LENGTH</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The attribute value length is invalid for the operation.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_BLUETOOTH_ATT_UNLIKELY</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The attribute request that was requested has encountered an error that was unlikely, and therefore could not be completed as requested.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_BLUETOOTH_ATT_INSUFFICIENT_ENCRYPTION</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The attribute requires encryption before it can be read or written.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_BLUETOOTH_ATT_UNSUPPORTED_GROUP_TYPE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The attribute type is not a supported grouping attribute as defined by a higher layer specification.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_BLUETOOTH_ATT_INSUFFICIENT_RESOURCES</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Insufficient Resources to complete the request.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_BLUETOOTH_ATT_UNKNOWN_ERROR</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * An error that lies in the reserved range has been received.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/bluetoothleapis/nf-bluetoothleapis-bluetoothgattabortreliablewrite
 * @since windows8.0
 */
export BluetoothGATTAbortReliableWrite(hDevice, ReliableWriteContext, Flags) {
    result := DllCall("BluetoothApis.dll\BluetoothGATTAbortReliableWrite", HANDLE, hDevice, "uint", ReliableWriteContext, "uint", Flags, "HRESULT")
    return result
}

/**
 * Writes the specified descriptor value to the Bluetooth device.
 * @remarks
 * The parent descriptor must be returned from a previous call to BluetoothGATTGetDescriptors, and must not be altered.  Behavior is undefined
 *     if the caller does this.
 * 
 * <b>Example</b>
 * 
 * 
 * ```cpp
 * 
 * BTH_LE_GATT_DESCRIPTOR_VALUE newValue;
 * 
 * RtlZeroMemory(&newValue, sizeof(newValue));
 * 
 * newValue.DescriptorType = ClientCharacteristicConfiguration;
 * newValue.ClientCharacteristicConfiguration.IsSubscribeToNotification = TRUE;
 * 
 * // Subscribe to an event.
 * hr = BluetoothGATTSetDescriptorValue(hDevice, 
 *                                 parentDescriptor, 
 *                                 &newValue,
 *                                 BLUETOOTH_GATT_FLAG_NONE);
 * 
 * ```
 * @param {HANDLE} hDevice Handle to the service.
 * @param {Pointer<BTH_LE_GATT_DESCRIPTOR>} Descriptor Pointer to the parent descriptor.
 * @param {Pointer<BTH_LE_GATT_DESCRIPTOR_VALUE>} DescriptorValue Pointer to the descriptor's value.
 * @param {Integer} Flags Flags to modify the behavior of <b>BluetoothGATTSetDescriptorValue</b>:
 * 
 * <table>
 * <tr>
 * <th>Flag</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td>
 * <b>BLUETOOTH_GATT_FLAG_NONE</b>
 * 
 * </td>
 * <td>
 * The client does not have specific GATT requirements (default).
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>
 * <b>BLUETOOTH_GATT_FLAG_CONNECTION_ENCRYPTED</b>
 * 
 * </td>
 * <td>
 * The client requests the data to be transmitted over an encrypted channel.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>
 * <b>BLUETOOTH_GATT_FLAG_CONNECTION_AUTHENTICATED</b>
 * 
 * </td>
 * <td>
 * The client requests the data to be transmitted over an authenticated channel.
 * 
 * </td>
 * </tr>
 * </table>
 * @returns {HRESULT} The BluetoothGATTSetDescriptorValue function returns the following values:
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
 * The operation completed successfully.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_ACCESS_DENIED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Returned if both a parent service and a service handle are provided and the service hierarchy does not roll up to the provided parent service handle.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A parameter was invalid.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_BAD_NET_RESP</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The target server did not provide an
 *             appropriate network response.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_SEM_TIMEOUT</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The request timed-out.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_NO_SYSTEM_RESOURCES</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The operation ran out of memory.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_BLUETOOTH_ATT_INVALID_HANDLE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The attribute handle given was not valid on this server.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_BLUETOOTH_ATT_READ_NOT_PERMITTED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The attribute cannot be read.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_BLUETOOTH_ATT_WRITE_NOT_PERMITTED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The attribute cannot be written.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_BLUETOOTH_ATT_INVALID_PDU</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The attribute PDU was invalid.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_BLUETOOTH_ATT_INSUFFICIENT_AUTHENTICATION</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The attribute requires authentication before it can be read or written.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_BLUETOOTH_ATT_REQUEST_NOT_SUPPORTED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Attribute server does not support the request received from the client.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_BLUETOOTH_ATT_INVALID_OFFSET</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Offset specified was past the end of the attribute.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_BLUETOOTH_ATT_INSUFFICIENT_AUTHORIZATION</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The attribute requires authorization before it can be read or written.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_BLUETOOTH_ATT_PREPARE_QUEUE_FULL</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Too many prepare writes have been queued.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_BLUETOOTH_ATT_ATTRIBUTE_NOT_FOUND</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * No attribute found within the given attribute handle range.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_BLUETOOTH_ATT_ATTRIBUTE_NOT_LONG</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The attribute cannot be read or written using the Read Blob Request.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_BLUETOOTH_ATT_INSUFFICIENT_ENCRYPTION_KEY_SIZE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The Encryption Key Size used for encrypting this link is insufficient.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_BLUETOOTH_ATT_INVALID_ATTRIBUTE_VALUE_LENGTH</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The attribute value length is invalid for the operation.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_BLUETOOTH_ATT_UNLIKELY</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The attribute request that was requested has encountered an error that was unlikely, and therefore could not be completed as requested.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_BLUETOOTH_ATT_INSUFFICIENT_ENCRYPTION</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The attribute requires encryption before it can be read or written.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_BLUETOOTH_ATT_UNSUPPORTED_GROUP_TYPE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The attribute type is not a supported grouping attribute as defined by a higher layer specification.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_BLUETOOTH_ATT_INSUFFICIENT_RESOURCES</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Insufficient Resources to complete the request.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>E_BLUETOOTH_ATT_UNKNOWN_ERROR</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * An error that lies in the reserved range has been received.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/bluetoothleapis/nf-bluetoothleapis-bluetoothgattsetdescriptorvalue
 * @since windows8.0
 */
export BluetoothGATTSetDescriptorValue(hDevice, Descriptor, DescriptorValue, Flags) {
    result := DllCall("BluetoothApis.dll\BluetoothGATTSetDescriptorValue", HANDLE, hDevice, BTH_LE_GATT_DESCRIPTOR.Ptr, Descriptor, BTH_LE_GATT_DESCRIPTOR_VALUE.Ptr, DescriptorValue, "uint", Flags, "HRESULT")
    return result
}

/**
 * Registers a routine to be called back during a characteristic value change event on the given characteristic identified by its characteristic handle.
 * @param {HANDLE} hService Handle to the service.
 * @param {BTH_LE_GATT_EVENT_TYPE} EventType A value from <a href="https://docs.microsoft.com/windows/desktop/api/bthledef/ne-bthledef-bth_le_gatt_event_type">BTH_LE_GATT_EVENT_TYPE</a>. Currently, only <b>CharacteristicValueChangedEvent</b> is supported.
 * @param {Pointer<Void>} EventParameterIn Pointer to a <a href="https://docs.microsoft.com/windows/win32/api/bthledef/ns-bthledef-bluetooth_gatt_value_changed_event_registration">BLUETOOTH_GATT_VALUE_CHANGED_EVENT_REGISTRATION</a> structure to pass when the event is triggered.
 * @param {Pointer<PFNBLUETOOTH_GATT_EVENT_CALLBACK>} Callback The routine to call when the Characteristic value changes.
 * @param {Pointer<Void>} CallbackContext Context to pass to <i>Callback</i>.
 * @param {Integer} Flags Flags to modify the behavior of <b>BluetoothGATTRegisterEvent</b>:
 * 
 * <table>
 * <tr>
 * <th>Flag</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td>
 * <b>BLUETOOTH_GATT_FLAG_NONE</b>
 * 
 * </td>
 * <td>
 * The client does not have specific GATT requirements (default).
 * 
 * </td>
 * </tr>
 * </table>
 * @returns {Pointer} Pointer to buffer to receive a handle for the registration.  Profile drivers must pass this handle when calling <a href="https://docs.microsoft.com/windows/desktop/api/bluetoothleapis/nf-bluetoothleapis-bluetoothgattunregisterevent">BluetoothGATTUnregisterEvent</a>.
 * @see https://learn.microsoft.com/windows/win32/api/bluetoothleapis/nf-bluetoothleapis-bluetoothgattregisterevent
 * @since windows8.0
 */
export BluetoothGATTRegisterEvent(hService, EventType, EventParameterIn, Callback, CallbackContext, Flags) {
    EventParameterInMarshal := EventParameterIn is VarRef ? "ptr" : "ptr"
    CallbackContextMarshal := CallbackContext is VarRef ? "ptr" : "ptr"

    result := DllCall("BluetoothApis.dll\BluetoothGATTRegisterEvent", HANDLE, hService, BTH_LE_GATT_EVENT_TYPE, EventType, EventParameterInMarshal, EventParameterIn, "ptr", Callback, CallbackContextMarshal, CallbackContext, "ptr*", &pEventHandle := 0, "uint", Flags, "HRESULT")
    return pEventHandle
}

/**
 * Unregisters the given characteristic value change event.
 * @param {Pointer} EventHandle Handle returned from a previous call to <a href="https://docs.microsoft.com/windows/desktop/api/bluetoothleapis/nf-bluetoothleapis-bluetoothgattregisterevent">BluetoothGATTRegisterEvent</a>.
 * @param {Integer} Flags Flags to modify the behavior of <b>BluetoothGATTUnregisterEvent</b>:
 * 
 * <table>
 * <tr>
 * <th>Flag</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td>
 * <b>BLUETOOTH_GATT_FLAG_NONE</b>
 * 
 * </td>
 * <td>
 * The client does not have specific GATT requirements (default).
 * 
 * </td>
 * </tr>
 * </table>
 * @returns {HRESULT} <b>BluetoothGATTUnregisterEvent</b> returns the following values:
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
 * The operation completed successfully.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_ACCESS_DENIED</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Returned if both a parent service and a service handle are provided and the service hierarchy does not roll up to the provided parent service handle.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * A parameter was invalid.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/bluetoothleapis/nf-bluetoothleapis-bluetoothgattunregisterevent
 * @since windows8.0
 */
export BluetoothGATTUnregisterEvent(EventHandle, Flags) {
    result := DllCall("BluetoothApis.dll\BluetoothGATTUnregisterEvent", "ptr", EventHandle, "uint", Flags, "HRESULT")
    return result
}

;@endregion Functions
