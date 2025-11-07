#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IEnumTASK.ahk
#Include ..\Com\IUnknown.ahk

/**
 * The IEnumTASK interface is introduced in MMC 1.1.
 * @see https://docs.microsoft.com/windows/win32/api//mmc/nn-mmc-ienumtask
 * @namespace Windows.Win32.System.Mmc
 * @version v4.0.30319
 */
class IEnumTASK extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEnumTASK
     * @type {Guid}
     */
    static IID => Guid("{338698b1-5a02-11d1-9fec-00600832db4a}")

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
     * @param {Integer} celt 
     * @param {Pointer<MMC_TASK>} rgelt 
     * @param {Pointer<Integer>} pceltFetched 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-ienumtask-next
     */
    Next(celt, rgelt, pceltFetched) {
        pceltFetchedMarshal := pceltFetched is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", celt, "ptr", rgelt, pceltFetchedMarshal, pceltFetched, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} celt 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-ienumtask-skip
     */
    Skip(celt) {
        result := ComCall(4, this, "uint", celt, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-ienumtask-reset
     */
    Reset() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IEnumTASK} 
     * @see https://learn.microsoft.com/windows/win32/api/mmc/nf-mmc-ienumtask-clone
     */
    Clone() {
        result := ComCall(6, this, "ptr*", &ppenum := 0, "HRESULT")
        return IEnumTASK(ppenum)
    }
}
