#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Handle.ahk

/**
 * @namespace Windows.Win32.UI.Input
 * @version v4.0.30319
 */
class Input {

;@region Constants
;@endregion Constants

;@region Methods
    /**
     * Retrieves the raw input from the specified device.
     * @remarks
     * <b>GetRawInputData</b> gets the raw input one <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-rawinput">RAWINPUT</a> structure at a time. In contrast, <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getrawinputbuffer">GetRawInputBuffer</a> gets an array of <b>RAWINPUT</b> structures.
     * @param {HRAWINPUT} hRawInput Type: <b>HRAWINPUT</b>
     * 
     * A handle to the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-rawinput">RAWINPUT</a> structure. This comes from the 
     * 					<i>lParam</i> in <a href="https://docs.microsoft.com/windows/desktop/inputdev/wm-input">WM_INPUT</a>.
     * @param {Integer} uiCommand Type: <b>UINT</b>
     * @param {Pointer} pData Type: <b>LPVOID</b>
     * 
     * A pointer to the data that comes from the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-rawinput">RAWINPUT</a> structure. This depends on the value of 
     * 					<i>uiCommand</i>. If 
     * 					<i>pData</i> is <b>NULL</b>, the required size of the buffer is returned in *<i>pcbSize</i>.
     * @param {Pointer<Integer>} pcbSize Type: <b>PUINT</b>
     * 
     * The size, in bytes, of the data in 
     * 					<i>pData</i>.
     * @param {Integer} cbSizeHeader Type: <b>UINT</b>
     * 
     * The size, in bytes, of the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-rawinputheader">RAWINPUTHEADER</a> structure.
     * @returns {Integer} Type: <b>UINT</b>
     * 
     * If 
     * 						<i>pData</i> is <b>NULL</b> and the function is successful, the return value is 0. If 
     * 						<i>pData</i> is not <b>NULL</b> and the function is successful, the return value is the number of bytes copied into pData.
     * 
     * If there is an error, the return value is (<b>UINT</b>)-1.
     * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-getrawinputdata
     * @since windows5.1.2600
     */
    static GetRawInputData(hRawInput, uiCommand, pData, pcbSize, cbSizeHeader) {
        hRawInput := hRawInput is Win32Handle ? NumGet(hRawInput, "ptr") : hRawInput

        pcbSizeMarshal := pcbSize is VarRef ? "uint*" : "ptr"

        result := DllCall("USER32.dll\GetRawInputData", "ptr", hRawInput, "uint", uiCommand, "ptr", pData, pcbSizeMarshal, pcbSize, "uint", cbSizeHeader, "uint")
        return result
    }

    /**
     * Retrieves information about the raw input device. (ANSI)
     * @remarks
     * > [!NOTE]
     * > The winuser.h header defines GetRawInputDeviceInfo as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {HANDLE} hDevice Type: <b>HANDLE</b>
     * 
     * A handle to the raw input device. This comes from the <b>hDevice</b> member of <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-rawinputheader">RAWINPUTHEADER</a> or from <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getrawinputdevicelist">GetRawInputDeviceList</a>.
     * @param {Integer} uiCommand Type: <b>UINT</b>
     * @param {Pointer} pData Type: <b>LPVOID</b>
     * 
     * A pointer to a buffer that contains the information specified by <i>uiCommand</i>.
     * 
     * If <i>uiCommand</i> is <b>RIDI_DEVICEINFO</b>, set the <b>cbSize</b> member of <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-rid_device_info">RID_DEVICE_INFO</a> to <c>sizeof(RID_DEVICE_INFO)</c> before calling <b>GetRawInputDeviceInfo</b>.
     * @param {Pointer<Integer>} pcbSize Type: <b>PUINT</b>
     * 
     * The size, in bytes, of the data in <i>pData</i>.
     * @returns {Integer} Type: <b>UINT</b>
     * 
     * If successful, this function returns a non-negative number indicating the number of bytes copied to <i>pData</i>. 
     * 
     * If <i>pData</i> is not large enough for the data, the function returns -1. If <i>pData</i> is <b>NULL</b>, the function returns a value of zero. In both of these cases, <i>pcbSize</i> is set to the minimum size required for the <i>pData</i> buffer.
     * 
     * Call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> to identify any other errors.
     * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-getrawinputdeviceinfoa
     * @since windows5.1.2600
     */
    static GetRawInputDeviceInfoA(hDevice, uiCommand, pData, pcbSize) {
        hDevice := hDevice is Win32Handle ? NumGet(hDevice, "ptr") : hDevice

        pcbSizeMarshal := pcbSize is VarRef ? "uint*" : "ptr"

        A_LastError := 0

        result := DllCall("USER32.dll\GetRawInputDeviceInfoA", "ptr", hDevice, "uint", uiCommand, "ptr", pData, pcbSizeMarshal, pcbSize, "uint")
        if(A_LastError) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves information about the raw input device. (Unicode)
     * @remarks
     * > [!NOTE]
     * > The winuser.h header defines GetRawInputDeviceInfo as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {HANDLE} hDevice Type: <b>HANDLE</b>
     * 
     * A handle to the raw input device. This comes from the <b>hDevice</b> member of <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-rawinputheader">RAWINPUTHEADER</a> or from <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getrawinputdevicelist">GetRawInputDeviceList</a>.
     * @param {Integer} uiCommand Type: <b>UINT</b>
     * @param {Pointer} pData Type: <b>LPVOID</b>
     * 
     * A pointer to a buffer that contains the information specified by <i>uiCommand</i>.
     * 
     * If <i>uiCommand</i> is <b>RIDI_DEVICEINFO</b>, set the <b>cbSize</b> member of <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-rid_device_info">RID_DEVICE_INFO</a> to <c>sizeof(RID_DEVICE_INFO)</c> before calling <b>GetRawInputDeviceInfo</b>.
     * @param {Pointer<Integer>} pcbSize Type: <b>PUINT</b>
     * 
     * The size, in bytes, of the data in <i>pData</i>.
     * @returns {Integer} Type: <b>UINT</b>
     * 
     * If successful, this function returns a non-negative number indicating the number of bytes copied to <i>pData</i>. 
     * 
     * If <i>pData</i> is not large enough for the data, the function returns -1. If <i>pData</i> is <b>NULL</b>, the function returns a value of zero. In both of these cases, <i>pcbSize</i> is set to the minimum size required for the <i>pData</i> buffer.
     * 
     * Call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> to identify any other errors.
     * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-getrawinputdeviceinfow
     * @since windows5.1.2600
     */
    static GetRawInputDeviceInfoW(hDevice, uiCommand, pData, pcbSize) {
        hDevice := hDevice is Win32Handle ? NumGet(hDevice, "ptr") : hDevice

        pcbSizeMarshal := pcbSize is VarRef ? "uint*" : "ptr"

        A_LastError := 0

        result := DllCall("USER32.dll\GetRawInputDeviceInfoW", "ptr", hDevice, "uint", uiCommand, "ptr", pData, pcbSizeMarshal, pcbSize, "uint")
        if(A_LastError) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Performs a buffered read of the raw input data.
     * @remarks
     * When an application receives raw input, its message queue gets a [WM_INPUT](/windows/win32/inputdev/wm-input) message and the queue status flag [QS_RAWINPUT](nf-winuser-getqueuestatus.md) is set.
     * 
     * Using **GetRawInputBuffer**, the raw input data is read in the array of variable size [RAWINPUT](ns-winuser-rawinput.md) structures and corresponding [WM_INPUT](/windows/win32/inputdev/wm-input) messages are removed from the calling thread's message queue. You can call this method several times with buffer that cannot fit all message's data until all raw input messages have been read.
     * 
     * The [NEXTRAWINPUTBLOCK](nf-winuser-nextrawinputblock.md) macro allows an application to traverse an array of [RAWINPUT](ns-winuser-rawinput.md) structures.
     * 
     * If all raw input messages have been successfully read from message queue then [QS_RAWINPUT](nf-winuser-getqueuestatus.md) flag is cleared from the calling thread's message queue status.
     * 
     * > [!NOTE]
     * > WOW64: To get the correct size of the raw input buffer, do not use \**pcbSize*, use \**pcbSize* \* 8 instead. To ensure **GetRawInputBuffer** behaves properly on WOW64, you must align the [RAWINPUT](ns-winuser-rawinput.md) structure by 8 bytes. The following code shows how to align **RAWINPUT** for WOW64.
     * 
     * ```csharp
     * [StructLayout(LayoutKind.Explicit)]
     * internal struct RAWINPUT
     * {
     *     [FieldOffset(0)]
     *     public RAWINPUTHEADER header;
     * 
     *     [FieldOffset(16+8)]
     *     public RAWMOUSE mouse;
     * 
     *     [FieldOffset(16+8)]
     *     public RAWKEYBOARD keyboard;
     * 
     *     [FieldOffset(16+8)]
     *     public RAWHID hid;
     * }
     * ```
     * @param {Pointer} pData Type: **PRAWINPUT**
     * 
     * A pointer to a buffer of [RAWINPUT](ns-winuser-rawinput.md) structures that contain the raw input data. Buffer should be aligned on a pointer boundary, which is a **DWORD** on 32-bit architectures and a **QWORD** on 64-bit architectures.
     * 
     * If **NULL**, size of the first raw input message data (minimum required buffer), in bytes, is returned in \**pcbSize*.
     * @param {Pointer<Integer>} pcbSize Type: **PUINT**
     * 
     * The size, in bytes, of the provided [RAWINPUT](ns-winuser-rawinput.md) buffer.
     * @param {Integer} cbSizeHeader Type: **UINT**
     * 
     * The size, in bytes, of the [RAWINPUTHEADER](ns-winuser-rawinputheader.md) structure.
     * @returns {Integer} Type: **UINT**
     * 
     * If *pData* is **NULL** and the function is successful, the return value is zero. If *pData* is not **NULL** and the function is successful, the return value is the number of [RAWINPUT](ns-winuser-rawinput.md) structures written to *pData*.
     * 
     * If an error occurs, the return value is (**UINT**)-1. Call [GetLastError](/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror) for the error code.
     * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-getrawinputbuffer
     * @since windows5.1.2600
     */
    static GetRawInputBuffer(pData, pcbSize, cbSizeHeader) {
        pcbSizeMarshal := pcbSize is VarRef ? "uint*" : "ptr"

        A_LastError := 0

        result := DllCall("USER32.dll\GetRawInputBuffer", "ptr", pData, pcbSizeMarshal, pcbSize, "uint", cbSizeHeader, "uint")
        if(A_LastError) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Registers the devices that supply the raw input data.
     * @remarks
     * To receive <a href="https://docs.microsoft.com/windows/desktop/inputdev/wm-input">WM_INPUT</a> messages, an application must first register the raw input devices using <b>RegisterRawInputDevices</b>. By default, an application does not receive raw input.
     * 
     * To receive <a href="https://docs.microsoft.com/windows/desktop/inputdev/wm-input-device-change">WM_INPUT_DEVICE_CHANGE</a> messages, an application must specify the  RIDEV_DEVNOTIFY flag for each device class that is specified by the usUsagePage and usUsage fields of the  <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-rawinputdevice">RAWINPUTDEVICE</a> structure  .  By default, an application does not receive  <b>WM_INPUT_DEVICE_CHANGE</b> notifications for raw input device arrival and removal.
     * 
     * If a <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-rawinputdevice">RAWINPUTDEVICE</a> structure has the RIDEV_REMOVE flag set and the hwndTarget parameter is not set to NULL, then parameter validation will fail.
     * 
     * Only one window per raw input device class may be registered to receive raw input within a process (the window passed in the last call to RegisterRawInputDevices). Because of this, RegisterRawInputDevices should not be used from a library, as it may interfere with any raw input processing logic already present in applications that load it.
     * @param {Pointer<RAWINPUTDEVICE>} pRawInputDevices Type: <b>PCRAWINPUTDEVICE</b>
     * 
     * An array of <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-rawinputdevice">RAWINPUTDEVICE</a> structures that represent the devices that supply the raw input.
     * @param {Integer} uiNumDevices Type: <b>UINT</b>
     * 
     * The number of <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-rawinputdevice">RAWINPUTDEVICE</a> structures pointed to by <i>pRawInputDevices</i>.
     * @param {Integer} cbSize Type: <b>UINT</b>
     * 
     * The size, in bytes, of a <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-rawinputdevice">RAWINPUTDEVICE</a> structure.
     * @returns {BOOL} Type: <b>BOOL</b>
     * 
     * <b>TRUE</b> if the function succeeds; otherwise, <b>FALSE</b>. If the function fails, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> for more information.
     * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-registerrawinputdevices
     * @since windows5.1.2600
     */
    static RegisterRawInputDevices(pRawInputDevices, uiNumDevices, cbSize) {
        A_LastError := 0

        result := DllCall("USER32.dll\RegisterRawInputDevices", "ptr", pRawInputDevices, "uint", uiNumDevices, "uint", cbSize, "int")
        if((!result && A_LastError)) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves the information about the raw input devices for the current application.
     * @remarks
     * To receive raw input from a device, an application must register it by using <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-registerrawinputdevices">RegisterRawInputDevices</a>.
     * @param {Pointer<RAWINPUTDEVICE>} pRawInputDevices Type: <b>PRAWINPUTDEVICE</b>
     * 
     * An array of <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-rawinputdevice">RAWINPUTDEVICE</a> structures for the application.
     * @param {Pointer<Integer>} puiNumDevices Type: <b>PUINT</b>
     * 
     * The number of <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-rawinputdevice">RAWINPUTDEVICE</a> structures in *<i>pRawInputDevices</i>.
     * @param {Integer} cbSize Type: <b>UINT</b>
     * 
     * The size, in bytes, of a <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-rawinputdevice">RAWINPUTDEVICE</a> structure.
     * @returns {Integer} Type: <b>UINT</b>
     * 
     * If successful, the function returns a non-negative number that is the number of <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-rawinputdevice">RAWINPUTDEVICE</a> structures written to the buffer. 
     * 
     * If the <i>pRawInputDevices</i> buffer is too small or <b>NULL</b>, the function sets the last error as <b>ERROR_INSUFFICIENT_BUFFER</b>, returns -1, and sets <i>puiNumDevices</i> to the required number of devices. If the function fails for any other reason, it returns -1. For more details, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-getregisteredrawinputdevices
     * @since windows5.1.2600
     */
    static GetRegisteredRawInputDevices(pRawInputDevices, puiNumDevices, cbSize) {
        puiNumDevicesMarshal := puiNumDevices is VarRef ? "uint*" : "ptr"

        A_LastError := 0

        result := DllCall("USER32.dll\GetRegisteredRawInputDevices", "ptr", pRawInputDevices, puiNumDevicesMarshal, puiNumDevices, "uint", cbSize, "uint")
        if(A_LastError) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Enumerates the raw input devices attached to the system.
     * @remarks
     * The devices returned from this function are the mouse, the keyboard, and other Human Interface Device (HID) devices.
     * 
     * To get more detailed information about the attached devices, call <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getrawinputdeviceinfoa">GetRawInputDeviceInfo</a> using the hDevice from <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-rawinputdevicelist">RAWINPUTDEVICELIST</a>.
     * @param {Pointer<RAWINPUTDEVICELIST>} pRawInputDeviceList Type: <b>PRAWINPUTDEVICELIST</b>
     * 
     * An array of <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-rawinputdevicelist">RAWINPUTDEVICELIST</a> structures for the devices attached to the system. If <b>NULL</b>, the number of devices are returned in *<i>puiNumDevices</i>.
     * @param {Pointer<Integer>} puiNumDevices Type: <b>PUINT</b>
     * 
     * If <i>pRawInputDeviceList</i> is <b>NULL</b>, the function populates this variable with the number of devices attached to the system; otherwise, this variable specifies the number of <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-rawinputdevicelist">RAWINPUTDEVICELIST</a> structures that can be contained in the buffer to which <i>pRawInputDeviceList</i> points. If this value is less than the number of devices attached to the system, the function returns the actual number of devices in this variable and fails with <b>ERROR_INSUFFICIENT_BUFFER</b>.
     * If this value is greater than or equal to the number of devices attached to the system, then the value is unchanged, and the number of devices is reported as the return value.
     * @param {Integer} cbSize Type: <b>UINT</b>
     * 
     * The size of a <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-rawinputdevicelist">RAWINPUTDEVICELIST</a> structure, in bytes.
     * @returns {Integer} Type: <b>UINT</b>
     * 
     * If the function is successful, the return value is the number of devices stored in the buffer pointed to by 
     * 						<i>pRawInputDeviceList</i>.
     * 
     * On any other error, the function returns (<b>UINT</b>) -1 and 
     * 						<a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> returns the error indication.
     * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-getrawinputdevicelist
     * @since windows5.1.2600
     */
    static GetRawInputDeviceList(pRawInputDeviceList, puiNumDevices, cbSize) {
        puiNumDevicesMarshal := puiNumDevices is VarRef ? "uint*" : "ptr"

        A_LastError := 0

        result := DllCall("USER32.dll\GetRawInputDeviceList", "ptr", pRawInputDeviceList, puiNumDevicesMarshal, puiNumDevices, "uint", cbSize, "uint")
        if(A_LastError) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Verifies that the size of the RAWINPUTHEADER structure is correct.
     * @param {Pointer<Pointer<RAWINPUT>>} paRawInput Type: <b>PRAWINPUT*</b>
     * 
     * Ignored.
     * @param {Integer} nInput Type: <b>INT</b>
     * 
     * Ignored.
     * @param {Integer} cbSizeHeader Type: <b>UINT</b>
     * 
     * The size, in bytes, of the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-rawinputheader">RAWINPUTHEADER</a> structure.
     * @returns {LRESULT} Type: <b>LRESULT</b>
     * 
     * If successful, the function returns <b>0</b>. Otherwise it returns <b>-1</b>.
     * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-defrawinputproc
     * @since windows5.1.2600
     */
    static DefRawInputProc(paRawInput, nInput, cbSizeHeader) {
        paRawInputMarshal := paRawInput is VarRef ? "ptr*" : "ptr"

        result := DllCall("USER32.dll\DefRawInputProc", paRawInputMarshal, paRawInput, "int", nInput, "uint", cbSizeHeader, "ptr")
        return result
    }

    /**
     * Retrieves the source of the input message.
     * @param {Pointer<INPUT_MESSAGE_SOURCE>} inputMessageSource The <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-input_message_source">INPUT_MESSAGE_SOURCE</a> structure that holds the device type and the ID of the input message source.
     * 
     * <div class="alert"><b>Note</b>  <b>deviceType</b> in <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-input_message_source">INPUT_MESSAGE_SOURCE</a> is set to   <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ne-winuser-input_message_device_type">IMDT_UNAVAILABLE</a> when <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-sendmessage">SendMessage</a> is used to inject input (system generated or through messages such as <a href="https://docs.microsoft.com/windows/desktop/gdi/wm-paint">WM_PAINT</a>). This remains true until  <b>SendMessage</b> returns.</div>
     * <div> </div>
     * @returns {BOOL} If this function succeeds, it returns TRUE. Otherwise, it returns FALSE. To retrieve extended error information, call the <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function.
     * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-getcurrentinputmessagesource
     * @since windows8.0
     */
    static GetCurrentInputMessageSource(inputMessageSource) {
        A_LastError := 0

        result := DllCall("USER32.dll\GetCurrentInputMessageSource", "ptr", inputMessageSource, "int")
        if((!result && A_LastError)) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves the source of the input message (GetCurrentInputMessageSourceInSendMessage).
     * @remarks
     * <b>GetCIMSSM</b> should be used only when <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getcurrentinputmessagesource">GetCurrentInputMessageSource</a> returns a device type of <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ne-winuser-input_message_device_type">IMDT_UNAVAILABLE</a>.
     * @param {Pointer<INPUT_MESSAGE_SOURCE>} inputMessageSource The <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-input_message_source">INPUT_MESSAGE_SOURCE</a> structure that holds the device type and the ID of the input message source.
     * @returns {BOOL} If this function succeeds, it returns TRUE. Otherwise, it returns ERROR_INVALID_PARAMETER.
     * 
     * This function fails when:<ul>
     * <li>The input parameter is invalid.</li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getcurrentinputmessagesource">GetCurrentInputMessageSource</a> returns a value other than <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ne-winuser-input_message_device_type">IMDT_UNAVAILABLE</a> for the device type.</li>
     * </ul>
     * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-getcimssm
     * @since windows8.0
     */
    static GetCIMSSM(inputMessageSource) {
        result := DllCall("USER32.dll\GetCIMSSM", "ptr", inputMessageSource, "int")
        return result
    }

;@endregion Methods
}
