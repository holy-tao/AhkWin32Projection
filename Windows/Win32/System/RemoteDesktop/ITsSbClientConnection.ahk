#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Exposes methods and properties that store state information about an incoming connection request from a Remote Desktop Connection (RDC) client.
 * @see https://docs.microsoft.com/windows/win32/api//sbtsv/nn-sbtsv-itssbclientconnection
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class ITsSbClientConnection extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITsSbClientConnection
     * @type {Guid}
     */
    static IID => Guid("{18857499-ad61-4b1b-b7df-cbcd41fb8338}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_UserName", "get_Domain", "get_InitialProgram", "get_LoadBalanceResult", "get_FarmName", "PutContext", "GetContext", "get_Environment", "get_ConnectionError", "get_SamUserAccount", "get_ClientConnectionPropertySet", "get_IsFirstAssignment", "get_RdFarmType", "get_UserSidString", "GetDisconnectedSession"]

    /**
     * 
     * @param {Pointer<BSTR>} pVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbclientconnection-get_username
     */
    get_UserName(pVal) {
        result := ComCall(3, this, "ptr", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbclientconnection-get_domain
     */
    get_Domain(pVal) {
        result := ComCall(4, this, "ptr", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbclientconnection-get_initialprogram
     */
    get_InitialProgram(pVal) {
        result := ComCall(5, this, "ptr", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ITsSbLoadBalanceResult>} ppVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbclientconnection-get_loadbalanceresult
     */
    get_LoadBalanceResult(ppVal) {
        result := ComCall(6, this, "ptr*", ppVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbclientconnection-get_farmname
     */
    get_FarmName(pVal) {
        result := ComCall(7, this, "ptr", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} contextId 
     * @param {VARIANT} context 
     * @param {Pointer<VARIANT>} existingContext 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbclientconnection-putcontext
     */
    PutContext(contextId, context, existingContext) {
        contextId := contextId is String ? BSTR.Alloc(contextId).Value : contextId

        result := ComCall(8, this, "ptr", contextId, "ptr", context, "ptr", existingContext, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} contextId 
     * @param {Pointer<VARIANT>} context 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbclientconnection-getcontext
     */
    GetContext(contextId, context) {
        contextId := contextId is String ? BSTR.Alloc(contextId).Value : contextId

        result := ComCall(9, this, "ptr", contextId, "ptr", context, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ITsSbEnvironment>} ppEnvironment 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbclientconnection-get_environment
     */
    get_Environment(ppEnvironment) {
        result := ComCall(10, this, "ptr*", ppEnvironment, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbclientconnection-get_connectionerror
     */
    get_ConnectionError() {
        result := ComCall(11, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbclientconnection-get_samuseraccount
     */
    get_SamUserAccount(pVal) {
        result := ComCall(12, this, "ptr", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ITsSbClientConnectionPropertySet>} ppPropertySet 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbclientconnection-get_clientconnectionpropertyset
     */
    get_ClientConnectionPropertySet(ppPropertySet) {
        result := ComCall(13, this, "ptr*", ppPropertySet, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} ppVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbclientconnection-get_isfirstassignment
     */
    get_IsFirstAssignment(ppVal) {
        result := ComCall(14, this, "ptr", ppVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pRdFarmType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbclientconnection-get_rdfarmtype
     */
    get_RdFarmType(pRdFarmType) {
        result := ComCall(15, this, "int*", pRdFarmType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<Integer>>} pszUserSidString 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbclientconnection-get_usersidstring
     */
    get_UserSidString(pszUserSidString) {
        result := ComCall(16, this, "ptr*", pszUserSidString, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ITsSbSession>} ppSession 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbclientconnection-getdisconnectedsession
     */
    GetDisconnectedSession(ppSession) {
        result := ComCall(17, this, "ptr*", ppSession, "HRESULT")
        return result
    }
}
