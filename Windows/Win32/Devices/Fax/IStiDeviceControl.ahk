#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\System\IO\OVERLAPPED.ahk" { OVERLAPPED }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Devices.Fax
 */
export default struct IStiDeviceControl extends IUnknown {
    /**
     * The interface identifier for IStiDeviceControl
     * @type {Guid}
     */
    static IID := Guid("{128a9860-52dc-11d0-9edf-444553540000}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IStiDeviceControl interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Initialize          : IntPtr
        RawReadData         : IntPtr
        RawWriteData        : IntPtr
        RawReadCommand      : IntPtr
        RawWriteCommand     : IntPtr
        RawDeviceControl    : IntPtr
        GetLastError        : IntPtr
        GetMyDevicePortName : IntPtr
        GetMyDeviceHandle   : IntPtr
        GetMyDeviceOpenMode : IntPtr
        WriteToErrorLog     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IStiDeviceControl.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * @see https://learn.microsoft.com/windows/win32/api/roapi/nf-roapi-initialize
     */
    Initialize(dwDeviceType, dwMode, pwszPortName, dwFlags) {
        pwszPortName := pwszPortName is String ? StrPtr(pwszPortName) : pwszPortName

        result := ComCall(3, this, "uint", dwDeviceType, "uint", dwMode, "ptr", pwszPortName, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} lpBuffer 
     * @param {Pointer<Integer>} lpdwNumberOfBytes 
     * @param {Pointer<OVERLAPPED>} lpOverlapped 
     * @returns {HRESULT} 
     */
    RawReadData(lpBuffer, lpdwNumberOfBytes, lpOverlapped) {
        lpBufferMarshal := lpBuffer is VarRef ? "ptr" : "ptr"
        lpdwNumberOfBytesMarshal := lpdwNumberOfBytes is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, lpBufferMarshal, lpBuffer, lpdwNumberOfBytesMarshal, lpdwNumberOfBytes, OVERLAPPED.Ptr, lpOverlapped, "HRESULT")
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
        lpBufferMarshal := lpBuffer is VarRef ? "ptr" : "ptr"

        result := ComCall(5, this, lpBufferMarshal, lpBuffer, "uint", nNumberOfBytes, OVERLAPPED.Ptr, lpOverlapped, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} lpBuffer 
     * @param {Pointer<Integer>} lpdwNumberOfBytes 
     * @param {Pointer<OVERLAPPED>} lpOverlapped 
     * @returns {HRESULT} 
     */
    RawReadCommand(lpBuffer, lpdwNumberOfBytes, lpOverlapped) {
        lpBufferMarshal := lpBuffer is VarRef ? "ptr" : "ptr"
        lpdwNumberOfBytesMarshal := lpdwNumberOfBytes is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, lpBufferMarshal, lpBuffer, lpdwNumberOfBytesMarshal, lpdwNumberOfBytes, OVERLAPPED.Ptr, lpOverlapped, "HRESULT")
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
        lpBufferMarshal := lpBuffer is VarRef ? "ptr" : "ptr"

        result := ComCall(7, this, lpBufferMarshal, lpBuffer, "uint", nNumberOfBytes, OVERLAPPED.Ptr, lpOverlapped, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} EscapeFunction 
     * @param {Pointer<Void>} lpInData 
     * @param {Integer} cbInDataSize 
     * @param {Pointer<Void>} pOutData 
     * @param {Integer} dwOutDataSize 
     * @param {Pointer<Integer>} pdwActualData 
     * @returns {HRESULT} 
     */
    RawDeviceControl(EscapeFunction, lpInData, cbInDataSize, pOutData, dwOutDataSize, pdwActualData) {
        lpInDataMarshal := lpInData is VarRef ? "ptr" : "ptr"
        pOutDataMarshal := pOutData is VarRef ? "ptr" : "ptr"
        pdwActualDataMarshal := pdwActualData is VarRef ? "uint*" : "ptr"

        result := ComCall(8, this, "uint", EscapeFunction, lpInDataMarshal, lpInData, "uint", cbInDataSize, pOutDataMarshal, pOutData, "uint", dwOutDataSize, pdwActualDataMarshal, pdwActualData, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} lpdwLastError 
     * @returns {HRESULT} The return value is the calling thread's last-error code.
     * 
     * The Return Value section of the documentation for each function that sets the last-error code notes the conditions under which the function sets the last-error code. Most functions that set the thread's last-error code set it when they fail. However, some functions also set the last-error code when they succeed. If the function is not documented to set the last-error code, the value returned by this function is simply the most recent last-error code to have been set; some functions set the last-error code to 0 on success and others do not.
     * @see https://learn.microsoft.com/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror
     */
    GetLastError(lpdwLastError) {
        lpdwLastErrorMarshal := lpdwLastError is VarRef ? "uint*" : "ptr"

        result := ComCall(9, this, lpdwLastErrorMarshal, lpdwLastError, "HRESULT")
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

        result := ComCall(10, this, "ptr", lpszDevicePath, "uint", cwDevicePathSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<HANDLE>} lph 
     * @returns {HRESULT} 
     */
    GetMyDeviceHandle(lph) {
        result := ComCall(11, this, HANDLE.Ptr, lph, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwOpenMode 
     * @returns {HRESULT} 
     */
    GetMyDeviceOpenMode(pdwOpenMode) {
        pdwOpenModeMarshal := pdwOpenMode is VarRef ? "uint*" : "ptr"

        result := ComCall(12, this, pdwOpenModeMarshal, pdwOpenMode, "HRESULT")
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

        result := ComCall(13, this, "uint", dwMessageType, "ptr", pszMessage, "uint", dwErrorCode, "HRESULT")
        return result
    }

    Query(iid) {
        if (IStiDeviceControl.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Initialize := CallbackCreate(GetMethod(implObj, "Initialize"), flags, 5)
        this.vtbl.RawReadData := CallbackCreate(GetMethod(implObj, "RawReadData"), flags, 4)
        this.vtbl.RawWriteData := CallbackCreate(GetMethod(implObj, "RawWriteData"), flags, 4)
        this.vtbl.RawReadCommand := CallbackCreate(GetMethod(implObj, "RawReadCommand"), flags, 4)
        this.vtbl.RawWriteCommand := CallbackCreate(GetMethod(implObj, "RawWriteCommand"), flags, 4)
        this.vtbl.RawDeviceControl := CallbackCreate(GetMethod(implObj, "RawDeviceControl"), flags, 7)
        this.vtbl.GetLastError := CallbackCreate(GetMethod(implObj, "GetLastError"), flags, 2)
        this.vtbl.GetMyDevicePortName := CallbackCreate(GetMethod(implObj, "GetMyDevicePortName"), flags, 3)
        this.vtbl.GetMyDeviceHandle := CallbackCreate(GetMethod(implObj, "GetMyDeviceHandle"), flags, 2)
        this.vtbl.GetMyDeviceOpenMode := CallbackCreate(GetMethod(implObj, "GetMyDeviceOpenMode"), flags, 2)
        this.vtbl.WriteToErrorLog := CallbackCreate(GetMethod(implObj, "WriteToErrorLog"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Initialize)
        CallbackFree(this.vtbl.RawReadData)
        CallbackFree(this.vtbl.RawWriteData)
        CallbackFree(this.vtbl.RawReadCommand)
        CallbackFree(this.vtbl.RawWriteCommand)
        CallbackFree(this.vtbl.RawDeviceControl)
        CallbackFree(this.vtbl.GetLastError)
        CallbackFree(this.vtbl.GetMyDevicePortName)
        CallbackFree(this.vtbl.GetMyDeviceHandle)
        CallbackFree(this.vtbl.GetMyDeviceOpenMode)
        CallbackFree(this.vtbl.WriteToErrorLog)
    }
}
