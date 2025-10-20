#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Represents knowledge that a replica has about its item store.
 * @remarks
 * 
  * Be aware that there is no single representation of knowledge. Equivalent knowledge might be represented in different forms and return different values from knowledge inspection methods, such as <b>GetScopeVector</b>, <b>GetRangeExceptions</b>, <b>GetSingleItemExceptions</b>, <b>GetChangeUnitExceptions</b>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//winsync/nn-winsync-isyncknowledge
 * @namespace Windows.Win32.System.WindowsSync
 * @version v4.0.30319
 */
class ISyncKnowledge extends IUnknown{
    /**
     * The interface identifier for ISyncKnowledge
     * @type {Guid}
     */
    static IID => Guid("{615bbb53-c945-4203-bf4b-2cb65919a0aa}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<Byte>} pbReplicaId 
     * @param {Pointer<UInt32>} pcbIdSize 
     * @returns {HRESULT} 
     */
    GetOwnerReplicaId(pbReplicaId, pcbIdSize) {
        result := ComCall(3, this, "char*", pbReplicaId, "uint*", pcbIdSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} fSerializeReplicaKeyMap 
     * @param {Pointer<Byte>} pbKnowledge 
     * @param {Pointer<UInt32>} pcbKnowledge 
     * @returns {HRESULT} 
     */
    Serialize(fSerializeReplicaKeyMap, pbKnowledge, pcbKnowledge) {
        result := ComCall(4, this, "int", fSerializeReplicaKeyMap, "char*", pbKnowledge, "uint*", pcbKnowledge, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ullTickCount 
     * @returns {HRESULT} 
     */
    SetLocalTickCount(ullTickCount) {
        result := ComCall(5, this, "uint", ullTickCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Byte>} pbVersionOwnerReplicaId 
     * @param {Pointer<Byte>} pgidItemId 
     * @param {Pointer<SYNC_VERSION>} pSyncVersion 
     * @returns {HRESULT} 
     */
    ContainsChange(pbVersionOwnerReplicaId, pgidItemId, pSyncVersion) {
        result := ComCall(6, this, "char*", pbVersionOwnerReplicaId, "char*", pgidItemId, "ptr", pSyncVersion, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Byte>} pbVersionOwnerReplicaId 
     * @param {Pointer<Byte>} pbItemId 
     * @param {Pointer<Byte>} pbChangeUnitId 
     * @param {Pointer<SYNC_VERSION>} pSyncVersion 
     * @returns {HRESULT} 
     */
    ContainsChangeUnit(pbVersionOwnerReplicaId, pbItemId, pbChangeUnitId, pSyncVersion) {
        result := ComCall(7, this, "char*", pbVersionOwnerReplicaId, "char*", pbItemId, "char*", pbChangeUnitId, "ptr", pSyncVersion, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} ppUnk 
     * @returns {HRESULT} 
     */
    GetScopeVector(riid, ppUnk) {
        result := ComCall(8, this, "ptr", riid, "ptr", ppUnk, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IReplicaKeyMap>} ppReplicaKeyMap 
     * @returns {HRESULT} 
     */
    GetReplicaKeyMap(ppReplicaKeyMap) {
        result := ComCall(9, this, "ptr", ppReplicaKeyMap, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISyncKnowledge>} ppClonedKnowledge 
     * @returns {HRESULT} 
     */
    Clone(ppClonedKnowledge) {
        result := ComCall(10, this, "ptr", ppClonedKnowledge, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISyncKnowledge>} pKnowledgeIn 
     * @param {Pointer<Byte>} pbCurrentOwnerId 
     * @param {Pointer<SYNC_VERSION>} pVersionIn 
     * @param {Pointer<Byte>} pbNewOwnerId 
     * @param {Pointer<UInt32>} pcbIdSize 
     * @param {Pointer<SYNC_VERSION>} pVersionOut 
     * @returns {HRESULT} 
     */
    ConvertVersion(pKnowledgeIn, pbCurrentOwnerId, pVersionIn, pbNewOwnerId, pcbIdSize, pVersionOut) {
        result := ComCall(11, this, "ptr", pKnowledgeIn, "char*", pbCurrentOwnerId, "ptr", pVersionIn, "char*", pbNewOwnerId, "uint*", pcbIdSize, "ptr", pVersionOut, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISyncKnowledge>} pRemoteKnowledge 
     * @param {Pointer<ISyncKnowledge>} ppMappedKnowledge 
     * @returns {HRESULT} 
     */
    MapRemoteToLocal(pRemoteKnowledge, ppMappedKnowledge) {
        result := ComCall(12, this, "ptr", pRemoteKnowledge, "ptr", ppMappedKnowledge, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISyncKnowledge>} pKnowledge 
     * @returns {HRESULT} 
     */
    Union(pKnowledge) {
        result := ComCall(13, this, "ptr", pKnowledge, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Byte>} pbItemId 
     * @param {Pointer<ISyncKnowledge>} ppKnowledgeOut 
     * @returns {HRESULT} 
     */
    ProjectOntoItem(pbItemId, ppKnowledgeOut) {
        result := ComCall(14, this, "char*", pbItemId, "ptr", ppKnowledgeOut, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Byte>} pbItemId 
     * @param {Pointer<Byte>} pbChangeUnitId 
     * @param {Pointer<ISyncKnowledge>} ppKnowledgeOut 
     * @returns {HRESULT} 
     */
    ProjectOntoChangeUnit(pbItemId, pbChangeUnitId, ppKnowledgeOut) {
        result := ComCall(15, this, "char*", pbItemId, "char*", pbChangeUnitId, "ptr", ppKnowledgeOut, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SYNC_RANGE>} psrngSyncRange 
     * @param {Pointer<ISyncKnowledge>} ppKnowledgeOut 
     * @returns {HRESULT} 
     */
    ProjectOntoRange(psrngSyncRange, ppKnowledgeOut) {
        result := ComCall(16, this, "ptr", psrngSyncRange, "ptr", ppKnowledgeOut, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Byte>} pbItemId 
     * @returns {HRESULT} 
     */
    ExcludeItem(pbItemId) {
        result := ComCall(17, this, "char*", pbItemId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Byte>} pbItemId 
     * @param {Pointer<Byte>} pbChangeUnitId 
     * @returns {HRESULT} 
     */
    ExcludeChangeUnit(pbItemId, pbChangeUnitId) {
        result := ComCall(18, this, "char*", pbItemId, "char*", pbChangeUnitId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISyncKnowledge>} pKnowledge 
     * @returns {HRESULT} 
     */
    ContainsKnowledge(pKnowledge) {
        result := ComCall(19, this, "ptr", pKnowledge, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Byte>} pbReplicaId 
     * @param {Pointer<UInt64>} pullReplicaTickCount 
     * @returns {HRESULT} 
     */
    FindMinTickCountForReplica(pbReplicaId, pullReplicaTickCount) {
        result := ComCall(20, this, "char*", pbReplicaId, "uint*", pullReplicaTickCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} ppUnk 
     * @returns {HRESULT} 
     */
    GetRangeExceptions(riid, ppUnk) {
        result := ComCall(21, this, "ptr", riid, "ptr", ppUnk, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} ppUnk 
     * @returns {HRESULT} 
     */
    GetSingleItemExceptions(riid, ppUnk) {
        result := ComCall(22, this, "ptr", riid, "ptr", ppUnk, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} ppUnk 
     * @returns {HRESULT} 
     */
    GetChangeUnitExceptions(riid, ppUnk) {
        result := ComCall(23, this, "ptr", riid, "ptr", ppUnk, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Byte>} pbItemId 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} ppUnk 
     * @returns {HRESULT} 
     */
    FindClockVectorForItem(pbItemId, riid, ppUnk) {
        result := ComCall(24, this, "char*", pbItemId, "ptr", riid, "ptr", ppUnk, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Byte>} pbItemId 
     * @param {Pointer<Byte>} pbChangeUnitId 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} ppUnk 
     * @returns {HRESULT} 
     */
    FindClockVectorForChangeUnit(pbItemId, pbChangeUnitId, riid, ppUnk) {
        result := ComCall(25, this, "char*", pbItemId, "char*", pbChangeUnitId, "ptr", riid, "ptr", ppUnk, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * With the release of Windows 8.1, the behavior of the GetVersion API has changed in the value it will return for the operating system version. The value returned by the GetVersion function now depends on how the application is manifested.
     * @param {Pointer<UInt32>} pdwVersion 
     * @returns {HRESULT} If the function succeeds, the return value includes the major and minor version numbers of the operating system in the low-order word, and information about the operating system platform in the high-order word.
     * 
     * For all platforms, the low-order word contains the version number of the operating system. The low-order byte of this word specifies the major version number, in hexadecimal notation. The high-order byte specifies the minor version (revision) number, in hexadecimal notation. The  high-order bit is zero, the next 7 bits represent the build number, and the low-order byte is 5.
     * @see https://docs.microsoft.com/windows/win32/api//sysinfoapi/nf-sysinfoapi-getversion
     */
    GetVersion(pdwVersion) {
        result := ComCall(26, this, "uint*", pdwVersion, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
