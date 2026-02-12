#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Suspends or releases a share root or directory tree in the Offline Files cache.
 * @see https://learn.microsoft.com/windows/win32/api//content/cscobj/nn-cscobj-iofflinefilessuspend
 * @namespace Windows.Win32.Storage.OfflineFiles
 * @version v4.0.30319
 */
class IOfflineFilesSuspend extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SuspendRoot"]

    /**
     * Suspend or release a share root or directory tree.
     * @remarks
     * When a share root or directory tree is suspended, all directories and files contained in the share or directory or in any subfolders are suspended as well.  This means that both directories and files may be suspended. Note that a directory can be suspended directly (if it is the root of the share or directory tree) or indirectly (if it is one of the items contained in the share or directory tree).
     * @param {BOOL} bSuspend Specify <b>TRUE</b> to suspend, or <b>FALSE</b> to release.
     * @returns {HRESULT} Returns <b>S_OK</b> if successful, or an error value otherwise.
     * @see https://learn.microsoft.com/windows/win32/api//content/cscobj/nf-cscobj-iofflinefilessuspend-suspendroot
     */
    SuspendRoot(bSuspend) {
        result := ComCall(3, this, "int", bSuspend, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
