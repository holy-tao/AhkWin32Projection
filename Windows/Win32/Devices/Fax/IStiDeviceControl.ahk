#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Devices.Fax
 * @version v4.0.30319
 */
class IStiDeviceControl extends IUnknown{
    /**
     * The interface identifier for IStiDeviceControl
     * @type {Guid}
     */
    static IID => Guid("{128a9860-52dc-11d0-9edf-444553540000}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * Initializes a thread to use Windows Runtime APIs.
     * @param {Integer} dwDeviceType 
     * @param {Integer} dwMode 
     * @param {PWSTR} pwszPortName 
     * @param {Integer} dwFlags 
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
    Initialize(dwDeviceType, dwMode, pwszPortName, dwFlags) {
        pwszPortName := pwszPortName is String ? StrPtr(pwszPortName) : pwszPortName

        result := ComCall(3, this, "uint", dwDeviceType, "uint", dwMode, "ptr", pwszPortName, "uint", dwFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} lpBuffer 
     * @param {Pointer<UInt32>} lpdwNumberOfBytes 
     * @param {Pointer<OVERLAPPED>} lpOverlapped 
     * @returns {HRESULT} 
     */
    RawReadData(lpBuffer, lpdwNumberOfBytes, lpOverlapped) {
        result := ComCall(4, this, "ptr", lpBuffer, "uint*", lpdwNumberOfBytes, "ptr", lpOverlapped, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} lpBuffer 
     * @param {Integer} nNumberOfBytes 
     * @param {Pointer<OVERLAPPED>} lpOverlapped 
     * @returns {HRESULT} 
     */
    RawWriteData(lpBuffer, nNumberOfBytes, lpOverlapped) {
        result := ComCall(5, this, "ptr", lpBuffer, "uint", nNumberOfBytes, "ptr", lpOverlapped, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} lpBuffer 
     * @param {Pointer<UInt32>} lpdwNumberOfBytes 
     * @param {Pointer<OVERLAPPED>} lpOverlapped 
     * @returns {HRESULT} 
     */
    RawReadCommand(lpBuffer, lpdwNumberOfBytes, lpOverlapped) {
        result := ComCall(6, this, "ptr", lpBuffer, "uint*", lpdwNumberOfBytes, "ptr", lpOverlapped, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} lpBuffer 
     * @param {Integer} nNumberOfBytes 
     * @param {Pointer<OVERLAPPED>} lpOverlapped 
     * @returns {HRESULT} 
     */
    RawWriteCommand(lpBuffer, nNumberOfBytes, lpOverlapped) {
        result := ComCall(7, this, "ptr", lpBuffer, "uint", nNumberOfBytes, "ptr", lpOverlapped, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} EscapeFunction 
     * @param {Pointer<Void>} lpInData 
     * @param {Integer} cbInDataSize 
     * @param {Pointer<Void>} pOutData 
     * @param {Integer} dwOutDataSize 
     * @param {Pointer<UInt32>} pdwActualData 
     * @returns {HRESULT} 
     */
    RawDeviceControl(EscapeFunction, lpInData, cbInDataSize, pOutData, dwOutDataSize, pdwActualData) {
        result := ComCall(8, this, "uint", EscapeFunction, "ptr", lpInData, "uint", cbInDataSize, "ptr", pOutData, "uint", dwOutDataSize, "uint*", pdwActualData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Retrieves the calling thread's last-error code value.
     * @param {Pointer<UInt32>} lpdwLastError 
     * @returns {HRESULT} The return value is the calling thread's last-error code.
     * 
     * The Return Value section of the documentation for each function that sets the last-error code notes the conditions under which the function sets the last-error code. Most functions that set the thread's last-error code set it when they fail. However, some functions also set the last-error code when they succeed. If the function is not documented to set the last-error code, the value returned by this function is simply the most recent last-error code to have been set; some functions set the last-error code to 0 on success and others do not.
     * @see https://docs.microsoft.com/windows/win32/api//errhandlingapi/nf-errhandlingapi-getlasterror
     */
    GetLastError(lpdwLastError) {
        result := ComCall(9, this, "uint*", lpdwLastError, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} lpszDevicePath 
     * @param {Integer} cwDevicePathSize 
     * @returns {HRESULT} 
     */
    GetMyDevicePortName(lpszDevicePath, cwDevicePathSize) {
        lpszDevicePath := lpszDevicePath is String ? StrPtr(lpszDevicePath) : lpszDevicePath

        result := ComCall(10, this, "ptr", lpszDevicePath, "uint", cwDevicePathSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<HANDLE>} lph 
     * @returns {HRESULT} 
     */
    GetMyDeviceHandle(lph) {
        result := ComCall(11, this, "ptr", lph, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwOpenMode 
     * @returns {HRESULT} 
     */
    GetMyDeviceOpenMode(pdwOpenMode) {
        result := ComCall(12, this, "uint*", pdwOpenMode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwMessageType 
     * @param {PWSTR} pszMessage 
     * @param {Integer} dwErrorCode 
     * @returns {HRESULT} 
     */
    WriteToErrorLog(dwMessageType, pszMessage, dwErrorCode) {
        pszMessage := pszMessage is String ? StrPtr(pszMessage) : pszMessage

        result := ComCall(13, this, "uint", dwMessageType, "ptr", pszMessage, "uint", dwErrorCode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
