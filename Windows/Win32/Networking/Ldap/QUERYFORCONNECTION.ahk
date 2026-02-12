#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Networking.Ldap
 * @version v4.0.30319
 */
class QUERYFORCONNECTION extends IUnknown {

    static sizeof => A_PtrSize

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Invoke"]

    /**
     * Invokes helper functionality for the IDispatch interface.
     * @param {Pointer<LDAP>} PrimaryConnection 
     * @param {Pointer<LDAP>} ReferralFromConnection 
     * @param {PWSTR} NewDN 
     * @param {PSTR} HostName 
     * @param {Integer} PortNumber 
     * @param {Pointer<Void>} SecAuthIdentity 
     * @param {Pointer<Void>} CurrentUserToken 
     * @param {Pointer<Pointer<LDAP>>} ConnectionToUse 
     * @returns {Integer} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(PrimaryConnection, ReferralFromConnection, NewDN, HostName, PortNumber, SecAuthIdentity, CurrentUserToken, ConnectionToUse) {
        NewDN := NewDN is String ? StrPtr(NewDN) : NewDN
        HostName := HostName is String ? StrPtr(HostName) : HostName

        SecAuthIdentityMarshal := SecAuthIdentity is VarRef ? "ptr" : "ptr"
        CurrentUserTokenMarshal := CurrentUserToken is VarRef ? "ptr" : "ptr"
        ConnectionToUseMarshal := ConnectionToUse is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, "ptr", PrimaryConnection, "ptr", ReferralFromConnection, "ptr", NewDN, "ptr", HostName, "uint", PortNumber, SecAuthIdentityMarshal, SecAuthIdentity, CurrentUserTokenMarshal, CurrentUserToken, ConnectionToUseMarshal, ConnectionToUse, "uint")
        return result
    }
}
