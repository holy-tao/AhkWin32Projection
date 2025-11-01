#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Represents a recoverable error that occurred when an item was loaded or when an item was saved.
 * @see https://docs.microsoft.com/windows/win32/api//winsync/nn-winsync-irecoverableerror
 * @namespace Windows.Win32.System.WindowsSync
 * @version v4.0.30319
 */
class IRecoverableError extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRecoverableError
     * @type {Guid}
     */
    static IID => Guid("{0f5625e8-0a7b-45ee-9637-1ce13645909e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetStage", "GetProvider", "GetChangeWithRecoverableError", "GetRecoverableErrorDataForChange", "GetRecoverableErrorDataForChangeUnit"]

    /**
     * 
     * @param {Pointer<Integer>} pStage 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-irecoverableerror-getstage
     */
    GetStage(pStage) {
        pStageMarshal := pStage is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, pStageMarshal, pStage, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pProviderRole 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-irecoverableerror-getprovider
     */
    GetProvider(pProviderRole) {
        pProviderRoleMarshal := pProviderRole is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, pProviderRoleMarshal, pProviderRole, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ISyncChange>} ppChangeWithRecoverableError 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-irecoverableerror-getchangewithrecoverableerror
     */
    GetChangeWithRecoverableError(ppChangeWithRecoverableError) {
        result := ComCall(5, this, "ptr*", ppChangeWithRecoverableError, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<HRESULT>} phrError 
     * @param {Pointer<IRecoverableErrorData>} ppErrorData 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-irecoverableerror-getrecoverableerrordataforchange
     */
    GetRecoverableErrorDataForChange(phrError, ppErrorData) {
        result := ComCall(6, this, "ptr", phrError, "ptr*", ppErrorData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ISyncChangeUnit} pChangeUnit 
     * @param {Pointer<HRESULT>} phrError 
     * @param {Pointer<IRecoverableErrorData>} ppErrorData 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-irecoverableerror-getrecoverableerrordataforchangeunit
     */
    GetRecoverableErrorDataForChangeUnit(pChangeUnit, phrError, ppErrorData) {
        result := ComCall(7, this, "ptr", pChangeUnit, "ptr", phrError, "ptr*", ppErrorData, "HRESULT")
        return result
    }
}
