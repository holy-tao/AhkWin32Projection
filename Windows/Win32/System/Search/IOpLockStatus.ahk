#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\HANDLE.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Provides methods to check the opportunistic lock that is used by Microsoft Windows Desktop Search (WDS) on items while indexing.
 * @see https://learn.microsoft.com/windows/win32/api//content/searchapi/nn-searchapi-ioplockstatus
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class IOpLockStatus extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IOpLockStatus
     * @type {Guid}
     */
    static IID => Guid("{c731065d-ac80-11d1-8df3-00c04fb6ef4f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["IsOplockValid", "IsOplockBroken", "GetOplockEventHandle"]

    /**
     * Checks the status of the opportunistic lock (OpLock) on the item being indexed. (IOpLockStatus.IsOplockValid)
     * @remarks
     * An OpLock is an opportunistic lock that allows the indexer to lock the item when another process is not accessing it. The indexer releases the item, invalidating or breaking the lock, when another process requests an incompatible access mode. This enables the indexer to run in the background and not impede access to these items by other processes.
     * 
     * An OpLock is never taken after the underlying <a href="https://docs.microsoft.com/windows/desktop/api/searchapi/nn-searchapi-iurlaccessor">IUrlAccessor</a> object is initialized, and any call to this method yields the same output value on the same object.
     * @returns {BOOL} Type: <b>BOOL*</b>
     * 
     * Receives a pointer to a <b>BOOL</b> value that indicates whether the OpLock is successfully taken.
     * @see https://learn.microsoft.com/windows/win32/api//content/searchapi/nf-searchapi-ioplockstatus-isoplockvalid
     */
    IsOplockValid() {
        result := ComCall(3, this, "int*", &pfIsOplockValid := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pfIsOplockValid
    }

    /**
     * Checks the status of the opportunistic lock (OpLock) on the item being indexed. (IOpLockStatus.IsOplockBroken)
     * @remarks
     * An OpLock is an opportunistic lock that allows the indexer to lock the item when another process isn't accessing it. The indexer releases the item, invalidating or breaking the lock, when another process requests an incompatible access mode. This enables the indexer to run in the background and not impede access to these items by other processes.
     * @returns {BOOL} Type: <b>BOOL*</b>
     * 
     * Receives a pointer to a <b>BOOL</b> value that indicates whether the OpLock is broken: <b>TRUE</b> if OpLock was taken and then broken, <b>FALSE</b> otherwise (including the case when OpLock was not taken).
     * @see https://learn.microsoft.com/windows/win32/api//content/searchapi/nf-searchapi-ioplockstatus-isoplockbroken
     */
    IsOplockBroken() {
        result := ComCall(4, this, "int*", &pfIsOplockBroken := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pfIsOplockBroken
    }

    /**
     * Gets the event handle of the opportunistic lock (OpLock). The event object is set to the signaled state when the OpLock is broken, enabling the indexer to stop all operations on the underlying IUrlAccessor object.
     * @returns {HANDLE} Type: <b>HANDLE*</b>
     * 
     * Receives a pointer to the handle of the event associated with the OpLock, or <b>NULL</b> if no OpLock was taken.
     * @see https://learn.microsoft.com/windows/win32/api//content/searchapi/nf-searchapi-ioplockstatus-getoplockeventhandle
     */
    GetOplockEventHandle() {
        phOplockEv := HANDLE()
        result := ComCall(5, this, "ptr", phOplockEv, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return phOplockEv
    }
}
