#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISyncChange.ahk
#Include .\IEnumSyncChanges.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Enumerates a list of item changes.
 * @see https://docs.microsoft.com/windows/win32/api//winsync/nn-winsync-ienumsyncchanges
 * @namespace Windows.Win32.System.WindowsSync
 * @version v4.0.30319
 */
class IEnumSyncChanges extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEnumSyncChanges
     * @type {Guid}
     */
    static IID => Guid("{5f86be4a-5e78-4e32-ac1c-c24fd223ef85}")

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
     * @param {Integer} cChanges 
     * @param {Pointer<Integer>} pcFetched 
     * @returns {ISyncChange} 
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-ienumsyncchanges-next
     */
    Next(cChanges, pcFetched) {
        pcFetchedMarshal := pcFetched is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "uint", cChanges, "ptr*", &ppChange := 0, pcFetchedMarshal, pcFetched, "HRESULT")
        return ISyncChange(ppChange)
    }

    /**
     * 
     * @param {Integer} cChanges 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-ienumsyncchanges-skip
     */
    Skip(cChanges) {
        result := ComCall(4, this, "uint", cChanges, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-ienumsyncchanges-reset
     */
    Reset() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IEnumSyncChanges} 
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-ienumsyncchanges-clone
     */
    Clone() {
        result := ComCall(6, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumSyncChanges(ppEnum)
    }
}
