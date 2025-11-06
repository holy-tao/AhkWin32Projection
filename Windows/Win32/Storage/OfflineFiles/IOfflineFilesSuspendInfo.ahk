#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Determines whether an item is suspended or not and, if so, if it is a suspended root or not.
 * @see https://docs.microsoft.com/windows/win32/api//cscobj/nn-cscobj-iofflinefilessuspendinfo
 * @namespace Windows.Win32.Storage.OfflineFiles
 * @version v4.0.30319
 */
class IOfflineFilesSuspendInfo extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IOfflineFilesSuspendInfo
     * @type {Guid}
     */
    static IID => Guid("{a457c25b-4e9c-4b04-85af-8932ccd97889}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["IsSuspended"]

    /**
     * 
     * @param {Pointer<BOOL>} pbSuspended 
     * @param {Pointer<BOOL>} pbSuspendedRoot 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/cscobj/nf-cscobj-iofflinefilessuspendinfo-issuspended
     */
    IsSuspended(pbSuspended, pbSuspendedRoot) {
        pbSuspendedMarshal := pbSuspended is VarRef ? "int*" : "ptr"
        pbSuspendedRootMarshal := pbSuspendedRoot is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, pbSuspendedMarshal, pbSuspended, pbSuspendedRootMarshal, pbSuspendedRoot, "HRESULT")
        return result
    }
}
