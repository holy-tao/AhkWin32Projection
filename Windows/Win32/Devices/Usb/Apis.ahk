#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit

#Import ".\USB_FRAME_NUMBER_AND_QPC_FOR_TIME_SYNC_INFORMATION.ahk" { USB_FRAME_NUMBER_AND_QPC_FOR_TIME_SYNC_INFORMATION }
#Import ".\USB_CONFIGURATION_DESCRIPTOR.ahk" { USB_CONFIGURATION_DESCRIPTOR }
#Import "..\..\System\IO\OVERLAPPED.ahk" { OVERLAPPED }
#Import ".\USB_STOP_TRACKING_FOR_TIME_SYNC_INFORMATION.ahk" { USB_STOP_TRACKING_FOR_TIME_SYNC_INFORMATION }
#Import ".\USB_START_TRACKING_FOR_TIME_SYNC_INFORMATION.ahk" { USB_START_TRACKING_FOR_TIME_SYNC_INFORMATION }
#Import ".\WINUSB_PIPE_POLICY.ahk" { WINUSB_PIPE_POLICY }
#Import ".\USBD_ISO_PACKET_DESCRIPTOR.ahk" { USBD_ISO_PACKET_DESCRIPTOR }
#Import ".\USB_INTERFACE_DESCRIPTOR.ahk" { USB_INTERFACE_DESCRIPTOR }
#Import ".\WINUSB_PIPE_INFORMATION.ahk" { WINUSB_PIPE_INFORMATION }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\WINUSB_PIPE_INFORMATION_EX.ahk" { WINUSB_PIPE_INFORMATION_EX }
#Import ".\USB_COMMON_DESCRIPTOR.ahk" { USB_COMMON_DESCRIPTOR }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\WINUSB_INTERFACE_HANDLE.ahk" { WINUSB_INTERFACE_HANDLE }
#Import ".\WINUSB_POWER_POLICY.ahk" { WINUSB_POWER_POLICY }
#Import ".\WINUSB_SETUP_PACKET.ahk" { WINUSB_SETUP_PACKET }

/**
 * @namespace Windows.Win32.Devices.Usb
 */

;@region Functions
/**
 * The WinUsb_Initialize function creates a WinUSB handle for the device specified by a file handle.
 * @remarks
 * When <b>WinUsb_Initialize</b> is called,
 *    the policy settings of the interface are reset to the default values. 
 * 
 * The <b>WinUsb_Initialize</b> call queries the underlying USB stack for various descriptors and allocates enough memory to store the retrieved descriptor data. 
 * 
 * <b>WinUsb_Initialize</b> first retrieves the device descriptor and then gets the associated configuration descriptor. From the configuration descriptor, the call derives the associated interface descriptors and stores them in an array. The interfaces in the array are identified by zero-based indexes. An index value of 0 indicates the first interface (the default interface), a value of 1 indicates the second associated interface, and so on.
 *     <b>WinUsb_Initialize</b> parses the default interface descriptor for the endpoint descriptors and caches information such as the associated pipes or state specific data.
 * The handle received in the <i>InterfaceHandle</i> parameter is a pointer to the memory block allocated for the first interface in the array. 
 * 
 * If an application wants to use another interface on the device, it must call <a href="https://docs.microsoft.com/windows/desktop/api/winusb/nf-winusb-winusb_getassociatedinterface">WinUsb_GetAssociatedInterface</a>,  specify the index of the interface, and retrieve a handle to the  memory block allocated for the specified interface.
 * @param {HANDLE} DeviceHandle The handle to the device that <b>CreateFile</b> returned. WinUSB uses overlapped I/O, so FILE_FLAG_OVERLAPPED must be specified in the <i>dwFlagsAndAttributes</i> parameter of <b>CreateFile</b> call for <i>DeviceHandle</i> to have the characteristics necessary for <b>WinUsb_Initialize</b> to function properly.
 * @param {Pointer<WINUSB_INTERFACE_HANDLE>} InterfaceHandle Receives an opaque handle to the first (default) interface on the device. This handle is required by other WinUSB routines that perform operations on the default interface. To release the handle, call the <a href="https://docs.microsoft.com/windows/desktop/api/winusb/nf-winusb-winusb_free">WinUSB_Free</a> function.
 * @returns {BOOL} <b>WinUsb_Initialize</b> returns <b>TRUE</b> if the operation succeeds. Otherwise, this routine returns <b>FALSE</b>, and the caller can retrieve the logged error by calling <b>GetLastError</b>.
 * 
 * 
 * <b>GetLastError</b>    can return the following error code.
 * 
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
 * <dt><b>ERROR_INVALID_HANDLE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The caller passed <b>NULL</b> or an invalid handle in the  <i>DeviceHandle</i> parameter; FILE_FLAG_OVERLAPPED was not set in the file handle.
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
 * Indicates that there is insufficient memory to perform the operation.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_BAD_DEVICE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Indicates that the default interface descriptor could not be found for the device.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/winusb/nf-winusb-winusb_initialize
 */
export WinUsb_Initialize(DeviceHandle, InterfaceHandle) {
    A_LastError := 0

    result := DllCall("WINUSB.dll\WinUsb_Initialize", HANDLE, DeviceHandle, WINUSB_INTERFACE_HANDLE.Ptr, InterfaceHandle, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * The WinUsb_Free function releases all of the resources that WinUsb_Initialize allocated. This is a synchronous operation.
 * @param {WINUSB_INTERFACE_HANDLE} InterfaceHandle An opaque handle to an interface in the selected configuration. That handle must be created by a previous call to  <a href="https://docs.microsoft.com/windows/desktop/api/winusb/nf-winusb-winusb_initialize">WinUsb_Initialize</a> or <a href="https://docs.microsoft.com/windows/desktop/api/winusb/nf-winusb-winusb_getassociatedinterface">WinUsb_GetAssociatedInterface</a>.
 * @returns {BOOL} <b>WinUsb_Free</b> returns <b>TRUE</b>.
 * @see https://learn.microsoft.com/windows/win32/api/winusb/nf-winusb-winusb_free
 */
export WinUsb_Free(InterfaceHandle) {
    result := DllCall("WINUSB.dll\WinUsb_Free", WINUSB_INTERFACE_HANDLE, InterfaceHandle, BOOL)
    return result
}

/**
 * The WinUsb_GetAssociatedInterface function retrieves a handle for an associated interface. This is a synchronous operation.
 * @remarks
 * The <b>WinUsb_GetAssociatedInterface</b> routine retrieves an opaque handle.
 * 
 * The <i>first associated interface</i> is the interface that immediately follows the interface whose handle the <a href="https://docs.microsoft.com/windows/desktop/api/winusb/nf-winusb-winusb_initialize">WinUsb_Initialize</a> routine retrieves.
 * 
 * The handle that <b>WinUsb_GetAssociatedInterface</b> returns must be released by calling <a href="https://docs.microsoft.com/windows/desktop/api/winusb/nf-winusb-winusb_free">WinUsb_Free</a>.
 * 
 * Callers of <b>WinUsb_GetAssociatedInterface</b> can retrieve only one handle for each interface. If a caller attempts to retrieve more than one handle for the same interface, the routine will fail with an error of ERROR_ALREADY_EXISTS.
 * @param {WINUSB_INTERFACE_HANDLE} InterfaceHandle An opaque handle to the first (default) interface on the device, which is returned by <a href="https://docs.microsoft.com/windows/desktop/api/winusb/nf-winusb-winusb_initialize">WinUsb_Initialize</a>.
 * @param {Integer} AssociatedInterfaceIndex An index that specifies the associated interface to retrieve. A value of 0 indicates the first associated interface, a value of 1 indicates the second associated interface, and so on.
 * @param {Pointer<WINUSB_INTERFACE_HANDLE>} AssociatedInterfaceHandle A handle for the associated interface. Callers must pass this interface handle to <a href="https://docs.microsoft.com/windows/iot-core/learn-about-hardware/hardwarecompatlist">WinUSB Functions</a> exposed by Winusb.dll. To close this handle, call <a href="https://docs.microsoft.com/windows/desktop/api/winusb/nf-winusb-winusb_free">WinUsb_Free</a>.
 * @returns {BOOL} <b>WinUsb_GetAssociatedInterface</b> returns <b>TRUE</b> if the operation succeeds. Otherwise, this routine returns <b>FALSE</b>, and the caller can retrieve the logged error by calling <b>GetLastError</b>.
 * 
 * <table>
 * <tr>
 * <th>Return code</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_ALREADY_EXISTS</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winusb/nf-winusb-winusb_getassociatedinterface">WinUsb_GetAssociatedInterface</a> has already returned a handle for the interface that <i>AssociatedInterfaceIndex</i> specifies.
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
 * The caller passed <b>NULL</b> in the  <i>InterfaceHandle</i> parameter.
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
 *  The passed <i>AssociatedInterfaceIndex</i> value failed an integer overflow check. 
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
 * An interface does not exist for the specified <i>AssociatedInterfaceIndex</i> value<i>.</i>
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
 * Indicates that there is insufficient memory to perform the operation.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/winusb/nf-winusb-winusb_getassociatedinterface
 */
export WinUsb_GetAssociatedInterface(InterfaceHandle, AssociatedInterfaceIndex, AssociatedInterfaceHandle) {
    A_LastError := 0

    result := DllCall("WINUSB.dll\WinUsb_GetAssociatedInterface", WINUSB_INTERFACE_HANDLE, InterfaceHandle, "char", AssociatedInterfaceIndex, WINUSB_INTERFACE_HANDLE.Ptr, AssociatedInterfaceHandle, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * The WinUsb_GetDescriptor function returns the requested descriptor. This is a synchronous operation.
 * @remarks
 * If the output buffer pointed to by  the  <i>Buffer</i> parameter is large enough, <b>WinUsb_GetDescriptor</b> creates a copy of the specified descriptor into the output buffer. No data is copied if the buffer is not large enough to hold descriptor data.  The descriptor is created during the <a href="https://docs.microsoft.com/windows/desktop/api/winusb/nf-winusb-winusb_initialize">WinUsb_Initialize</a> call or it may be retrieved at this point from the device.
 * @param {WINUSB_INTERFACE_HANDLE} InterfaceHandle An opaque handle to an interface in the selected configuration. 
 * 
 * To retrieve the device or configuration descriptor, use the handle returned by <a href="https://docs.microsoft.com/windows/desktop/api/winusb/nf-winusb-winusb_initialize">WinUsb_Initialize</a>.
 * 
 * To retrieve the interface descriptor of the  first interface, use the handle returned by <a href="https://docs.microsoft.com/windows/desktop/api/winusb/nf-winusb-winusb_initialize">WinUsb_Initialize</a>.
 * 
 * To retrieve the endpoint descriptor of an endpoint in the first interface, use the handle returned by <a href="https://docs.microsoft.com/windows/desktop/api/winusb/nf-winusb-winusb_initialize">WinUsb_Initialize</a>.
 * 
 * To retrieve descriptors of all other interfaces and their related endpoints, use the handle to the target interface, retrieved by  <a href="https://docs.microsoft.com/windows/desktop/api/winusb/nf-winusb-winusb_getassociatedinterface">WinUsb_GetAssociatedInterface</a>.
 * @param {Integer} DescriptorType A value that specifies the type of descriptor to return. This parameter corresponds to the <b>bDescriptorType</b> field of a standard device descriptor, whose values are described in the <i>Universal Serial Bus </i> specification. Some of these values are listed in the description of the <b>DescriptorType</b> member of the <a href="https://docs.microsoft.com/windows-hardware/drivers/ddi/content/usb/ns-usb-_urb_control_descriptor_request">_URB_CONTROL_DESCRIPTOR_REQUEST</a> structure.
 * @param {Integer} Index The descriptor index. For an explanation of the descriptor index, see the <i>Universal Serial Bus</i> specification (www.usb.org).
 * @param {Integer} LanguageID A value that specifies the language identifier, if the requested descriptor is a string descriptor.
 * @param {Integer} _Buffer A caller-allocated buffer that receives the requested descriptor.
 * @param {Integer} BufferLength The length, in bytes, of <i>Buffer</i>.
 * @param {Pointer<Integer>} LengthTransferred The number of bytes that were copied into <i>Buffer</i>.
 * @returns {BOOL} <b>WinUsb_GetDescriptor</b> returns <b>TRUE</b> if the operation succeeds. Otherwise, this routine returns <b>FALSE</b>, and the caller can retrieve the logged error by calling <b>GetLastError</b>.
 * 
 * 
 * <b>GetLastError</b>    can return the following error code.
 * 
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
 * <dt><b>ERROR_INVALID_HANDLE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The caller passed <b>NULL</b> in the  <i>InterfaceHandle</i> parameter.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/winusb/nf-winusb-winusb_getdescriptor
 */
export WinUsb_GetDescriptor(InterfaceHandle, DescriptorType, Index, LanguageID, _Buffer, BufferLength, LengthTransferred) {
    LengthTransferredMarshal := LengthTransferred is VarRef ? "uint*" : "ptr"

    A_LastError := 0

    result := DllCall("WINUSB.dll\WinUsb_GetDescriptor", WINUSB_INTERFACE_HANDLE, InterfaceHandle, "char", DescriptorType, "char", Index, "ushort", LanguageID, "ptr", _Buffer, "uint", BufferLength, LengthTransferredMarshal, LengthTransferred, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * The WinUsb_QueryInterfaceSettings function retrieves the interface descriptor for the specified alternate interface settings for a particular interface handle.
 * @remarks
 * <b>WinUsb_QueryInterfaceSettings</b> parses the configuration descriptor previously retrieved by  <a href="https://docs.microsoft.com/windows/desktop/api/winusb/nf-winusb-winusb_initialize">WinUsb_Initialize</a>. For more information, see the Remarks section for <b>WinUsb_Initialize</b>. 
 * 
 * The <b>WinUsb_QueryInterfaceSettings</b> call searches the interface array for the alternate interface specified by the interface index passed by the caller in the <i>AlternateSettingNumber</i>. If the specified interface is found, the function populates the caller-allocated <a href="https://docs.microsoft.com/windows-hardware/drivers/ddi/content/usbspec/ns-usbspec-_usb_interface_descriptor">USB_INTERFACE_DESCRIPTOR</a> structure. If the specified interface is not found, then the call fails with the ERROR_NO_MORE_ITEMS code.
 * @param {WINUSB_INTERFACE_HANDLE} InterfaceHandle An opaque handle to an interface in the selected configuration. 
 * 
 * To retrieve the settings of the first interface, use the handle returned by <a href="https://docs.microsoft.com/windows/desktop/api/winusb/nf-winusb-winusb_initialize">WinUsb_Initialize</a>. For all other interfaces, use the handle to the target interface, retrieved by <a href="https://docs.microsoft.com/windows/desktop/api/winusb/nf-winusb-winusb_getassociatedinterface">WinUsb_GetAssociatedInterface</a>.
 * @param {Integer} AlternateInterfaceNumber A value that indicates which alternate settings to return. A value of 0 indicates the first alternate setting, a value of 1 indicates the second alternate setting, and so on.
 * @param {Pointer<USB_INTERFACE_DESCRIPTOR>} UsbAltInterfaceDescriptor A pointer to a caller-allocated <a href="https://docs.microsoft.com/windows-hardware/drivers/ddi/content/usbspec/ns-usbspec-_usb_interface_descriptor">USB_INTERFACE_DESCRIPTOR</a> structure that contains information about the interface that <i>AlternateSettingNumber</i> specified.
 * @returns {BOOL} <b>WinUsb_QueryInterfaceSettings</b> returns <b>TRUE</b> if the operation succeeds. Otherwise, it returns <b>FALSE</b>, and the caller can retrieve the logged error by calling <b>GetLastError</b>.
 * 
 * 
 * <b>GetLastError</b>    can return the following error code.
 * 
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
 * <dt><b>ERROR_INVALID_HANDLE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The caller passed <b>NULL</b> in the  <i>InterfaceHandle</i> parameter.
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
 * The specified alternate interface was not found.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/winusb/nf-winusb-winusb_queryinterfacesettings
 */
export WinUsb_QueryInterfaceSettings(InterfaceHandle, AlternateInterfaceNumber, UsbAltInterfaceDescriptor) {
    A_LastError := 0

    result := DllCall("WINUSB.dll\WinUsb_QueryInterfaceSettings", WINUSB_INTERFACE_HANDLE, InterfaceHandle, "char", AlternateInterfaceNumber, USB_INTERFACE_DESCRIPTOR.Ptr, UsbAltInterfaceDescriptor, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * The WinUsb_QueryDeviceInformation function gets information about the physical device that is associated with a WinUSB interface handle.
 * @param {WINUSB_INTERFACE_HANDLE} InterfaceHandle An opaque handle to the first interface on the device, which is returned by <a href="https://docs.microsoft.com/windows/desktop/api/winusb/nf-winusb-winusb_initialize">WinUsb_Initialize</a>.
 * @param {Integer} InformationType A value that specifies which interface information value to retrieve.
 * 
 * On input, <i>InformationType</i> must have the following value: DEVICE_SPEED (0x01).
 * @param {Pointer<Integer>} BufferLength The maximum number of bytes to read. This number must be less than or equal to the size, in bytes, of <i>Buffer</i>. On output, <i>BufferLength</i> is set to the actual number of bytes that were copied into <i>Buffer</i>.
 * @param {Integer} _Buffer A caller-allocated buffer that receives the requested value.
 * 
 * If <i>InformationType</i> is DEVICE_SPEED, on successful return, <i>Buffer</i> indicates the operating speed of the device. 0x03 indicates high-speed or higher; 0x01 indicates full-speed or lower.
 * @returns {BOOL} <b>WinUsb_QueryDeviceInformation</b> returns <b>TRUE</b> if the operation succeeds. Otherwise, this routine returns <b>FALSE</b>, and the caller can retrieve the logged error by calling <b>GetLastError</b>.
 * 
 * 
 * <b>GetLastError</b>    can return the following error code.
 * 
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
 * <dt><b>ERROR_INVALID_HANDLE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The caller passed <b>NULL</b> in the  <i>InterfaceHandle</i> parameter.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/winusb/nf-winusb-winusb_querydeviceinformation
 */
export WinUsb_QueryDeviceInformation(InterfaceHandle, InformationType, BufferLength, _Buffer) {
    BufferLengthMarshal := BufferLength is VarRef ? "uint*" : "ptr"

    A_LastError := 0

    result := DllCall("WINUSB.dll\WinUsb_QueryDeviceInformation", WINUSB_INTERFACE_HANDLE, InterfaceHandle, "uint", InformationType, BufferLengthMarshal, BufferLength, "ptr", _Buffer, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * The WinUsb_SetCurrentAlternateSetting function sets the alternate setting of an interface.
 * @remarks
 * <b>WinUsb_SetCurrentAlternateSetting</b> fails if outstanding I/O requests are present on the interface.
 * @param {WINUSB_INTERFACE_HANDLE} InterfaceHandle An opaque handle to an interface, which defines the alternate setting to set. 
 * 
 * To set an alternate setting in the first interface on the device, use the interface handle returned by <a href="https://docs.microsoft.com/windows/desktop/api/winusb/nf-winusb-winusb_initialize">WinUsb_Initialize</a>. For all other interfaces, use the handle to the target interface, retrieved by <a href="https://docs.microsoft.com/windows/desktop/api/winusb/nf-winusb-winusb_getassociatedinterface">WinUsb_GetAssociatedInterface</a>.
 * @param {Integer} SettingNumber The value that is contained in the <b>bAlternateSetting</b> member of the <a href="https://docs.microsoft.com/windows-hardware/drivers/ddi/content/usbspec/ns-usbspec-_usb_interface_descriptor">USB_INTERFACE_DESCRIPTOR</a> structure. This structure is populated by the <a href="https://docs.microsoft.com/windows/desktop/api/winusb/nf-winusb-winusb_queryinterfacesettings">WinUsb_QueryInterfaceSettings</a> routine.
 * @returns {BOOL} <b>WinUsb_SetCurrentAlternateSetting</b> returns <b>TRUE</b> if the operation succeeds. Otherwise, this function returns <b>FALSE</b>, and the caller can retrieve the logged error by calling <b>GetLastError</b>.
 * 
 * 
 * <b>GetLastError</b>    can return the following error code.
 * 
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
 * <dt><b>ERROR_INVALID_HANDLE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The caller passed <b>NULL</b> in the  <i>InterfaceHandle</i> parameter.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/winusb/nf-winusb-winusb_setcurrentalternatesetting
 */
export WinUsb_SetCurrentAlternateSetting(InterfaceHandle, SettingNumber) {
    A_LastError := 0

    result := DllCall("WINUSB.dll\WinUsb_SetCurrentAlternateSetting", WINUSB_INTERFACE_HANDLE, InterfaceHandle, "char", SettingNumber, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * The WinUsb_GetCurrentAlternateSetting function gets the current alternate interface setting for an interface. This is a synchronous operation.
 * @param {WINUSB_INTERFACE_HANDLE} InterfaceHandle An opaque handle to an interface in the selected configuration. To get the current alternate setting in the first (default) interface on the device, use the interface handle returned by <a href="https://docs.microsoft.com/windows/desktop/api/winusb/nf-winusb-winusb_initialize">WinUsb_Initialize</a>. For all other interfaces, use the handle to the target interface, retrieved by <a href="https://docs.microsoft.com/windows/desktop/api/winusb/nf-winusb-winusb_getassociatedinterface">WinUsb_GetAssociatedInterface</a>.
 * @param {Pointer<Integer>} SettingNumber A pointer to an unsigned character that receives an integer that indicates the current alternate setting.
 * @returns {BOOL} <b>WinUsb_GetCurrentAlternateSetting</b> returns <b>TRUE</b> if the operation succeeds. Otherwise, this routine returns <b>FALSE</b>, and the caller can retrieve the logged error by calling <b>GetLastError</b>.
 * 
 * 
 * <b>GetLastError</b>    can return the following error code.
 * 
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
 * <dt><b>ERROR_INVALID_HANDLE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The caller passed <b>NULL</b> in the  <i>InterfaceHandle</i> parameter.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/winusb/nf-winusb-winusb_getcurrentalternatesetting
 */
export WinUsb_GetCurrentAlternateSetting(InterfaceHandle, SettingNumber) {
    SettingNumberMarshal := SettingNumber is VarRef ? "char*" : "ptr"

    A_LastError := 0

    result := DllCall("WINUSB.dll\WinUsb_GetCurrentAlternateSetting", WINUSB_INTERFACE_HANDLE, InterfaceHandle, SettingNumberMarshal, SettingNumber, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * The WinUsb_QueryPipe function retrieves information about the specified endpoint and the associated pipe for an interface.
 * @remarks
 * The <b>WinUsb_QueryPipe</b> function does not retrieve information about the control pipe.
 * 
 * Each interface on the USB device can have multiple endpoints. To communicate with each of these endpoints, the bus driver creates pipes for each endpoint on the interface. The pipe indices are zero-based. Therefore for <i>n</i> number of endpoints, the pipes' indices are set from <i>n</i>-1. <b>WinUsb_QueryPipe</b> parses the configuration descriptor to get the interface specified by the caller.  It searches the interface descriptor  for the endpoint descriptor associated with the caller-specified pipe. If the endpoint is found, the function populates the caller-allocated <a href="https://docs.microsoft.com/windows/desktop/api/winusbio/ns-winusbio-winusb_pipe_information">WINUSB_PIPE_INFORMATION</a> structure with information from the endpoint descriptor.
 * @param {WINUSB_INTERFACE_HANDLE} InterfaceHandle An opaque handle to an interface that contains the endpoint with which the pipe is associated.
 * 
 * To query the pipe associated with an endpoint in the first interface, use the handle returned by <a href="https://docs.microsoft.com/windows/desktop/api/winusb/nf-winusb-winusb_initialize">WinUsb_Initialize</a>. For all other interfaces, use the handle to the target interface, retrieved by <a href="https://docs.microsoft.com/windows/desktop/api/winusb/nf-winusb-winusb_getassociatedinterface">WinUsb_GetAssociatedInterface</a>.
 * @param {Integer} AlternateInterfaceNumber A value that specifies the alternate interface to return the information for.
 * @param {Integer} PipeIndex A value that specifies the pipe to return information about. This value is not the same as the <b>bEndpointAddress</b> field in the endpoint descriptor. A <i>PipeIndex </i> value of 0 signifies the first endpoint that is associated with the interface, a value of 1 signifies the second endpoint, and so on. <i>PipeIndex</i> must be less than the value in the <b>bNumEndpoints</b> field of the interface descriptor.
 * @param {Pointer<WINUSB_PIPE_INFORMATION>} PipeInformation A pointer, on output, to a caller-allocated <a href="https://docs.microsoft.com/windows/desktop/api/winusbio/ns-winusbio-winusb_pipe_information">WINUSB_PIPE_INFORMATION</a> structure that contains pipe information.
 * @returns {BOOL} <b>WinUsb_QueryPipe</b> returns <b>TRUE</b> if the operation succeeds. Otherwise, this function returns <b>FALSE</b>, and the caller can retrieve the logged error by calling <b>GetLastError</b>.
 * 
 * 
 * <b>GetLastError</b>    can return the following error code.
 * 
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
 * <dt><b>ERROR_INVALID_HANDLE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The caller passed <b>NULL</b> in the  <i>InterfaceHandle</i> parameter.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_PARAMETER </b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The caller passed <b>NULL</b> in the  <i>PipeInformation </i> parameter; interface descriptor could not be found for the handle specified in <i>InterfaceHandle</i>.
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
 * The value passed in the <i>PipeIndex</i> parameter is greater than the  <b>bNumEndpoints</b> value of the interface descriptor; endpoint descriptor could not be found for the specified interface.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/winusb/nf-winusb-winusb_querypipe
 */
export WinUsb_QueryPipe(InterfaceHandle, AlternateInterfaceNumber, PipeIndex, PipeInformation) {
    A_LastError := 0

    result := DllCall("WINUSB.dll\WinUsb_QueryPipe", WINUSB_INTERFACE_HANDLE, InterfaceHandle, "char", AlternateInterfaceNumber, "char", PipeIndex, WINUSB_PIPE_INFORMATION.Ptr, PipeInformation, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * The WinUsb_QueryPipeEx function retrieves extended information about the specified endpoint and the associated pipe for an interface.
 * @remarks
 * The <b>WinUsb_QueryPipeEx</b> function does not retrieve information about the control pipe.
 * @param {WINUSB_INTERFACE_HANDLE} InterfaceHandle An opaque handle to an interface that contains the endpoint with which the pipe is associated.
 * 
 * To query the pipe associated with an endpoint in the first interface, use the handle returned by <a href="https://docs.microsoft.com/windows/desktop/api/winusb/nf-winusb-winusb_initialize">WinUsb_Initialize</a>. For all other interfaces, use the handle to the target interface, retrieved by <a href="https://docs.microsoft.com/windows/desktop/api/winusb/nf-winusb-winusb_getassociatedinterface">WinUsb_GetAssociatedInterface</a>.
 * @param {Integer} AlternateSettingNumber A value that specifies the alternate interface to return the information for.
 * @param {Integer} PipeIndex A value that specifies the pipe to return information about. This value is not the same as the <b>bEndpointAddress</b> field in the endpoint descriptor. A <i>PipeIndex </i> value of 0 signifies the first endpoint that is associated with the interface, a value of 1 signifies the second endpoint, and so on. <i>PipeIndex</i> must be less than the value in the <b>bNumEndpoints</b> field of the interface descriptor.
 * @param {Pointer<WINUSB_PIPE_INFORMATION_EX>} PipeInformationEx A pointer, on output, to a caller-allocated <a href="https://docs.microsoft.com/windows/desktop/api/winusbio/ns-winusbio-winusb_pipe_information_ex">WINUSB_PIPE_INFORMATION_EX</a> structure that contains pipe information.
 * @returns {BOOL} <b>WinUsb_QueryPipeEx</b> returns <b>TRUE</b> if the operation succeeds. Otherwise, this function returns <b>FALSE</b>, and the caller can retrieve the logged error by calling <b>GetLastError</b>.
 * 
 * 
 * <b>GetLastError</b>    can return the following error code.
 * 
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
 * <dt><b>ERROR_INVALID_HANDLE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The caller passed <b>NULL</b> in the  <i>InterfaceHandle</i> parameter.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_PARAMETER </b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The caller passed <b>NULL</b> in the  <i>PipeInformation </i> parameter; interface descriptor could not be found for the handle specified in <i>InterfaceHandle</i>.
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
 * The value passed in the <i>PipeIndex</i> parameter is greater than the  <b>bNumEndpoints</b> value of the interface descriptor; endpoint descriptor could not be found for the specified interface.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/winusb/nf-winusb-winusb_querypipeex
 */
export WinUsb_QueryPipeEx(InterfaceHandle, AlternateSettingNumber, PipeIndex, PipeInformationEx) {
    A_LastError := 0

    result := DllCall("WINUSB.dll\WinUsb_QueryPipeEx", WINUSB_INTERFACE_HANDLE, InterfaceHandle, "char", AlternateSettingNumber, "char", PipeIndex, WINUSB_PIPE_INFORMATION_EX.Ptr, PipeInformationEx, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * The WinUsb_SetPipePolicy function sets the policy for a specific pipe associated with an endpoint on the device. This is a synchronous operation.
 * @param {WINUSB_INTERFACE_HANDLE} InterfaceHandle An opaque handle to an interface that contains the endpoint with which the pipe is associated. 
 * 
 * To set policy for the pipe associated with the endpoint in the first interface, use the handle returned by <a href="https://docs.microsoft.com/windows/desktop/api/winusb/nf-winusb-winusb_initialize">WinUsb_Initialize</a>. For all other interfaces, use the handle to the target interface, retrieved by <a href="https://docs.microsoft.com/windows/desktop/api/winusb/nf-winusb-winusb_getassociatedinterface">WinUsb_GetAssociatedInterface</a>.
 * @param {Integer} PipeID An 8-bit value that consists of a 7-bit address and a direction bit. This parameter corresponds to the <b>bEndpointAddress</b> field in the endpoint descriptor.
 * @param {WINUSB_PIPE_POLICY} PolicyType A <b>ULONG</b> variable that specifies the policy parameter to change. The <i>Value</i> parameter contains the new value for the policy parameter, defined in <i>winusbio.h</i>. For information about how to use each of the pipe policies and the resulting behavior, see <a href="https://docs.microsoft.com/windows-hardware/drivers/ddi/content/index">WinUSB Functions for Pipe Policy Modification</a>.
 * @param {Integer} ValueLength The size, in bytes, of the buffer at <i>Value</i>.
 * @param {Integer} Value The new value for the policy parameter that <i>PolicyType</i> specifies. The size of this input parameter depends on the policy to change. For information about the size of this parameter, see the description of the <i>PolicyType</i> parameter.
 * @returns {BOOL} <b>WinUsb_SetPipePolicy</b> returns <b>TRUE</b> if the operation succeeds. Otherwise, this function returns <b>FALSE</b>, and the caller can retrieve the logged error by calling <b>GetLastError</b>.
 * 
 * 
 * <b>GetLastError</b>    can return the following error code.
 * 
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
 * <dt><b>ERROR_INVALID_HANDLE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The caller passed <b>NULL</b> in the  <i>InterfaceHandle</i> parameter.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_PARAMETER </b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The caller passed an invalid size for the policy parameter buffer in the <i>ValueLength</i> parameter.
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
 * Indicates that there is insufficient memory to perform the operation.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/winusb/nf-winusb-winusb_setpipepolicy
 */
export WinUsb_SetPipePolicy(InterfaceHandle, PipeID, PolicyType, ValueLength, Value) {
    A_LastError := 0

    result := DllCall("WINUSB.dll\WinUsb_SetPipePolicy", WINUSB_INTERFACE_HANDLE, InterfaceHandle, "char", PipeID, WINUSB_PIPE_POLICY, PolicyType, "uint", ValueLength, "ptr", Value, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * The WinUsb_GetPipePolicy function retrieves the policy for a specific pipe associated with an endpoint on the device. This is a synchronous operation.
 * @param {WINUSB_INTERFACE_HANDLE} InterfaceHandle An opaque handle to an interface that contains the endpoint with which the pipe is associated.
 * 
 * To query the pipe associated with the endpoint in the first interface, use the handle returned by <a href="https://docs.microsoft.com/windows/desktop/api/winusb/nf-winusb-winusb_initialize">WinUsb_Initialize</a>. For all other interfaces, use the handle to the target interface, retrieved by <a href="https://docs.microsoft.com/windows/desktop/api/winusb/nf-winusb-winusb_getassociatedinterface">WinUsb_GetAssociatedInterface</a>.
 * @param {Integer} PipeID An 8-bit value that consists of a 7-bit address and a direction bit. This parameter corresponds to the <b>bEndpointAddress</b> field in the endpoint descriptor.
 * @param {WINUSB_PIPE_POLICY} PolicyType A <b>ULONG</b> variable that specifies the policy parameter to retrieve. The current value for the policy parameter is retrieved the <i>Value</i> parameter. For information about the behavior of the pipe policies, see <a href="https://docs.microsoft.com/windows-hardware/drivers/ddi/content/index">WinUSB Functions for Pipe Policy Modification</a>.
 * @param {Pointer<Integer>} ValueLength A pointer to the size, in bytes, of the buffer that <i>Value</i> points to. On output, <i>ValueLength</i> receives the size, in bytes, of the data that was copied into the <i>Value </i> buffer.
 * @param {Integer} Value A pointer to a buffer that receives the specified pipe policy value.
 * @returns {BOOL} <b>WinUsb_GetPipePolicy</b> returns <b>TRUE</b> if the operation succeeds. Otherwise, this routine returns <b>FALSE</b>, and the caller can retrieve the logged error by calling <b>GetLastError</b>.
 * 
 * 
 * <b>GetLastError</b>    can return the following error code.
 * 
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
 * <dt><b>ERROR_INVALID_HANDLE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The caller passed <b>NULL</b> in the  <i>InterfaceHandle</i> parameter.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/winusb/nf-winusb-winusb_getpipepolicy
 */
export WinUsb_GetPipePolicy(InterfaceHandle, PipeID, PolicyType, ValueLength, Value) {
    ValueLengthMarshal := ValueLength is VarRef ? "uint*" : "ptr"

    A_LastError := 0

    result := DllCall("WINUSB.dll\WinUsb_GetPipePolicy", WINUSB_INTERFACE_HANDLE, InterfaceHandle, "char", PipeID, WINUSB_PIPE_POLICY, PolicyType, ValueLengthMarshal, ValueLength, "ptr", Value, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * The WinUsb_ReadPipe function reads data from the specified pipe.
 * @remarks
 * If the data returned by the device is greater than a maximum transfer length, WinUSB divides the request into smaller requests of maximum transfer length and submits them serially. If the transfer length is not a multiple of the endpoint's maximum packet size (retrievable through  the <a href="https://docs.microsoft.com/windows/desktop/api/winusbio/ns-winusbio-winusb_pipe_information">WINUSB_PIPE_INFORMATION</a> structure's <b>MaximumPacketSize</b> member), WinUSB increases the size of the transfer to the next multiple of <b>MaximumPacketSize</b>.
 * 
 * USB packet size does not factor into the transfer for a read request. If the device responds with a packet that is too large for the client buffer, the behavior of the read request corresponds to the type of policy set on the pipe. If policy type for the pipe is ALLOW_PARTIAL_READS, WinUSB adds the remaining data to the beginning of the next transfer. If ALLOW_PARTIAL_READS is not set, the read request fails. For more information about policy types, see <a href="https://docs.microsoft.com/windows-hardware/drivers/ddi/content/index">WinUSB Functions for Pipe Policy Modification</a>.
 * 
 * If an application passes <b>NULL</b> in the <i>Overlapped</i> parameter (synchronous operation), the application must make sure that <i>LengthTransferred</i> is not <b>NULL</b>, even when the read  operation produces no output data.
 * 
 * If <i>Overlapped</i> is not <b>NULL</b> (asynchronous operation),  <i>LengthTransferred</i> can be set to <b>NULL</b>. For an overlapped operation (and if <i>LengthTransferred</i> is a non-<b>NULL</b> value), the value received in <i>LengthTransferred</i> after <b>WinUsb_ReadPipe</b> returns is meaningless until the overlapped operation has completed. To retrieve the actual number of bytes read from the pipe, call <a href="https://docs.microsoft.com/windows/desktop/api/winusb/nf-winusb-winusb_getoverlappedresult">WinUsb_GetOverlappedResult</a>.
 * 
 * When no data is available in the endpoint (pipe is empty), <b>WinUsb_ReadPipe</b> does not return until there is data in the pipe. If an error condition occurs or the application-specified timeout expires,   <b>WinUsb_ReadPipe</b> always returns FALSE. To determine the actual reason for that return value, always call <b>GetLastError</b>. For example, in these cases the <b>GetLastError</b> error value indicates the actual reason: <ul>
 * <li>If the application specified a timeout value in the pipe policy and that timeout expires, <b>WinUsb_ReadPipe</b> returns  FALSE and <b>GetLastError</b> returns ERROR_SEM_TIMEOUT.</li>
 * <li>If an error condition occurs while reading data from the pipe, <b>WinUsb_ReadPipe</b> returns FALSE and <b>GetLastError</b> returns ERROR_GEN_FAILURE.</li>
 * </ul>
 * @param {WINUSB_INTERFACE_HANDLE} InterfaceHandle An opaque handle to the interface that contains the endpoint with which the pipe is associated. 
 * 
 * To read data from the pipe associated with an endpoint in the first interface, use the handle returned by <a href="https://docs.microsoft.com/windows/desktop/api/winusb/nf-winusb-winusb_initialize">WinUsb_Initialize</a>. For all other interfaces, use the handle to the target interface, retrieved by <a href="https://docs.microsoft.com/windows/desktop/api/winusb/nf-winusb-winusb_getassociatedinterface">WinUsb_GetAssociatedInterface</a>.
 * @param {Integer} PipeID <i>PipeID</i> corresponds to the <b>bEndpointAddress</b> field in the endpoint descriptor. For information about the layout of this field, see <b>Table 9-13</b> in "Universal Serial Bus Specification Revision 2.0" at <a href="https://www.microsoft.com/whdc/connect/usb/default.mspx">USB Technology</a>. In the <b>bEndpointAddress</b> field, Bit 7 indicates the direction of the endpoint: 0 for OUT; 1 for IN.
 * @param {Integer} _Buffer A caller-allocated buffer that receives the data that is read.
 * @param {Integer} BufferLength The maximum number of bytes to read. This number must be less than or equal to the size, in bytes, of <i>Buffer</i>.
 * @param {Pointer<Integer>} LengthTransferred A pointer to a ULONG variable that receives the actual number of bytes that were copied into <i>Buffer</i>. For more information, see Remarks.
 * @param {Pointer<OVERLAPPED>} _Overlapped An optional pointer to an OVERLAPPED structure that is used for asynchronous operations. If this parameter is specified, <b>WinUsb_ReadPipe</b> returns immediately rather than waiting synchronously for the operation to complete before returning. An event is signaled when the operation is complete.
 * @returns {BOOL} <b>WinUsb_ReadPipe</b> returns <b>TRUE</b> if the operation succeeds. Otherwise, this function returns <b>FALSE</b>, and the caller can retrieve the logged error by calling <b>GetLastError</b>.
 * 
 * 
 * <b>GetLastError</b>    can return the following error code.
 * 
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
 * <dt><b>ERROR_INVALID_HANDLE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The caller passed <b>NULL</b> in the  <i>InterfaceHandle</i> parameter.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_IO_PENDING</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * An overlapped I/O operation is in progress but has not completed.  If the overlapped operation cannot be completed immediately, the function returns <b>FALSE</b> and the <b>GetLastError</b> function returns ERROR_IO_PENDING, indicating that the operation is executing in the background. Call <a href="https://docs.microsoft.com/windows/desktop/api/winusb/nf-winusb-winusb_getoverlappedresult">WinUsb_GetOverlappedResult</a> to check the success or failure of the operation.
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
 * There is insufficient memory to perform the operation.
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
 * The read operation initiated by <a href="https://docs.microsoft.com/windows/desktop/api/winusb/nf-winusb-winusb_readpipe">WinUsb_ReadPipe</a>  in the USB stack timed out before the operation could be completed.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/winusb/nf-winusb-winusb_readpipe
 */
export WinUsb_ReadPipe(InterfaceHandle, PipeID, _Buffer, BufferLength, LengthTransferred, _Overlapped) {
    LengthTransferredMarshal := LengthTransferred is VarRef ? "uint*" : "ptr"

    A_LastError := 0

    result := DllCall("WINUSB.dll\WinUsb_ReadPipe", WINUSB_INTERFACE_HANDLE, InterfaceHandle, "char", PipeID, "ptr", _Buffer, "uint", BufferLength, LengthTransferredMarshal, LengthTransferred, OVERLAPPED.Ptr, _Overlapped, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * The WinUsb_WritePipe function writes data to a pipe.
 * @remarks
 * To create a write request, your the application must allocate a buffer, fill it with the data that you want to write to the device, and send the buffer to the host controller by calling  <b>WinUsb_WritePipe</b>. 
 * 
 * The following restrictions apply to the size of the buffer if  RAW_IO is  set:
 * 
 * <ul>
 * <li>The buffer length must be a multiple of the maximum endpoint packet size.</li>
 * <li>The length must be less than or equal to the value of MAXIMUM_TRANSFER_SIZE retrieved by <a href="https://docs.microsoft.com/windows/desktop/api/winusb/nf-winusb-winusb_getpipepolicy">WinUsb_GetPipePolicy</a>.</li>
 * </ul>
 * There are no restrictions on the size of the buffer if RAW_IO is not set as the pipe's policy type. If the size of the buffer is greater than the maximum transfer length reported by MAXIMUM_TRANSFER_SIZE, WinUSB divides the request into smaller requests and submits them serially to the host controller.
 * 
 * A write request that contains zero-length data is forwarded down the USB stack. 
 * 
 * If an application passes <b>NULL</b> in the <i>Overlapped</i> parameter (synchronous operation), it must ensure that <i>LengthTransferred</i> is not <b>NULL</b>, even when an operation produces no output data.
 * 
 * If <i>Overlapped</i> is not <b>NULL</b> (asynchronous operation),  <i>LengthTransferred</i> can be set to <b>NULL</b>. For an overlapped operation (and if <i>LengthTransferred</i> is a non-<b>NULL</b> value), the value received in <i>LengthTransferred</i> after <b>WinUsb_WritePipe</b> returns is meaningless until the overlapped operation has completed. To retrieve the actual number of bytes returned, call <a href="https://docs.microsoft.com/windows/desktop/api/winusb/nf-winusb-winusb_getoverlappedresult">WinUsb_GetOverlappedResult</a>.
 * @param {WINUSB_INTERFACE_HANDLE} InterfaceHandle An opaque handle to the interface that contains the endpoint with which the pipe is associated. 
 * 
 * To write to  a pipe that is associated with an endpoint in the first interface, use the handle returned by <a href="https://docs.microsoft.com/windows/desktop/api/winusb/nf-winusb-winusb_initialize">WinUsb_Initialize</a>. For all other interfaces, use the handle to the target interface, retrieved by <a href="https://docs.microsoft.com/windows/desktop/api/winusb/nf-winusb-winusb_getassociatedinterface">WinUsb_GetAssociatedInterface</a>.
 * @param {Integer} PipeID <i>PipeID</i> corresponds to the <b>bEndpointAddress</b> field in the endpoint descriptor. For information about the layout of this field, see <b>Table 9-13</b> in "Universal Serial Bus Specification Revision 2.0" at <a href="https://www.microsoft.com/whdc/connect/usb/default.mspx">USB Technology</a>. In the <b>bEndpointAddress</b> field, Bit 7 indicates the direction of the endpoint: 0 for OUT; 1 for IN.
 * @param {Integer} _Buffer A caller-allocated buffer that contains the data to write.
 * @param {Integer} BufferLength The number of bytes to write. This number must be less than or equal to the size, in bytes, of <i>Buffer</i>.
 * @param {Pointer<Integer>} LengthTransferred A pointer to a ULONG variable that receives the actual number of bytes that were written to the pipe. For more information, see Remarks.
 * @param {Pointer<OVERLAPPED>} _Overlapped An optional pointer to an OVERLAPPED structure, which is used for asynchronous operations. If this parameter is specified, <b>WinUsb_WritePipe</b> immediately returns, and the event is signaled when the operation is complete.
 * @returns {BOOL} <b>WinUsb_WritePipe</b> returns <b>TRUE</b> if the operation succeeds. Otherwise, this function returns <b>FALSE</b>, and the caller can retrieve the logged error by calling <b>GetLastError</b>.
 * 
 * 
 * <b>GetLastError</b>    can return the following error code.
 * 
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
 * <dt><b>ERROR_INVALID_HANDLE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The caller passed <b>NULL</b> in the  <i>InterfaceHandle</i> parameter.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_IO_PENDING</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * Indicates that an overlapped I/O operation is in progress but has not completed.  If the overlapped operation cannot be completed immediately, the function returns <b>FALSE</b> and the <b>GetLastError</b> function returns ERROR_IO_PENDING, indicating that the operation is executing in the background. Call <a href="https://docs.microsoft.com/windows/desktop/api/winusb/nf-winusb-winusb_getoverlappedresult">WinUsb_GetOverlappedResult</a> to check the success or failure of the operation.
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
 * Indicates that there is insufficient memory to perform the operation.
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
 * The write operation initiated by  <a href="https://docs.microsoft.com/windows/desktop/api/winusb/nf-winusb-winusb_writepipe">WinUsb_WritePipe</a> in the USB stack timed out before the operation could be completed.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/winusb/nf-winusb-winusb_writepipe
 */
export WinUsb_WritePipe(InterfaceHandle, PipeID, _Buffer, BufferLength, LengthTransferred, _Overlapped) {
    LengthTransferredMarshal := LengthTransferred is VarRef ? "uint*" : "ptr"

    A_LastError := 0

    result := DllCall("WINUSB.dll\WinUsb_WritePipe", WINUSB_INTERFACE_HANDLE, InterfaceHandle, "char", PipeID, "ptr", _Buffer, "uint", BufferLength, LengthTransferredMarshal, LengthTransferred, OVERLAPPED.Ptr, _Overlapped, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * The WinUsb_ControlTransfer function transmits control data over a default control endpoint.
 * @remarks
 * A control request is always sent by the host to the default endpoint of a USB device but the recipient of the request can be the entire device, an interface, or an endpoint in the selected alternate setting. In the <b>WinUsb_ControlTransfer</b> call, the application must indicate the recipient through two parameters: <i>InterfaceHandle</i> and <i>SetupPacket</i>. 
 * 
 * If the recipient of a control request is the entire device, the first interface, or any endpoint in that interface, the application must use the handle returned by <a href="https://docs.microsoft.com/windows/desktop/api/winusb/nf-winusb-winusb_initialize">WinUsb_Initialize</a>. If the recipient is any other interface or its endpoint, then the application must obtain the WinUSB handle that is associated with the target interface by calling <a href="https://docs.microsoft.com/windows/desktop/api/winusb/nf-winusb-winusb_getassociatedinterface">WinUsb_GetAssociatedInterface</a>, and then call <b>WinUsb_ControlTransfer</b> by specifying the obtained interface handle.
 * 
 * As per Section 9.3 of the official USB specification, the setup token of a control transfer contains information about the request. For a WinUSB application, that setup token is described by using the <a href="https://docs.microsoft.com/windows/desktop/api/winusb/ns-winusb-winusb_setup_packet">WINUSB_SETUP_PACKET</a> structure. 
 * 
 * Within the setup token, <b>bmRequestType</b> and <b>wIndex</b> fields are used to indicate the recipient of the request. Those fields correspond to <b>RequestType</b> and <b>Index</b> members of <a href="https://docs.microsoft.com/windows/desktop/api/winusb/ns-winusb-winusb_setup_packet">WINUSB_SETUP_PACKET</a>, respectively. 
 * 
 * The lowest two bits of <b>RequestType</b> indicate the recipient of the request. The recipient can be the device, an interface, endpoint, or other (for vendor request). Depending on the recipient, the lower byte of <b>Index</b> indicates the device-defined index of the recipient. The value of <b>Index</b> depends on the type of request. For example, for standard control requests, the value is 0, or indicates the interface or endpoint number. For certain types of standard requests, such as a GET_DESCRIPTOR request to obtain a string descriptor, the <b>Index</b> value indicates the Language ID. 
 * 
 * If the recipient is the device, the application must set <b>RequestType</b> and <b>Index</b> values.  The lowest two bits of <b>RequestType</b> value must be 0. The lower byte of <b>Index</b> value depends on the type of request. The <i>InterfaceHandle</i> must be the WinUSB handle returned by <a href="https://docs.microsoft.com/windows/desktop/api/winusb/nf-winusb-winusb_initialize">WinUsb_Initialize</a>.
 * 
 * If the recipient of the request is an interface, the application must set the lowest two bits of <b>RequestType</b> to 0x01. The application is not required to set the lower byte of <b>Index</b> for any type of request. For  standard, class, and vendor requests,  Winusb.sys sets the value to the interface number of the target interface. The <i>InterfaceHandle</i> must be associated with the target interface. The application can obtain that handle by calling <a href="https://docs.microsoft.com/windows/desktop/api/winusb/nf-winusb-winusb_getassociatedinterface">WinUsb_GetAssociatedInterface</a>.
 * 
 * If the recipient is an endpoint, the application must set the lowest two bits of <b>RequestType</b> to 0x02 and lower byte of Index to the endpoint address. In this case, <i>InterfaceHandle</i> is associated with the interface that contains the endpoint. The application can obtain that handle by calling <a href="https://docs.microsoft.com/windows/desktop/api/winusb/nf-winusb-winusb_getassociatedinterface">WinUsb_GetAssociatedInterface</a>.
 * @param {WINUSB_INTERFACE_HANDLE} InterfaceHandle An opaque handle to an interface in the selected configuration. 
 * 
 * To specify the recipient of  a control request as the entire device or the first interface, use the handle returned by <a href="https://docs.microsoft.com/windows/desktop/api/winusb/nf-winusb-winusb_initialize">WinUsb_Initialize</a>. For all other interfaces, obtain the handle to the target interface by calling <a href="https://docs.microsoft.com/windows/desktop/api/winusb/nf-winusb-winusb_getassociatedinterface">WinUsb_GetAssociatedInterface</a>, and then call <b>WinUsb_ControlTransfer</b> by specifying the obtained interface handle.
 * @param {WINUSB_SETUP_PACKET} SetupPacket The 8-byte setup packet of type <a href="https://docs.microsoft.com/windows/desktop/api/winusb/ns-winusb-winusb_setup_packet">WINUSB_SETUP_PACKET</a>.
 * @param {Integer} _Buffer A caller-allocated buffer that contains the data to transfer. The length of this buffer must not exceed 4KB.
 * @param {Integer} BufferLength The number of bytes to transfer, not including the setup packet. This number must be less than or equal to the size, in bytes, of <i>Buffer</i>.
 * @param {Pointer<Integer>} LengthTransferred A pointer to a ULONG variable that receives the actual number of transferred bytes. If the application does not expect any data to be transferred during the
 *         data phase (<i>BufferLength</i> is zero),  <i>LengthTransferred</i> can be <b>NULL</b>.
 * @param {Pointer<OVERLAPPED>} _Overlapped An optional pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-overlapped">OVERLAPPED</a> structure, which is used for asynchronous operations. If this parameter is specified, <b>WinUsb_ControlTransfer</b> immediately returns, and the event is signaled when the operation is complete. If <i>Overlapped</i> is not supplied, the <b>WinUsb_ControlTransfer</b> function transfers data synchronously.
 * @returns {BOOL} <b>WinUsb_ControlTransfer</b> returns <b>TRUE</b> if the operation succeeds. Otherwise, this routine returns <b>FALSE</b>, and the caller can retrieve the logged error by calling <b>GetLastError</b>.
 * 
 * 
 * <b>GetLastError</b>    can return one of the following error codes.
 * 
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
 * <dt><b>ERROR_INVALID_HANDLE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The caller passed <b>NULL</b> in the  <i>InterfaceHandle</i> parameter.
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
 * Indicates that there is insufficient memory to perform the operation.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/winusb/nf-winusb-winusb_controltransfer
 */
export WinUsb_ControlTransfer(InterfaceHandle, SetupPacket, _Buffer, BufferLength, LengthTransferred, _Overlapped) {
    LengthTransferredMarshal := LengthTransferred is VarRef ? "uint*" : "ptr"

    A_LastError := 0

    result := DllCall("WINUSB.dll\WinUsb_ControlTransfer", WINUSB_INTERFACE_HANDLE, InterfaceHandle, WINUSB_SETUP_PACKET, SetupPacket, "ptr", _Buffer, "uint", BufferLength, LengthTransferredMarshal, LengthTransferred, OVERLAPPED.Ptr, _Overlapped, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * The WinUsb_ResetPipe function resets the data toggle and clears the stall condition on a pipe.
 * @param {WINUSB_INTERFACE_HANDLE} InterfaceHandle An opaque handle to the interface that contains the endpoint with which the pipe is associated. 
 * 
 * To reset a pipe associated with an endpoint in the first interface, use the handle returned by <a href="https://docs.microsoft.com/windows/desktop/api/winusb/nf-winusb-winusb_initialize">WinUsb_Initialize</a>. For all other interfaces, use the handle to the target interface, retrieved by <a href="https://docs.microsoft.com/windows/desktop/api/winusb/nf-winusb-winusb_getassociatedinterface">WinUsb_GetAssociatedInterface</a>.
 * @param {Integer} PipeID The identifier (ID) of the control pipe. The <i>PipeID</i> parameter is an 8-bit value that consists in a 7-bit address and a direction bit. This parameter corresponds to the <b>bEndpointAddress</b> field in the endpoint descriptor.
 * @returns {BOOL} <b>WinUsb_ResetPipe</b> returns <b>TRUE</b> if the operation succeeds. Otherwise, this function returns <b>FALSE</b>, and the caller can retrieve the logged error by calling <b>GetLastError</b>.
 * 
 * 
 * <b>GetLastError</b>    can return the following error code.
 * 
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
 * <dt><b>ERROR_INVALID_HANDLE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The caller passed <b>NULL</b> in the  <i>InterfaceHandle</i> parameter.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/winusb/nf-winusb-winusb_resetpipe
 */
export WinUsb_ResetPipe(InterfaceHandle, PipeID) {
    A_LastError := 0

    result := DllCall("WINUSB.dll\WinUsb_ResetPipe", WINUSB_INTERFACE_HANDLE, InterfaceHandle, "char", PipeID, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * The WinUsb_AbortPipe function aborts all of the pending transfers for a pipe. This is a synchronous operation.
 * @param {WINUSB_INTERFACE_HANDLE} InterfaceHandle An opaque handle to an interface that contains the endpoint with which the pipe is associated.
 * 
 * To abort transfers on the pipe associated with the endpoint in the first interface, use the handle returned by <a href="https://docs.microsoft.com/windows/desktop/api/winusb/nf-winusb-winusb_initialize">WinUsb_Initialize</a>. For all other interfaces, use the handle to the target interface, retrieved by <a href="https://docs.microsoft.com/windows/desktop/api/winusb/nf-winusb-winusb_getassociatedinterface">WinUsb_GetAssociatedInterface</a>.
 * @param {Integer} PipeID The identifier (ID) of the control pipe. The <i>PipeID</i> parameter is an 8-bit value that consists of a 7-bit address and a direction bit. This parameter corresponds to the <b>bEndpointAddress</b> field in the endpoint descriptor.
 * @returns {BOOL} <b>WinUsb_AbortPipe</b> returns <b>TRUE</b> if  the operation succeeds. Otherwise, this routine returns <b>FALSE</b>, and the caller can retrieve the logged error by calling <b>GetLastError</b>. 
 * 
 * 
 * <b>GetLastError</b>    can return the following error code.
 * 
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
 * <dt><b>ERROR_INVALID_HANDLE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The caller passed <b>NULL</b> in the  <i>InterfaceHandle</i> parameter.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/winusb/nf-winusb-winusb_abortpipe
 */
export WinUsb_AbortPipe(InterfaceHandle, PipeID) {
    A_LastError := 0

    result := DllCall("WINUSB.dll\WinUsb_AbortPipe", WINUSB_INTERFACE_HANDLE, InterfaceHandle, "char", PipeID, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * The WinUsb_FlushPipe function discards any data that is cached in a pipe. This is a synchronous operation.
 * @param {WINUSB_INTERFACE_HANDLE} InterfaceHandle An opaque handle to the interface with which the specified pipe's endpoint is associated. To clear data in a pipe that is associated with the endpoint on the first (default) interface, use the handle returned by <a href="https://docs.microsoft.com/windows/desktop/api/winusb/nf-winusb-winusb_initialize">WinUsb_Initialize</a>. For all other interfaces, use the handle to the target interface, retrieved by <a href="https://docs.microsoft.com/windows/desktop/api/winusb/nf-winusb-winusb_getassociatedinterface">WinUsb_GetAssociatedInterface</a>.
 * @param {Integer} PipeID The identifier (ID) of the control pipe. The <i>PipeID</i> parameter is an 8-bit value that consists of a 7-bit address and a direction bit. This parameter corresponds to the <b>bEndpointAddress</b> field in the endpoint descriptor.
 * @returns {BOOL} <b>WinUsb_FlushPipe</b> returns <b>TRUE</b> if the operation succeeds. Otherwise, this routine returns <b>FALSE</b>, and the caller can retrieve the logged error by calling <b>GetLastError</b>.
 * 
 * 
 * <b>GetLastError</b>    can return the following error code.
 * 
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
 * <dt><b>ERROR_INVALID_HANDLE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The caller passed <b>NULL</b> in the  <i>InterfaceHandle</i> parameter.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/winusb/nf-winusb-winusb_flushpipe
 */
export WinUsb_FlushPipe(InterfaceHandle, PipeID) {
    A_LastError := 0

    result := DllCall("WINUSB.dll\WinUsb_FlushPipe", WINUSB_INTERFACE_HANDLE, InterfaceHandle, "char", PipeID, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * The WinUsb_SetPowerPolicy function sets the power policy for a device.
 * @remarks
 * The following list summarizes the effects of changes to power management states:
 * 
 * <ul>
 * <li>
 * All pipe handles, interface handles, locks, and alternate settings are preserved across power management events.
 * 
 * </li>
 * <li>
 * Any transfers that are in progress are suspended when a device transfers to a low power state, and they are resumed when the device is restored to a working state.
 * 
 * </li>
 * <li>
 * The device and system must be in a working state before the client can restore a device-specific configuration. Clients can determine whether the device and system are in a working state from the WM_POWERBROADCAST message.
 * 
 * </li>
 * <li>
 * The client can indicate that an interface is idle by calling <b>WinUsb_SetPowerPolicy</b>. 
 * 
 * </li>
 * </ul>
 * @param {WINUSB_INTERFACE_HANDLE} InterfaceHandle An opaque handle to the first (default) interface on the device, which is returned by <a href="https://docs.microsoft.com/windows/desktop/api/winusb/nf-winusb-winusb_initialize">WinUsb_Initialize</a>.
 * @param {WINUSB_POWER_POLICY} PolicyType A value that specifies the power policy to set. The following table describes symbolic constants that are defined in winusbio.h. 
 * 
 * <table>
 * <tr>
 * <th>Policy parameter</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td>
 * AUTO_SUSPEND
 * 
 * (0x81)
 * 
 * </td>
 * <td>
 * Specifies the auto-suspend policy type; the power policy parameter must be specified by the caller in the <i>Value</i> parameter.
 * 
 * For auto-suspend, the <i>Value</i> parameter must point to a UCHAR variable.  
 * 
 * If <i>Value</i> is <b>TRUE</b> (nonzero), the USB stack suspends the device if the device is idle.  A device is idle if there are no transfers pending, or if the only pending transfers are IN transfers to interrupt or bulk endpoints.  
 * 
 * The default value is determined by the value set in the <b>DefaultIdleState</b> registry setting. By default, this value is <b>TRUE</b>. 
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>
 * SUSPEND_DELAY
 * 
 * (0x83)
 * 
 * </td>
 * <td>
 * Specifies the suspend-delay policy type; the power policy parameter must be specified by the caller in the <i>Value</i> parameter.
 * 
 * For suspend-delay, <i>Value</i> must point to a ULONG variable.  
 * 
 * <i>Value</i> specifies the minimum amount of time, in milliseconds, that the WinUSB driver must wait post transfer before it can suspend the device. 
 * 
 * The default value is determined by the value set in the <b>DefaultIdleTimeout</b> registry setting. By default, this value is five seconds.
 * 
 * </td>
 * </tr>
 * </table>
 * @param {Integer} ValueLength The size, in bytes, of the buffer at <i>Value</i>.
 * @param {Integer} Value The new value for the power policy parameter. Datatype and value for <i>Value</i> depends on the type of power policy passed in <i>PolicyType</i>. For more information, see <i>PolicyType</i>.
 * @returns {BOOL} <b>WinUsb_SetPowerPolicy</b> returns <b>TRUE</b> if the operation succeeds. Otherwise, this function returns <b>FALSE</b>, and the caller can retrieve the logged error by calling <b>GetLastError</b>.
 * 
 * 
 * <b>GetLastError</b>    can return the following error code.
 * 
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
 * <dt><b>ERROR_INVALID_HANDLE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The caller passed <b>NULL</b> in the  <i>InterfaceHandle</i> parameter.
 * 
 * </td>
 * </tr>
 * <tr>
 * <td width="40%">
 * <dl>
 * <dt><b>ERROR_INVALID_PARAMETER </b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The caller passed an invalid size for the policy parameter buffer in the <i>ValueLength</i> parameter.
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
 * Indicates that there is insufficient memory to perform the operation.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/winusb/nf-winusb-winusb_setpowerpolicy
 */
export WinUsb_SetPowerPolicy(InterfaceHandle, PolicyType, ValueLength, Value) {
    A_LastError := 0

    result := DllCall("WINUSB.dll\WinUsb_SetPowerPolicy", WINUSB_INTERFACE_HANDLE, InterfaceHandle, WINUSB_POWER_POLICY, PolicyType, "uint", ValueLength, "ptr", Value, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * The WinUsb_GetPowerPolicy function retrieves the power policy for a device. This is a synchronous operation.
 * @param {WINUSB_INTERFACE_HANDLE} InterfaceHandle An opaque handle to the first interface on the device, which is returned by <a href="https://docs.microsoft.com/windows/desktop/api/winusb/nf-winusb-winusb_initialize">WinUsb_Initialize</a>.
 * @param {WINUSB_POWER_POLICY} PolicyType A value that specifies the power policy parameter to retrieve in <i>Value</i>. The following table describes symbolic constants that are defined in <i>Winusbio.h</i>. 
 * 
 * <table>
 * <tr>
 * <th>Policy type</th>
 * <th>Description</th>
 * </tr>
 * <tr>
 * <td>
 * AUTO_SUSPEND
 * 
 * (0x81)
 * 
 * </td>
 * <td>
 * If the caller specifies a power policy of AUTO_SUSPEND, <b>WinUsb_GetPowerPolicy</b> returns the value of the auto suspend policy parameter in the <i>Value</i> parameter.
 * 
 * If <i>Value</i> is <b>TRUE</b> (that is, nonzero), the USB stack suspends the device when no transfers are pending or the only transfers pending are IN transfers on an interrupt or bulk endpoint. 
 * 
 * The value of the <b>DefaultIdleState</b> registry value determines the default value of the auto suspend policy parameter.
 * 
 * The <i>Value</i> parameter must point to a UCHAR variable.  
 * 
 * </td>
 * </tr>
 * <tr>
 * <td>
 * SUSPEND_DELAY
 * 
 * (0x83)
 * 
 * </td>
 * <td>
 * If the caller specifies a power policy of SUSPEND_DELAY, <b>WinUsb_GetPowerPolicy</b> returns the value of the suspend delay policy parameter in <i>Value</i>.
 * 
 * The suspend delay policy parameter specifies the minimum amount of time, in milliseconds, that the WinUSB driver must wait after any transfer before it can suspend the device. 
 * 
 * <i>Value</i> must point to a ULONG variable.  
 * 
 * </td>
 * </tr>
 * </table>
 * @param {Pointer<Integer>} ValueLength A pointer to the size of the buffer that <i>Value</i>. On output, <i>ValueLength</i> receives the size of the data that was copied into the <i>Value </i> buffer.
 * @param {Integer} Value A buffer that receives the specified power policy parameter. For more information, see <i>PolicyType</i>.
 * @returns {BOOL} <b>WinUsb_GetPowerPolicy</b> returns <b>TRUE</b> if the operation succeeds. Otherwise, this routine returns <b>FALSE</b>, and the caller can retrieve the logged error by calling <b>GetLastError</b>.
 * 
 * 
 * <b>GetLastError</b>    can return the following error code.
 * 
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
 * <dt><b>ERROR_INVALID_HANDLE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The caller passed <b>NULL</b> in the  <i>InterfaceHandle</i> parameter.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/winusb/nf-winusb-winusb_getpowerpolicy
 */
export WinUsb_GetPowerPolicy(InterfaceHandle, PolicyType, ValueLength, Value) {
    ValueLengthMarshal := ValueLength is VarRef ? "uint*" : "ptr"

    A_LastError := 0

    result := DllCall("WINUSB.dll\WinUsb_GetPowerPolicy", WINUSB_INTERFACE_HANDLE, InterfaceHandle, WINUSB_POWER_POLICY, PolicyType, ValueLengthMarshal, ValueLength, "ptr", Value, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * The WinUsb_GetOverlappedResult function retrieves the results of an overlapped operation on the specified file.
 * @remarks
 * This function is like the Win32 API routine, <b>GetOverlappedResult</b>, with one difference—instead of passing a file handle that is returned from <b>CreateFile</b>, the caller passes an interface handle that is returned from <a href="https://docs.microsoft.com/windows/desktop/api/winusb/nf-winusb-winusb_initialize">WinUsb_Initialize</a>. The caller can use either API routine, if the appropriate handle is passed. The <b>WinUsb_GetOverlappedResult </b> function extracts the file handle from the interface handle and then calls <b>GetOverlappedResult</b>.
 * 
 * The results that are reported by the <b>WinUsb_GetOverlappedResult</b> function are those from the specified handle's last overlapped operation to which the specified <b>OVERLAPPED</b> structure was provided, and for which the operation's results were pending. A pending operation is indicated when the function that started the operation returns <b>FALSE</b>, and the <b>GetLastError</b> routine returns ERROR_IO_PENDING. When an I/O operation is pending, the function that started the operation resets the <b>hEvent</b> member of the <b>OVERLAPPED</b> structure to the nonsignaled state. Then when the pending operation has been completed, the system sets the event object to the signaled state.
 * 
 * The caller can specify that an event object is manually reset in the <b>OVERLAPPED</b> structure. If an automatic reset event object is used, the event handle must not be specified in any other wait operation in the interval between starting the overlapped operation and the call to <b>WinUsb_GetOverlappedResult</b>. For example, the event object is sometimes specified in one of the wait routines to wait for the operation to be completed. When the wait routine returns, the system sets an auto-reset event's state to nonsignaled, and a successive call to <b>WinUsb_GetOverlappedResult</b> with the <i>bWait</i> parameter set to <b>TRUE</b> causes the function to be blocked indefinitely.
 * 
 * If the <i>bWait</i> parameter is <b>TRUE</b>, <b>WinUsb_GetOverlappedResult</b> determines whether the pending operation has been completed by waiting for the event object to be in the signaled state.
 * 
 * If the <b>hEvent</b> member of the <b>OVERLAPPED</b> structure is <b>NULL</b>, the system uses the state of the file handle to signal when the operation has been completed. Do not use file handles for this purpose. It is better to use an event object because of the confusion that can occur when multiple concurrent overlapped operations are performed on the same file. In this situation, you cannot know which operation caused the state of the object to be signaled.
 * @param {WINUSB_INTERFACE_HANDLE} InterfaceHandle An opaque handle to the first interface on the device, which is returned by <a href="https://docs.microsoft.com/windows/desktop/api/winusb/nf-winusb-winusb_initialize">WinUsb_Initialize</a>.
 * @param {Pointer<OVERLAPPED>} lpOverlapped A pointer to an <b>OVERLAPPED</b> structure that was specified when the overlapped operation was started.
 * @param {Pointer<Integer>} lpNumberOfBytesTransferred A pointer to a variable that receives the number of bytes that were actually transferred by a read or write operation.
 * @param {BOOL} bWait If this parameter is <b>TRUE</b>, the function does not return until the operation has been completed. If this parameter is <b>FALSE</b> and the operation is still pending, the function returns <b>FALSE</b> and the <b>GetLastError</b> function returns ERROR_IO_INCOMPLETE.
 * @returns {BOOL} If the function succeeds, the return value is any number other than zero. If the function fails, the return value is zero. To get extended error information, call <b>GetLastError</b>.
 * @see https://learn.microsoft.com/windows/win32/api/winusb/nf-winusb-winusb_getoverlappedresult
 */
export WinUsb_GetOverlappedResult(InterfaceHandle, lpOverlapped, lpNumberOfBytesTransferred, bWait) {
    lpNumberOfBytesTransferredMarshal := lpNumberOfBytesTransferred is VarRef ? "uint*" : "ptr"

    A_LastError := 0

    result := DllCall("WINUSB.dll\WinUsb_GetOverlappedResult", WINUSB_INTERFACE_HANDLE, InterfaceHandle, OVERLAPPED.Ptr, lpOverlapped, lpNumberOfBytesTransferredMarshal, lpNumberOfBytesTransferred, BOOL, bWait, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * 
 * @param {Pointer<USB_CONFIGURATION_DESCRIPTOR>} ConfigurationDescriptor 
 * @param {Pointer<Void>} StartPosition 
 * @param {Integer} InterfaceNumber 
 * @param {Integer} AlternateSetting 
 * @param {Integer} InterfaceClass 
 * @param {Integer} InterfaceSubClass 
 * @param {Integer} InterfaceProtocol 
 * @returns {Pointer<USB_INTERFACE_DESCRIPTOR>} 
 */
export WinUsb_ParseConfigurationDescriptor(ConfigurationDescriptor, StartPosition, InterfaceNumber, AlternateSetting, InterfaceClass, InterfaceSubClass, InterfaceProtocol) {
    StartPositionMarshal := StartPosition is VarRef ? "ptr" : "ptr"

    A_LastError := 0

    result := DllCall("WINUSB.dll\WinUsb_ParseConfigurationDescriptor", USB_CONFIGURATION_DESCRIPTOR.Ptr, ConfigurationDescriptor, StartPositionMarshal, StartPosition, "int", InterfaceNumber, "int", AlternateSetting, "int", InterfaceClass, "int", InterfaceSubClass, "int", InterfaceProtocol, USB_INTERFACE_DESCRIPTOR.Ptr)
    if(A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * 
 * @param {Integer} DescriptorBuffer 
 * @param {Integer} TotalLength 
 * @param {Pointer<Void>} StartPosition 
 * @param {Integer} DescriptorType 
 * @returns {Pointer<USB_COMMON_DESCRIPTOR>} 
 */
export WinUsb_ParseDescriptors(DescriptorBuffer, TotalLength, StartPosition, DescriptorType) {
    StartPositionMarshal := StartPosition is VarRef ? "ptr" : "ptr"

    A_LastError := 0

    result := DllCall("WINUSB.dll\WinUsb_ParseDescriptors", "ptr", DescriptorBuffer, "uint", TotalLength, StartPositionMarshal, StartPosition, "int", DescriptorType, USB_COMMON_DESCRIPTOR.Ptr)
    if(A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * The WinUsb_GetCurrentFrameNumber function gets the current frame number for the bus.
 * @remarks
 * The caller may compare the PerformanceCount with the value returned by the Win32 function <a href="https://docs.microsoft.com/windows/desktop/api/profileapi/nf-profileapi-queryperformancecounter">QueryPerformanceCounter</a> to determine if there has been a delay in transitioning back to user-mode after the frame number was read.  The caller can then adjust the starting frame number as needed.
 * @param {WINUSB_INTERFACE_HANDLE} InterfaceHandle The handle to the device that <b>CreateFile</b> returned.
 * @param {Pointer<Integer>} CurrentFrameNumber The current frame number value.
 * @param {Pointer<Integer>} _TimeStamp The time stamp value when the current frame was read.
 * @returns {BOOL} <b>WinUsb_GetCurrentFrameNumber</b> returns TRUE if the operation succeeds.  Otherwise this function returns FALSE, and the caller can retrieve the logged error by calling <b>GetLastError</b>.
 * @see https://learn.microsoft.com/windows/win32/api/winusb/nf-winusb-winusb_getcurrentframenumber
 * @since windows8.1
 */
export WinUsb_GetCurrentFrameNumber(InterfaceHandle, CurrentFrameNumber, _TimeStamp) {
    CurrentFrameNumberMarshal := CurrentFrameNumber is VarRef ? "uint*" : "ptr"
    _TimeStampMarshal := _TimeStamp is VarRef ? "int64*" : "ptr"

    A_LastError := 0

    result := DllCall("WINUSB.dll\WinUsb_GetCurrentFrameNumber", WINUSB_INTERFACE_HANDLE, InterfaceHandle, CurrentFrameNumberMarshal, CurrentFrameNumber, _TimeStampMarshal, _TimeStamp, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * The WinUsb_GetAdjustedFrameNumber function computes what the current USB frame number should be based on the frame number value and timestamp.
 * @param {Pointer<Integer>} CurrentFrameNumber The frame number to be adjusted.
 * @param {Integer} _TimeStamp The timestamp recorded at the time the frame        number was returned.
 * @returns {BOOL} <b>WinUsb_GetAdjustedFrameNumber</b> returns TRUE if the operation succeeds. Otherwise this function returns FALSE, and the caller can retrieve the logged error by calling <b>GetLastError</b>.
 * @see https://learn.microsoft.com/windows/win32/api/winusb/nf-winusb-winusb_getadjustedframenumber
 * @since windows8.1
 */
export WinUsb_GetAdjustedFrameNumber(CurrentFrameNumber, _TimeStamp) {
    CurrentFrameNumberMarshal := CurrentFrameNumber is VarRef ? "uint*" : "ptr"

    A_LastError := 0

    result := DllCall("WINUSB.dll\WinUsb_GetAdjustedFrameNumber", CurrentFrameNumberMarshal, CurrentFrameNumber, "int64", _TimeStamp, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * The WinUsb_RegisterIsochBuffer function registers a buffer to be used for isochronous transfers.
 * @remarks
 * Prior to initiating isochronous transfers to or from a buffer, the caller must register the buffer with <b>WinUsb_RegisterIsochBuffer</b>.  This call allows the Winusb.sys to pre-map and lock the buffer after for all subsequent transfers using the buffer.
 * @param {WINUSB_INTERFACE_HANDLE} InterfaceHandle An opaque handle to an interface in the selected configuration. That handle must be created by a previous call to  <a href="https://docs.microsoft.com/windows/desktop/api/winusb/nf-winusb-winusb_initialize">WinUsb_Initialize</a> or <a href="https://docs.microsoft.com/windows/desktop/api/winusb/nf-winusb-winusb_getassociatedinterface">WinUsb_GetAssociatedInterface</a>.
 * @param {Integer} PipeID Derived from Bit 3...0 of the <b>bEndpointAddress</b> field in the endpoint descriptor.
 * @param {Integer} _Buffer Pointer to the transfer buffer to be registered.
 * @param {Integer} BufferLength Length, in bytes, of the transfer buffer pointed to by <i>Buffer</i>.
 * @param {Pointer<Pointer<Void>>} IsochBufferHandle Receives an opaque handle to the registered buffer. This handle is required by other WinUSB functions that perform isochronous transfers. To release the handle, call the <a href="https://docs.microsoft.com/windows/desktop/api/winusb/nf-winusb-winusb_unregisterisochbuffer">WinUsb_UnregisterIsochBuffer</a> function.
 * @returns {BOOL} <b>WinUsb_RegisterIsochBuffer</b> returns TRUE if the operation succeeds.  Otherwise this function returns FALSE, and the caller can retrieve the logged error by calling <b>GetLastError</b>.
 * 
 * If the caller sets <i>ContinueStream</i> to TRUE, The transfer fails if Winusb.sys is unable to schedule the transfer to continue the stream without dropping one or more frames.
 * @see https://learn.microsoft.com/windows/win32/api/winusb/nf-winusb-winusb_registerisochbuffer
 * @since windows8.1
 */
export WinUsb_RegisterIsochBuffer(InterfaceHandle, PipeID, _Buffer, BufferLength, IsochBufferHandle) {
    IsochBufferHandleMarshal := IsochBufferHandle is VarRef ? "ptr*" : "ptr"

    A_LastError := 0

    result := DllCall("WINUSB.dll\WinUsb_RegisterIsochBuffer", WINUSB_INTERFACE_HANDLE, InterfaceHandle, "char", PipeID, "ptr", _Buffer, "uint", BufferLength, IsochBufferHandleMarshal, IsochBufferHandle, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * The WinUsb_UnregisterIsochBuffer function releases all of the resources that WinUsb_RegisterIsochBuffer allocated for isochronous transfers. This is a synchronous operation.
 * @remarks
 * The caller must ensure that there are no pending transfers that is currently using the buffer before calling <b>WinUsb_UnregisterIsochBuffer</b>.  If there are pending transfers, <b>WinUsb_UnregisterIsochBuffer</b> blocks until those transfers are complete.
 * @param {Pointer<Void>} IsochBufferHandle An opaque handle to the transfer buffer that was registered by a previous call to <a href="https://docs.microsoft.com/windows/desktop/api/winusb/nf-winusb-winusb_registerisochbuffer">WinUsb_RegisterIsochBuffer</a>.
 * @returns {BOOL} <b>WinUsb_UnregisterIsochBuffer</b> returns TRUE if the operation succeeds.  Otherwise this function returns FALSE, and the caller can retrieve the logged error by calling <b>GetLastError</b>.
 * @see https://learn.microsoft.com/windows/win32/api/winusb/nf-winusb-winusb_unregisterisochbuffer
 * @since windows8.1
 */
export WinUsb_UnregisterIsochBuffer(IsochBufferHandle) {
    IsochBufferHandleMarshal := IsochBufferHandle is VarRef ? "ptr" : "ptr"

    A_LastError := 0

    result := DllCall("WINUSB.dll\WinUsb_UnregisterIsochBuffer", IsochBufferHandleMarshal, IsochBufferHandle, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * The WinUsb_WriteIsochPipe function writes the contents of a caller-supplied buffer to an isochronous OUT endpoint, starting on a specified frame number.
 * @remarks
 * <b>WinUsb_WriteIsochPipe</b> packetizes the transfer buffer so that in each 1ms interval, the host can send the maximum bytes allowed per interval. The maximum bytes is as specified by the endpoint descriptor for full and high-speed endpoints, and endpoint companion descriptor for SuperSpeed endpoints.
 * If the caller submits multiple write requests to stream data to the device, the transfer size should be a multiple of the maximum bytes per interval (as returned by <a href="https://docs.microsoft.com/windows/desktop/api/winusb/nf-winusb-winusb_querypipeex">WinUsb_QueryPipeEx</a>) * 8 / interval.
 * 
 * 
 * Because of the transfer packaging used in the underlying kernel-mode interface, the lowest latency notification to an application or driver is 1ms intervals.
 * @param {Pointer<Void>} BufferHandle An opaque handle to the transfer buffer that was registered by a previous call to <a href="https://docs.microsoft.com/windows/desktop/api/winusb/nf-winusb-winusb_registerisochbuffer">WinUsb_RegisterIsochBuffer</a>.
 * @param {Integer} Offset Offset into the buffer relative to the start the transfer.
 * @param {Integer} Length Length in bytes of the transfer buffer.
 * @param {Pointer<Integer>} FrameNumber On input, indicates the starting frame number for the transfer. On output, contains the frame number of the frame that follows the last frame used in the transfer.
 * @param {Pointer<OVERLAPPED>} _Overlapped Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl/ns-shobjidl-overlapped">OVERLAPPED</a> structure used for asynchronous operations.
 * @returns {BOOL} <b>WinUsb_WriteIsochPipe</b> returns TRUE if the operation succeeds. Otherwise this function returns FALSE, and the caller can retrieve the logged error by calling <b>GetLastError</b>.
 * @see https://learn.microsoft.com/windows/win32/api/winusb/nf-winusb-winusb_writeisochpipe
 * @since windows8.1
 */
export WinUsb_WriteIsochPipe(BufferHandle, Offset, Length, FrameNumber, _Overlapped) {
    BufferHandleMarshal := BufferHandle is VarRef ? "ptr" : "ptr"
    FrameNumberMarshal := FrameNumber is VarRef ? "uint*" : "ptr"

    A_LastError := 0

    result := DllCall("WINUSB.dll\WinUsb_WriteIsochPipe", BufferHandleMarshal, BufferHandle, "uint", Offset, "uint", Length, FrameNumberMarshal, FrameNumber, OVERLAPPED.Ptr, _Overlapped, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * The WinUsb_ReadIsochPipe function reads data from an isochronous OUT endpoint.
 * @remarks
 * <b>WinUsb_ReadIsochPipe</b> packetizes the transfer buffer so that in each 1ms interval, the host can receive the maximum bytes allowed per interval. The maximum bytes is as specified by the endpoint descriptor for full and high-speed endpoints, and endpoint companion descriptor for SuperSpeed endpoints.
 * If the caller submits multiple read requests to stream data from the device, the transfer size should be a multiple of the maximum bytes per interval (as returned by <a href="https://docs.microsoft.com/windows/desktop/api/winusb/nf-winusb-winusb_querypipeex">WinUsb_QueryPipeEx</a>) * 8 / interval.
 * 
 * 
 * Because of the transfer packaging used in the underlying kernel-mode interface, the lowest latency notification to an application or driver is 1ms intervals.
 * @param {Pointer<Void>} BufferHandle An opaque handle to the transfer buffer that was registered by a previous call to <a href="https://docs.microsoft.com/windows/desktop/api/winusb/nf-winusb-winusb_registerisochbuffer">WinUsb_RegisterIsochBuffer</a>.
 * @param {Integer} Offset Offset into the buffer relative to the start the transfer.
 * @param {Integer} Length Length in bytes of the transfer buffer.
 * @param {Pointer<Integer>} FrameNumber On input, indicates the starting frame number for the transfer. On output, contains the frame number of the frame that follows the last frame used in the transfer.
 * @param {Integer} NumberOfPackets Total number of isochronous packets required to hold the transfer buffer. Also indicates the number of elements in the array pointed to by <i>IsoPacketDescriptors</i>.
 * @param {Pointer<USBD_ISO_PACKET_DESCRIPTOR>} IsoPacketDescriptors An array of <a href="https://docs.microsoft.com/windows-hardware/drivers/ddi/content/usb/ns-usb-_usbd_iso_packet_descriptor">USBD_ISO_PACKET_DESCRIPTOR</a> structures.  After the transfer completes, each element contains the status and size of the isochronous packet.
 * @param {Pointer<OVERLAPPED>} _Overlapped Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl/ns-shobjidl-overlapped">OVERLAPPED</a> structure used for asynchronous operations.
 * @returns {BOOL} <b>WinUsb_ReadIsochPipe</b> returns TRUE if the operation succeeds. Otherwise this function returns FALSE, and the caller can retrieve the logged error by calling <b>GetLastError</b>.
 * @see https://learn.microsoft.com/windows/win32/api/winusb/nf-winusb-winusb_readisochpipe
 * @since windows8.1
 */
export WinUsb_ReadIsochPipe(BufferHandle, Offset, Length, FrameNumber, NumberOfPackets, IsoPacketDescriptors, _Overlapped) {
    BufferHandleMarshal := BufferHandle is VarRef ? "ptr" : "ptr"
    FrameNumberMarshal := FrameNumber is VarRef ? "uint*" : "ptr"

    A_LastError := 0

    result := DllCall("WINUSB.dll\WinUsb_ReadIsochPipe", BufferHandleMarshal, BufferHandle, "uint", Offset, "uint", Length, FrameNumberMarshal, FrameNumber, "uint", NumberOfPackets, USBD_ISO_PACKET_DESCRIPTOR.Ptr, IsoPacketDescriptors, OVERLAPPED.Ptr, _Overlapped, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * The WinUsb_WriteIsochPipeAsap submits a request for writing the contents of a buffer to an isochronous OUT endpoint.
 * @remarks
 * <b>WinUsb_WriteIsochPipeAsap</b> allows the USB driver stack to choose the starting frame number for the transfer. If one or more transfers are already pending on the endpoint, the transfer will be scheduled for the frame number immediately following the last frame number of the last currently pending transfer.
 * 
 * 
 * <b>WinUsb_WriteIsochPipeAsap</b> packetizes the transfer buffer so that in each 1ms interval, the host can send the maximum bytes allowed per interval. The maximum bytes is as specified by the endpoint descriptor for full and high-speed endpoints, and endpoint companion descriptor for SuperSpeed endpoints.
 * If the caller submits multiple write requests to stream data to the device, the transfer size should be a multiple of the maximum bytes per interval (as returned by <a href="https://docs.microsoft.com/windows/desktop/api/winusb/nf-winusb-winusb_querypipeex">WinUsb_QueryPipeEx</a>) * 8 / interval.
 * 
 * 
 * Because of the transfer packaging used in the underlying kernel-mode interface, the lowest latency notification to an application or driver is 1ms intervals.
 * @param {Pointer<Void>} BufferHandle An opaque handle to the transfer buffer that was registered by a previous call to <a href="https://docs.microsoft.com/windows/desktop/api/winusb/nf-winusb-winusb_registerisochbuffer">WinUsb_RegisterIsochBuffer</a>.
 * @param {Integer} Offset Offset into the buffer relative to the start the transfer.
 * @param {Integer} Length Length in bytes of the transfer buffer.
 * @param {BOOL} ContinueStream Indicates that the transfer should only be submitted if it can be scheduled in the first frame after the last pending transfer.
 * @param {Pointer<OVERLAPPED>} _Overlapped Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl/ns-shobjidl-overlapped">OVERLAPPED</a> structure used for asynchronous operations.
 * @returns {BOOL} <b>WinUsb_WriteIsochPipeAsap</b> returns TRUE if the operation succeeds. Otherwise this function returns FALSE, and the caller can retrieve the logged error by calling <b>GetLastError</b>.
 * 
 * If the caller sets <i>ContinueStream</i> to TRUE, The transfer fails if Winusb.sys is unable to schedule the transfer to continue the stream without dropping one or more frames.
 * @see https://learn.microsoft.com/windows/win32/api/winusb/nf-winusb-winusb_writeisochpipeasap
 * @since windows8.1
 */
export WinUsb_WriteIsochPipeAsap(BufferHandle, Offset, Length, ContinueStream, _Overlapped) {
    BufferHandleMarshal := BufferHandle is VarRef ? "ptr" : "ptr"

    A_LastError := 0

    result := DllCall("WINUSB.dll\WinUsb_WriteIsochPipeAsap", BufferHandleMarshal, BufferHandle, "uint", Offset, "uint", Length, BOOL, ContinueStream, OVERLAPPED.Ptr, _Overlapped, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * The WinUsb_ReadIsochPipeAsap function submits a request that reads data from an isochronous OUT endpoint.
 * @remarks
 * <b>WinUsb_ReadIsochPipeAsap</b> allows the USB driver stack to choose the starting frame number for the transfer. If one or more transfers are already pending on the endpoint, the transfer will be scheduled for the frame number immediately following the last frame number of the last currently pending transfer.
 * 
 * 
 * <b>WinUsb_ReadIsochPipeAsap</b> packetizes the transfer buffer so that in each interval,  the host can receive the maximum bytes allowed per interval. The maximum bytes is as specified by the endpoint descriptor for full and high-speed endpoints, and endpoint companion descriptor for SuperSpeed endpoints.
 * If the caller submits multiple read requests to stream data from the device, the transfer size should be a multiple of the maximum bytes per interval (as returned by <a href="https://docs.microsoft.com/windows/desktop/api/winusb/nf-winusb-winusb_querypipeex">WinUsb_QueryPipeEx</a>) * 8 / interval.
 * 
 * 
 * 
 * Because of the transfer packaging used in the underlying kernel-mode interface, the lowest latency notification to an application or driver is 1ms intervals.
 * @param {Pointer<Void>} BufferHandle An opaque handle to the transfer buffer that was registered by a previous call to <a href="https://docs.microsoft.com/windows/desktop/api/winusb/nf-winusb-winusb_registerisochbuffer">WinUsb_RegisterIsochBuffer</a>.
 * @param {Integer} Offset Offset into the buffer relative to the start the transfer.
 * @param {Integer} Length Length in bytes of the transfer buffer.
 * @param {BOOL} ContinueStream Indicates that the transfer  should only be submitted if it can be scheduled in the first frame after the last pending transfer.
 * @param {Integer} NumberOfPackets Total number of isochronous packets required to hold the transfer buffer. Also indicates the number of elements in the array pointed to by <i>IsoPacketDescriptors</i>.
 * @param {Pointer<USBD_ISO_PACKET_DESCRIPTOR>} IsoPacketDescriptors An array of <a href="https://docs.microsoft.com/windows-hardware/drivers/ddi/content/usb/ns-usb-_usbd_iso_packet_descriptor">USBD_ISO_PACKET_DESCRIPTOR</a> that receives the details of each isochronous packet in the transfer.
 * @param {Pointer<OVERLAPPED>} _Overlapped Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl/ns-shobjidl-overlapped">OVERLAPPED</a> structure used for asynchronous operations.
 * @returns {BOOL} <b>WinUsb_ReadIsochPipeAsap</b> returns TRUE if the operation succeeds. Otherwise this function returns FALSE, and the caller can retrieve the logged error by calling <b>GetLastError</b>.
 * 
 * If the caller sets <i>ContinueStream</i> to TRUE, The transfer fails if Winusb.sys is unable to schedule the transfer to continue the stream without dropping one or more frames.
 * @see https://learn.microsoft.com/windows/win32/api/winusb/nf-winusb-winusb_readisochpipeasap
 * @since windows8.1
 */
export WinUsb_ReadIsochPipeAsap(BufferHandle, Offset, Length, ContinueStream, NumberOfPackets, IsoPacketDescriptors, _Overlapped) {
    BufferHandleMarshal := BufferHandle is VarRef ? "ptr" : "ptr"

    A_LastError := 0

    result := DllCall("WINUSB.dll\WinUsb_ReadIsochPipeAsap", BufferHandleMarshal, BufferHandle, "uint", Offset, "uint", Length, BOOL, ContinueStream, "uint", NumberOfPackets, USBD_ISO_PACKET_DESCRIPTOR.Ptr, IsoPacketDescriptors, OVERLAPPED.Ptr, _Overlapped, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * The WinUsb_StartTrackingForTimeSync function starts the time synchronization feature in the USB driver stack that gets the associated system QPC time for USB bus frames and microframes.
 * @param {WINUSB_INTERFACE_HANDLE} InterfaceHandle An opaque handle retrieved in the previous call to <a href="https://docs.microsoft.com/windows/desktop/api/winusb/nf-winusb-winusb_initialize">WinUsb_Initialize</a>.
 * @param {Pointer<USB_START_TRACKING_FOR_TIME_SYNC_INFORMATION>} StartTrackingInfo A pointer to a <a href="https://docs.microsoft.com/windows-hardware/drivers/ddi/content/usbioctl/ns-usbioctl-_usb_start_tracking_for_time_sync_information">USB_START_TRACKING_FOR_TIME_SYNC_INFORMATION</a> structure. Set <b>TimeTrackingHandle</b> to INAVLID_HANDLE.
 * Set <b>IsStartupDelayTolerable</b> to TRUE if the initial startup latency of up to 2.048 seconds is tolerable. FALSE, the registration is delayed until the USB driver stack is able to detect a valid frame or microframe boundary.
 * @returns {BOOL} <b>WinUsb_StartTrackingForTimeSync</b> returns <b>TRUE</b> if the operation succeeds. Otherwise, this routine returns <b>FALSE</b>, and the caller can retrieve the logged error by calling <b>GetLastError</b>.
 * 
 * 
 * <b>GetLastError</b>    can return one of the following error codes.
 * 
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
 * <dt><b>ERROR_INVALID_HANDLE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The caller passed <b>NULL</b> in the  <i>InterfaceHandle</i> or <i>StartTrackingInfo</i> parameter.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/winusb/nf-winusb-winusb_starttrackingfortimesync
 * @since windows10.0.10240
 */
export WinUsb_StartTrackingForTimeSync(InterfaceHandle, StartTrackingInfo) {
    A_LastError := 0

    result := DllCall("WINUSB.dll\WinUsb_StartTrackingForTimeSync", WINUSB_INTERFACE_HANDLE, InterfaceHandle, USB_START_TRACKING_FOR_TIME_SYNC_INFORMATION.Ptr, StartTrackingInfo, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * The WinUsb_GetCurrentFrameNumberAndQpc function retrieves the system query performance counter (QPC) value synchronized with the frame and microframe.
 * @param {WINUSB_INTERFACE_HANDLE} InterfaceHandle An opaque handle retrieved in the previous call to <a href="https://docs.microsoft.com/windows/desktop/api/winusb/nf-winusb-winusb_initialize">WinUsb_Initialize</a>.
 * @param {Pointer<USB_FRAME_NUMBER_AND_QPC_FOR_TIME_SYNC_INFORMATION>} FrameQpcInfo A pointer to a <a href="https://docs.microsoft.com/windows-hardware/drivers/ddi/content/usbioctl/ns-usbioctl-_usb_frame_number_and_qpc_for_time_sync_information">USB_FRAME_NUMBER_AND_QPC_FOR_TIME_SYNC_INFORMATION</a> structure. On output, <b>CurrentQueryPerformanceCounter</b> set to the system QPC  value (in microseconds) predicted by the USB driver stack. Optionally, on input, the caller can specify a frame and microframe number for which to retrieve the QPC value. 
 * 
 * On output, the <b>QueryPerformanceCounterAtInputFrameOrMicroFrame</b> member  is set to the QPC value for that frame or microframe.
 * @returns {BOOL} <b>WinUsb_GetCurrentFrameNumberAndQpc</b> returns <b>TRUE</b> if the operation succeeds. Otherwise, this routine returns <b>FALSE</b>, and the caller can retrieve the logged error by calling <b>GetLastError</b>.
 * 
 * 
 * <b>GetLastError</b>    can return one of the following error codes.
 * 
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
 * <dt><b>ERROR_INVALID_HANDLE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The caller passed <b>NULL</b> in the  <i>InterfaceHandle</i> or <i>FrameQpcInfo</i> parameter.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/winusb/nf-winusb-winusb_getcurrentframenumberandqpc
 * @since windows10.0.10240
 */
export WinUsb_GetCurrentFrameNumberAndQpc(InterfaceHandle, FrameQpcInfo) {
    A_LastError := 0

    result := DllCall("WINUSB.dll\WinUsb_GetCurrentFrameNumberAndQpc", WINUSB_INTERFACE_HANDLE, InterfaceHandle, USB_FRAME_NUMBER_AND_QPC_FOR_TIME_SYNC_INFORMATION.Ptr, FrameQpcInfo, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

/**
 * The WinUsb_StopTrackingForTimeSync function tops the time synchronization feature in the USB driver stack that gets the associated system QPC time for USB bus frames and microframes.
 * @param {WINUSB_INTERFACE_HANDLE} InterfaceHandle An opaque handle retrieved in the previous call to <a href="https://docs.microsoft.com/windows/desktop/api/winusb/nf-winusb-winusb_initialize">WinUsb_Initialize</a>.
 * @param {Pointer<USB_STOP_TRACKING_FOR_TIME_SYNC_INFORMATION>} StopTrackingInfo A pointer to a <a href="https://docs.microsoft.com/windows-hardware/drivers/ddi/content/usbioctl/ns-usbioctl-_usb_stop_tracking_for_time_sync_information">USB_STOP_TRACKING_FOR_TIME_SYNC_INFORMATION</a> structure. Set <b>TimeTrackingHandle</b> to the handle received in the previous call to <a href="https://docs.microsoft.com/windows/desktop/api/winusb/nf-winusb-winusb_starttrackingfortimesync">WinUsb_StartTrackingForTimeSync</a>.
 * @returns {BOOL} <b>WinUsb_StopTrackingForTimeSync</b> returns <b>TRUE</b> if the operation succeeds. Otherwise, this routine returns <b>FALSE</b>, and the caller can retrieve the logged error by calling <b>GetLastError</b>.
 * 
 * 
 * <b>GetLastError</b>    can return one of the following error codes.
 * 
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
 * <dt><b>ERROR_INVALID_HANDLE</b></dt>
 * </dl>
 * </td>
 * <td width="60%">
 * The caller passed <b>NULL</b> in the  <i>InterfaceHandle</i> or <i>StopTrackingInfo</i> parameter.
 * 
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/winusb/nf-winusb-winusb_stoptrackingfortimesync
 * @since windows10.0.10240
 */
export WinUsb_StopTrackingForTimeSync(InterfaceHandle, StopTrackingInfo) {
    A_LastError := 0

    result := DllCall("WINUSB.dll\WinUsb_StopTrackingForTimeSync", WINUSB_INTERFACE_HANDLE, InterfaceHandle, USB_STOP_TRACKING_FOR_TIME_SYNC_INFORMATION.Ptr, StopTrackingInfo, BOOL)
    if(!result && A_LastError) {
        throw OSError(A_LastError)
    }

    return result
}

;@endregion Functions
