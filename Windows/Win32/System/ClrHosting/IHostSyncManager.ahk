#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IHostCrst.ahk
#Include .\IHostAutoEvent.ahk
#Include .\IHostManualEvent.ahk
#Include .\IHostSemaphore.ahk
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
     * @returns {IHostCrst} 
     */
    CreateCrst() {
        result := ComCall(4, this, "ptr*", &ppCrst := 0, "HRESULT")
        return IHostCrst(ppCrst)
    }

    /**
     * 
     * @param {Integer} dwSpinCount 
     * @returns {IHostCrst} 
     */
    CreateCrstWithSpinCount(dwSpinCount) {
        result := ComCall(5, this, "uint", dwSpinCount, "ptr*", &ppCrst := 0, "HRESULT")
        return IHostCrst(ppCrst)
    }

    /**
     * 
     * @returns {IHostAutoEvent} 
     */
    CreateAutoEvent() {
        result := ComCall(6, this, "ptr*", &ppEvent := 0, "HRESULT")
        return IHostAutoEvent(ppEvent)
    }

    /**
     * 
     * @param {BOOL} bInitialState 
     * @returns {IHostManualEvent} 
     */
    CreateManualEvent(bInitialState) {
        result := ComCall(7, this, "int", bInitialState, "ptr*", &ppEvent := 0, "HRESULT")
        return IHostManualEvent(ppEvent)
    }

    /**
     * 
     * @param {Pointer} Cookie 
     * @returns {IHostAutoEvent} 
     */
    CreateMonitorEvent(Cookie) {
        result := ComCall(8, this, "ptr", Cookie, "ptr*", &ppEvent := 0, "HRESULT")
        return IHostAutoEvent(ppEvent)
    }

    /**
     * 
     * @param {Pointer} Cookie 
     * @returns {IHostAutoEvent} 
     */
    CreateRWLockWriterEvent(Cookie) {
        result := ComCall(9, this, "ptr", Cookie, "ptr*", &ppEvent := 0, "HRESULT")
        return IHostAutoEvent(ppEvent)
    }

    /**
     * 
     * @param {BOOL} bInitialState 
     * @param {Pointer} Cookie 
     * @returns {IHostManualEvent} 
     */
    CreateRWLockReaderEvent(bInitialState, Cookie) {
        result := ComCall(10, this, "int", bInitialState, "ptr", Cookie, "ptr*", &ppEvent := 0, "HRESULT")
        return IHostManualEvent(ppEvent)
    }

    /**
     * Creates or opens a named or unnamed semaphore object.
     * @param {Integer} dwInitial 
     * @param {Integer} dwMax 
     * @returns {IHostSemaphore} 
     * @see https://docs.microsoft.com/windows/win32/api//winbase/nf-winbase-createsemaphorea
     */
    CreateSemaphoreA(dwInitial, dwMax) {
        result := ComCall(11, this, "uint", dwInitial, "uint", dwMax, "ptr*", &ppSemaphore := 0, "HRESULT")
        return IHostSemaphore(ppSemaphore)
    }
}
