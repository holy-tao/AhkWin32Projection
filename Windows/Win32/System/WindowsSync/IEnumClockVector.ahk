#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IClockVectorElement.ahk
#Include .\IEnumClockVector.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Enumerates the clock vector elements that are stored in a clock vector.
 * @see https://docs.microsoft.com/windows/win32/api//winsync/nn-winsync-ienumclockvector
 * @namespace Windows.Win32.System.WindowsSync
 * @version v4.0.30319
 */
class IEnumClockVector extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEnumClockVector
     * @type {Guid}
     */
    static IID => Guid("{525844db-2837-4799-9e80-81a66e02220c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Next", "Skip", "Reset", "Clone"]

    /**
     * 
     * @param {Integer} cClockVectorElements 
     * @param {Pointer<Integer>} pcFetched 
     * @returns {IClockVectorElement} 
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-ienumclockvector-next
     */
    Next(cClockVectorElements, pcFetched) {
        pcFetchedMarshal := pcFetched is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", cClockVectorElements, "ptr*", &ppiClockVectorElements := 0, pcFetchedMarshal, pcFetched, "HRESULT")
        return IClockVectorElement(ppiClockVectorElements)
    }

    /**
     * 
     * @param {Integer} cSyncVersions 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-ienumclockvector-skip
     */
    Skip(cSyncVersions) {
        result := ComCall(4, this, "uint", cSyncVersions, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-ienumclockvector-reset
     */
    Reset() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IEnumClockVector} 
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-ienumclockvector-clone
     */
    Clone() {
        result := ComCall(6, this, "ptr*", &ppiEnum := 0, "HRESULT")
        return IEnumClockVector(ppiEnum)
    }
}
