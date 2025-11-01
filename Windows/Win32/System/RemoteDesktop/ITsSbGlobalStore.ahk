#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Exposes methods that query for target computers, sessions, environments, and farms that have been added to the Remote Desktop Connection Broker (RD Connection Broker) store.
 * @see https://docs.microsoft.com/windows/win32/api//sbtsv/nn-sbtsv-itssbglobalstore
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class ITsSbGlobalStore extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITsSbGlobalStore
     * @type {Guid}
     */
    static IID => Guid("{9ab60f7b-bd72-4d9f-8a3a-a0ea5574e635}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["QueryTarget", "QuerySessionBySessionId", "EnumerateFarms", "EnumerateTargets", "EnumerateEnvironmentsByProvider", "EnumerateSessions", "GetFarmProperty"]

    /**
     * 
     * @param {BSTR} ProviderName 
     * @param {BSTR} TargetName 
     * @param {BSTR} FarmName 
     * @param {Pointer<ITsSbTarget>} ppTarget 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbglobalstore-querytarget
     */
    QueryTarget(ProviderName, TargetName, FarmName, ppTarget) {
        ProviderName := ProviderName is String ? BSTR.Alloc(ProviderName).Value : ProviderName
        TargetName := TargetName is String ? BSTR.Alloc(TargetName).Value : TargetName
        FarmName := FarmName is String ? BSTR.Alloc(FarmName).Value : FarmName

        result := ComCall(3, this, "ptr", ProviderName, "ptr", TargetName, "ptr", FarmName, "ptr*", ppTarget, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} ProviderName 
     * @param {Integer} dwSessionId 
     * @param {BSTR} TargetName 
     * @param {Pointer<ITsSbSession>} ppSession 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbglobalstore-querysessionbysessionid
     */
    QuerySessionBySessionId(ProviderName, dwSessionId, TargetName, ppSession) {
        ProviderName := ProviderName is String ? BSTR.Alloc(ProviderName).Value : ProviderName
        TargetName := TargetName is String ? BSTR.Alloc(TargetName).Value : TargetName

        result := ComCall(4, this, "ptr", ProviderName, "uint", dwSessionId, "ptr", TargetName, "ptr*", ppSession, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} ProviderName 
     * @param {Pointer<Integer>} pdwCount 
     * @param {Pointer<Pointer<SAFEARRAY>>} pVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbglobalstore-enumeratefarms
     */
    EnumerateFarms(ProviderName, pdwCount, pVal) {
        ProviderName := ProviderName is String ? BSTR.Alloc(ProviderName).Value : ProviderName

        pdwCountMarshal := pdwCount is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, "ptr", ProviderName, pdwCountMarshal, pdwCount, "ptr*", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} ProviderName 
     * @param {BSTR} FarmName 
     * @param {BSTR} EnvName 
     * @param {Pointer<Integer>} pdwCount 
     * @param {Pointer<Pointer<ITsSbTarget>>} pVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbglobalstore-enumeratetargets
     */
    EnumerateTargets(ProviderName, FarmName, EnvName, pdwCount, pVal) {
        ProviderName := ProviderName is String ? BSTR.Alloc(ProviderName).Value : ProviderName
        FarmName := FarmName is String ? BSTR.Alloc(FarmName).Value : FarmName
        EnvName := EnvName is String ? BSTR.Alloc(EnvName).Value : EnvName

        pdwCountMarshal := pdwCount is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, "ptr", ProviderName, "ptr", FarmName, "ptr", EnvName, pdwCountMarshal, pdwCount, "ptr*", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} ProviderName 
     * @param {Pointer<Integer>} pdwCount 
     * @param {Pointer<Pointer<ITsSbEnvironment>>} ppVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbglobalstore-enumerateenvironmentsbyprovider
     */
    EnumerateEnvironmentsByProvider(ProviderName, pdwCount, ppVal) {
        ProviderName := ProviderName is String ? BSTR.Alloc(ProviderName).Value : ProviderName

        pdwCountMarshal := pdwCount is VarRef ? "uint*" : "ptr"

        result := ComCall(7, this, "ptr", ProviderName, pdwCountMarshal, pdwCount, "ptr*", ppVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} ProviderName 
     * @param {BSTR} targetName 
     * @param {BSTR} userName 
     * @param {BSTR} userDomain 
     * @param {BSTR} poolName 
     * @param {BSTR} initialProgram 
     * @param {Pointer<Integer>} pSessionState 
     * @param {Pointer<Integer>} pdwCount 
     * @param {Pointer<Pointer<ITsSbSession>>} ppVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbglobalstore-enumeratesessions
     */
    EnumerateSessions(ProviderName, targetName, userName, userDomain, poolName, initialProgram, pSessionState, pdwCount, ppVal) {
        ProviderName := ProviderName is String ? BSTR.Alloc(ProviderName).Value : ProviderName
        targetName := targetName is String ? BSTR.Alloc(targetName).Value : targetName
        userName := userName is String ? BSTR.Alloc(userName).Value : userName
        userDomain := userDomain is String ? BSTR.Alloc(userDomain).Value : userDomain
        poolName := poolName is String ? BSTR.Alloc(poolName).Value : poolName
        initialProgram := initialProgram is String ? BSTR.Alloc(initialProgram).Value : initialProgram

        pSessionStateMarshal := pSessionState is VarRef ? "int*" : "ptr"
        pdwCountMarshal := pdwCount is VarRef ? "uint*" : "ptr"

        result := ComCall(8, this, "ptr", ProviderName, "ptr", targetName, "ptr", userName, "ptr", userDomain, "ptr", poolName, "ptr", initialProgram, pSessionStateMarshal, pSessionState, pdwCountMarshal, pdwCount, "ptr*", ppVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} farmName 
     * @param {BSTR} propertyName 
     * @param {Pointer<VARIANT>} pVarValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbglobalstore-getfarmproperty
     */
    GetFarmProperty(farmName, propertyName, pVarValue) {
        farmName := farmName is String ? BSTR.Alloc(farmName).Value : farmName
        propertyName := propertyName is String ? BSTR.Alloc(propertyName).Value : propertyName

        result := ComCall(9, this, "ptr", farmName, "ptr", propertyName, "ptr", pVarValue, "HRESULT")
        return result
    }
}
