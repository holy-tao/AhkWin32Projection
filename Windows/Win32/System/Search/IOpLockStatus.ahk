#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\HANDLE.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Provides methods to check the opportunistic lock that is used by Microsoft Windows Desktop Search (WDS) on items while indexing.
 * @see https://docs.microsoft.com/windows/win32/api//searchapi/nn-searchapi-ioplockstatus
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
     * Checks the status of the opportunistic lock (OpLock) on the item being indexed.
     * @returns {BOOL} Type: <b>BOOL*</b>
     * 
     * Receives a pointer to a <b>BOOL</b> value that indicates whether the OpLock is successfully taken.
     * @see https://docs.microsoft.com/windows/win32/api//searchapi/nf-searchapi-ioplockstatus-isoplockvalid
     */
    IsOplockValid() {
        result := ComCall(3, this, "int*", &pfIsOplockValid := 0, "HRESULT")
        return pfIsOplockValid
    }

    /**
     * Checks the status of the opportunistic lock (OpLock) on the item being indexed.
     * @returns {BOOL} Type: <b>BOOL*</b>
     * 
     * Receives a pointer to a <b>BOOL</b> value that indicates whether the OpLock is broken: <b>TRUE</b> if OpLock was taken and then broken, <b>FALSE</b> otherwise (including the case when OpLock was not taken).
     * @see https://docs.microsoft.com/windows/win32/api//searchapi/nf-searchapi-ioplockstatus-isoplockbroken
     */
    IsOplockBroken() {
        result := ComCall(4, this, "int*", &pfIsOplockBroken := 0, "HRESULT")
        return pfIsOplockBroken
    }

    /**
     * Gets the event handle of the opportunistic lock (OpLock). The event object is set to the signaled state when the OpLock is broken, enabling the indexer to stop all operations on the underlying IUrlAccessor object.
     * @returns {HANDLE} Type: <b>HANDLE*</b>
     * 
     * Receives a pointer to the handle of the event associated with the OpLock, or <b>NULL</b> if no OpLock was taken.
     * @see https://docs.microsoft.com/windows/win32/api//searchapi/nf-searchapi-ioplockstatus-getoplockeventhandle
     */
    GetOplockEventHandle() {
        phOplockEv := HANDLE()
        result := ComCall(5, this, "ptr", phOplockEv, "HRESULT")
        return phOplockEv
    }
}
