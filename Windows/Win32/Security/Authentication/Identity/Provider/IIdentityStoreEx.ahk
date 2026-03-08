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
     * Deletes the user credential used for the connected identity.
     * @param {PWSTR} ConnectedName 
     * @param {Pointer<Guid>} ProviderGUID 
     * @returns {HRESULT} If the function succeeds, the function returns SEC\_E\_OK.
     * 
     * If the function fails, the function may return one of the following error codes.
     * 
     * 
     * 
     * | Return value                                                                                               | Description                                                                                                                                                 |
     * |------------------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------|
     * | <dl> <dt>STATUS\_INVALID\_PARAMETER</dt> </dl>      | A parameter is not valid.<br/>                                                                                                                        |
     * | <dl> <dt>STATUS\_NO\_SUCH\_USER</dt> </dl>          | The user identified by *UserSid* does not exist, is not currently connected, or there is no identity whose user name matches *IdentityUserName*.<br/> |
     * | <dl> <dt>STATUS\_INSUFFICIENT\_RESOURCES</dt> </dl> | There is not enough memory to process the request.<br/>                                                                                               |
     * @see https://learn.microsoft.com/windows/win32/SecAuthN/deleteconnectedidentity
     */
    DeleteConnectedIdentity(ConnectedName, ProviderGUID) {
        ConnectedName := ConnectedName is String ? StrPtr(ConnectedName) : ConnectedName

        result := ComCall(4, this, "ptr", ConnectedName, "ptr", ProviderGUID, "HRESULT")
        return result
    }
}
