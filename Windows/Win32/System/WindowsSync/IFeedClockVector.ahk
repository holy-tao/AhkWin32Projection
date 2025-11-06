#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IClockVector.ahk

/**
 * Represents a clock vector that contains FeedSync information.
 * @see https://docs.microsoft.com/windows/win32/api//winsync/nn-winsync-ifeedclockvector
 * @namespace Windows.Win32.System.WindowsSync
 * @version v4.0.30319
 */
class IFeedClockVector extends IClockVector{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFeedClockVector
     * @type {Guid}
     */
    static IID => Guid("{8d1d98d1-9fb8-4ec9-a553-54dd924e0f67}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 5

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetUpdateCount", "IsNoConflictsSpecified"]

    /**
     * 
     * @param {Pointer<Integer>} pdwUpdateCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-ifeedclockvector-getupdatecount
     */
    GetUpdateCount(pdwUpdateCount) {
        pdwUpdateCountMarshal := pdwUpdateCount is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, pdwUpdateCountMarshal, pdwUpdateCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pfIsNoConflictsSpecified 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-ifeedclockvector-isnoconflictsspecified
     */
    IsNoConflictsSpecified(pfIsNoConflictsSpecified) {
        pfIsNoConflictsSpecifiedMarshal := pfIsNoConflictsSpecified is VarRef ? "int*" : "ptr"

        result := ComCall(6, this, pfIsNoConflictsSpecifiedMarshal, pfIsNoConflictsSpecified, "HRESULT")
        return result
    }
}
