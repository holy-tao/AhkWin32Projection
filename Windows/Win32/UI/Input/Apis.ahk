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
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-getrawinputdata
     * @since windows5.1.2600
     */
    static GetRawInputData(hRawInput, uiCommand, pData, pcbSize, cbSizeHeader) {
        hRawInput := hRawInput is Win32Handle ? NumGet(hRawInput, "ptr") : hRawInput

        pcbSizeMarshal := pcbSize is VarRef ? "uint*" : "ptr"

        result := DllCall("USER32.dll\GetRawInputData", "ptr", hRawInput, "uint", uiCommand, "ptr", pData, pcbSizeMarshal, pcbSize, "uint", cbSizeHeader, "uint")
        return result
    }

    /**
     * Retrieves information about the raw input device.
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
     * Call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> to identify any other errors.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-getrawinputdeviceinfoa
     * @since windows5.1.2600
     */
    static GetRawInputDeviceInfoA(hDevice, uiCommand, pData, pcbSize) {
        hDevice := hDevice is Win32Handle ? NumGet(hDevice, "ptr") : hDevice

        pcbSizeMarshal := pcbSize is VarRef ? "uint*" : "ptr"

        A_LastError := 0

        result := DllCall("USER32.dll\GetRawInputDeviceInfoA", "ptr", hDevice, "uint", uiCommand, "ptr", pData, pcbSizeMarshal, pcbSize, "uint")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves information about the raw input device.
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
     * Call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> to identify any other errors.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-getrawinputdeviceinfow
     * @since windows5.1.2600
     */
    static GetRawInputDeviceInfoW(hDevice, uiCommand, pData, pcbSize) {
        hDevice := hDevice is Win32Handle ? NumGet(hDevice, "ptr") : hDevice

        pcbSizeMarshal := pcbSize is VarRef ? "uint*" : "ptr"

        A_LastError := 0

        result := DllCall("USER32.dll\GetRawInputDeviceInfoW", "ptr", hDevice, "uint", uiCommand, "ptr", pData, pcbSizeMarshal, pcbSize, "uint")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Performs a buffered read of the raw input data.
     * @param {Pointer} pData Type: **PRAWINPUT**
     * 
     * A pointer to a buffer of [RAWINPUT](ns-winuser-rawinput.md) structures that contain the raw input data. If **NULL**, size of the first raw input message data (minimum required buffer), in bytes, is returned in \**pcbSize*.
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
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-getrawinputbuffer
     * @since windows5.1.2600
     */
    static GetRawInputBuffer(pData, pcbSize, cbSizeHeader) {
        pcbSizeMarshal := pcbSize is VarRef ? "uint*" : "ptr"

        A_LastError := 0

        result := DllCall("USER32.dll\GetRawInputBuffer", "ptr", pData, pcbSizeMarshal, pcbSize, "uint", cbSizeHeader, "uint")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Registers the devices that supply the raw input data.
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
     * <b>TRUE</b> if the function succeeds; otherwise, <b>FALSE</b>. If the function fails, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> for more information.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-registerrawinputdevices
     * @since windows5.1.2600
     */
    static RegisterRawInputDevices(pRawInputDevices, uiNumDevices, cbSize) {
        A_LastError := 0

        result := DllCall("USER32.dll\RegisterRawInputDevices", "ptr", pRawInputDevices, "uint", uiNumDevices, "uint", cbSize, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the information about the raw input devices for the current application.
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
     * If successful, the function returns a non-negative number that is the number of <a href="/windows/desktop/api/winuser/ns-winuser-rawinputdevice">RAWINPUTDEVICE</a> structures written to the buffer. 
     * 
     * If the <i>pRawInputDevices</i> buffer is too small or <b>NULL</b>, the function sets the last error as <b>ERROR_INSUFFICIENT_BUFFER</b>, returns -1, and sets <i>puiNumDevices</i> to the required number of devices. If the function fails for any other reason, it returns -1. For more details, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-getregisteredrawinputdevices
     * @since windows5.1.2600
     */
    static GetRegisteredRawInputDevices(pRawInputDevices, puiNumDevices, cbSize) {
        puiNumDevicesMarshal := puiNumDevices is VarRef ? "uint*" : "ptr"

        A_LastError := 0

        result := DllCall("USER32.dll\GetRegisteredRawInputDevices", "ptr", pRawInputDevices, puiNumDevicesMarshal, puiNumDevices, "uint", cbSize, "uint")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Enumerates the raw input devices attached to the system.
     * @param {Pointer<RAWINPUTDEVICELIST>} pRawInputDeviceList Type: <b>PRAWINPUTDEVICELIST</b>
     * 
     * An array of <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-rawinputdevicelist">RAWINPUTDEVICELIST</a> structures for the devices attached to the system. If <b>NULL</b>, the number of devices are returned in *<i>puiNumDevices</i>.
     * @param {Pointer<Integer>} puiNumDevices Type: <b>PUINT</b>
     * 
     * If <i>pRawInputDeviceList</i> is <b>NULL</b>, the function populates this variable with the number of devices attached to the system; otherwise, this variable specifies the number of <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-rawinputdevicelist">RAWINPUTDEVICELIST</a> structures that can be contained in the buffer to which <i>pRawInputDeviceList</i> points. If this value is less than the number of devices attached to the system, the function returns the actual number of devices in this variable and fails with <b>ERROR_INSUFFICIENT_BUFFER</b>.
     * @param {Integer} cbSize Type: <b>UINT</b>
     * 
     * The size of a <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-rawinputdevicelist">RAWINPUTDEVICELIST</a> structure, in bytes.
     * @returns {Integer} Type: <b>UINT</b>
     * 
     * If the function is successful, the return value is the number of devices stored in the buffer pointed to by 
     * 						<i>pRawInputDeviceList</i>.
     * 
     * On any other error, the function returns (<b>UINT</b>) -1 and 
     * 						<a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> returns the error indication.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-getrawinputdevicelist
     * @since windows5.1.2600
     */
    static GetRawInputDeviceList(pRawInputDeviceList, puiNumDevices, cbSize) {
        puiNumDevicesMarshal := puiNumDevices is VarRef ? "uint*" : "ptr"

        A_LastError := 0

        result := DllCall("USER32.dll\GetRawInputDeviceList", "ptr", pRawInputDeviceList, puiNumDevicesMarshal, puiNumDevices, "uint", cbSize, "uint")
        if(A_LastError)
            throw OSError()

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
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-defrawinputproc
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
     * @returns {BOOL} If this function succeeds, it returns TRUE. Otherwise, it returns FALSE. To retrieve extended error information, call the <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-getcurrentinputmessagesource
     * @since windows8.0
     */
    static GetCurrentInputMessageSource(inputMessageSource) {
        A_LastError := 0

        result := DllCall("USER32.dll\GetCurrentInputMessageSource", "ptr", inputMessageSource, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the source of the input message (GetCurrentInputMessageSourceInSendMessage).
     * @param {Pointer<INPUT_MESSAGE_SOURCE>} inputMessageSource The <a href="https://docs.microsoft.com/windows/desktop/api/winuser/ns-winuser-input_message_source">INPUT_MESSAGE_SOURCE</a> structure that holds the device type and the ID of the input message source.
     * @returns {BOOL} If this function succeeds, it returns TRUE. Otherwise, it returns ERROR_INVALID_PARAMETER.
     * 
     * This function fails when:<ul>
     * <li>The input parameter is invalid.</li>
     * <li>
     * <a href="/windows/desktop/api/winuser/nf-winuser-getcurrentinputmessagesource">GetCurrentInputMessageSource</a> returns a value other than <a href="/windows/desktop/api/winuser/ne-winuser-input_message_device_type">IMDT_UNAVAILABLE</a> for the device type.</li>
     * </ul>
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-getcimssm
     * @since windows8.0
     */
    static GetCIMSSM(inputMessageSource) {
        result := DllCall("USER32.dll\GetCIMSSM", "ptr", inputMessageSource, "int")
        return result
    }

;@endregion Methods
}
