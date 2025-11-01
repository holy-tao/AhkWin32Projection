#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * 
     * @param {Pointer<BOOL>} pfIsOplockValid 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-ioplockstatus-isoplockvalid
     */
    IsOplockValid(pfIsOplockValid) {
        result := ComCall(3, this, "ptr", pfIsOplockValid, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pfIsOplockBroken 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-ioplockstatus-isoplockbroken
     */
    IsOplockBroken(pfIsOplockBroken) {
        result := ComCall(4, this, "ptr", pfIsOplockBroken, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<HANDLE>} phOplockEv 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-ioplockstatus-getoplockeventhandle
     */
    GetOplockEventHandle(phOplockEv) {
        result := ComCall(5, this, "ptr", phOplockEv, "HRESULT")
        return result
    }
}
