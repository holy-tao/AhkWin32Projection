#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Security.Authentication.Identity.Provider
 * @version v4.0.30319
 */
class AsyncIIdentityStoreEx extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for AsyncIIdentityStoreEx
     * @type {Guid}
     */
    static IID => Guid("{fca3af9a-8a07-4eae-8632-ec3de658a36a}")

    /**
     * The class identifier for AsyncIIdentityStoreEx
     * @type {Guid}
     */
    static CLSID => Guid("{fca3af9a-8a07-4eae-8632-ec3de658a36a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Begin_CreateConnectedIdentity", "Finish_CreateConnectedIdentity", "Begin_DeleteConnectedIdentity", "Finish_DeleteConnectedIdentity"]

    /**
     * 
     * @param {PWSTR} LocalName 
     * @param {PWSTR} ConnectedName 
     * @param {Pointer<Guid>} ProviderGUID 
     * @returns {HRESULT} 
     */
    Begin_CreateConnectedIdentity(LocalName, ConnectedName, ProviderGUID) {
        LocalName := LocalName is String ? StrPtr(LocalName) : LocalName
        ConnectedName := ConnectedName is String ? StrPtr(ConnectedName) : ConnectedName

        result := ComCall(3, this, "ptr", LocalName, "ptr", ConnectedName, "ptr", ProviderGUID, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Finish_CreateConnectedIdentity() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} ConnectedName 
     * @param {Pointer<Guid>} ProviderGUID 
     * @returns {HRESULT} 
     */
    Begin_DeleteConnectedIdentity(ConnectedName, ProviderGUID) {
        ConnectedName := ConnectedName is String ? StrPtr(ConnectedName) : ConnectedName

        result := ComCall(5, this, "ptr", ConnectedName, "ptr", ProviderGUID, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Finish_DeleteConnectedIdentity() {
        result := ComCall(6, this, "HRESULT")
        return result
    }
}
