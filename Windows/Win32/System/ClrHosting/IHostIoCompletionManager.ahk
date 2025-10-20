#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.ClrHosting
 * @version v4.0.30319
 */
class IHostIoCompletionManager extends IUnknown{
    /**
     * The interface identifier for IHostIoCompletionManager
     * @type {Guid}
     */
    static IID => Guid("{8bde9d80-ec06-41d6-83e6-22580effcc20}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * Creates an input/output (I/O) completion port and associates it with a specified file handle, or creates an I/O completion port that is not yet associated with a file handle, allowing association at a later time.
     * @param {Pointer<HANDLE>} phPort 
     * @returns {HRESULT} If the function succeeds, the return value is the handle to an I/O completion port:
     * 
     * <ul>
     * <li>
     * If the <i>ExistingCompletionPort</i> parameter was <b>NULL</b>, the return value is a new handle.
     * 
     * </li>
     * <li>
     * If the <i>ExistingCompletionPort</i> parameter was a valid I/O completion port handle, the return value is that same handle.
     * 
     * </li>
     * <li>
     * If the <i>FileHandle</i> parameter was a valid handle, that file handle is now associated with the returned I/O completion port.
     * 
     * </li>
     * </ul>
     * If the function fails, the return value is <b>NULL</b>. To get extended error information, call 
     * the <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function.
     * @see https://docs.microsoft.com/windows/win32/api//ioapiset/nf-ioapiset-createiocompletionport
     */
    CreateIoCompletionPort(phPort) {
        result := ComCall(3, this, "ptr", phPort, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HANDLE} hPort 
     * @returns {HRESULT} 
     */
    CloseIoCompletionPort(hPort) {
        hPort := hPort is Win32Handle ? NumGet(hPort, "ptr") : hPort

        result := ComCall(4, this, "ptr", hPort, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwMaxIOCompletionThreads 
     * @returns {HRESULT} 
     */
    SetMaxThreads(dwMaxIOCompletionThreads) {
        result := ComCall(5, this, "uint", dwMaxIOCompletionThreads, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwMaxIOCompletionThreads 
     * @returns {HRESULT} 
     */
    GetMaxThreads(pdwMaxIOCompletionThreads) {
        result := ComCall(6, this, "uint*", pdwMaxIOCompletionThreads, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwAvailableIOCompletionThreads 
     * @returns {HRESULT} 
     */
    GetAvailableThreads(pdwAvailableIOCompletionThreads) {
        result := ComCall(7, this, "uint*", pdwAvailableIOCompletionThreads, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pcbSize 
     * @returns {HRESULT} 
     */
    GetHostOverlappedSize(pcbSize) {
        result := ComCall(8, this, "uint*", pcbSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ICLRIoCompletionManager>} pManager 
     * @returns {HRESULT} 
     */
    SetCLRIoCompletionManager(pManager) {
        result := ComCall(9, this, "ptr", pManager, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} pvOverlapped 
     * @returns {HRESULT} 
     */
    InitializeHostOverlapped(pvOverlapped) {
        result := ComCall(10, this, "ptr", pvOverlapped, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HANDLE} hPort 
     * @param {HANDLE} hHandle 
     * @returns {HRESULT} 
     */
    Bind(hPort, hHandle) {
        hPort := hPort is Win32Handle ? NumGet(hPort, "ptr") : hPort
        hHandle := hHandle is Win32Handle ? NumGet(hHandle, "ptr") : hHandle

        result := ComCall(11, this, "ptr", hPort, "ptr", hHandle, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwMinIOCompletionThreads 
     * @returns {HRESULT} 
     */
    SetMinThreads(dwMinIOCompletionThreads) {
        result := ComCall(12, this, "uint", dwMinIOCompletionThreads, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwMinIOCompletionThreads 
     * @returns {HRESULT} 
     */
    GetMinThreads(pdwMinIOCompletionThreads) {
        result := ComCall(13, this, "uint*", pdwMinIOCompletionThreads, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
