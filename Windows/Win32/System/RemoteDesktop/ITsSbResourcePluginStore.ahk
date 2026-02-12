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
 * @see https://learn.microsoft.com/windows/win32/api//content/sbtsv/nn-sbtsv-itssbresourcepluginstore
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
     * @remarks
     * A resource plug-in store can use this method to retrieve the target that has the specified target name and farm name. Unlike the global store, the resource plug-in store does not copy the target object retrieved because the resource plug-in owns the target object. Accordingly, if you modify the <a href="https://docs.microsoft.com/windows/desktop/api/sbtsv/nn-sbtsv-itssbtarget">ITsSbTarget</a> object that is returned by this method, you are modifying the target object in    the            resource plug-in store.
     * @param {BSTR} TargetName The target name.
     * @param {BSTR} FarmName The farm name. If this parameter is <b>NULL</b>, the method returns the first target it finds.
     * @returns {ITsSbTarget} A pointer to a pointer to an  <a href="https://docs.microsoft.com/windows/desktop/api/sbtsv/nn-sbtsv-itssbtarget">ITsSbTarget</a> target object. When you have finished using the object, release it by calling the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a> method.
     * @see https://learn.microsoft.com/windows/win32/api//content/sbtsv/nf-sbtsv-itssbresourcepluginstore-querytarget
     */
    QueryTarget(TargetName, FarmName) {
        if(TargetName is String) {
            pin := BSTR.Alloc(TargetName)
            TargetName := pin.Value
        }
        if(FarmName is String) {
            pin := BSTR.Alloc(FarmName)
            FarmName := pin.Value
        }

        result := ComCall(3, this, "ptr", TargetName, "ptr", FarmName, "ptr*", &ppTarget := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ITsSbTarget(ppTarget)
    }

    /**
     * Returns the session object that has the specified session ID.
     * @remarks
     * A resource plug-in can use this method to retrieve a session object. Unlike the global store, the resource plug-in store does not copy the session object retrieved because the resource plug-in owns the session object.
     * @param {Integer} dwSessionId The session ID.
     * @param {BSTR} TargetName The target name.
     * @returns {ITsSbSession} A pointer to a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/sbtsv/nn-sbtsv-itssbsession">ITsSbSession</a> session object. When you have finished using the object, release it by calling the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a> method.
     * @see https://learn.microsoft.com/windows/win32/api//content/sbtsv/nf-sbtsv-itssbresourcepluginstore-querysessionbysessionid
     */
    QuerySessionBySessionId(dwSessionId, TargetName) {
        if(TargetName is String) {
            pin := BSTR.Alloc(TargetName)
            TargetName := pin.Value
        }

        result := ComCall(4, this, "uint", dwSessionId, "ptr", TargetName, "ptr*", &ppSession := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ITsSbSession(ppSession)
    }

    /**
     * Adds a target to the resource plug-in store.
     * @param {ITsSbTarget} pTarget A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/sbtsv/nn-sbtsv-itssbtarget">ITsSbTarget</a> target object.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/sbtsv/nf-sbtsv-itssbresourcepluginstore-addtargettostore
     */
    AddTargetToStore(pTarget) {
        result := ComCall(5, this, "ptr", pTarget, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Adds a new session to the resource plug-in store.
     * @param {ITsSbSession} pSession A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/sbtsv/nn-sbtsv-itssbsession">ITsSbSession</a> session object. The target name, user name, domain name, and session ID are required fields.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/sbtsv/nf-sbtsv-itssbresourcepluginstore-addsessiontostore
     */
    AddSessionToStore(pSession) {
        result := ComCall(6, this, "ptr", pSession, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Adds an environment to the resource plug-in store.
     * @remarks
     * Resource plug-ins can use this  method to add an environment to the resource plug-in store.
     * @param {ITsSbEnvironment} pEnvironment A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/sbtsv/nn-sbtsv-itssbenvironment">ITsSbEnvironment</a> environment object.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/sbtsv/nf-sbtsv-itssbresourcepluginstore-addenvironmenttostore
     */
    AddEnvironmentToStore(pEnvironment) {
        result := ComCall(7, this, "ptr", pEnvironment, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @see https://learn.microsoft.com/windows/win32/api//content/sbtsv/nf-sbtsv-itssbresourcepluginstore-removeenvironmentfromstore
     */
    RemoveEnvironmentFromStore(EnvironmentName, bIgnoreOwner) {
        if(EnvironmentName is String) {
            pin := BSTR.Alloc(EnvironmentName)
            EnvironmentName := pin.Value
        }

        result := ComCall(8, this, "ptr", EnvironmentName, "int", bIgnoreOwner, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Enumerates all the farms that have been added to the resource plug-in store.
     * @param {Pointer<Integer>} pdwCount The number of farms retrieved.
     * @param {Pointer<Pointer<SAFEARRAY>>} pVal An array of farm names. The <i>pdwCount</i> parameter contains the number of elements in this array. When you have finished using the array, free the allocated memory by calling the   <a href="https://docs.microsoft.com/windows/desktop/api/oleauto/nf-oleauto-safearraydestroy">SafeArrayDestroy</a> function.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/sbtsv/nf-sbtsv-itssbresourcepluginstore-enumeratefarms
     */
    EnumerateFarms(pdwCount, pVal) {
        pdwCountMarshal := pdwCount is VarRef ? "uint*" : "ptr"
        pValMarshal := pVal is VarRef ? "ptr*" : "ptr"

        result := ComCall(9, this, pdwCountMarshal, pdwCount, pValMarshal, pVal, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Returns the specified environment object.
     * @param {BSTR} EnvironmentName The name of the environment.
     * @returns {ITsSbEnvironment} A pointer to the retrieved <a href="https://docs.microsoft.com/windows/desktop/api/sbtsv/nn-sbtsv-itssbenvironment">ITsSbEnvironment</a> environment object.
     * @see https://learn.microsoft.com/windows/win32/api//content/sbtsv/nf-sbtsv-itssbresourcepluginstore-queryenvironment
     */
    QueryEnvironment(EnvironmentName) {
        if(EnvironmentName is String) {
            pin := BSTR.Alloc(EnvironmentName)
            EnvironmentName := pin.Value
        }

        result := ComCall(10, this, "ptr", EnvironmentName, "ptr*", &ppEnvironment := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ITsSbEnvironment(ppEnvironment)
    }

    /**
     * Returns an array that contains the environments present in the resource plug-in store.
     * @param {Pointer<Integer>} pdwCount A pointer to the number of targets retrieved.
     * @returns {Pointer<ITsSbEnvironment>} A pointer to an array that contains references to the environments present. When you have finished using the array, release each element and free the array by calling the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a> function.
     * @see https://learn.microsoft.com/windows/win32/api//content/sbtsv/nf-sbtsv-itssbresourcepluginstore-enumerateenvironments
     */
    EnumerateEnvironments(pdwCount) {
        pdwCountMarshal := pdwCount is VarRef ? "uint*" : "ptr"

        result := ComCall(11, this, pdwCountMarshal, pdwCount, "ptr*", &pVal := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pVal
    }

    /**
     * Saves a target.
     * @param {ITsSbTarget} pTarget Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/sbtsv/nn-sbtsv-itssbtarget">ITsSbTarget</a> object to save.
     * @param {BOOL} bForceWrite Set to TRUE to force writing the saved object.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/sbtsv/nf-sbtsv-itssbresourcepluginstore-savetarget
     */
    SaveTarget(pTarget, bForceWrite) {
        result := ComCall(12, this, "ptr", pTarget, "int", bForceWrite, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Saves an environment.
     * @param {ITsSbEnvironment} pEnvironment Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/sbtsv/nn-sbtsv-itssbenvironment">ITsSbEnvironment</a> object to save.
     * @param {BOOL} bForceWrite Set to <b>TRUE</b> to force writing the saved object.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/sbtsv/nf-sbtsv-itssbresourcepluginstore-saveenvironment
     */
    SaveEnvironment(pEnvironment, bForceWrite) {
        result := ComCall(13, this, "ptr", pEnvironment, "int", bForceWrite, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Saves a session.
     * @param {ITsSbSession} pSession A Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/sbtsv/nn-sbtsv-itssbsession">ITsSbSession</a> object to save.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/sbtsv/nf-sbtsv-itssbresourcepluginstore-savesession
     */
    SaveSession(pSession) {
        result := ComCall(14, this, "ptr", pSession, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Sets the value of a property of a target. (ITsSbResourcePluginStoreEx.SetTargetProperty)
     * @param {BSTR} TargetName The name of the target.
     * @param {BSTR} PropertyName The name of the property.
     * @param {Pointer<VARIANT>} pProperty A pointer to the value to set.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/sbtsv/nf-sbtsv-itssbresourcepluginstore-settargetproperty
     */
    SetTargetProperty(TargetName, PropertyName, pProperty) {
        if(TargetName is String) {
            pin := BSTR.Alloc(TargetName)
            TargetName := pin.Value
        }
        if(PropertyName is String) {
            pin := BSTR.Alloc(PropertyName)
            PropertyName := pin.Value
        }

        result := ComCall(15, this, "ptr", TargetName, "ptr", PropertyName, "ptr", pProperty, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Sets a property of an environment. (ITsSbResourcePluginStoreEx.SetEnvironmentProperty)
     * @param {BSTR} EnvironmentName The name of the environment.
     * @param {BSTR} PropertyName The name of the property to set.
     * @param {Pointer<VARIANT>} pProperty A pointer to the value to set.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/sbtsv/nf-sbtsv-itssbresourcepluginstore-setenvironmentproperty
     */
    SetEnvironmentProperty(EnvironmentName, PropertyName, pProperty) {
        if(EnvironmentName is String) {
            pin := BSTR.Alloc(EnvironmentName)
            EnvironmentName := pin.Value
        }
        if(PropertyName is String) {
            pin := BSTR.Alloc(PropertyName)
            PropertyName := pin.Value
        }

        result := ComCall(16, this, "ptr", EnvironmentName, "ptr", PropertyName, "ptr", pProperty, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Sets the state of a target object.
     * @param {BSTR} targetName The name of the target.
     * @param {Integer} newState The <a href="https://docs.microsoft.com/windows/desktop/api/sessdirpublictypes/ne-sessdirpublictypes-target_state">TARGET_STATE</a> value to set.
     * @returns {Integer} The previous state of the target.
     * @see https://learn.microsoft.com/windows/win32/api//content/sbtsv/nf-sbtsv-itssbresourcepluginstore-settargetstate
     */
    SetTargetState(targetName, newState) {
        if(targetName is String) {
            pin := BSTR.Alloc(targetName)
            targetName := pin.Value
        }

        result := ComCall(17, this, "ptr", targetName, "int", newState, "int*", &pOldState := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pOldState
    }

    /**
     * Sets the session state.
     * @param {ITsSbSession} sbSession A pointer to the session to modify.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/sbtsv/nf-sbtsv-itssbresourcepluginstore-setsessionstate
     */
    SetSessionState(sbSession) {
        result := ComCall(18, this, "ptr", sbSession, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Returns an array that contains the specified targets that are present in the resource plug-in store.
     * @param {BSTR} FarmName The farm name.
     * @param {BSTR} EnvName The environment name.
     * @param {Integer} sortByFieldId Specifies sort order.
     * @param {BSTR} sortyByPropName The property name to sort by if <i>sortByFieldId</i> is set to <b>TS_SB_SORT_BY_PROP</b>.
     * @param {Pointer<Integer>} pdwCount The number of targets retrieved.
     * @returns {Pointer<ITsSbTarget>} Pointer to the retrieved <a href="https://docs.microsoft.com/windows/desktop/api/sbtsv/nn-sbtsv-itssbtarget">ITsSbTarget</a> objects.
     * @see https://learn.microsoft.com/windows/win32/api//content/sbtsv/nf-sbtsv-itssbresourcepluginstore-enumeratetargets
     */
    EnumerateTargets(FarmName, EnvName, sortByFieldId, sortyByPropName, pdwCount) {
        if(FarmName is String) {
            pin := BSTR.Alloc(FarmName)
            FarmName := pin.Value
        }
        if(EnvName is String) {
            pin := BSTR.Alloc(EnvName)
            EnvName := pin.Value
        }
        if(sortyByPropName is String) {
            pin := BSTR.Alloc(sortyByPropName)
            sortyByPropName := pin.Value
        }

        pdwCountMarshal := pdwCount is VarRef ? "uint*" : "ptr"

        result := ComCall(19, this, "ptr", FarmName, "ptr", EnvName, "int", sortByFieldId, "ptr", sortyByPropName, pdwCountMarshal, pdwCount, "ptr*", &pVal := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @see https://learn.microsoft.com/windows/win32/api//content/sbtsv/nf-sbtsv-itssbresourcepluginstore-enumeratesessions
     */
    EnumerateSessions(targetName, userName, userDomain, poolName, initialProgram, pSessionState, pdwCount) {
        if(targetName is String) {
            pin := BSTR.Alloc(targetName)
            targetName := pin.Value
        }
        if(userName is String) {
            pin := BSTR.Alloc(userName)
            userName := pin.Value
        }
        if(userDomain is String) {
            pin := BSTR.Alloc(userDomain)
            userDomain := pin.Value
        }
        if(poolName is String) {
            pin := BSTR.Alloc(poolName)
            poolName := pin.Value
        }
        if(initialProgram is String) {
            pin := BSTR.Alloc(initialProgram)
            initialProgram := pin.Value
        }

        pSessionStateMarshal := pSessionState is VarRef ? "int*" : "ptr"
        pdwCountMarshal := pdwCount is VarRef ? "uint*" : "ptr"

        result := ComCall(20, this, "ptr", targetName, "ptr", userName, "ptr", userDomain, "ptr", poolName, "ptr", initialProgram, pSessionStateMarshal, pSessionState, pdwCountMarshal, pdwCount, "ptr*", &ppVal := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppVal
    }

    /**
     * Retrieves a property of a farm. (ITsSbResourcePluginStoreEx.GetFarmProperty)
     * @param {BSTR} farmName The name of the farm.
     * @param {BSTR} propertyName The name of the property to retrieve.
     * @param {Pointer<VARIANT>} pVarValue Returns a pointer to the value of the property.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/sbtsv/nf-sbtsv-itssbresourcepluginstore-getfarmproperty
     */
    GetFarmProperty(farmName, propertyName, pVarValue) {
        if(farmName is String) {
            pin := BSTR.Alloc(farmName)
            farmName := pin.Value
        }
        if(propertyName is String) {
            pin := BSTR.Alloc(propertyName)
            propertyName := pin.Value
        }

        result := ComCall(21, this, "ptr", farmName, "ptr", propertyName, "ptr", pVarValue, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Deletes a target.
     * @param {BSTR} targetName The name of the target.
     * @param {BSTR} hostName The name of the computer that hosts the target.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/sbtsv/nf-sbtsv-itssbresourcepluginstore-deletetarget
     */
    DeleteTarget(targetName, hostName) {
        if(targetName is String) {
            pin := BSTR.Alloc(targetName)
            targetName := pin.Value
        }
        if(hostName is String) {
            pin := BSTR.Alloc(hostName)
            hostName := pin.Value
        }

        result := ComCall(22, this, "ptr", targetName, "ptr", hostName, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @see https://learn.microsoft.com/windows/win32/api//content/sbtsv/nf-sbtsv-itssbresourcepluginstore-settargetpropertywithversioncheck
     */
    SetTargetPropertyWithVersionCheck(pTarget, PropertyName, pProperty) {
        if(PropertyName is String) {
            pin := BSTR.Alloc(PropertyName)
            PropertyName := pin.Value
        }

        result := ComCall(23, this, "ptr", pTarget, "ptr", PropertyName, "ptr", pProperty, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @see https://learn.microsoft.com/windows/win32/api//content/sbtsv/nf-sbtsv-itssbresourcepluginstore-setenvironmentpropertywithversioncheck
     */
    SetEnvironmentPropertyWithVersionCheck(pEnvironment, PropertyName, pProperty) {
        if(PropertyName is String) {
            pin := BSTR.Alloc(PropertyName)
            PropertyName := pin.Value
        }

        result := ComCall(24, this, "ptr", pEnvironment, "ptr", PropertyName, "ptr", pProperty, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @see https://learn.microsoft.com/windows/win32/api//content/sbtsv/nf-sbtsv-itssbresourcepluginstore-acquiretargetlock
     */
    AcquireTargetLock(targetName, dwTimeout) {
        if(targetName is String) {
            pin := BSTR.Alloc(targetName)
            targetName := pin.Value
        }

        result := ComCall(25, this, "ptr", targetName, "uint", dwTimeout, "ptr*", &ppContext := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IUnknown(ppContext)
    }

    /**
     * Releases a lock on a target.
     * @param {IUnknown} pContext A pointer to the context returned by the <a href="https://docs.microsoft.com/windows/desktop/api/sbtsv/nf-sbtsv-itssbresourcepluginstore-acquiretargetlock">AcquireTargetLock</a> method.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/sbtsv/nf-sbtsv-itssbresourcepluginstore-releasetargetlock
     */
    ReleaseTargetLock(pContext) {
        result := ComCall(26, this, "ptr", pContext, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Conditionally sets a new state on a server.
     * @param {BSTR} PoolName Name of the pool.
     * @param {BSTR} ServerFQDN Fully qualified domain name (FQDN) of the server.
     * @param {Integer} NewState The state to set.
     * @param {Integer} TestState If set to <b>TARGET_UNKNOWN</b> or the current state of the server, the  server will be set as specified in the <i>NewState</i> parameter.
     * @returns {Integer} On return, points to the previous state of the server.
     * @see https://learn.microsoft.com/windows/win32/api//content/sbtsv/nf-sbtsv-itssbresourcepluginstore-testandsetserverstate
     */
    TestAndSetServerState(PoolName, ServerFQDN, NewState, TestState) {
        if(PoolName is String) {
            pin := BSTR.Alloc(PoolName)
            PoolName := pin.Value
        }
        if(ServerFQDN is String) {
            pin := BSTR.Alloc(ServerFQDN)
            ServerFQDN := pin.Value
        }

        result := ComCall(27, this, "ptr", PoolName, "ptr", ServerFQDN, "int", NewState, "int", TestState, "int*", &pInitState := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pInitState
    }

    /**
     * Indicates to the session host that the server is waiting to start.
     * @param {BSTR} PoolName Name of the pool.
     * @param {BSTR} serverName Name of the server.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/sbtsv/nf-sbtsv-itssbresourcepluginstore-setserverwaitingtostart
     */
    SetServerWaitingToStart(PoolName, serverName) {
        if(PoolName is String) {
            pin := BSTR.Alloc(PoolName)
            PoolName := pin.Value
        }
        if(serverName is String) {
            pin := BSTR.Alloc(serverName)
            serverName := pin.Value
        }

        result := ComCall(28, this, "ptr", PoolName, "ptr", serverName, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves the state of a specified server.
     * @param {BSTR} PoolName Name of the pool.
     * @param {BSTR} ServerFQDN Fully qualified domain name (FQDN) of the server.
     * @returns {Integer} On return, points to the state of the server.
     * @see https://learn.microsoft.com/windows/win32/api//content/sbtsv/nf-sbtsv-itssbresourcepluginstore-getserverstate
     */
    GetServerState(PoolName, ServerFQDN) {
        if(PoolName is String) {
            pin := BSTR.Alloc(PoolName)
            PoolName := pin.Value
        }
        if(ServerFQDN is String) {
            pin := BSTR.Alloc(ServerFQDN)
            ServerFQDN := pin.Value
        }

        result := ComCall(29, this, "ptr", PoolName, "ptr", ServerFQDN, "int*", &pState := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pState
    }

    /**
     * Sets the drain mode of the specified server.
     * @param {BSTR} ServerFQDN The fully qualified domain name of the server.
     * @param {Integer} DrainMode The mode to set.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/sbtsv/nf-sbtsv-itssbresourcepluginstore-setserverdrainmode
     */
    SetServerDrainMode(ServerFQDN, DrainMode) {
        if(ServerFQDN is String) {
            pin := BSTR.Alloc(ServerFQDN)
            ServerFQDN := pin.Value
        }

        result := ComCall(30, this, "ptr", ServerFQDN, "uint", DrainMode, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
