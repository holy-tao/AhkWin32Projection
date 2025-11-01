#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.ClrHosting
 * @version v4.0.30319
 */
class IHostSyncManager extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHostSyncManager
     * @type {Guid}
     */
    static IID => Guid("{234330c7-5f10-4f20-9615-5122dab7a0ac}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetCLRSyncManager", "CreateCrst", "CreateCrstWithSpinCount", "CreateAutoEvent", "CreateManualEvent", "CreateMonitorEvent", "CreateRWLockWriterEvent", "CreateRWLockReaderEvent", "CreateSemaphoreA"]

    /**
     * 
     * @param {ICLRSyncManager} pManager 
     * @returns {HRESULT} 
     */
    SetCLRSyncManager(pManager) {
        result := ComCall(3, this, "ptr", pManager, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IHostCrst>} ppCrst 
     * @returns {HRESULT} 
     */
    CreateCrst(ppCrst) {
        result := ComCall(4, this, "ptr*", ppCrst, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwSpinCount 
     * @param {Pointer<IHostCrst>} ppCrst 
     * @returns {HRESULT} 
     */
    CreateCrstWithSpinCount(dwSpinCount, ppCrst) {
        result := ComCall(5, this, "uint", dwSpinCount, "ptr*", ppCrst, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IHostAutoEvent>} ppEvent 
     * @returns {HRESULT} 
     */
    CreateAutoEvent(ppEvent) {
        result := ComCall(6, this, "ptr*", ppEvent, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} bInitialState 
     * @param {Pointer<IHostManualEvent>} ppEvent 
     * @returns {HRESULT} 
     */
    CreateManualEvent(bInitialState, ppEvent) {
        result := ComCall(7, this, "int", bInitialState, "ptr*", ppEvent, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} Cookie 
     * @param {Pointer<IHostAutoEvent>} ppEvent 
     * @returns {HRESULT} 
     */
    CreateMonitorEvent(Cookie, ppEvent) {
        result := ComCall(8, this, "ptr", Cookie, "ptr*", ppEvent, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} Cookie 
     * @param {Pointer<IHostAutoEvent>} ppEvent 
     * @returns {HRESULT} 
     */
    CreateRWLockWriterEvent(Cookie, ppEvent) {
        result := ComCall(9, this, "ptr", Cookie, "ptr*", ppEvent, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} bInitialState 
     * @param {Pointer} Cookie 
     * @param {Pointer<IHostManualEvent>} ppEvent 
     * @returns {HRESULT} 
     */
    CreateRWLockReaderEvent(bInitialState, Cookie, ppEvent) {
        result := ComCall(10, this, "int", bInitialState, "ptr", Cookie, "ptr*", ppEvent, "HRESULT")
        return result
    }

    /**
     * Creates or opens a named or unnamed semaphore object.
     * @param {Integer} dwInitial 
     * @param {Integer} dwMax 
     * @param {Pointer<IHostSemaphore>} ppSemaphore 
     * @returns {HRESULT} If the function succeeds, the return value is a handle to the semaphore object. If the named semaphore object existed before the function call, the function returns a handle to the existing object and 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> returns <b>ERROR_ALREADY_EXISTS</b>.
     * 
     * If the function fails, the return value is <b>NULL</b>. To get extended error information, call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-createsemaphorea
     */
    CreateSemaphoreA(dwInitial, dwMax, ppSemaphore) {
        result := ComCall(11, this, "uint", dwInitial, "uint", dwMax, "ptr*", ppSemaphore, "HRESULT")
        return result
    }
}
