#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Suspends or releases a share root or directory tree in the Offline Files cache.
 * @see https://docs.microsoft.com/windows/win32/api//cscobj/nn-cscobj-iofflinefilessuspend
 * @namespace Windows.Win32.Storage.OfflineFiles
 * @version v4.0.30319
 */
class IOfflineFilesSuspend extends IUnknown{
    /**
     * The interface identifier for IOfflineFilesSuspend
     * @type {Guid}
     */
    static IID => Guid("{62c4560f-bc0b-48ca-ad9d-34cb528d99a9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {BOOL} bSuspend 
     * @returns {HRESULT} 
     */
    SuspendRoot(bSuspend) {
        result := ComCall(3, this, "int", bSuspend, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
