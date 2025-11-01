#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Represents a change to a change unit that is contained in an item.
 * @see https://docs.microsoft.com/windows/win32/api//winsync/nn-winsync-isyncchangeunit
 * @namespace Windows.Win32.System.WindowsSync
 * @version v4.0.30319
 */
class ISyncChangeUnit extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISyncChangeUnit
     * @type {Guid}
     */
    static IID => Guid("{60edd8ca-7341-4bb7-95ce-fab6394b51cb}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetItemChange", "GetChangeUnitId", "GetChangeUnitVersion"]

    /**
     * 
     * @param {Pointer<ISyncChange>} ppSyncChange 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-isyncchangeunit-getitemchange
     */
    GetItemChange(ppSyncChange) {
        result := ComCall(3, this, "ptr*", ppSyncChange, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pbChangeUnitId 
     * @param {Pointer<Integer>} pcbIdSize 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-isyncchangeunit-getchangeunitid
     */
    GetChangeUnitId(pbChangeUnitId, pcbIdSize) {
        pbChangeUnitIdMarshal := pbChangeUnitId is VarRef ? "char*" : "ptr"
        pcbIdSizeMarshal := pcbIdSize is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, pbChangeUnitIdMarshal, pbChangeUnitId, pcbIdSizeMarshal, pcbIdSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pbCurrentReplicaId 
     * @param {Pointer<SYNC_VERSION>} pVersion 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-isyncchangeunit-getchangeunitversion
     */
    GetChangeUnitVersion(pbCurrentReplicaId, pVersion) {
        pbCurrentReplicaIdMarshal := pbCurrentReplicaId is VarRef ? "char*" : "ptr"

        result := ComCall(5, this, pbCurrentReplicaIdMarshal, pbCurrentReplicaId, "ptr", pVersion, "HRESULT")
        return result
    }
}
