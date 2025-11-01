#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Devices.Fax
 * @version v4.0.30319
 */
class IStiUSD extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStiUSD
     * @type {Guid}
     */
    static IID => Guid("{0c9bb460-51ac-11d0-90ea-00aa0060f86c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Initialize", "GetCapabilities", "GetStatus", "DeviceReset", "Diagnostic", "Escape", "GetLastError", "LockDevice", "UnLockDevice", "RawReadData", "RawWriteData", "RawReadCommand", "RawWriteCommand", "SetNotificationHandle", "GetNotificationData", "GetLastErrorInfo"]

    /**
     * Initializes a thread to use Windows Runtime APIs.
     * @param {IStiDeviceControl} pHelDcb 
     * @param {Integer} dwStiVersion 
     * @param {HKEY} hParametersKey 
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
     * @see https://docs.microsoft.com/windows/win32/api//roapi/nf-roapi-initialize
     */
    Initialize(pHelDcb, dwStiVersion, hParametersKey) {
        hParametersKey := hParametersKey is Win32Handle ? NumGet(hParametersKey, "ptr") : hParametersKey

        result := ComCall(3, this, "ptr", pHelDcb, "uint", dwStiVersion, "ptr", hParametersKey, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<STI_USD_CAPS>} pDevCaps 
     * @returns {HRESULT} 
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
     * 
     * @param {Pointer<STI_DIAG>} pBuffer 
     * @returns {HRESULT} 
     */
    Diagnostic(pBuffer) {
        result := ComCall(7, this, "ptr", pBuffer, "HRESULT")
        return result
    }

    /**
     * Enables an application to access the system-defined device capabilities that are not available through GDI.
     * @param {Integer} EscapeFunction 
     * @param {Pointer} lpInData 
     * @param {Integer} cbInDataSize 
     * @param {Pointer} pOutData 
     * @param {Integer} cbOutDataSize 
     * @param {Pointer<Integer>} pdwActualData 
     * @returns {HRESULT} If the function succeeds, the return value is greater than zero, except with the <a href="/previous-versions/windows/desktop/legacy/ff686811(v=vs.85)">QUERYESCSUPPORT</a> printer escape, which checks for implementation only. If the escape is not implemented, the return value is zero.
     * 
     * If the function fails, the return value is a system error code.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-escape
     */
    Escape(EscapeFunction, lpInData, cbInDataSize, pOutData, cbOutDataSize, pdwActualData) {
        pdwActualDataMarshal := pdwActualData is VarRef ? "uint*" : "ptr"

        result := ComCall(8, this, "uint", EscapeFunction, "ptr", lpInData, "uint", cbInDataSize, "ptr", pOutData, "uint", cbOutDataSize, pdwActualDataMarshal, pdwActualData, "HRESULT")
        return result
    }

    /**
     * Retrieves the calling thread's last-error code value.
     * @param {Pointer<Integer>} pdwLastDeviceError 
     * @returns {HRESULT} The return value is the calling thread's last-error code.
     * 
     * The Return Value section of the documentation for each function that sets the last-error code notes the conditions under which the function sets the last-error code. Most functions that set the thread's last-error code set it when they fail. However, some functions also set the last-error code when they succeed. If the function is not documented to set the last-error code, the value returned by this function is simply the most recent last-error code to have been set; some functions set the last-error code to 0 on success and others do not.
     * @see https://docs.microsoft.com/windows/win32/api//errhandlingapi/nf-errhandlingapi-getlasterror
     */
    GetLastError(pdwLastDeviceError) {
        pdwLastDeviceErrorMarshal := pdwLastDeviceError is VarRef ? "uint*" : "ptr"

        result := ComCall(9, this, pdwLastDeviceErrorMarshal, pdwLastDeviceError, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    LockDevice() {
        result := ComCall(10, this, "HRESULT")
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
     * 
     * @param {HANDLE} hEvent 
     * @returns {HRESULT} 
     */
    SetNotificationHandle(hEvent) {
        hEvent := hEvent is Win32Handle ? NumGet(hEvent, "ptr") : hEvent

        result := ComCall(16, this, "ptr", hEvent, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<STINOTIFY>} lpNotify 
     * @returns {HRESULT} 
     */
    GetNotificationData(lpNotify) {
        result := ComCall(17, this, "ptr", lpNotify, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<_ERROR_INFOW>} pLastErrorInfo 
     * @returns {HRESULT} 
     */
    GetLastErrorInfo(pLastErrorInfo) {
        result := ComCall(18, this, "ptr", pLastErrorInfo, "HRESULT")
        return result
    }
}
