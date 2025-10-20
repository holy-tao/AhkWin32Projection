#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Represents a mapping between replica keys and replica IDs.
 * @remarks
 * 
  * Because replica IDs repeatedly occur in the metadata for a replica and are suggested to be 16-byte GUIDs, Windows Sync represents replica IDs by using a map between replica IDs to 4-byte replica keys. Windows Sync then uses replica keys where references to particular replicas are required.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//winsync/nn-winsync-ireplicakeymap
 * @namespace Windows.Win32.System.WindowsSync
 * @version v4.0.30319
 */
class IReplicaKeyMap extends IUnknown{
    /**
     * The interface identifier for IReplicaKeyMap
     * @type {Guid}
     */
    static IID => Guid("{2209f4fc-fd10-4ff0-84a8-f0a1982e440e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<Byte>} pbReplicaId 
     * @param {Pointer<UInt32>} pdwReplicaKey 
     * @returns {HRESULT} 
     */
    LookupReplicaKey(pbReplicaId, pdwReplicaKey) {
        result := ComCall(3, this, "char*", pbReplicaId, "uint*", pdwReplicaKey, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwReplicaKey 
     * @param {Pointer<Byte>} pbReplicaId 
     * @param {Pointer<UInt32>} pcbIdSize 
     * @returns {HRESULT} 
     */
    LookupReplicaId(dwReplicaKey, pbReplicaId, pcbIdSize) {
        result := ComCall(4, this, "uint", dwReplicaKey, "char*", pbReplicaId, "uint*", pcbIdSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Byte>} pbReplicaKeyMap 
     * @param {Pointer<UInt32>} pcbReplicaKeyMap 
     * @returns {HRESULT} 
     */
    Serialize(pbReplicaKeyMap, pcbReplicaKeyMap) {
        result := ComCall(5, this, "char*", pbReplicaKeyMap, "uint*", pcbReplicaKeyMap, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
