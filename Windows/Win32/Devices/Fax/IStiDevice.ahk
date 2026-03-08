#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\STINOTIFY.ahk
#Include .\_ERROR_INFOW.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Devices.Fax
 * @version v4.0.30319
 */
class IStiDevice extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStiDevice
     * @type {Guid}
     */
    static IID => Guid("{6cfa5a80-2dc8-11d0-90ea-00aa0060f86c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Initialize", "GetCapabilities", "GetStatus", "DeviceReset", "Diagnostic", "Escape", "GetLastError", "LockDevice", "UnLockDevice", "RawReadData", "RawWriteData", "RawReadCommand", "RawWriteCommand", "Subscribe", "GetLastNotificationData", "UnSubscribe", "GetLastErrorInfo"]

    /**
     * Initializes a thread to use Windows Runtime APIs.
     * @remarks
     * <b>Windows::Foundation::Initialize</b> is changed to create 
     *     ASTAs instead of classic STAs for the <a href="https://docs.microsoft.com/windows/desktop/api/roapi/ne-roapi-ro_init_type">RO_INIT_TYPE</a> 
     *     value <b>RO_INIT_SINGLETHREADED</b>. 
     *     <b>Windows::Foundation::Initialize</b>(<b>RO_INIT_SINGLETHREADED</b>) 
     *     is not supported for desktop applications and will return <b>CO_E_NOTSUPPORTED</b> if called 
     *     from a process other than a Windows Store app.
     * 
     * For Microsoft DirectX applications, you must initialize the initial thread by using 
     *     <b>Windows::Foundation::Initialize</b>(<b>RO_INIT_MULTITHREADED</b>).
     * 
     * For an out-of-process EXE server,  you must initialize the initial thread of the server by using 
     *     <b>Windows::Foundation::Initialize</b>(<b>RO_INIT_MULTITHREADED</b>).
     * @param {HINSTANCE} hinst 
     * @param {PWSTR} pwszDeviceName 
     * @param {Integer} dwVersion 
     * @param {Integer} dwMode 
     * @returns {HRESULT} <ul>
     * <li><b>S_OK</b> - Successfully initialized for the first time on the current thread</li>
     * <li><b>S_FALSE</b> - Successful nested initialization (current thread was already 
     *         initialized for the specified apartment type)</li>
     * <li><b>E_INVALIDARG</b> - Invalid <i>initType</i> value</li>
     * <li><b>CO_E_INIT_TLS</b> - Failed to allocate COM's internal TLS structure</li>
     * <li><b>E_OUTOFMEMORY</b> - Failed to allocate per-thread/per-apartment structures other 
     *         than the TLS</li>
     * <li><b>RPC_E_CHANGED_MODE</b> - The current thread is already initialized for a different 
     *         apartment type from what is specified.</li>
     * </ul>
     * @see https://learn.microsoft.com/windows/win32/api/roapi/nf-roapi-initialize
     */
    Initialize(hinst, pwszDeviceName, dwVersion, dwMode) {
        hinst := hinst is Win32Handle ? NumGet(hinst, "ptr") : hinst
        pwszDeviceName := pwszDeviceName is String ? StrPtr(pwszDeviceName) : pwszDeviceName

        result := ComCall(3, this, "ptr", hinst, "ptr", pwszDeviceName, "uint", dwVersion, "uint", dwMode, "HRESULT")
        return result
    }

    /**
     * Retrieves the length of a monitor's capabilities string.
     * @remarks
     * This function usually returns quickly, but sometimes it can take several seconds to complete.
     * @param {Pointer<STI_DEV_CAPS>} pDevCaps 
     * @returns {HRESULT} If the function succeeds, the return value is <b>TRUE</b>. If the function fails, the return value is <b>FALSE</b>. To get extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/lowlevelmonitorconfigurationapi/nf-lowlevelmonitorconfigurationapi-getcapabilitiesstringlength
     */
    GetCapabilities(pDevCaps) {
        result := ComCall(4, this, "ptr", pDevCaps, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<STI_DEVICE_STATUS>} pDevStatus 
     * @returns {HRESULT} 
     */
    GetStatus(pDevStatus) {
        result := ComCall(5, this, "ptr", pDevStatus, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    DeviceReset() {
        result := ComCall(6, this, "HRESULT")
        return result
    }

    /**
     * Windows has APIs and services that support diagnostics in and of your desktop apps.
     * @param {Pointer<STI_DIAG>} pBuffer 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/diagnostics
     */
    Diagnostic(pBuffer) {
        result := ComCall(7, this, "ptr", pBuffer, "HRESULT")
        return result
    }

    /**
     * Enables an application to access the system-defined device capabilities that are not available through GDI.
     * @remarks
     * <div class="alert"><b>Note</b>  This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation—factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.</div>
     * <div> </div>
     * The effect of passing 0 for <i>cbInput</i> will depend on the value of <i>nEscape</i> and on the driver that is handling the escape.
     * 
     * Of the original printer escapes, only the following can be used.
     * 
     * <table>
     * <tr>
     * <th>Escape</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>
     * QUERYESCSUPPORT
     * 
     * </td>
     * <td>
     * Determines whether a particular escape is implemented by the device driver.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>
     * PASSTHROUGH
     * 
     * </td>
     * <td>
     * Allows the application to send data directly to a printer.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * For information about printer escapes, see <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-extescape">ExtEscape</a>.
     * 
     * Use the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-startpage">StartPage</a> function to prepare the printer driver to receive data.
     * @param {Integer} EscapeFunction 
     * @param {Pointer} lpInData 
     * @param {Integer} cbInDataSize 
     * @param {Pointer} pOutData 
     * @param {Integer} dwOutDataSize 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wingdi/nf-wingdi-escape
     */
    Escape(EscapeFunction, lpInData, cbInDataSize, pOutData, dwOutDataSize) {
        result := ComCall(8, this, "uint", EscapeFunction, "ptr", lpInData, "uint", cbInDataSize, "ptr", pOutData, "uint", dwOutDataSize, "uint*", &pdwActualData := 0, "HRESULT")
        return pdwActualData
    }

    /**
     * Retrieves the calling thread's last-error code value.
     * @remarks
     * Functions executed by the calling thread set this value by calling the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-setlasterror">SetLastError</a> function. You should call the 
     * <b>GetLastError</b> function immediately when a function's return value indicates that such a call will return useful data. That is because some functions call 
     * <b>SetLastError</b> with a zero when they succeed, wiping out the error code set by the most recently failed function.
     * 
     * To obtain an error string for system error codes, use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> function. For a complete list of error codes provided by the operating system, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">System Error Codes</a>.
     * 
     * The error codes returned by a function are not part of the Windows API specification and can vary by operating system or device driver. For this reason, we cannot provide the complete list of error codes that can be returned by each function. There are also many functions whose documentation does not include even a partial list of error codes that can be returned.
     * 
     * Error codes are 32-bit values (bit 31 is the most significant bit). Bit 29 is reserved for application-defined error codes; no system error code has this bit set. If you are defining an error code for your application, set this bit to one. That indicates that the error code has been defined by an application, and ensures that your error code does not conflict with any error codes defined by the system.
     * 
     * To convert a system error into an <b>HRESULT</b> value, use the 
     * <a href="https://docs.microsoft.com/windows/win32/api/winerror/nf-winerror-hresult_from_win32">HRESULT_FROM_WIN32</a> macro.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror
     */
    GetLastError() {
        result := ComCall(9, this, "uint*", &pdwLastDeviceError := 0, "HRESULT")
        return pdwLastDeviceError
    }

    /**
     * 
     * @param {Integer} dwTimeOut 
     * @returns {HRESULT} 
     */
    LockDevice(dwTimeOut) {
        result := ComCall(10, this, "uint", dwTimeOut, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    UnLockDevice() {
        result := ComCall(11, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} lpBuffer 
     * @param {Pointer<Integer>} lpdwNumberOfBytes 
     * @param {Pointer<OVERLAPPED>} lpOverlapped 
     * @returns {HRESULT} 
     */
    RawReadData(lpBuffer, lpdwNumberOfBytes, lpOverlapped) {
        lpdwNumberOfBytesMarshal := lpdwNumberOfBytes is VarRef ? "uint*" : "ptr"

        result := ComCall(12, this, "ptr", lpBuffer, lpdwNumberOfBytesMarshal, lpdwNumberOfBytes, "ptr", lpOverlapped, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} lpBuffer 
     * @param {Integer} nNumberOfBytes 
     * @param {Pointer<OVERLAPPED>} lpOverlapped 
     * @returns {HRESULT} 
     */
    RawWriteData(lpBuffer, nNumberOfBytes, lpOverlapped) {
        result := ComCall(13, this, "ptr", lpBuffer, "uint", nNumberOfBytes, "ptr", lpOverlapped, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} lpBuffer 
     * @param {Pointer<Integer>} lpdwNumberOfBytes 
     * @param {Pointer<OVERLAPPED>} lpOverlapped 
     * @returns {HRESULT} 
     */
    RawReadCommand(lpBuffer, lpdwNumberOfBytes, lpOverlapped) {
        lpdwNumberOfBytesMarshal := lpdwNumberOfBytes is VarRef ? "uint*" : "ptr"

        result := ComCall(14, this, "ptr", lpBuffer, lpdwNumberOfBytesMarshal, lpdwNumberOfBytes, "ptr", lpOverlapped, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} lpBuffer 
     * @param {Integer} nNumberOfBytes 
     * @param {Pointer<OVERLAPPED>} lpOverlapped 
     * @returns {HRESULT} 
     */
    RawWriteCommand(lpBuffer, nNumberOfBytes, lpOverlapped) {
        result := ComCall(15, this, "ptr", lpBuffer, "uint", nNumberOfBytes, "ptr", lpOverlapped, "HRESULT")
        return result
    }

    /**
     * Creates a subscription that receives notifications for the policy's opening and closing.
     * @remarks
     * >**Note** Do not perform your activity in this callback, since it will block delivery of future policy notifications for this subscription. This callback should be used to coordinate the starting and stopping of your activity in response to RUN/STOP notifications from the API.
     * 
     * >**Note** Do not block this callback for extended periods of time, since it will block [UnsubscribeActivityCoordinatorPolicy](nf-activitycoordinator-unsubscribeactivitycoordinatorpolicy.md) and may contribute to thread pool exhaustion.
     * 
     * >**Note** Calls to [UnsubscribeActivityCoordinatorPolicy](nf-activitycoordinator-unsubscribeactivitycoordinatorpolicy.md) from this callback will fail. Unsubscribing must occur outside the callback.
     * @param {Pointer<STISUBSCRIBE>} lpSubsribe 
     * @returns {HRESULT} Returns an **HRESULT**.
     * @see https://learn.microsoft.com/windows/win32/api/activitycoordinator/nf-activitycoordinator-subscribeactivitycoordinatorpolicy
     */
    Subscribe(lpSubsribe) {
        result := ComCall(16, this, "ptr", lpSubsribe, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {STINOTIFY} 
     */
    GetLastNotificationData() {
        lpNotify := STINOTIFY()
        result := ComCall(17, this, "ptr", lpNotify, "HRESULT")
        return lpNotify
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    UnSubscribe() {
        result := ComCall(18, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {_ERROR_INFOW} 
     */
    GetLastErrorInfo() {
        pLastErrorInfo := _ERROR_INFOW()
        result := ComCall(19, this, "ptr", pLastErrorInfo, "HRESULT")
        return pLastErrorInfo
    }
}
