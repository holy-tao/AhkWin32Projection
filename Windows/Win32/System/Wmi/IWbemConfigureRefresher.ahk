#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IWbemClassObject.ahk" { IWbemClassObject }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\IWbemRefresher.ahk" { IWbemRefresher }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IWbemServices.ahk" { IWbemServices }
#Import ".\IWbemHiPerfEnum.ahk" { IWbemHiPerfEnum }
#Import ".\IWbemContext.ahk" { IWbemContext }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * The IWbemConfigureRefresher interface is used by client code to add enumerators, objects, and nested refreshers into a refresher.
 * @see https://learn.microsoft.com/windows/win32/api/wbemcli/nn-wbemcli-iwbemconfigurerefresher
 * @namespace Windows.Win32.System.Wmi
 */
export default struct IWbemConfigureRefresher extends IUnknown {
    /**
     * The interface identifier for IWbemConfigureRefresher
     * @type {Guid}
     */
    static IID := Guid("{49353c92-516b-11d1-aea6-00c04fb68820}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWbemConfigureRefresher interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        AddObjectByPath     : IntPtr
        AddObjectByTemplate : IntPtr
        AddRefresher        : IntPtr
        Remove              : IntPtr
        AddEnum             : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWbemConfigureRefresher.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The IWbemConfigureRefresher::AddObjectByPath method adds an object to a refresher by specifying an object path.
     * @remarks
     * The supplied path must specify a valid object, which is provided by the High-Performance Provider. The returned object must not be touched by the client while a refresh operation is in process. The returned identifier can be used by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nf-wbemcli-iwbemconfigurerefresher-remove">Remove</a> function to remove the object.
     * 
     * <div class="alert"><b>Note</b>  It is not necessary for the user to explicitly remove added objects. The client must call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a> on the returned object when it is no longer required.</div>
     * <div> </div>
     * @param {IWbemServices} pNamespace An 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nn-wbemcli-iwbemservices">IWbemServices</a> pointer back into Windows Management, which can service any request made by the provider. The provider should call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-addref">AddRef</a> on this pointer if it is going to call back into Windows Management during its execution.
     * @param {PWSTR} wszPath Constant, null-terminated string of 16-bit Unicode characters that contains the object path of the object you add to the refresher.
     * @param {Integer} lFlags Bitmask of flags that modify the behavior of this method. If this parameter is set to <b>WBEM_FLAG_USE_AMENDED_QUALIFIERS</b>, the returned instance contain localized qualifiers if available.
     * @param {IWbemContext} pContext Typically <b>NULL</b>; otherwise, a pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nn-wbemcli-iwbemcontext">IWbemContext</a> object that is required by one or more dynamic class providers. The values in the context object must be specified in the specific provider documentation. For more information about this parameter, see 
     * <a href="https://docs.microsoft.com/windows/desktop/WmiSdk/making-calls-to-wmi">Making Calls to WMI</a>.
     * @param {Pointer<Integer>} plId Pointer to an integer returned by the provider that uniquely identifies the refreshable object.
     * @returns {IWbemClassObject} Pointer to hold the reference to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nn-wbemcli-iwbemclassobject">IWbemClassObject</a> object, which contains the refreshable instance object. The client must call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a> on the returned object when it is no longer required.
     * @see https://learn.microsoft.com/windows/win32/api/wbemcli/nf-wbemcli-iwbemconfigurerefresher-addobjectbypath
     */
    AddObjectByPath(pNamespace, wszPath, lFlags, pContext, plId) {
        wszPath := wszPath is String ? StrPtr(wszPath) : wszPath

        plIdMarshal := plId is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, "ptr", pNamespace, "ptr", wszPath, "int", lFlags, "ptr", pContext, "ptr*", &ppRefreshable := 0, plIdMarshal, plId, "HRESULT")
        return IWbemClassObject(ppRefreshable)
    }

    /**
     * With the IWbemConfigureRefresher::AddObjectByTemplate method, you can add an object you want refreshed to a refresher by specifying an IWbemClassObject instance template.
     * @remarks
     * The supplied instance must specify a valid object, which is provided by the High-Performance Provider. The returned object must not be modified by the client while a refresh operation is in process. The returned identifier can be used by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nf-wbemcli-iwbemconfigurerefresher-remove">Remove</a> function to remove the object.
     * 
     * It is not necessary for the user to explicitly remove added objects. The client must call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a> on the returned object when it is no longer required.
     * @param {IWbemServices} pNamespace An 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nn-wbemcli-iwbemservices">IWbemServices</a> pointer back into Windows Management, which can service any request made by the provider. The provider should call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-addref">AddRef</a> on this pointer if it is going to call back into Windows Management during its execution.
     * @param {IWbemClassObject} pTemplate Pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nn-wbemcli-iwbemclassobject">IWbemClassObject</a> object that contains the instance template.
     * @param {Integer} lFlags Bitmask of flags that modify the behavior of this method. If this parameter is set to <b>WBEM_FLAG_USE_AMENDED_QUALIFIERS</b>, the returned instance will contain localized qualifiers if available.
     * @param {IWbemContext} pContext Typically <b>NULL</b>; otherwise, a pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nn-wbemcli-iwbemcontext">IWbemContext</a> object that is required by one or more dynamic class providers. The values in the context object must be specified in the specific provider documentation. For more information about this parameter, see 
     * <a href="https://docs.microsoft.com/windows/desktop/WmiSdk/making-calls-to-wmi">Making Calls to WMI</a>.
     * @param {Pointer<Integer>} plId Pointer to an integer returned by the provider that uniquely identifies this refreshable object.
     * @returns {IWbemClassObject} Pointer to hold the reference to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nn-wbemcli-iwbemclassobject">IWbemClassObject</a> object, which will contain the refreshable instance object. The client must call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a> on the returned object when it is no longer required.
     * @see https://learn.microsoft.com/windows/win32/api/wbemcli/nf-wbemcli-iwbemconfigurerefresher-addobjectbytemplate
     */
    AddObjectByTemplate(pNamespace, pTemplate, lFlags, pContext, plId) {
        plIdMarshal := plId is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, "ptr", pNamespace, "ptr", pTemplate, "int", lFlags, "ptr", pContext, "ptr*", &ppRefreshable := 0, plIdMarshal, plId, "HRESULT")
        return IWbemClassObject(ppRefreshable)
    }

    /**
     * The IWbemConfigureRefresher::AddRefresher method adds a refresher to a refresher.
     * @remarks
     * Users should not add recursively nested refreshers. The returned identifier can be used by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nf-wbemcli-iwbemconfigurerefresher-remove">Remove</a> function to remove the refresher. Although it is not necessary for the client to explicitly remove added refreshers, the client must call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a> on the refreshers when they are no longer required.
     * @param {IWbemRefresher} pRefresher Pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nn-wbemcli-iwbemrefresher">IWbemRefresher</a> object to nest in this refresher.
     * @param {Integer} lFlags Reserved. This parameter must be 0 (zero).
     * @param {Pointer<Integer>} plId Pointer to an integer returned by the provider that uniquely identifies the refreshable object.
     * @returns {HRESULT} This method returns an <b>HRESULT</b> indicating the status of the method call. The following list lists the value contained within an <b>HRESULT</b>.
     * @see https://learn.microsoft.com/windows/win32/api/wbemcli/nf-wbemcli-iwbemconfigurerefresher-addrefresher
     */
    AddRefresher(pRefresher, lFlags, plId) {
        plIdMarshal := plId is VarRef ? "int*" : "ptr"

        result := ComCall(5, this, "ptr", pRefresher, "int", lFlags, plIdMarshal, plId, "HRESULT")
        return result
    }

    /**
     * The IWbemConfigureRefresher::Remove method is used to remove an object, enumerator, or nested refresher from a refresher.
     * @param {Integer} lId Integer that uniquely identifies the object to remove. You obtain this identifier when you first add an object to the refresher by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nf-wbemcli-iwbemconfigurerefresher-addobjectbypath">IWbemConfigureRefresher::AddObjectByPath</a>, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nf-wbemcli-iwbemconfigurerefresher-addobjectbytemplate">IWbemConfigureRefresher::AddObjectByTemplate</a>, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nf-wbemcli-iwbemconfigurerefresher-addenum">IWbemConfigureRefresher::AddEnum</a>, or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nf-wbemcli-iwbemconfigurerefresher-addrefresher">IWbemConfigureRefresher::AddRefresher</a>.
     * @param {Integer} lFlags Bitmask of flags that modify the behavior of the 
     * <b>Remove</b> method. If this parameter is set to. <b>WBEM_FLAG_REFRESH_AUTO_RECONNECT</b>, the refresher attempts to automatically reconnect to a remote provider if the connection is broken. This is default behavior for this method. Specify <b>WBEM_FLAG_REFRESH_NO_AUTO_RECONNECT</b> if you do not want the refresher to attempt to reconnect to a remote provider.
     * @returns {HRESULT} This method returns an <b>HRESULT</b> indicating the status of the method call. The following list lists the value contained within an <b>HRESULT</b>.
     * @see https://learn.microsoft.com/windows/win32/api/wbemcli/nf-wbemcli-iwbemconfigurerefresher-remove
     */
    Remove(lId, lFlags) {
        result := ComCall(6, this, "int", lId, "int", lFlags, "HRESULT")
        return result
    }

    /**
     * The IWbemConfigureRefresher::AddEnum method adds an enumerator to the requested refresher.
     * @remarks
     * The supplied class must specify a valid class, which is provided by the High-Performance Provider. All instances of the returned enumerator can be queried after calls. On each call to refresh, the number of instances in the enumerator can vary. Only instances of the specified class name are returned; subclasses of the specified class will not be enumerated because detailed enumeration is not supported. The returned enumerator must not be touched by the client while a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nf-wbemcli-iwbemrefresher-refresh">Refresh</a> operation is in process. The returned identifier can be used by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nf-wbemcli-iwbemconfigurerefresher-remove">Remove</a> function to remove the object. Note that it is not necessary for the user to explicitly remove added enumerators. However, the client must call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a> on the returned enumerator when it is no longer required.
     * @param {IWbemServices} pNamespace An 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nn-wbemcli-iwbemservices">IWbemServices</a> pointer back into Windows Management, which can service any request made by the provider. If the method must call back into Windows Management during its execution, the provider should call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-addref">AddRef</a> with the <i>pNamespace</i> pointer.
     * @param {PWSTR} wszClassName Constant, null-terminated string of 16-bit Unicode characters containing the name of the class that is enumerated.
     * @param {Integer} lFlags Bitmask of flags that modify the behavior of this method. If this parameter is set to WBEM_FLAG_USE_AMENDED_QUALIFIERS, the returned instances contain localized qualifiers if they are available.
     * @param {IWbemContext} pContext Typically <b>NULL</b>; otherwise, this is a pointer to an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nn-wbemcli-iwbemcontext">IWbemContext</a> object that is required by one or more dynamic class providers. The values in the context object must be specified in the specific provider documentation. For more information about this parameter, see 
     * <a href="https://docs.microsoft.com/windows/desktop/WmiSdk/making-calls-to-wmi">Making Calls to WMI</a>.
     * @param {Pointer<Integer>} plId Pointer to an integer returned by the provider that uniquely identifies the refreshable enumeration.
     * @returns {IWbemHiPerfEnum} Pointer that holds the reference to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nn-wbemcli-iwbemhiperfenum">IWbemHiPerfEnum</a> object, which will contain the enumeration. The client must call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-release">Release</a> on this pointer when it is no longer required.
     * @see https://learn.microsoft.com/windows/win32/api/wbemcli/nf-wbemcli-iwbemconfigurerefresher-addenum
     */
    AddEnum(pNamespace, wszClassName, lFlags, pContext, plId) {
        wszClassName := wszClassName is String ? StrPtr(wszClassName) : wszClassName

        plIdMarshal := plId is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, "ptr", pNamespace, "ptr", wszClassName, "int", lFlags, "ptr", pContext, "ptr*", &ppEnum := 0, plIdMarshal, plId, "HRESULT")
        return IWbemHiPerfEnum(ppEnum)
    }

    Query(iid) {
        if (IWbemConfigureRefresher.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.AddObjectByPath := CallbackCreate(GetMethod(implObj, "AddObjectByPath"), flags, 7)
        this.vtbl.AddObjectByTemplate := CallbackCreate(GetMethod(implObj, "AddObjectByTemplate"), flags, 7)
        this.vtbl.AddRefresher := CallbackCreate(GetMethod(implObj, "AddRefresher"), flags, 4)
        this.vtbl.Remove := CallbackCreate(GetMethod(implObj, "Remove"), flags, 3)
        this.vtbl.AddEnum := CallbackCreate(GetMethod(implObj, "AddEnum"), flags, 7)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.AddObjectByPath)
        CallbackFree(this.vtbl.AddObjectByTemplate)
        CallbackFree(this.vtbl.AddRefresher)
        CallbackFree(this.vtbl.Remove)
        CallbackFree(this.vtbl.AddEnum)
    }
}
