#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Adds entries to an IReplicaKeyMap object.
 * @remarks
 * 
  * An <b>IConstructReplicaKeyMap</b> object can be obtained by passing <b>IID_IConstructReplicaKeyMap</b> to the <b>QueryInterface</b> method of an <b>IReplicaKeyMap</b> object.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//winsync/nn-winsync-iconstructreplicakeymap
 * @namespace Windows.Win32.System.WindowsSync
 * @version v4.0.30319
 */
class IConstructReplicaKeyMap extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IConstructReplicaKeyMap
     * @type {Guid}
     */
    static IID => Guid("{ded10970-ec85-4115-b52c-4405845642a5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["FindOrAddReplica"]

    /**
     * 
     * @param {Pointer<Integer>} pbReplicaId 
     * @param {Pointer<Integer>} pdwReplicaKey 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/winsync/nf-winsync-iconstructreplicakeymap-findoraddreplica
     */
    FindOrAddReplica(pbReplicaId, pdwReplicaKey) {
        pbReplicaIdMarshal := pbReplicaId is VarRef ? "char*" : "ptr"
        pdwReplicaKeyMarshal := pdwReplicaKey is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, pbReplicaIdMarshal, pbReplicaId, pdwReplicaKeyMarshal, pdwReplicaKey, "HRESULT")
        return result
    }
}
