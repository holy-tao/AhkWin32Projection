#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Contacts
 * @version v4.0.30319
 */
class IContactAggregationContact extends IUnknown{
    /**
     * The interface identifier for IContactAggregationContact
     * @type {Guid}
     */
    static IID => Guid("{1eb22e86-4c86-41f0-9f9f-c251e9fda6c3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @returns {HRESULT} 
     */
    Delete() {
        result := ComCall(3, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Save() {
        result := ComCall(4, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pAggregateId 
     * @returns {HRESULT} 
     */
    MoveToAggregate(pAggregateId) {
        pAggregateId := pAggregateId is String ? StrPtr(pAggregateId) : pAggregateId

        result := ComCall(5, this, "ptr", pAggregateId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Unlink() {
        result := ComCall(6, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppAccountId 
     * @returns {HRESULT} 
     */
    get_AccountId(ppAccountId) {
        result := ComCall(7, this, "ptr", ppAccountId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pAccountId 
     * @returns {HRESULT} 
     */
    put_AccountId(pAccountId) {
        pAccountId := pAccountId is String ? StrPtr(pAccountId) : pAccountId

        result := ComCall(8, this, "ptr", pAccountId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppAggregateId 
     * @returns {HRESULT} 
     */
    get_AggregateId(ppAggregateId) {
        result := ComCall(9, this, "ptr", ppAggregateId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppItemId 
     * @returns {HRESULT} 
     */
    get_Id(ppItemId) {
        result := ComCall(10, this, "ptr", ppItemId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pIsMe 
     * @returns {HRESULT} 
     */
    get_IsMe(pIsMe) {
        result := ComCall(11, this, "ptr", pIsMe, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pIsExternal 
     * @returns {HRESULT} 
     */
    get_IsExternal(pIsExternal) {
        result := ComCall(12, this, "ptr", pIsExternal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pNetworkSourceId 
     * @returns {HRESULT} 
     */
    get_NetworkSourceId(pNetworkSourceId) {
        result := ComCall(13, this, "uint*", pNetworkSourceId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} networkSourceId 
     * @returns {HRESULT} 
     */
    put_NetworkSourceId(networkSourceId) {
        result := ComCall(14, this, "uint", networkSourceId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppNetworkSourceId 
     * @returns {HRESULT} 
     */
    get_NetworkSourceIdString(ppNetworkSourceId) {
        result := ComCall(15, this, "ptr", ppNetworkSourceId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pNetworkSourceId 
     * @returns {HRESULT} 
     */
    put_NetworkSourceIdString(pNetworkSourceId) {
        pNetworkSourceId := pNetworkSourceId is String ? StrPtr(pNetworkSourceId) : pNetworkSourceId

        result := ComCall(16, this, "ptr", pNetworkSourceId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<CONTACT_AGGREGATION_BLOB>} ppRemoteObjectId 
     * @returns {HRESULT} 
     */
    get_RemoteObjectId(ppRemoteObjectId) {
        result := ComCall(17, this, "ptr", ppRemoteObjectId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<CONTACT_AGGREGATION_BLOB>} pRemoteObjectId 
     * @returns {HRESULT} 
     */
    put_RemoteObjectId(pRemoteObjectId) {
        result := ComCall(18, this, "ptr", pRemoteObjectId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<CONTACT_AGGREGATION_BLOB>} ppSyncIdentityHash 
     * @returns {HRESULT} 
     */
    get_SyncIdentityHash(ppSyncIdentityHash) {
        result := ComCall(19, this, "ptr", ppSyncIdentityHash, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<CONTACT_AGGREGATION_BLOB>} pSyncIdentityHash 
     * @returns {HRESULT} 
     */
    put_SyncIdentityHash(pSyncIdentityHash) {
        result := ComCall(20, this, "ptr", pSyncIdentityHash, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
