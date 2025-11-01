#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Security.Authentication.Identity.Provider
 * @version v4.0.30319
 */
class IIdentityStoreEx extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IIdentityStoreEx
     * @type {Guid}
     */
    static IID => Guid("{f9f9eb98-8f7f-4e38-9577-6980114ce32b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateConnectedIdentity", "DeleteConnectedIdentity"]

    /**
     * 
     * @param {PWSTR} LocalName 
     * @param {PWSTR} ConnectedName 
     * @param {Pointer<Guid>} ProviderGUID 
     * @returns {HRESULT} 
     */
    CreateConnectedIdentity(LocalName, ConnectedName, ProviderGUID) {
        LocalName := LocalName is String ? StrPtr(LocalName) : LocalName
        ConnectedName := ConnectedName is String ? StrPtr(ConnectedName) : ConnectedName

        result := ComCall(3, this, "ptr", LocalName, "ptr", ConnectedName, "ptr", ProviderGUID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} ConnectedName 
     * @param {Pointer<Guid>} ProviderGUID 
     * @returns {HRESULT} 
     */
    DeleteConnectedIdentity(ConnectedName, ProviderGUID) {
        ConnectedName := ConnectedName is String ? StrPtr(ConnectedName) : ConnectedName

        result := ComCall(4, this, "ptr", ConnectedName, "ptr", ProviderGUID, "HRESULT")
        return result
    }
}
