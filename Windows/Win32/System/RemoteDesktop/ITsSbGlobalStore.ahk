#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\ITsSbTarget.ahk
#Include .\ITsSbSession.ahk
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
     * Retrieves the ITsSbTarget object for the given parameters.
     * @param {BSTR} ProviderName The name of the resource plug-in provider.
     * @param {BSTR} TargetName The target name.
     * @param {BSTR} FarmName The farm name to which the target belongs. If <b>NULL</b>, the first target found is returned.
     * @returns {ITsSbTarget} A pointer to a pointer to a target <a href="https://docs.microsoft.com/windows/desktop/api/sbtsv/nn-sbtsv-itssbtarget">ITsSbTarget</a> object. When you have finished using the object, release it by calling the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a> method.
     * @see https://docs.microsoft.com/windows/win32/api//sbtsv/nf-sbtsv-itssbglobalstore-querytarget
     */
    QueryTarget(ProviderName, TargetName, FarmName) {
        ProviderName := ProviderName is String ? BSTR.Alloc(ProviderName).Value : ProviderName
        TargetName := TargetName is String ? BSTR.Alloc(TargetName).Value : TargetName
        FarmName := FarmName is String ? BSTR.Alloc(FarmName).Value : FarmName

        result := ComCall(3, this, "ptr", ProviderName, "ptr", TargetName, "ptr", FarmName, "ptr*", &ppTarget := 0, "HRESULT")
        return ITsSbTarget(ppTarget)
    }

    /**
     * Retrieves the ITsSbSession object associated with the given session ID.
     * @param {BSTR} ProviderName The resource plug-in provider name that owns the target.
     * @param {Integer} dwSessionId The session ID.
     * @param {BSTR} TargetName The name of the target computer on which this session is present.
     * @returns {ITsSbSession} A pointer to a pointer to a session object. When you have finished using the object, release it by calling the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a> method.
     * @see https://docs.microsoft.com/windows/win32/api//sbtsv/nf-sbtsv-itssbglobalstore-querysessionbysessionid
     */
    QuerySessionBySessionId(ProviderName, dwSessionId, TargetName) {
        ProviderName := ProviderName is String ? BSTR.Alloc(ProviderName).Value : ProviderName
        TargetName := TargetName is String ? BSTR.Alloc(TargetName).Value : TargetName

        result := ComCall(4, this, "ptr", ProviderName, "uint", dwSessionId, "ptr", TargetName, "ptr*", &ppSession := 0, "HRESULT")
        return ITsSbSession(ppSession)
    }

    /**
     * Enumerates all the farms that have been added by the specified resource plug-in.
     * @param {BSTR} ProviderName The provider name of the resource plug-in.
     * @param {Pointer<Integer>} pdwCount The count of farms retrieved.
     * @param {Pointer<Pointer<SAFEARRAY>>} pVal A pointer to an array of farm names. The number of elements in this array is specified by the <i>pdwCount</i> parameter. When you have finished using the array, free the allocated memory by calling the <a href="https://docs.microsoft.com/windows/desktop/api/oleauto/nf-oleauto-safearraydestroy">SafeArrayDestroy</a> function.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//sbtsv/nf-sbtsv-itssbglobalstore-enumeratefarms
     */
    EnumerateFarms(ProviderName, pdwCount, pVal) {
        ProviderName := ProviderName is String ? BSTR.Alloc(ProviderName).Value : ProviderName

        pdwCountMarshal := pdwCount is VarRef ? "uint*" : "ptr"
        pValMarshal := pVal is VarRef ? "ptr*" : "ptr"

        result := ComCall(5, this, "ptr", ProviderName, pdwCountMarshal, pdwCount, pValMarshal, pVal, "HRESULT")
        return result
    }

    /**
     * Returns an array that contains the specified targets present in the global store.
     * @param {BSTR} ProviderName The provider name.
     * @param {BSTR} FarmName The farm name.
     * @param {BSTR} EnvName The environment name.
     * @param {Pointer<Integer>} pdwCount The number of targets retrieved.
     * @returns {Pointer<ITsSbTarget>} Pointer to the retrieved <a href="https://docs.microsoft.com/windows/desktop/api/sbtsv/nn-sbtsv-itssbtarget">ITsSbTarget</a>objects.
     * @see https://docs.microsoft.com/windows/win32/api//sbtsv/nf-sbtsv-itssbglobalstore-enumeratetargets
     */
    EnumerateTargets(ProviderName, FarmName, EnvName, pdwCount) {
        ProviderName := ProviderName is String ? BSTR.Alloc(ProviderName).Value : ProviderName
        FarmName := FarmName is String ? BSTR.Alloc(FarmName).Value : FarmName
        EnvName := EnvName is String ? BSTR.Alloc(EnvName).Value : EnvName

        pdwCountMarshal := pdwCount is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, "ptr", ProviderName, "ptr", FarmName, "ptr", EnvName, pdwCountMarshal, pdwCount, "ptr*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * Returns an array that contains the environments present on the specified provider.
     * @param {BSTR} ProviderName The name of the provider.
     * @param {Pointer<Integer>} pdwCount A pointer to the number of environments retrieved.
     * @returns {Pointer<ITsSbEnvironment>} A pointer to an array that contains references to the environments present. When you have finished using the array, release each element and free the array by calling the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> function.
     * @see https://docs.microsoft.com/windows/win32/api//sbtsv/nf-sbtsv-itssbglobalstore-enumerateenvironmentsbyprovider
     */
    EnumerateEnvironmentsByProvider(ProviderName, pdwCount) {
        ProviderName := ProviderName is String ? BSTR.Alloc(ProviderName).Value : ProviderName

        pdwCountMarshal := pdwCount is VarRef ? "uint*" : "ptr"

        result := ComCall(7, this, "ptr", ProviderName, pdwCountMarshal, pdwCount, "ptr*", &ppVal := 0, "HRESULT")
        return ppVal
    }

    /**
     * Returns an array that contains sessions on the specified provider.
     * @param {BSTR} ProviderName The name of the provider.
     * @param {BSTR} targetName The name of the target.
     * @param {BSTR} userName The name of the user account.
     * @param {BSTR} userDomain The domain name of the user account.
     * @param {BSTR} poolName The name of the pool.
     * @param {BSTR} initialProgram The name of the published remote application.
     * @param {Pointer<Integer>} pSessionState A pointer to the  <a href="https://docs.microsoft.com/windows/win32/api/sessdirpublictypes/ne-sessdirpublictypes-tssession_state">TSSESSION_STATE</a> value of the sessions to enumerate.
     * @param {Pointer<Integer>} pdwCount Returns a pointer to the number of sessions returned.
     * @returns {Pointer<ITsSbSession>} Returns the list of sessions requested.
     * @see https://docs.microsoft.com/windows/win32/api//sbtsv/nf-sbtsv-itssbglobalstore-enumeratesessions
     */
    EnumerateSessions(ProviderName, targetName, userName, userDomain, poolName, initialProgram, pSessionState, pdwCount) {
        ProviderName := ProviderName is String ? BSTR.Alloc(ProviderName).Value : ProviderName
        targetName := targetName is String ? BSTR.Alloc(targetName).Value : targetName
        userName := userName is String ? BSTR.Alloc(userName).Value : userName
        userDomain := userDomain is String ? BSTR.Alloc(userDomain).Value : userDomain
        poolName := poolName is String ? BSTR.Alloc(poolName).Value : poolName
        initialProgram := initialProgram is String ? BSTR.Alloc(initialProgram).Value : initialProgram

        pSessionStateMarshal := pSessionState is VarRef ? "int*" : "ptr"
        pdwCountMarshal := pdwCount is VarRef ? "uint*" : "ptr"

        result := ComCall(8, this, "ptr", ProviderName, "ptr", targetName, "ptr", userName, "ptr", userDomain, "ptr", poolName, "ptr", initialProgram, pSessionStateMarshal, pSessionState, pdwCountMarshal, pdwCount, "ptr*", &ppVal := 0, "HRESULT")
        return ppVal
    }

    /**
     * Retrieves a property of a farm.
     * @param {BSTR} farmName The name of the farm.
     * @param {BSTR} propertyName The name of the property to retrieve.
     * @param {Pointer<VARIANT>} pVarValue Returns a pointer to the value of the property.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//sbtsv/nf-sbtsv-itssbglobalstore-getfarmproperty
     */
    GetFarmProperty(farmName, propertyName, pVarValue) {
        farmName := farmName is String ? BSTR.Alloc(farmName).Value : farmName
        propertyName := propertyName is String ? BSTR.Alloc(propertyName).Value : propertyName

        result := ComCall(9, this, "ptr", farmName, "ptr", propertyName, "ptr", pVarValue, "HRESULT")
        return result
    }
}
