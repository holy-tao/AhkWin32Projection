#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Provides the methods for enumerating the tasks in the Scheduled Tasks folder.
 * @see https://docs.microsoft.com/windows/win32/api//mstask/nn-mstask-ienumworkitems
 * @namespace Windows.Win32.System.TaskScheduler
 * @version v4.0.30319
 */
class IEnumWorkItems extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEnumWorkItems
     * @type {Guid}
     */
    static IID => Guid("{148bd528-a2ab-11ce-b11f-00aa00530503}")

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
     * @param {Pointer<Pointer<PWSTR>>} rgpwszNames 
     * @param {Pointer<Integer>} pceltFetched 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mstask/nf-mstask-ienumworkitems-next
     */
    Next(celt, rgpwszNames, pceltFetched) {
        rgpwszNamesMarshal := rgpwszNames is VarRef ? "ptr*" : "ptr"
        pceltFetchedMarshal := pceltFetched is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", celt, rgpwszNamesMarshal, rgpwszNames, pceltFetchedMarshal, pceltFetched, "int")
        return result
    }

    /**
     * 
     * @param {Integer} celt 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mstask/nf-mstask-ienumworkitems-skip
     */
    Skip(celt) {
        result := ComCall(4, this, "uint", celt, "int")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mstask/nf-mstask-ienumworkitems-reset
     */
    Reset() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IEnumWorkItems>} ppEnumWorkItems 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mstask/nf-mstask-ienumworkitems-clone
     */
    Clone(ppEnumWorkItems) {
        result := ComCall(6, this, "ptr*", ppEnumWorkItems, "HRESULT")
        return result
    }
}
