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
     * 
     * @param {Pointer<ISyncChange>} ppSyncChange 
     * @returns {HRESULT} 
     */
    GetItemChange(ppSyncChange) {
        result := ComCall(3, this, "ptr", ppSyncChange, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Byte>} pbChangeUnitId 
     * @param {Pointer<UInt32>} pcbIdSize 
     * @returns {HRESULT} 
     */
    GetChangeUnitId(pbChangeUnitId, pcbIdSize) {
        result := ComCall(4, this, "char*", pbChangeUnitId, "uint*", pcbIdSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Byte>} pbCurrentReplicaId 
     * @param {Pointer<SYNC_VERSION>} pVersion 
     * @returns {HRESULT} 
     */
    GetChangeUnitVersion(pbCurrentReplicaId, pVersion) {
        result := ComCall(5, this, "char*", pbCurrentReplicaId, "ptr", pVersion, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
