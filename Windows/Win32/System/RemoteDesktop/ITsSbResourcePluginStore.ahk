#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Exposes methods that enable resource plug-ins to store objects such as sessions and targets.
 * @see https://docs.microsoft.com/windows/win32/api//sbtsv/nn-sbtsv-itssbresourcepluginstore
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class ITsSbResourcePluginStore extends IUnknown{
    /**
     * The interface identifier for ITsSbResourcePluginStore
     * @type {Guid}
     */
    static IID => Guid("{5c38f65f-bcf1-4036-a6bf-9e3cccae0b63}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {BSTR} TargetName 
     * @param {BSTR} FarmName 
     * @param {Pointer<ITsSbTarget>} ppTarget 
     * @returns {HRESULT} 
     */
    QueryTarget(TargetName, FarmName, ppTarget) {
        TargetName := TargetName is String ? BSTR.Alloc(TargetName).Value : TargetName
        FarmName := FarmName is String ? BSTR.Alloc(FarmName).Value : FarmName

        result := ComCall(3, this, "ptr", TargetName, "ptr", FarmName, "ptr", ppTarget, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwSessionId 
     * @param {BSTR} TargetName 
     * @param {Pointer<ITsSbSession>} ppSession 
     * @returns {HRESULT} 
     */
    QuerySessionBySessionId(dwSessionId, TargetName, ppSession) {
        TargetName := TargetName is String ? BSTR.Alloc(TargetName).Value : TargetName

        result := ComCall(4, this, "uint", dwSessionId, "ptr", TargetName, "ptr", ppSession, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITsSbTarget>} pTarget 
     * @returns {HRESULT} 
     */
    AddTargetToStore(pTarget) {
        result := ComCall(5, this, "ptr", pTarget, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITsSbSession>} pSession 
     * @returns {HRESULT} 
     */
    AddSessionToStore(pSession) {
        result := ComCall(6, this, "ptr", pSession, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITsSbEnvironment>} pEnvironment 
     * @returns {HRESULT} 
     */
    AddEnvironmentToStore(pEnvironment) {
        result := ComCall(7, this, "ptr", pEnvironment, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} EnvironmentName 
     * @param {BOOL} bIgnoreOwner 
     * @returns {HRESULT} 
     */
    RemoveEnvironmentFromStore(EnvironmentName, bIgnoreOwner) {
        EnvironmentName := EnvironmentName is String ? BSTR.Alloc(EnvironmentName).Value : EnvironmentName

        result := ComCall(8, this, "ptr", EnvironmentName, "int", bIgnoreOwner, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwCount 
     * @param {Pointer<SAFEARRAY>} pVal 
     * @returns {HRESULT} 
     */
    EnumerateFarms(pdwCount, pVal) {
        result := ComCall(9, this, "uint*", pdwCount, "ptr", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} EnvironmentName 
     * @param {Pointer<ITsSbEnvironment>} ppEnvironment 
     * @returns {HRESULT} 
     */
    QueryEnvironment(EnvironmentName, ppEnvironment) {
        EnvironmentName := EnvironmentName is String ? BSTR.Alloc(EnvironmentName).Value : EnvironmentName

        result := ComCall(10, this, "ptr", EnvironmentName, "ptr", ppEnvironment, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwCount 
     * @param {Pointer<ITsSbEnvironment>} pVal 
     * @returns {HRESULT} 
     */
    EnumerateEnvironments(pdwCount, pVal) {
        result := ComCall(11, this, "uint*", pdwCount, "ptr", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITsSbTarget>} pTarget 
     * @param {BOOL} bForceWrite 
     * @returns {HRESULT} 
     */
    SaveTarget(pTarget, bForceWrite) {
        result := ComCall(12, this, "ptr", pTarget, "int", bForceWrite, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITsSbEnvironment>} pEnvironment 
     * @param {BOOL} bForceWrite 
     * @returns {HRESULT} 
     */
    SaveEnvironment(pEnvironment, bForceWrite) {
        result := ComCall(13, this, "ptr", pEnvironment, "int", bForceWrite, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITsSbSession>} pSession 
     * @returns {HRESULT} 
     */
    SaveSession(pSession) {
        result := ComCall(14, this, "ptr", pSession, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} TargetName 
     * @param {BSTR} PropertyName 
     * @param {Pointer<VARIANT>} pProperty 
     * @returns {HRESULT} 
     */
    SetTargetProperty(TargetName, PropertyName, pProperty) {
        TargetName := TargetName is String ? BSTR.Alloc(TargetName).Value : TargetName
        PropertyName := PropertyName is String ? BSTR.Alloc(PropertyName).Value : PropertyName

        result := ComCall(15, this, "ptr", TargetName, "ptr", PropertyName, "ptr", pProperty, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} EnvironmentName 
     * @param {BSTR} PropertyName 
     * @param {Pointer<VARIANT>} pProperty 
     * @returns {HRESULT} 
     */
    SetEnvironmentProperty(EnvironmentName, PropertyName, pProperty) {
        EnvironmentName := EnvironmentName is String ? BSTR.Alloc(EnvironmentName).Value : EnvironmentName
        PropertyName := PropertyName is String ? BSTR.Alloc(PropertyName).Value : PropertyName

        result := ComCall(16, this, "ptr", EnvironmentName, "ptr", PropertyName, "ptr", pProperty, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} targetName 
     * @param {Integer} newState 
     * @param {Pointer<Int32>} pOldState 
     * @returns {HRESULT} 
     */
    SetTargetState(targetName, newState, pOldState) {
        targetName := targetName is String ? BSTR.Alloc(targetName).Value : targetName

        result := ComCall(17, this, "ptr", targetName, "int", newState, "int*", pOldState, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITsSbSession>} sbSession 
     * @returns {HRESULT} 
     */
    SetSessionState(sbSession) {
        result := ComCall(18, this, "ptr", sbSession, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} FarmName 
     * @param {BSTR} EnvName 
     * @param {Integer} sortByFieldId 
     * @param {BSTR} sortyByPropName 
     * @param {Pointer<UInt32>} pdwCount 
     * @param {Pointer<ITsSbTarget>} pVal 
     * @returns {HRESULT} 
     */
    EnumerateTargets(FarmName, EnvName, sortByFieldId, sortyByPropName, pdwCount, pVal) {
        FarmName := FarmName is String ? BSTR.Alloc(FarmName).Value : FarmName
        EnvName := EnvName is String ? BSTR.Alloc(EnvName).Value : EnvName
        sortyByPropName := sortyByPropName is String ? BSTR.Alloc(sortyByPropName).Value : sortyByPropName

        result := ComCall(19, this, "ptr", FarmName, "ptr", EnvName, "int", sortByFieldId, "ptr", sortyByPropName, "uint*", pdwCount, "ptr", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} targetName 
     * @param {BSTR} userName 
     * @param {BSTR} userDomain 
     * @param {BSTR} poolName 
     * @param {BSTR} initialProgram 
     * @param {Pointer<Int32>} pSessionState 
     * @param {Pointer<UInt32>} pdwCount 
     * @param {Pointer<ITsSbSession>} ppVal 
     * @returns {HRESULT} 
     */
    EnumerateSessions(targetName, userName, userDomain, poolName, initialProgram, pSessionState, pdwCount, ppVal) {
        targetName := targetName is String ? BSTR.Alloc(targetName).Value : targetName
        userName := userName is String ? BSTR.Alloc(userName).Value : userName
        userDomain := userDomain is String ? BSTR.Alloc(userDomain).Value : userDomain
        poolName := poolName is String ? BSTR.Alloc(poolName).Value : poolName
        initialProgram := initialProgram is String ? BSTR.Alloc(initialProgram).Value : initialProgram

        result := ComCall(20, this, "ptr", targetName, "ptr", userName, "ptr", userDomain, "ptr", poolName, "ptr", initialProgram, "int*", pSessionState, "uint*", pdwCount, "ptr", ppVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} farmName 
     * @param {BSTR} propertyName 
     * @param {Pointer<VARIANT>} pVarValue 
     * @returns {HRESULT} 
     */
    GetFarmProperty(farmName, propertyName, pVarValue) {
        farmName := farmName is String ? BSTR.Alloc(farmName).Value : farmName
        propertyName := propertyName is String ? BSTR.Alloc(propertyName).Value : propertyName

        result := ComCall(21, this, "ptr", farmName, "ptr", propertyName, "ptr", pVarValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} targetName 
     * @param {BSTR} hostName 
     * @returns {HRESULT} 
     */
    DeleteTarget(targetName, hostName) {
        targetName := targetName is String ? BSTR.Alloc(targetName).Value : targetName
        hostName := hostName is String ? BSTR.Alloc(hostName).Value : hostName

        result := ComCall(22, this, "ptr", targetName, "ptr", hostName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITsSbTarget>} pTarget 
     * @param {BSTR} PropertyName 
     * @param {Pointer<VARIANT>} pProperty 
     * @returns {HRESULT} 
     */
    SetTargetPropertyWithVersionCheck(pTarget, PropertyName, pProperty) {
        PropertyName := PropertyName is String ? BSTR.Alloc(PropertyName).Value : PropertyName

        result := ComCall(23, this, "ptr", pTarget, "ptr", PropertyName, "ptr", pProperty, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITsSbEnvironment>} pEnvironment 
     * @param {BSTR} PropertyName 
     * @param {Pointer<VARIANT>} pProperty 
     * @returns {HRESULT} 
     */
    SetEnvironmentPropertyWithVersionCheck(pEnvironment, PropertyName, pProperty) {
        PropertyName := PropertyName is String ? BSTR.Alloc(PropertyName).Value : PropertyName

        result := ComCall(24, this, "ptr", pEnvironment, "ptr", PropertyName, "ptr", pProperty, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} targetName 
     * @param {Integer} dwTimeout 
     * @param {Pointer<IUnknown>} ppContext 
     * @returns {HRESULT} 
     */
    AcquireTargetLock(targetName, dwTimeout, ppContext) {
        targetName := targetName is String ? BSTR.Alloc(targetName).Value : targetName

        result := ComCall(25, this, "ptr", targetName, "uint", dwTimeout, "ptr", ppContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} pContext 
     * @returns {HRESULT} 
     */
    ReleaseTargetLock(pContext) {
        result := ComCall(26, this, "ptr", pContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} PoolName 
     * @param {BSTR} ServerFQDN 
     * @param {Integer} NewState 
     * @param {Integer} TestState 
     * @param {Pointer<Int32>} pInitState 
     * @returns {HRESULT} 
     */
    TestAndSetServerState(PoolName, ServerFQDN, NewState, TestState, pInitState) {
        PoolName := PoolName is String ? BSTR.Alloc(PoolName).Value : PoolName
        ServerFQDN := ServerFQDN is String ? BSTR.Alloc(ServerFQDN).Value : ServerFQDN

        result := ComCall(27, this, "ptr", PoolName, "ptr", ServerFQDN, "int", NewState, "int", TestState, "int*", pInitState, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} PoolName 
     * @param {BSTR} serverName 
     * @returns {HRESULT} 
     */
    SetServerWaitingToStart(PoolName, serverName) {
        PoolName := PoolName is String ? BSTR.Alloc(PoolName).Value : PoolName
        serverName := serverName is String ? BSTR.Alloc(serverName).Value : serverName

        result := ComCall(28, this, "ptr", PoolName, "ptr", serverName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} PoolName 
     * @param {BSTR} ServerFQDN 
     * @param {Pointer<Int32>} pState 
     * @returns {HRESULT} 
     */
    GetServerState(PoolName, ServerFQDN, pState) {
        PoolName := PoolName is String ? BSTR.Alloc(PoolName).Value : PoolName
        ServerFQDN := ServerFQDN is String ? BSTR.Alloc(ServerFQDN).Value : ServerFQDN

        result := ComCall(29, this, "ptr", PoolName, "ptr", ServerFQDN, "int*", pState, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} ServerFQDN 
     * @param {Integer} DrainMode 
     * @returns {HRESULT} 
     */
    SetServerDrainMode(ServerFQDN, DrainMode) {
        ServerFQDN := ServerFQDN is String ? BSTR.Alloc(ServerFQDN).Value : ServerFQDN

        result := ComCall(30, this, "ptr", ServerFQDN, "uint", DrainMode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
