#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\TSSESSION_STATE.ahk" { TSSESSION_STATE }
#Import ".\ITsSbTarget.ahk" { ITsSbTarget }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\Com\SAFEARRAY.ahk" { SAFEARRAY }
#Import ".\TS_SB_SORT_BY.ahk" { TS_SB_SORT_BY }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\ITsSbSession.ahk" { ITsSbSession }
#Import "..\Variant\VARIANT.ahk" { VARIANT }
#Import ".\ITsSbEnvironment.ahk" { ITsSbEnvironment }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import ".\TARGET_STATE.ahk" { TARGET_STATE }

/**
 * Exposes methods that enable resource plug-ins to store objects such as sessions and targets.
 * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nn-sbtsv-itssbresourcepluginstore
 * @namespace Windows.Win32.System.RemoteDesktop
 */
export default struct ITsSbResourcePluginStore extends IUnknown {
    /**
     * The interface identifier for ITsSbResourcePluginStore
     * @type {Guid}
     */
    static IID := Guid("{5c38f65f-bcf1-4036-a6bf-9e3cccae0b63}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITsSbResourcePluginStore interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        QueryTarget                            : IntPtr
        QuerySessionBySessionId                : IntPtr
        AddTargetToStore                       : IntPtr
        AddSessionToStore                      : IntPtr
        AddEnvironmentToStore                  : IntPtr
        RemoveEnvironmentFromStore             : IntPtr
        EnumerateFarms                         : IntPtr
        QueryEnvironment                       : IntPtr
        EnumerateEnvironments                  : IntPtr
        SaveTarget                             : IntPtr
        SaveEnvironment                        : IntPtr
        SaveSession                            : IntPtr
        SetTargetProperty                      : IntPtr
        SetEnvironmentProperty                 : IntPtr
        SetTargetState                         : IntPtr
        SetSessionState                        : IntPtr
        EnumerateTargets                       : IntPtr
        EnumerateSessions                      : IntPtr
        GetFarmProperty                        : IntPtr
        DeleteTarget                           : IntPtr
        SetTargetPropertyWithVersionCheck      : IntPtr
        SetEnvironmentPropertyWithVersionCheck : IntPtr
        AcquireTargetLock                      : IntPtr
        ReleaseTargetLock                      : IntPtr
        TestAndSetServerState                  : IntPtr
        SetServerWaitingToStart                : IntPtr
        GetServerState                         : IntPtr
        SetServerDrainMode                     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITsSbResourcePluginStore.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Returns the target that has the specified target name and farm name.
     * @remarks
     * A resource plug-in store can use this method to retrieve the target that has the specified target name and farm name. Unlike the global store, the resource plug-in store does not copy the target object retrieved because the resource plug-in owns the target object. Accordingly, if you modify the <a href="https://docs.microsoft.com/windows/desktop/api/sbtsv/nn-sbtsv-itssbtarget">ITsSbTarget</a> object that is returned by this method, you are modifying the target object in    the            resource plug-in store.
     * @param {BSTR} TargetName The target name.
     * @param {BSTR} FarmName The farm name. If this parameter is <b>NULL</b>, the method returns the first target it finds.
     * @returns {ITsSbTarget} A pointer to a pointer to an  <a href="https://docs.microsoft.com/windows/desktop/api/sbtsv/nn-sbtsv-itssbtarget">ITsSbTarget</a> target object. When you have finished using the object, release it by calling the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a> method.
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbresourcepluginstore-querytarget
     */
    QueryTarget(TargetName, FarmName) {
        TargetName := TargetName is String ? BSTR.Alloc(TargetName).Value : TargetName
        FarmName := FarmName is String ? BSTR.Alloc(FarmName).Value : FarmName

        result := ComCall(3, this, BSTR, TargetName, BSTR, FarmName, "ptr*", &ppTarget := 0, "HRESULT")
        return ITsSbTarget(ppTarget)
    }

    /**
     * Returns the session object that has the specified session ID.
     * @remarks
     * A resource plug-in can use this method to retrieve a session object. Unlike the global store, the resource plug-in store does not copy the session object retrieved because the resource plug-in owns the session object.
     * @param {Integer} dwSessionId The session ID.
     * @param {BSTR} TargetName The target name.
     * @returns {ITsSbSession} A pointer to a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/sbtsv/nn-sbtsv-itssbsession">ITsSbSession</a> session object. When you have finished using the object, release it by calling the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a> method.
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbresourcepluginstore-querysessionbysessionid
     */
    QuerySessionBySessionId(dwSessionId, TargetName) {
        TargetName := TargetName is String ? BSTR.Alloc(TargetName).Value : TargetName

        result := ComCall(4, this, "uint", dwSessionId, BSTR, TargetName, "ptr*", &ppSession := 0, "HRESULT")
        return ITsSbSession(ppSession)
    }

    /**
     * Adds a target to the resource plug-in store.
     * @param {ITsSbTarget} pTarget A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/sbtsv/nn-sbtsv-itssbtarget">ITsSbTarget</a> target object.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbresourcepluginstore-addtargettostore
     */
    AddTargetToStore(pTarget) {
        result := ComCall(5, this, "ptr", pTarget, "HRESULT")
        return result
    }

    /**
     * Adds a new session to the resource plug-in store.
     * @param {ITsSbSession} pSession A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/sbtsv/nn-sbtsv-itssbsession">ITsSbSession</a> session object. The target name, user name, domain name, and session ID are required fields.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbresourcepluginstore-addsessiontostore
     */
    AddSessionToStore(pSession) {
        result := ComCall(6, this, "ptr", pSession, "HRESULT")
        return result
    }

    /**
     * Adds an environment to the resource plug-in store.
     * @remarks
     * Resource plug-ins can use this  method to add an environment to the resource plug-in store.
     * @param {ITsSbEnvironment} pEnvironment A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/sbtsv/nn-sbtsv-itssbenvironment">ITsSbEnvironment</a> environment object.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbresourcepluginstore-addenvironmenttostore
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
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbresourcepluginstore-removeenvironmentfromstore
     */
    RemoveEnvironmentFromStore(EnvironmentName, bIgnoreOwner) {
        EnvironmentName := EnvironmentName is String ? BSTR.Alloc(EnvironmentName).Value : EnvironmentName

        result := ComCall(8, this, BSTR, EnvironmentName, BOOL, bIgnoreOwner, "HRESULT")
        return result
    }

    /**
     * Enumerates all the farms that have been added to the resource plug-in store.
     * @param {Pointer<Integer>} pdwCount The number of farms retrieved.
     * @param {Pointer<Pointer<SAFEARRAY>>} pVal An array of farm names. The <i>pdwCount</i> parameter contains the number of elements in this array. When you have finished using the array, free the allocated memory by calling the   <a href="https://docs.microsoft.com/windows/desktop/api/oleauto/nf-oleauto-safearraydestroy">SafeArrayDestroy</a> function.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbresourcepluginstore-enumeratefarms
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
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbresourcepluginstore-queryenvironment
     */
    QueryEnvironment(EnvironmentName) {
        EnvironmentName := EnvironmentName is String ? BSTR.Alloc(EnvironmentName).Value : EnvironmentName

        result := ComCall(10, this, BSTR, EnvironmentName, "ptr*", &ppEnvironment := 0, "HRESULT")
        return ITsSbEnvironment(ppEnvironment)
    }

    /**
     * Returns an array that contains the environments present in the resource plug-in store.
     * @param {Pointer<Integer>} pdwCount A pointer to the number of targets retrieved.
     * @returns {Pointer<ITsSbEnvironment>} A pointer to an array that contains references to the environments present. When you have finished using the array, release each element and free the array by calling the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> function.
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbresourcepluginstore-enumerateenvironments
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
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbresourcepluginstore-savetarget
     */
    SaveTarget(pTarget, bForceWrite) {
        result := ComCall(12, this, "ptr", pTarget, BOOL, bForceWrite, "HRESULT")
        return result
    }

    /**
     * Saves an environment.
     * @param {ITsSbEnvironment} pEnvironment Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/sbtsv/nn-sbtsv-itssbenvironment">ITsSbEnvironment</a> object to save.
     * @param {BOOL} bForceWrite Set to <b>TRUE</b> to force writing the saved object.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbresourcepluginstore-saveenvironment
     */
    SaveEnvironment(pEnvironment, bForceWrite) {
        result := ComCall(13, this, "ptr", pEnvironment, BOOL, bForceWrite, "HRESULT")
        return result
    }

    /**
     * Saves a session.
     * @param {ITsSbSession} pSession A Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/sbtsv/nn-sbtsv-itssbsession">ITsSbSession</a> object to save.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbresourcepluginstore-savesession
     */
    SaveSession(pSession) {
        result := ComCall(14, this, "ptr", pSession, "HRESULT")
        return result
    }

    /**
     * Sets the value of a property of a target. (ITsSbResourcePluginStoreEx.SetTargetProperty)
     * @param {BSTR} TargetName The name of the target.
     * @param {BSTR} PropertyName The name of the property.
     * @param {Pointer<VARIANT>} pProperty A pointer to the value to set.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbresourcepluginstore-settargetproperty
     */
    SetTargetProperty(TargetName, PropertyName, pProperty) {
        TargetName := TargetName is String ? BSTR.Alloc(TargetName).Value : TargetName
        PropertyName := PropertyName is String ? BSTR.Alloc(PropertyName).Value : PropertyName

        result := ComCall(15, this, BSTR, TargetName, BSTR, PropertyName, VARIANT.Ptr, pProperty, "HRESULT")
        return result
    }

    /**
     * Sets a property of an environment. (ITsSbResourcePluginStoreEx.SetEnvironmentProperty)
     * @param {BSTR} EnvironmentName The name of the environment.
     * @param {BSTR} PropertyName The name of the property to set.
     * @param {Pointer<VARIANT>} pProperty A pointer to the value to set.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbresourcepluginstore-setenvironmentproperty
     */
    SetEnvironmentProperty(EnvironmentName, PropertyName, pProperty) {
        EnvironmentName := EnvironmentName is String ? BSTR.Alloc(EnvironmentName).Value : EnvironmentName
        PropertyName := PropertyName is String ? BSTR.Alloc(PropertyName).Value : PropertyName

        result := ComCall(16, this, BSTR, EnvironmentName, BSTR, PropertyName, VARIANT.Ptr, pProperty, "HRESULT")
        return result
    }

    /**
     * Sets the state of a target object.
     * @param {BSTR} targetName The name of the target.
     * @param {TARGET_STATE} newState The <a href="https://docs.microsoft.com/windows/desktop/api/sessdirpublictypes/ne-sessdirpublictypes-target_state">TARGET_STATE</a> value to set.
     * @returns {TARGET_STATE} The previous state of the target.
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbresourcepluginstore-settargetstate
     */
    SetTargetState(targetName, newState) {
        targetName := targetName is String ? BSTR.Alloc(targetName).Value : targetName

        result := ComCall(17, this, BSTR, targetName, TARGET_STATE, newState, "int*", &pOldState := 0, "HRESULT")
        return pOldState
    }

    /**
     * Sets the session state.
     * @param {ITsSbSession} sbSession A pointer to the session to modify.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbresourcepluginstore-setsessionstate
     */
    SetSessionState(sbSession) {
        result := ComCall(18, this, "ptr", sbSession, "HRESULT")
        return result
    }

    /**
     * Returns an array that contains the specified targets that are present in the resource plug-in store.
     * @param {BSTR} FarmName The farm name.
     * @param {BSTR} EnvName The environment name.
     * @param {TS_SB_SORT_BY} sortByFieldId Specifies sort order.
     * @param {BSTR} sortyByPropName The property name to sort by if <i>sortByFieldId</i> is set to <b>TS_SB_SORT_BY_PROP</b>.
     * @param {Pointer<Integer>} pdwCount The number of targets retrieved.
     * @returns {Pointer<ITsSbTarget>} Pointer to the retrieved <a href="https://docs.microsoft.com/windows/desktop/api/sbtsv/nn-sbtsv-itssbtarget">ITsSbTarget</a> objects.
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbresourcepluginstore-enumeratetargets
     */
    EnumerateTargets(FarmName, EnvName, sortByFieldId, sortyByPropName, pdwCount) {
        FarmName := FarmName is String ? BSTR.Alloc(FarmName).Value : FarmName
        EnvName := EnvName is String ? BSTR.Alloc(EnvName).Value : EnvName
        sortyByPropName := sortyByPropName is String ? BSTR.Alloc(sortyByPropName).Value : sortyByPropName

        pdwCountMarshal := pdwCount is VarRef ? "uint*" : "ptr"

        result := ComCall(19, this, BSTR, FarmName, BSTR, EnvName, TS_SB_SORT_BY, sortByFieldId, BSTR, sortyByPropName, pdwCountMarshal, pdwCount, "ptr*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * Enumerates a specified set of sessions.
     * @param {BSTR} targetName The name of the target.
     * @param {BSTR} userName The name of the user account.
     * @param {BSTR} userDomain The domain name of the user account.
     * @param {BSTR} poolName The name of the pool.
     * @param {BSTR} initialProgram The name of the published remote application.
     * @param {Pointer<TSSESSION_STATE>} pSessionState A pointer to the  <a href="https://docs.microsoft.com/windows/win32/api/sessdirpublictypes/ne-sessdirpublictypes-tssession_state">TSSESSION_STATE</a> value of the sessions to enumerate.
     * @param {Pointer<Integer>} pdwCount Returns a pointer to the number of sessions returned.
     * @returns {Pointer<ITsSbSession>} Returns the list of sessions requested.
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

        result := ComCall(20, this, BSTR, targetName, BSTR, userName, BSTR, userDomain, BSTR, poolName, BSTR, initialProgram, pSessionStateMarshal, pSessionState, pdwCountMarshal, pdwCount, "ptr*", &ppVal := 0, "HRESULT")
        return ppVal
    }

    /**
     * Retrieves a property of a farm. (ITsSbResourcePluginStoreEx.GetFarmProperty)
     * @param {BSTR} farmName The name of the farm.
     * @param {BSTR} propertyName The name of the property to retrieve.
     * @param {Pointer<VARIANT>} pVarValue Returns a pointer to the value of the property.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbresourcepluginstore-getfarmproperty
     */
    GetFarmProperty(farmName, propertyName, pVarValue) {
        farmName := farmName is String ? BSTR.Alloc(farmName).Value : farmName
        propertyName := propertyName is String ? BSTR.Alloc(propertyName).Value : propertyName

        result := ComCall(21, this, BSTR, farmName, BSTR, propertyName, VARIANT.Ptr, pVarValue, "HRESULT")
        return result
    }

    /**
     * Deletes a target.
     * @param {BSTR} targetName The name of the target.
     * @param {BSTR} hostName The name of the computer that hosts the target.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbresourcepluginstore-deletetarget
     */
    DeleteTarget(targetName, hostName) {
        targetName := targetName is String ? BSTR.Alloc(targetName).Value : targetName
        hostName := hostName is String ? BSTR.Alloc(hostName).Value : hostName

        result := ComCall(22, this, BSTR, targetName, BSTR, hostName, "HRESULT")
        return result
    }

    /**
     * Sets the value of a property of a target. (ITsSbResourcePluginStore.SetTargetPropertyWithVersionCheck)
     * @remarks
     * When  a target or environment object is updated, the version number in the database is  automatically updated. This method verifies that the version number of the object it has modified matches the internal version number in the database before attempting to save the updated object to the database.
     * @param {ITsSbTarget} pTarget A pointer to the target.
     * @param {BSTR} PropertyName The name of the property.
     * @param {Pointer<VARIANT>} pProperty A pointer to the value to set.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbresourcepluginstore-settargetpropertywithversioncheck
     */
    SetTargetPropertyWithVersionCheck(pTarget, PropertyName, pProperty) {
        PropertyName := PropertyName is String ? BSTR.Alloc(PropertyName).Value : PropertyName

        result := ComCall(23, this, "ptr", pTarget, BSTR, PropertyName, VARIANT.Ptr, pProperty, "HRESULT")
        return result
    }

    /**
     * Sets a property of an environment. (ITsSbResourcePluginStore.SetEnvironmentPropertyWithVersionCheck)
     * @remarks
     * When  a target or environment object is updated, the version number in the database is  automatically updated. This method verifies that the version number of the object it has modified matches the internal version number in the database before attempting to save the updated object to the database.
     * @param {ITsSbEnvironment} pEnvironment A pointer to the environment.
     * @param {BSTR} PropertyName The name of the property to set.
     * @param {Pointer<VARIANT>} pProperty A pointer to the value to set.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbresourcepluginstore-setenvironmentpropertywithversioncheck
     */
    SetEnvironmentPropertyWithVersionCheck(pEnvironment, PropertyName, pProperty) {
        PropertyName := PropertyName is String ? BSTR.Alloc(PropertyName).Value : PropertyName

        result := ComCall(24, this, "ptr", pEnvironment, BSTR, PropertyName, VARIANT.Ptr, pProperty, "HRESULT")
        return result
    }

    /**
     * Locks a target.
     * @remarks
     * After the lock is acquired, the calling thread is assumed to have exclusive access to the target object and therefore no other thread (within the same machine) can update it. Therefore the calling thread must call the <a href="https://docs.microsoft.com/windows/desktop/api/sbtsv/nf-sbtsv-itssbresourcepluginstore-releasetargetlock">ReleaseTargetLock</a> method as soon as it has made the necessary updates to the target object.
     * 
     * <div class="alert"><b>Important</b>  this lock does not completely prevent target objects from being modified externally if more than one Connection Broker exists in the deployment. The calling thread must be prepared to handle a failure gracefully and retry the target update.</div>
     * <div> </div>
     * @param {BSTR} targetName The name of the target to lock.
     * @param {Integer} dwTimeout The timeout for the operation, in milliseconds.
     * @returns {IUnknown} Returns a pointer to the context of the lock. To release the lock, supply this pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/sbtsv/nf-sbtsv-itssbresourcepluginstore-releasetargetlock">ReleaseTargetLock</a> method.
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbresourcepluginstore-acquiretargetlock
     */
    AcquireTargetLock(targetName, dwTimeout) {
        targetName := targetName is String ? BSTR.Alloc(targetName).Value : targetName

        result := ComCall(25, this, BSTR, targetName, "uint", dwTimeout, "ptr*", &ppContext := 0, "HRESULT")
        return IUnknown(ppContext)
    }

    /**
     * Releases a lock on a target.
     * @param {IUnknown} pContext A pointer to the context returned by the <a href="https://docs.microsoft.com/windows/desktop/api/sbtsv/nf-sbtsv-itssbresourcepluginstore-acquiretargetlock">AcquireTargetLock</a> method.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbresourcepluginstore-releasetargetlock
     */
    ReleaseTargetLock(pContext) {
        result := ComCall(26, this, "ptr", pContext, "HRESULT")
        return result
    }

    /**
     * Conditionally sets a new state on a server.
     * @param {BSTR} PoolName Name of the pool.
     * @param {BSTR} ServerFQDN Fully qualified domain name (FQDN) of the server.
     * @param {TARGET_STATE} NewState The state to set.
     * @param {TARGET_STATE} TestState If set to <b>TARGET_UNKNOWN</b> or the current state of the server, the  server will be set as specified in the <i>NewState</i> parameter.
     * @returns {TARGET_STATE} On return, points to the previous state of the server.
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbresourcepluginstore-testandsetserverstate
     */
    TestAndSetServerState(PoolName, ServerFQDN, NewState, TestState) {
        PoolName := PoolName is String ? BSTR.Alloc(PoolName).Value : PoolName
        ServerFQDN := ServerFQDN is String ? BSTR.Alloc(ServerFQDN).Value : ServerFQDN

        result := ComCall(27, this, BSTR, PoolName, BSTR, ServerFQDN, TARGET_STATE, NewState, TARGET_STATE, TestState, "int*", &pInitState := 0, "HRESULT")
        return pInitState
    }

    /**
     * Indicates to the session host that the server is waiting to start.
     * @param {BSTR} PoolName Name of the pool.
     * @param {BSTR} serverName Name of the server.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbresourcepluginstore-setserverwaitingtostart
     */
    SetServerWaitingToStart(PoolName, serverName) {
        PoolName := PoolName is String ? BSTR.Alloc(PoolName).Value : PoolName
        serverName := serverName is String ? BSTR.Alloc(serverName).Value : serverName

        result := ComCall(28, this, BSTR, PoolName, BSTR, serverName, "HRESULT")
        return result
    }

    /**
     * Retrieves the state of a specified server.
     * @param {BSTR} PoolName Name of the pool.
     * @param {BSTR} ServerFQDN Fully qualified domain name (FQDN) of the server.
     * @returns {TARGET_STATE} On return, points to the state of the server.
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbresourcepluginstore-getserverstate
     */
    GetServerState(PoolName, ServerFQDN) {
        PoolName := PoolName is String ? BSTR.Alloc(PoolName).Value : PoolName
        ServerFQDN := ServerFQDN is String ? BSTR.Alloc(ServerFQDN).Value : ServerFQDN

        result := ComCall(29, this, BSTR, PoolName, BSTR, ServerFQDN, "int*", &pState := 0, "HRESULT")
        return pState
    }

    /**
     * Sets the drain mode of the specified server.
     * @param {BSTR} ServerFQDN The fully qualified domain name of the server.
     * @param {Integer} DrainMode The mode to set.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbresourcepluginstore-setserverdrainmode
     */
    SetServerDrainMode(ServerFQDN, DrainMode) {
        ServerFQDN := ServerFQDN is String ? BSTR.Alloc(ServerFQDN).Value : ServerFQDN

        result := ComCall(30, this, BSTR, ServerFQDN, "uint", DrainMode, "HRESULT")
        return result
    }

    Query(iid) {
        if (ITsSbResourcePluginStore.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.QueryTarget := CallbackCreate(GetMethod(implObj, "QueryTarget"), flags, 4)
        this.vtbl.QuerySessionBySessionId := CallbackCreate(GetMethod(implObj, "QuerySessionBySessionId"), flags, 4)
        this.vtbl.AddTargetToStore := CallbackCreate(GetMethod(implObj, "AddTargetToStore"), flags, 2)
        this.vtbl.AddSessionToStore := CallbackCreate(GetMethod(implObj, "AddSessionToStore"), flags, 2)
        this.vtbl.AddEnvironmentToStore := CallbackCreate(GetMethod(implObj, "AddEnvironmentToStore"), flags, 2)
        this.vtbl.RemoveEnvironmentFromStore := CallbackCreate(GetMethod(implObj, "RemoveEnvironmentFromStore"), flags, 3)
        this.vtbl.EnumerateFarms := CallbackCreate(GetMethod(implObj, "EnumerateFarms"), flags, 3)
        this.vtbl.QueryEnvironment := CallbackCreate(GetMethod(implObj, "QueryEnvironment"), flags, 3)
        this.vtbl.EnumerateEnvironments := CallbackCreate(GetMethod(implObj, "EnumerateEnvironments"), flags, 3)
        this.vtbl.SaveTarget := CallbackCreate(GetMethod(implObj, "SaveTarget"), flags, 3)
        this.vtbl.SaveEnvironment := CallbackCreate(GetMethod(implObj, "SaveEnvironment"), flags, 3)
        this.vtbl.SaveSession := CallbackCreate(GetMethod(implObj, "SaveSession"), flags, 2)
        this.vtbl.SetTargetProperty := CallbackCreate(GetMethod(implObj, "SetTargetProperty"), flags, 4)
        this.vtbl.SetEnvironmentProperty := CallbackCreate(GetMethod(implObj, "SetEnvironmentProperty"), flags, 4)
        this.vtbl.SetTargetState := CallbackCreate(GetMethod(implObj, "SetTargetState"), flags, 4)
        this.vtbl.SetSessionState := CallbackCreate(GetMethod(implObj, "SetSessionState"), flags, 2)
        this.vtbl.EnumerateTargets := CallbackCreate(GetMethod(implObj, "EnumerateTargets"), flags, 7)
        this.vtbl.EnumerateSessions := CallbackCreate(GetMethod(implObj, "EnumerateSessions"), flags, 9)
        this.vtbl.GetFarmProperty := CallbackCreate(GetMethod(implObj, "GetFarmProperty"), flags, 4)
        this.vtbl.DeleteTarget := CallbackCreate(GetMethod(implObj, "DeleteTarget"), flags, 3)
        this.vtbl.SetTargetPropertyWithVersionCheck := CallbackCreate(GetMethod(implObj, "SetTargetPropertyWithVersionCheck"), flags, 4)
        this.vtbl.SetEnvironmentPropertyWithVersionCheck := CallbackCreate(GetMethod(implObj, "SetEnvironmentPropertyWithVersionCheck"), flags, 4)
        this.vtbl.AcquireTargetLock := CallbackCreate(GetMethod(implObj, "AcquireTargetLock"), flags, 4)
        this.vtbl.ReleaseTargetLock := CallbackCreate(GetMethod(implObj, "ReleaseTargetLock"), flags, 2)
        this.vtbl.TestAndSetServerState := CallbackCreate(GetMethod(implObj, "TestAndSetServerState"), flags, 6)
        this.vtbl.SetServerWaitingToStart := CallbackCreate(GetMethod(implObj, "SetServerWaitingToStart"), flags, 3)
        this.vtbl.GetServerState := CallbackCreate(GetMethod(implObj, "GetServerState"), flags, 4)
        this.vtbl.SetServerDrainMode := CallbackCreate(GetMethod(implObj, "SetServerDrainMode"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.QueryTarget)
        CallbackFree(this.vtbl.QuerySessionBySessionId)
        CallbackFree(this.vtbl.AddTargetToStore)
        CallbackFree(this.vtbl.AddSessionToStore)
        CallbackFree(this.vtbl.AddEnvironmentToStore)
        CallbackFree(this.vtbl.RemoveEnvironmentFromStore)
        CallbackFree(this.vtbl.EnumerateFarms)
        CallbackFree(this.vtbl.QueryEnvironment)
        CallbackFree(this.vtbl.EnumerateEnvironments)
        CallbackFree(this.vtbl.SaveTarget)
        CallbackFree(this.vtbl.SaveEnvironment)
        CallbackFree(this.vtbl.SaveSession)
        CallbackFree(this.vtbl.SetTargetProperty)
        CallbackFree(this.vtbl.SetEnvironmentProperty)
        CallbackFree(this.vtbl.SetTargetState)
        CallbackFree(this.vtbl.SetSessionState)
        CallbackFree(this.vtbl.EnumerateTargets)
        CallbackFree(this.vtbl.EnumerateSessions)
        CallbackFree(this.vtbl.GetFarmProperty)
        CallbackFree(this.vtbl.DeleteTarget)
        CallbackFree(this.vtbl.SetTargetPropertyWithVersionCheck)
        CallbackFree(this.vtbl.SetEnvironmentPropertyWithVersionCheck)
        CallbackFree(this.vtbl.AcquireTargetLock)
        CallbackFree(this.vtbl.ReleaseTargetLock)
        CallbackFree(this.vtbl.TestAndSetServerState)
        CallbackFree(this.vtbl.SetServerWaitingToStart)
        CallbackFree(this.vtbl.GetServerState)
        CallbackFree(this.vtbl.SetServerDrainMode)
    }
}
