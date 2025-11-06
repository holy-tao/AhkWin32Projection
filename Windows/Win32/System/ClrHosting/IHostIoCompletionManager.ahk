#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\HANDLE.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.ClrHosting
 * @version v4.0.30319
 */
class IHostIoCompletionManager extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateIoCompletionPort", "CloseIoCompletionPort", "SetMaxThreads", "GetMaxThreads", "GetAvailableThreads", "GetHostOverlappedSize", "SetCLRIoCompletionManager", "InitializeHostOverlapped", "Bind", "SetMinThreads", "GetMinThreads"]

    /**
     * Creates an input/output (I/O) completion port and associates it with a specified file handle, or creates an I/O completion port that is not yet associated with a file handle, allowing association at a later time.
     * @returns {HANDLE} 
     * @see https://docs.microsoft.com/windows/win32/api//ioapiset/nf-ioapiset-createiocompletionport
     */
    CreateIoCompletionPort() {
        phPort := HANDLE()
        result := ComCall(3, this, "ptr", phPort, "HRESULT")
        return phPort
    }

    /**
     * 
     * @param {HANDLE} hPort 
     * @returns {HRESULT} 
     */
    CloseIoCompletionPort(hPort) {
        hPort := hPort is Win32Handle ? NumGet(hPort, "ptr") : hPort

        result := ComCall(4, this, "ptr", hPort, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwMaxIOCompletionThreads 
     * @returns {HRESULT} 
     */
    SetMaxThreads(dwMaxIOCompletionThreads) {
        result := ComCall(5, this, "uint", dwMaxIOCompletionThreads, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetMaxThreads() {
        result := ComCall(6, this, "uint*", &pdwMaxIOCompletionThreads := 0, "HRESULT")
        return pdwMaxIOCompletionThreads
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetAvailableThreads() {
        result := ComCall(7, this, "uint*", &pdwAvailableIOCompletionThreads := 0, "HRESULT")
        return pdwAvailableIOCompletionThreads
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetHostOverlappedSize() {
        result := ComCall(8, this, "uint*", &pcbSize := 0, "HRESULT")
        return pcbSize
    }

    /**
     * 
     * @param {ICLRIoCompletionManager} pManager 
     * @returns {HRESULT} 
     */
    SetCLRIoCompletionManager(pManager) {
        result := ComCall(9, this, "ptr", pManager, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} pvOverlapped 
     * @returns {HRESULT} 
     */
    InitializeHostOverlapped(pvOverlapped) {
        pvOverlappedMarshal := pvOverlapped is VarRef ? "ptr" : "ptr"

        result := ComCall(10, this, pvOverlappedMarshal, pvOverlapped, "HRESULT")
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

        result := ComCall(11, this, "ptr", hPort, "ptr", hHandle, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwMinIOCompletionThreads 
     * @returns {HRESULT} 
     */
    SetMinThreads(dwMinIOCompletionThreads) {
        result := ComCall(12, this, "uint", dwMinIOCompletionThreads, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetMinThreads() {
        result := ComCall(13, this, "uint*", &pdwMinIOCompletionThreads := 0, "HRESULT")
        return pdwMinIOCompletionThreads
    }
}
