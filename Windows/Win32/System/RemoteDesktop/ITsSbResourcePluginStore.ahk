#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\ITsSbTarget.ahk
#Include .\ITsSbSession.ahk
#Include .\ITsSbEnvironment.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Exposes methods that enable resource plug-ins to store objects such as sessions and targets.
 * @see https://docs.microsoft.com/windows/win32/api//sbtsv/nn-sbtsv-itssbresourcepluginstore
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class ITsSbResourcePluginStore extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["QueryTarget", "QuerySessionBySessionId", "AddTargetToStore", "AddSessionToStore", "AddEnvironmentToStore", "RemoveEnvironmentFromStore", "EnumerateFarms", "QueryEnvironment", "EnumerateEnvironments", "SaveTarget", "SaveEnvironment", "SaveSession", "SetTargetProperty", "SetEnvironmentProperty", "SetTargetState", "SetSessionState", "EnumerateTargets", "EnumerateSessions", "GetFarmProperty", "DeleteTarget", "SetTargetPropertyWithVersionCheck", "SetEnvironmentPropertyWithVersionCheck", "AcquireTargetLock", "ReleaseTargetLock", "TestAndSetServerState", "SetServerWaitingToStart", "GetServerState", "SetServerDrainMode"]

    /**
     * 
     * @param {BSTR} TargetName 
     * @param {BSTR} FarmName 
     * @returns {ITsSbTarget} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbresourcepluginstore-querytarget
     */
    QueryTarget(TargetName, FarmName) {
        TargetName := TargetName is String ? BSTR.Alloc(TargetName).Value : TargetName
        FarmName := FarmName is String ? BSTR.Alloc(FarmName).Value : FarmName

        result := ComCall(3, this, "ptr", TargetName, "ptr", FarmName, "ptr*", &ppTarget := 0, "HRESULT")
        return ITsSbTarget(ppTarget)
    }

    /**
     * 
     * @param {Integer} dwSessionId 
     * @param {BSTR} TargetName 
     * @returns {ITsSbSession} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbresourcepluginstore-querysessionbysessionid
     */
    QuerySessionBySessionId(dwSessionId, TargetName) {
        TargetName := TargetName is String ? BSTR.Alloc(TargetName).Value : TargetName

        result := ComCall(4, this, "uint", dwSessionId, "ptr", TargetName, "ptr*", &ppSession := 0, "HRESULT")
        return ITsSbSession(ppSession)
    }

    /**
     * 
     * @param {ITsSbTarget} pTarget 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbresourcepluginstore-addtargettostore
     */
    AddTargetToStore(pTarget) {
        result := ComCall(5, this, "ptr", pTarget, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ITsSbSession} pSession 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbresourcepluginstore-addsessiontostore
     */
    AddSessionToStore(pSession) {
        result := ComCall(6, this, "ptr", pSession, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ITsSbEnvironment} pEnvironment 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbresourcepluginstore-addenvironmenttostore
     */
    AddEnvironmentToStore(pEnvironment) {
        result := ComCall(7, this, "ptr", pEnvironment, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} EnvironmentName 
     * @param {BOOL} bIgnoreOwner 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbresourcepluginstore-removeenvironmentfromstore
     */
    RemoveEnvironmentFromStore(EnvironmentName, bIgnoreOwner) {
        EnvironmentName := EnvironmentName is String ? BSTR.Alloc(EnvironmentName).Value : EnvironmentName

        result := ComCall(8, this, "ptr", EnvironmentName, "int", bIgnoreOwner, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwCount 
     * @param {Pointer<Pointer<SAFEARRAY>>} pVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbresourcepluginstore-enumeratefarms
     */
    EnumerateFarms(pdwCount, pVal) {
        pdwCountMarshal := pdwCount is VarRef ? "uint*" : "ptr"
        pValMarshal := pVal is VarRef ? "ptr*" : "ptr"

        result := ComCall(9, this, pdwCountMarshal, pdwCount, pValMarshal, pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} EnvironmentName 
     * @returns {ITsSbEnvironment} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbresourcepluginstore-queryenvironment
     */
    QueryEnvironment(EnvironmentName) {
        EnvironmentName := EnvironmentName is String ? BSTR.Alloc(EnvironmentName).Value : EnvironmentName

        result := ComCall(10, this, "ptr", EnvironmentName, "ptr*", &ppEnvironment := 0, "HRESULT")
        return ITsSbEnvironment(ppEnvironment)
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwCount 
     * @returns {Pointer<ITsSbEnvironment>} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbresourcepluginstore-enumerateenvironments
     */
    EnumerateEnvironments(pdwCount) {
        pdwCountMarshal := pdwCount is VarRef ? "uint*" : "ptr"

        result := ComCall(11, this, pdwCountMarshal, pdwCount, "ptr*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @param {ITsSbTarget} pTarget 
     * @param {BOOL} bForceWrite 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbresourcepluginstore-savetarget
     */
    SaveTarget(pTarget, bForceWrite) {
        result := ComCall(12, this, "ptr", pTarget, "int", bForceWrite, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ITsSbEnvironment} pEnvironment 
     * @param {BOOL} bForceWrite 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbresourcepluginstore-saveenvironment
     */
    SaveEnvironment(pEnvironment, bForceWrite) {
        result := ComCall(13, this, "ptr", pEnvironment, "int", bForceWrite, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ITsSbSession} pSession 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbresourcepluginstore-savesession
     */
    SaveSession(pSession) {
        result := ComCall(14, this, "ptr", pSession, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} TargetName 
     * @param {BSTR} PropertyName 
     * @param {Pointer<VARIANT>} pProperty 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbresourcepluginstore-settargetproperty
     */
    SetTargetProperty(TargetName, PropertyName, pProperty) {
        TargetName := TargetName is String ? BSTR.Alloc(TargetName).Value : TargetName
        PropertyName := PropertyName is String ? BSTR.Alloc(PropertyName).Value : PropertyName

        result := ComCall(15, this, "ptr", TargetName, "ptr", PropertyName, "ptr", pProperty, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} EnvironmentName 
     * @param {BSTR} PropertyName 
     * @param {Pointer<VARIANT>} pProperty 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbresourcepluginstore-setenvironmentproperty
     */
    SetEnvironmentProperty(EnvironmentName, PropertyName, pProperty) {
        EnvironmentName := EnvironmentName is String ? BSTR.Alloc(EnvironmentName).Value : EnvironmentName
        PropertyName := PropertyName is String ? BSTR.Alloc(PropertyName).Value : PropertyName

        result := ComCall(16, this, "ptr", EnvironmentName, "ptr", PropertyName, "ptr", pProperty, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} targetName 
     * @param {Integer} newState 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbresourcepluginstore-settargetstate
     */
    SetTargetState(targetName, newState) {
        targetName := targetName is String ? BSTR.Alloc(targetName).Value : targetName

        result := ComCall(17, this, "ptr", targetName, "int", newState, "int*", &pOldState := 0, "HRESULT")
        return pOldState
    }

    /**
     * 
     * @param {ITsSbSession} sbSession 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbresourcepluginstore-setsessionstate
     */
    SetSessionState(sbSession) {
        result := ComCall(18, this, "ptr", sbSession, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} FarmName 
     * @param {BSTR} EnvName 
     * @param {Integer} sortByFieldId 
     * @param {BSTR} sortyByPropName 
     * @param {Pointer<Integer>} pdwCount 
     * @returns {Pointer<ITsSbTarget>} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbresourcepluginstore-enumeratetargets
     */
    EnumerateTargets(FarmName, EnvName, sortByFieldId, sortyByPropName, pdwCount) {
        FarmName := FarmName is String ? BSTR.Alloc(FarmName).Value : FarmName
        EnvName := EnvName is String ? BSTR.Alloc(EnvName).Value : EnvName
        sortyByPropName := sortyByPropName is String ? BSTR.Alloc(sortyByPropName).Value : sortyByPropName

        pdwCountMarshal := pdwCount is VarRef ? "uint*" : "ptr"

        result := ComCall(19, this, "ptr", FarmName, "ptr", EnvName, "int", sortByFieldId, "ptr", sortyByPropName, pdwCountMarshal, pdwCount, "ptr*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @param {BSTR} targetName 
     * @param {BSTR} userName 
     * @param {BSTR} userDomain 
     * @param {BSTR} poolName 
     * @param {BSTR} initialProgram 
     * @param {Pointer<Integer>} pSessionState 
     * @param {Pointer<Integer>} pdwCount 
     * @returns {Pointer<ITsSbSession>} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbresourcepluginstore-enumeratesessions
     */
    EnumerateSessions(targetName, userName, userDomain, poolName, initialProgram, pSessionState, pdwCount) {
        targetName := targetName is String ? BSTR.Alloc(targetName).Value : targetName
        userName := userName is String ? BSTR.Alloc(userName).Value : userName
        userDomain := userDomain is String ? BSTR.Alloc(userDomain).Value : userDomain
        poolName := poolName is String ? BSTR.Alloc(poolName).Value : poolName
        initialProgram := initialProgram is String ? BSTR.Alloc(initialProgram).Value : initialProgram

        pSessionStateMarshal := pSessionState is VarRef ? "int*" : "ptr"
        pdwCountMarshal := pdwCount is VarRef ? "uint*" : "ptr"

        result := ComCall(20, this, "ptr", targetName, "ptr", userName, "ptr", userDomain, "ptr", poolName, "ptr", initialProgram, pSessionStateMarshal, pSessionState, pdwCountMarshal, pdwCount, "ptr*", &ppVal := 0, "HRESULT")
        return ppVal
    }

    /**
     * 
     * @param {BSTR} farmName 
     * @param {BSTR} propertyName 
     * @param {Pointer<VARIANT>} pVarValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbresourcepluginstore-getfarmproperty
     */
    GetFarmProperty(farmName, propertyName, pVarValue) {
        farmName := farmName is String ? BSTR.Alloc(farmName).Value : farmName
        propertyName := propertyName is String ? BSTR.Alloc(propertyName).Value : propertyName

        result := ComCall(21, this, "ptr", farmName, "ptr", propertyName, "ptr", pVarValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} targetName 
     * @param {BSTR} hostName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbresourcepluginstore-deletetarget
     */
    DeleteTarget(targetName, hostName) {
        targetName := targetName is String ? BSTR.Alloc(targetName).Value : targetName
        hostName := hostName is String ? BSTR.Alloc(hostName).Value : hostName

        result := ComCall(22, this, "ptr", targetName, "ptr", hostName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ITsSbTarget} pTarget 
     * @param {BSTR} PropertyName 
     * @param {Pointer<VARIANT>} pProperty 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbresourcepluginstore-settargetpropertywithversioncheck
     */
    SetTargetPropertyWithVersionCheck(pTarget, PropertyName, pProperty) {
        PropertyName := PropertyName is String ? BSTR.Alloc(PropertyName).Value : PropertyName

        result := ComCall(23, this, "ptr", pTarget, "ptr", PropertyName, "ptr", pProperty, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ITsSbEnvironment} pEnvironment 
     * @param {BSTR} PropertyName 
     * @param {Pointer<VARIANT>} pProperty 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbresourcepluginstore-setenvironmentpropertywithversioncheck
     */
    SetEnvironmentPropertyWithVersionCheck(pEnvironment, PropertyName, pProperty) {
        PropertyName := PropertyName is String ? BSTR.Alloc(PropertyName).Value : PropertyName

        result := ComCall(24, this, "ptr", pEnvironment, "ptr", PropertyName, "ptr", pProperty, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} targetName 
     * @param {Integer} dwTimeout 
     * @returns {IUnknown} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbresourcepluginstore-acquiretargetlock
     */
    AcquireTargetLock(targetName, dwTimeout) {
        targetName := targetName is String ? BSTR.Alloc(targetName).Value : targetName

        result := ComCall(25, this, "ptr", targetName, "uint", dwTimeout, "ptr*", &ppContext := 0, "HRESULT")
        return IUnknown(ppContext)
    }

    /**
     * 
     * @param {IUnknown} pContext 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbresourcepluginstore-releasetargetlock
     */
    ReleaseTargetLock(pContext) {
        result := ComCall(26, this, "ptr", pContext, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} PoolName 
     * @param {BSTR} ServerFQDN 
     * @param {Integer} NewState 
     * @param {Integer} TestState 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbresourcepluginstore-testandsetserverstate
     */
    TestAndSetServerState(PoolName, ServerFQDN, NewState, TestState) {
        PoolName := PoolName is String ? BSTR.Alloc(PoolName).Value : PoolName
        ServerFQDN := ServerFQDN is String ? BSTR.Alloc(ServerFQDN).Value : ServerFQDN

        result := ComCall(27, this, "ptr", PoolName, "ptr", ServerFQDN, "int", NewState, "int", TestState, "int*", &pInitState := 0, "HRESULT")
        return pInitState
    }

    /**
     * 
     * @param {BSTR} PoolName 
     * @param {BSTR} serverName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbresourcepluginstore-setserverwaitingtostart
     */
    SetServerWaitingToStart(PoolName, serverName) {
        PoolName := PoolName is String ? BSTR.Alloc(PoolName).Value : PoolName
        serverName := serverName is String ? BSTR.Alloc(serverName).Value : serverName

        result := ComCall(28, this, "ptr", PoolName, "ptr", serverName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} PoolName 
     * @param {BSTR} ServerFQDN 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbresourcepluginstore-getserverstate
     */
    GetServerState(PoolName, ServerFQDN) {
        PoolName := PoolName is String ? BSTR.Alloc(PoolName).Value : PoolName
        ServerFQDN := ServerFQDN is String ? BSTR.Alloc(ServerFQDN).Value : ServerFQDN

        result := ComCall(29, this, "ptr", PoolName, "ptr", ServerFQDN, "int*", &pState := 0, "HRESULT")
        return pState
    }

    /**
     * 
     * @param {BSTR} ServerFQDN 
     * @param {Integer} DrainMode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbresourcepluginstore-setserverdrainmode
     */
    SetServerDrainMode(ServerFQDN, DrainMode) {
        ServerFQDN := ServerFQDN is String ? BSTR.Alloc(ServerFQDN).Value : ServerFQDN

        result := ComCall(30, this, "ptr", ServerFQDN, "uint", DrainMode, "HRESULT")
        return result
    }
}
