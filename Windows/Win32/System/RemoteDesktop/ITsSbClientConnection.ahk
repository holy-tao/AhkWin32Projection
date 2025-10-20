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
     * 
     * @param {Pointer<BSTR>} pVal 
     * @returns {HRESULT} 
     */
    get_UserName(pVal) {
        result := ComCall(3, this, "ptr", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pVal 
     * @returns {HRESULT} 
     */
    get_Domain(pVal) {
        result := ComCall(4, this, "ptr", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pVal 
     * @returns {HRESULT} 
     */
    get_InitialProgram(pVal) {
        result := ComCall(5, this, "ptr", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITsSbLoadBalanceResult>} ppVal 
     * @returns {HRESULT} 
     */
    get_LoadBalanceResult(ppVal) {
        result := ComCall(6, this, "ptr", ppVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pVal 
     * @returns {HRESULT} 
     */
    get_FarmName(pVal) {
        result := ComCall(7, this, "ptr", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} contextId 
     * @param {VARIANT} context 
     * @param {Pointer<VARIANT>} existingContext 
     * @returns {HRESULT} 
     */
    PutContext(contextId, context, existingContext) {
        contextId := contextId is String ? BSTR.Alloc(contextId).Value : contextId

        result := ComCall(8, this, "ptr", contextId, "ptr", context, "ptr", existingContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} contextId 
     * @param {Pointer<VARIANT>} context 
     * @returns {HRESULT} 
     */
    GetContext(contextId, context) {
        contextId := contextId is String ? BSTR.Alloc(contextId).Value : contextId

        result := ComCall(9, this, "ptr", contextId, "ptr", context, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITsSbEnvironment>} ppEnvironment 
     * @returns {HRESULT} 
     */
    get_Environment(ppEnvironment) {
        result := ComCall(10, this, "ptr", ppEnvironment, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    get_ConnectionError() {
        result := ComCall(11, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pVal 
     * @returns {HRESULT} 
     */
    get_SamUserAccount(pVal) {
        result := ComCall(12, this, "ptr", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITsSbClientConnectionPropertySet>} ppPropertySet 
     * @returns {HRESULT} 
     */
    get_ClientConnectionPropertySet(ppPropertySet) {
        result := ComCall(13, this, "ptr", ppPropertySet, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} ppVal 
     * @returns {HRESULT} 
     */
    get_IsFirstAssignment(ppVal) {
        result := ComCall(14, this, "ptr", ppVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pRdFarmType 
     * @returns {HRESULT} 
     */
    get_RdFarmType(pRdFarmType) {
        result := ComCall(15, this, "int*", pRdFarmType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SByte>} pszUserSidString 
     * @returns {HRESULT} 
     */
    get_UserSidString(pszUserSidString) {
        result := ComCall(16, this, "char*", pszUserSidString, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITsSbSession>} ppSession 
     * @returns {HRESULT} 
     */
    GetDisconnectedSession(ppSession) {
        result := ComCall(17, this, "ptr", ppSession, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
