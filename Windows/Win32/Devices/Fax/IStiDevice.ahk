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
     * @see https://docs.microsoft.com/windows/win32/api//roapi/nf-roapi-initialize
     */
    Initialize(hinst, pwszDeviceName, dwVersion, dwMode) {
        hinst := hinst is Win32Handle ? NumGet(hinst, "ptr") : hinst
        pwszDeviceName := pwszDeviceName is String ? StrPtr(pwszDeviceName) : pwszDeviceName

        result := ComCall(3, this, "ptr", hinst, "ptr", pwszDeviceName, "uint", dwVersion, "uint", dwMode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<STI_DEV_CAPS>} pDevCaps 
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
     * @param {Integer} dwOutDataSize 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-escape
     */
    Escape(EscapeFunction, lpInData, cbInDataSize, pOutData, dwOutDataSize) {
        result := ComCall(8, this, "uint", EscapeFunction, "ptr", lpInData, "uint", cbInDataSize, "ptr", pOutData, "uint", dwOutDataSize, "uint*", &pdwActualData := 0, "HRESULT")
        return pdwActualData
    }

    /**
     * Retrieves the calling thread's last-error code value.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//errhandlingapi/nf-errhandlingapi-getlasterror
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
     * 
     * @param {Pointer<STISUBSCRIBE>} lpSubsribe 
     * @returns {HRESULT} 
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
