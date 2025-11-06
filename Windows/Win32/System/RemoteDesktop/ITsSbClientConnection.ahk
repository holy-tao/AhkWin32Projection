#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\ITsSbLoadBalanceResult.ahk
#Include ..\Variant\VARIANT.ahk
#Include .\ITsSbEnvironment.ahk
#Include .\ITsSbClientConnectionPropertySet.ahk
#Include .\ITsSbSession.ahk
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
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbclientconnection-get_username
     */
    get_UserName() {
        pVal := BSTR()
        result := ComCall(3, this, "ptr", pVal, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbclientconnection-get_domain
     */
    get_Domain() {
        pVal := BSTR()
        result := ComCall(4, this, "ptr", pVal, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbclientconnection-get_initialprogram
     */
    get_InitialProgram() {
        pVal := BSTR()
        result := ComCall(5, this, "ptr", pVal, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {ITsSbLoadBalanceResult} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbclientconnection-get_loadbalanceresult
     */
    get_LoadBalanceResult() {
        result := ComCall(6, this, "ptr*", &ppVal := 0, "HRESULT")
        return ITsSbLoadBalanceResult(ppVal)
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbclientconnection-get_farmname
     */
    get_FarmName() {
        pVal := BSTR()
        result := ComCall(7, this, "ptr", pVal, "HRESULT")
        return pVal
    }

    /**
     * 
     * @param {BSTR} contextId 
     * @param {VARIANT} context 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbclientconnection-putcontext
     */
    PutContext(contextId, context) {
        contextId := contextId is String ? BSTR.Alloc(contextId).Value : contextId

        existingContext := VARIANT()
        result := ComCall(8, this, "ptr", contextId, "ptr", context, "ptr", existingContext, "HRESULT")
        return existingContext
    }

    /**
     * 
     * @param {BSTR} contextId 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbclientconnection-getcontext
     */
    GetContext(contextId) {
        contextId := contextId is String ? BSTR.Alloc(contextId).Value : contextId

        context := VARIANT()
        result := ComCall(9, this, "ptr", contextId, "ptr", context, "HRESULT")
        return context
    }

    /**
     * 
     * @returns {ITsSbEnvironment} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbclientconnection-get_environment
     */
    get_Environment() {
        result := ComCall(10, this, "ptr*", &ppEnvironment := 0, "HRESULT")
        return ITsSbEnvironment(ppEnvironment)
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
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbclientconnection-get_samuseraccount
     */
    get_SamUserAccount() {
        pVal := BSTR()
        result := ComCall(12, this, "ptr", pVal, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {ITsSbClientConnectionPropertySet} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbclientconnection-get_clientconnectionpropertyset
     */
    get_ClientConnectionPropertySet() {
        result := ComCall(13, this, "ptr*", &ppPropertySet := 0, "HRESULT")
        return ITsSbClientConnectionPropertySet(ppPropertySet)
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbclientconnection-get_isfirstassignment
     */
    get_IsFirstAssignment() {
        result := ComCall(14, this, "int*", &ppVal := 0, "HRESULT")
        return ppVal
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbclientconnection-get_rdfarmtype
     */
    get_RdFarmType() {
        result := ComCall(15, this, "int*", &pRdFarmType := 0, "HRESULT")
        return pRdFarmType
    }

    /**
     * 
     * @returns {Pointer<Integer>} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbclientconnection-get_usersidstring
     */
    get_UserSidString() {
        result := ComCall(16, this, "ptr*", &pszUserSidString := 0, "HRESULT")
        return pszUserSidString
    }

    /**
     * 
     * @returns {ITsSbSession} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbclientconnection-getdisconnectedsession
     */
    GetDisconnectedSession() {
        result := ComCall(17, this, "ptr*", &ppSession := 0, "HRESULT")
        return ITsSbSession(ppSession)
    }
}
