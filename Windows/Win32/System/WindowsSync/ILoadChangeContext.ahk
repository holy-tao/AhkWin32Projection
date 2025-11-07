#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISyncChange.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Represents information about a change to be loaded from the item store.
 * @see https://docs.microsoft.com/windows/win32/api//winsync/nn-winsync-iloadchangecontext
 * @namespace Windows.Win32.System.WindowsSync
 * @version v4.0.30319
 */
class ILoadChangeContext extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ILoadChangeContext
     * @type {Guid}
     */
    static IID => Guid("{44a4aaca-ec39-46d5-b5c9-d633c0ee67e2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetSyncChange", "SetRecoverableErrorOnChange", "SetRecoverableErrorOnChangeUnit"]

    /**
     * 
     * @returns {ISyncChange} 
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-iloadchangecontext-getsyncchange
     */
    GetSyncChange() {
        result := ComCall(3, this, "ptr*", &ppSyncChange := 0, "HRESULT")
        return ISyncChange(ppSyncChange)
    }

    /**
     * 
     * @param {HRESULT} hrError 
     * @param {IRecoverableErrorData} pErrorData 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-iloadchangecontext-setrecoverableerroronchange
     */
    SetRecoverableErrorOnChange(hrError, pErrorData) {
        result := ComCall(4, this, "int", hrError, "ptr", pErrorData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HRESULT} hrError 
     * @param {ISyncChangeUnit} pChangeUnit 
     * @param {IRecoverableErrorData} pErrorData 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-iloadchangecontext-setrecoverableerroronchangeunit
     */
    SetRecoverableErrorOnChangeUnit(hrError, pChangeUnit, pErrorData) {
        result := ComCall(5, this, "int", hrError, "ptr", pChangeUnit, "ptr", pErrorData, "HRESULT")
        return result
    }
}
