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
     * 
     * @param {Pointer<BOOL>} pfIsOplockValid 
     * @returns {HRESULT} 
     */
    IsOplockValid(pfIsOplockValid) {
        result := ComCall(3, this, "ptr", pfIsOplockValid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pfIsOplockBroken 
     * @returns {HRESULT} 
     */
    IsOplockBroken(pfIsOplockBroken) {
        result := ComCall(4, this, "ptr", pfIsOplockBroken, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<HANDLE>} phOplockEv 
     * @returns {HRESULT} 
     */
    GetOplockEventHandle(phOplockEv) {
        result := ComCall(5, this, "ptr", phOplockEv, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
