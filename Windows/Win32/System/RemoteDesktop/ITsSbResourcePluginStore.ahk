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
     * Returns the target that has the specified target name and farm name.
     * @param {BSTR} TargetName The target name.
     * @param {BSTR} FarmName The farm name. If this parameter is <b>NULL</b>, the method returns the first target it finds.
     * @returns {ITsSbTarget} A pointer to a pointer to an  <a href="https://docs.microsoft.com/windows/desktop/api/sbtsv/nn-sbtsv-itssbtarget">ITsSbTarget</a> target object. When you have finished using the object, release it by calling the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a> method.
     * @see https://docs.microsoft.com/windows/win32/api//sbtsv/nf-sbtsv-itssbresourcepluginstore-querytarget
     */
    QueryTarget(TargetName, FarmName) {
        TargetName := TargetName is String ? BSTR.Alloc(TargetName).Value : TargetName
        FarmName := FarmName is String ? BSTR.Alloc(FarmName).Value : FarmName

        result := ComCall(3, this, "ptr", TargetName, "ptr", FarmName, "ptr*", &ppTarget := 0, "HRESULT")
        return ITsSbTarget(ppTarget)
    }

    /**
     * Returns the session object that has the specified session ID.
     * @param {Integer} dwSessionId The session ID.
     * @param {BSTR} TargetName The target name.
     * @returns {ITsSbSession} A pointer to a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/sbtsv/nn-sbtsv-itssbsession">ITsSbSession</a> session object. When you have finished using the object, release it by calling the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a> method.
     * @see https://docs.microsoft.com/windows/win32/api//sbtsv/nf-sbtsv-itssbresourcepluginstore-querysessionbysessionid
     */
    QuerySessionBySessionId(dwSessionId, TargetName) {
        TargetName := TargetName is String ? BSTR.Alloc(TargetName).Value : TargetName

        result := ComCall(4, this, "uint", dwSessionId, "ptr", TargetName, "ptr*", &ppSession := 0, "HRESULT")
        return ITsSbSession(ppSession)
    }

    /**
     * Adds a target to the resource plug-in store.
     * @param {ITsSbTarget} pTarget A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/sbtsv/nn-sbtsv-itssbtarget">ITsSbTarget</a> target object.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//sbtsv/nf-sbtsv-itssbresourcepluginstore-addtargettostore
     */
    AddTargetToStore(pTarget) {
        result := ComCall(5, this, "ptr", pTarget, "HRESULT")
        return result
    }

    /**
     * Adds a new session to the resource plug-in store.
     * @param {ITsSbSession} pSession A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/sbtsv/nn-sbtsv-itssbsession">ITsSbSession</a> session object. The target name, user name, domain name, and session ID are required fields.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//sbtsv/nf-sbtsv-itssbresourcepluginstore-addsessiontostore
     */
    AddSessionToStore(pSession) {
        result := ComCall(6, this, "ptr", pSession, "HRESULT")
        return result
    }

    /**
     * Adds an environment to the resource plug-in store.
     * @param {ITsSbEnvironment} pEnvironment A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/sbtsv/nn-sbtsv-itssbenvironment">ITsSbEnvironment</a> environment object.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//sbtsv/nf-sbtsv-itssbresourcepluginstore-addenvironmenttostore
     */
    AddEnvironmentToStore(pEnvironment) {
        result := ComCall(7, this, "ptr", pEnvironment, "HRESULT")
        return result
    }

    /**
     * Removes the specified environment from the resource plug-in store.
     * @param {BSTR} EnvironmentName The name of the environment to remove.
     * @param {BOOL} bIgnoreOwner Set <b>TRUE</b> to ignore ownership of the environment; <b>FALSE</b> 
     *        otherwise.
     * 
     * <b>Windows Server 2012 R2 and Windows Server 2012:  </b>This parameter is not supported before Windows Server 2016.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//sbtsv/nf-sbtsv-itssbresourcepluginstore-removeenvironmentfromstore
     */
    RemoveEnvironmentFromStore(EnvironmentName, bIgnoreOwner) {
        EnvironmentName := EnvironmentName is String ? BSTR.Alloc(EnvironmentName).Value : EnvironmentName

        result := ComCall(8, this, "ptr", EnvironmentName, "int", bIgnoreOwner, "HRESULT")
        return result
    }

    /**
     * Enumerates all the farms that have been added to the resource plug-in store.
     * @param {Pointer<Integer>} pdwCount The number of farms retrieved.
     * @param {Pointer<Pointer<SAFEARRAY>>} pVal An array of farm names. The <i>pdwCount</i> parameter contains the number of elements in this array. When you have finished using the array, free the allocated memory by calling the   <a href="https://docs.microsoft.com/windows/desktop/api/oleauto/nf-oleauto-safearraydestroy">SafeArrayDestroy</a> function.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//sbtsv/nf-sbtsv-itssbresourcepluginstore-enumeratefarms
     */
    EnumerateFarms(pdwCount, pVal) {
        pdwCountMarshal := pdwCount is VarRef ? "uint*" : "ptr"
        pValMarshal := pVal is VarRef ? "ptr*" : "ptr"

        result := ComCall(9, this, pdwCountMarshal, pdwCount, pValMarshal, pVal, "HRESULT")
        return result
    }

    /**
     * Returns the specified environment object.
     * @param {BSTR} EnvironmentName The name of the environment.
     * @returns {ITsSbEnvironment} A pointer to the retrieved <a href="https://docs.microsoft.com/windows/desktop/api/sbtsv/nn-sbtsv-itssbenvironment">ITsSbEnvironment</a> environment object.
     * @see https://docs.microsoft.com/windows/win32/api//sbtsv/nf-sbtsv-itssbresourcepluginstore-queryenvironment
     */
    QueryEnvironment(EnvironmentName) {
        EnvironmentName := EnvironmentName is String ? BSTR.Alloc(EnvironmentName).Value : EnvironmentName

        result := ComCall(10, this, "ptr", EnvironmentName, "ptr*", &ppEnvironment := 0, "HRESULT")
        return ITsSbEnvironment(ppEnvironment)
    }

    /**
     * Returns an array that contains the environments present in the resource plug-in store.
     * @param {Pointer<Integer>} pdwCount A pointer to the number of targets retrieved.
     * @returns {Pointer<ITsSbEnvironment>} A pointer to an array that contains references to the environments present. When you have finished using the array, release each element and free the array by calling the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> function.
     * @see https://docs.microsoft.com/windows/win32/api//sbtsv/nf-sbtsv-itssbresourcepluginstore-enumerateenvironments
     */
    EnumerateEnvironments(pdwCount) {
        pdwCountMarshal := pdwCount is VarRef ? "uint*" : "ptr"

        result := ComCall(11, this, pdwCountMarshal, pdwCount, "ptr*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * Saves a target.
     * @param {ITsSbTarget} pTarget Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/sbtsv/nn-sbtsv-itssbtarget">ITsSbTarget</a> object to save.
     * @param {BOOL} bForceWrite Set to TRUE to force writing the saved object.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//sbtsv/nf-sbtsv-itssbresourcepluginstore-savetarget
     */
    SaveTarget(pTarget, bForceWrite) {
        result := ComCall(12, this, "ptr", pTarget, "int", bForceWrite, "HRESULT")
        return result
    }

    /**
     * Saves an environment.
     * @param {ITsSbEnvironment} pEnvironment Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/sbtsv/nn-sbtsv-itssbenvironment">ITsSbEnvironment</a> object to save.
     * @param {BOOL} bForceWrite Set to <b>TRUE</b> to force writing the saved object.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//sbtsv/nf-sbtsv-itssbresourcepluginstore-saveenvironment
     */
    SaveEnvironment(pEnvironment, bForceWrite) {
        result := ComCall(13, this, "ptr", pEnvironment, "int", bForceWrite, "HRESULT")
        return result
    }

    /**
     * Saves a session.
     * @param {ITsSbSession} pSession A Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/sbtsv/nn-sbtsv-itssbsession">ITsSbSession</a> object to save.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//sbtsv/nf-sbtsv-itssbresourcepluginstore-savesession
     */
    SaveSession(pSession) {
        result := ComCall(14, this, "ptr", pSession, "HRESULT")
        return result
    }

    /**
     * Sets the value of a property of a target.
     * @param {BSTR} TargetName The name of the target.
     * @param {BSTR} PropertyName The name of the property.
     * @param {Pointer<VARIANT>} pProperty A pointer to the value to set.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//sbtsv/nf-sbtsv-itssbresourcepluginstore-settargetproperty
     */
    SetTargetProperty(TargetName, PropertyName, pProperty) {
        TargetName := TargetName is String ? BSTR.Alloc(TargetName).Value : TargetName
        PropertyName := PropertyName is String ? BSTR.Alloc(PropertyName).Value : PropertyName

        result := ComCall(15, this, "ptr", TargetName, "ptr", PropertyName, "ptr", pProperty, "HRESULT")
        return result
    }

    /**
     * Sets a property of an environment.
     * @param {BSTR} EnvironmentName The name of the environment.
     * @param {BSTR} PropertyName The name of the property to set.
     * @param {Pointer<VARIANT>} pProperty A pointer to the value to set.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//sbtsv/nf-sbtsv-itssbresourcepluginstore-setenvironmentproperty
     */
    SetEnvironmentProperty(EnvironmentName, PropertyName, pProperty) {
        EnvironmentName := EnvironmentName is String ? BSTR.Alloc(EnvironmentName).Value : EnvironmentName
        PropertyName := PropertyName is String ? BSTR.Alloc(PropertyName).Value : PropertyName

        result := ComCall(16, this, "ptr", EnvironmentName, "ptr", PropertyName, "ptr", pProperty, "HRESULT")
        return result
    }

    /**
     * Sets the state of a target object.
     * @param {BSTR} targetName The name of the target.
     * @param {Integer} newState The <a href="https://docs.microsoft.com/windows/desktop/api/sessdirpublictypes/ne-sessdirpublictypes-target_state">TARGET_STATE</a> value to set.
     * @returns {Integer} The previous state of the target.
     * @see https://docs.microsoft.com/windows/win32/api//sbtsv/nf-sbtsv-itssbresourcepluginstore-settargetstate
     */
    SetTargetState(targetName, newState) {
        targetName := targetName is String ? BSTR.Alloc(targetName).Value : targetName

        result := ComCall(17, this, "ptr", targetName, "int", newState, "int*", &pOldState := 0, "HRESULT")
        return pOldState
    }

    /**
     * Sets the session state.
     * @param {ITsSbSession} sbSession A pointer to the session to modify.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//sbtsv/nf-sbtsv-itssbresourcepluginstore-setsessionstate
     */
    SetSessionState(sbSession) {
        result := ComCall(18, this, "ptr", sbSession, "HRESULT")
        return result
    }

    /**
     * Returns an array that contains the specified targets that are present in the resource plug-in store.
     * @param {BSTR} FarmName The farm name.
     * @param {BSTR} EnvName The environment name.
     * @param {Integer} sortByFieldId Specifies sort order.
     * @param {BSTR} sortyByPropName The property name to sort by if <i>sortByFieldId</i> is set to <b>TS_SB_SORT_BY_PROP</b>.
     * @param {Pointer<Integer>} pdwCount The number of targets retrieved.
     * @returns {Pointer<ITsSbTarget>} Pointer to the retrieved <a href="https://docs.microsoft.com/windows/desktop/api/sbtsv/nn-sbtsv-itssbtarget">ITsSbTarget</a>objects.
     * @see https://docs.microsoft.com/windows/win32/api//sbtsv/nf-sbtsv-itssbresourcepluginstore-enumeratetargets
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
     * Enumerates a specified set of sessions.
     * @param {BSTR} targetName The name of the target.
     * @param {BSTR} userName The name of the user account.
     * @param {BSTR} userDomain The domain name of the user account.
     * @param {BSTR} poolName The name of the pool.
     * @param {BSTR} initialProgram The name of the published remote application.
     * @param {Pointer<Integer>} pSessionState A pointer to the  <a href="https://docs.microsoft.com/windows/win32/api/sessdirpublictypes/ne-sessdirpublictypes-tssession_state">TSSESSION_STATE</a> value of the sessions to enumerate.
     * @param {Pointer<Integer>} pdwCount Returns a pointer to the number of sessions returned.
     * @returns {Pointer<ITsSbSession>} Returns the list of sessions requested.
     * @see https://docs.microsoft.com/windows/win32/api//sbtsv/nf-sbtsv-itssbresourcepluginstore-enumeratesessions
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
     * Retrieves a property of a farm.
     * @param {BSTR} farmName The name of the farm.
     * @param {BSTR} propertyName The name of the property to retrieve.
     * @param {Pointer<VARIANT>} pVarValue Returns a pointer to the value of the property.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//sbtsv/nf-sbtsv-itssbresourcepluginstore-getfarmproperty
     */
    GetFarmProperty(farmName, propertyName, pVarValue) {
        farmName := farmName is String ? BSTR.Alloc(farmName).Value : farmName
        propertyName := propertyName is String ? BSTR.Alloc(propertyName).Value : propertyName

        result := ComCall(21, this, "ptr", farmName, "ptr", propertyName, "ptr", pVarValue, "HRESULT")
        return result
    }

    /**
     * Deletes a target.
     * @param {BSTR} targetName The name of the target.
     * @param {BSTR} hostName The name of the computer that hosts the target.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//sbtsv/nf-sbtsv-itssbresourcepluginstore-deletetarget
     */
    DeleteTarget(targetName, hostName) {
        targetName := targetName is String ? BSTR.Alloc(targetName).Value : targetName
        hostName := hostName is String ? BSTR.Alloc(hostName).Value : hostName

        result := ComCall(22, this, "ptr", targetName, "ptr", hostName, "HRESULT")
        return result
    }

    /**
     * Sets the value of a property of a target.
     * @param {ITsSbTarget} pTarget A pointer to the target.
     * @param {BSTR} PropertyName The name of the property.
     * @param {Pointer<VARIANT>} pProperty A pointer to the value to set.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//sbtsv/nf-sbtsv-itssbresourcepluginstore-settargetpropertywithversioncheck
     */
    SetTargetPropertyWithVersionCheck(pTarget, PropertyName, pProperty) {
        PropertyName := PropertyName is String ? BSTR.Alloc(PropertyName).Value : PropertyName

        result := ComCall(23, this, "ptr", pTarget, "ptr", PropertyName, "ptr", pProperty, "HRESULT")
        return result
    }

    /**
     * Sets a property of an environment.
     * @param {ITsSbEnvironment} pEnvironment A pointer to the environment.
     * @param {BSTR} PropertyName The name of the property to set.
     * @param {Pointer<VARIANT>} pProperty A pointer to the value to set.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//sbtsv/nf-sbtsv-itssbresourcepluginstore-setenvironmentpropertywithversioncheck
     */
    SetEnvironmentPropertyWithVersionCheck(pEnvironment, PropertyName, pProperty) {
        PropertyName := PropertyName is String ? BSTR.Alloc(PropertyName).Value : PropertyName

        result := ComCall(24, this, "ptr", pEnvironment, "ptr", PropertyName, "ptr", pProperty, "HRESULT")
        return result
    }

    /**
     * Locks a target.
     * @param {BSTR} targetName The name of the target to lock.
     * @param {Integer} dwTimeout The timeout for the operation, in milliseconds.
     * @returns {IUnknown} Returns a pointer to the context of the lock. To release the lock, supply this pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/sbtsv/nf-sbtsv-itssbresourcepluginstore-releasetargetlock">ReleaseTargetLock</a> method.
     * @see https://docs.microsoft.com/windows/win32/api//sbtsv/nf-sbtsv-itssbresourcepluginstore-acquiretargetlock
     */
    AcquireTargetLock(targetName, dwTimeout) {
        targetName := targetName is String ? BSTR.Alloc(targetName).Value : targetName

        result := ComCall(25, this, "ptr", targetName, "uint", dwTimeout, "ptr*", &ppContext := 0, "HRESULT")
        return IUnknown(ppContext)
    }

    /**
     * Releases a lock on a target.
     * @param {IUnknown} pContext A pointer to the context returned by the <a href="https://docs.microsoft.com/windows/desktop/api/sbtsv/nf-sbtsv-itssbresourcepluginstore-acquiretargetlock">AcquireTargetLock</a> method.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//sbtsv/nf-sbtsv-itssbresourcepluginstore-releasetargetlock
     */
    ReleaseTargetLock(pContext) {
        result := ComCall(26, this, "ptr", pContext, "HRESULT")
        return result
    }

    /**
     * Conditionally sets a new state on a server.
     * @param {BSTR} PoolName Name of the pool.
     * @param {BSTR} ServerFQDN Fully qualified domain name (FQDN) of the server.
     * @param {Integer} NewState The state to set.
     * @param {Integer} TestState If set to <b>TARGET_UNKNOWN</b> or the current state of the server, the  server will be set as specified in the <i>NewState</i> parameter.
     * @returns {Integer} On return, points to the previous state of the server.
     * @see https://docs.microsoft.com/windows/win32/api//sbtsv/nf-sbtsv-itssbresourcepluginstore-testandsetserverstate
     */
    TestAndSetServerState(PoolName, ServerFQDN, NewState, TestState) {
        PoolName := PoolName is String ? BSTR.Alloc(PoolName).Value : PoolName
        ServerFQDN := ServerFQDN is String ? BSTR.Alloc(ServerFQDN).Value : ServerFQDN

        result := ComCall(27, this, "ptr", PoolName, "ptr", ServerFQDN, "int", NewState, "int", TestState, "int*", &pInitState := 0, "HRESULT")
        return pInitState
    }

    /**
     * Indicates to the session host that the server is waiting to start.
     * @param {BSTR} PoolName Name of the pool.
     * @param {BSTR} serverName Name of the server.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//sbtsv/nf-sbtsv-itssbresourcepluginstore-setserverwaitingtostart
     */
    SetServerWaitingToStart(PoolName, serverName) {
        PoolName := PoolName is String ? BSTR.Alloc(PoolName).Value : PoolName
        serverName := serverName is String ? BSTR.Alloc(serverName).Value : serverName

        result := ComCall(28, this, "ptr", PoolName, "ptr", serverName, "HRESULT")
        return result
    }

    /**
     * Retrieves the state of a specified server.
     * @param {BSTR} PoolName Name of the pool.
     * @param {BSTR} ServerFQDN Fully qualified domain name (FQDN) of the server.
     * @returns {Integer} On return, points to the state of the server.
     * @see https://docs.microsoft.com/windows/win32/api//sbtsv/nf-sbtsv-itssbresourcepluginstore-getserverstate
     */
    GetServerState(PoolName, ServerFQDN) {
        PoolName := PoolName is String ? BSTR.Alloc(PoolName).Value : PoolName
        ServerFQDN := ServerFQDN is String ? BSTR.Alloc(ServerFQDN).Value : ServerFQDN

        result := ComCall(29, this, "ptr", PoolName, "ptr", ServerFQDN, "int*", &pState := 0, "HRESULT")
        return pState
    }

    /**
     * Sets the drain mode of the specified server.
     * @param {BSTR} ServerFQDN The fully qualified domain name of the server.
     * @param {Integer} DrainMode The mode to set.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//sbtsv/nf-sbtsv-itssbresourcepluginstore-setserverdrainmode
     */
    SetServerDrainMode(ServerFQDN, DrainMode) {
        ServerFQDN := ServerFQDN is String ? BSTR.Alloc(ServerFQDN).Value : ServerFQDN

        result := ComCall(30, this, "ptr", ServerFQDN, "uint", DrainMode, "HRESULT")
        return result
    }
}
