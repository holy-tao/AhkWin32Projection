#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\pluginResource.ahk" { pluginResource }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Exposes properties and methods that provide information about resources available to users of RemoteApp and Desktop Connections.
 * @remarks
 * <p class="proch"><b>To register your plug-in so that it will be called by the RemoteApp and Desktop Connection Management service</b>
 * 
 * <ol>
 * <li>Implement the plug-in in a DLL and register the DLL by using the Regsvr32.exe tool.</li>
 * <li>Create a subkey named for the CLSID of the DLL under the following key:<pre><b>HKEY_LOCAL_MACHINE</b>
 *    <b>Software</b>
 *       <b>Microsoft</b>
 *          <b>Windows NT</b>
 *             <b>CurrentVersion</b>
 *                <b>Terminal Server</b>
 *                   <b>CentralizedPublishing</b>
 *                      <b>Plugins</b></pre>
 * </li>
 * <li>Create a value for the subkey of type <b>DWORD</b> with the name "IsEnabled". To allow the service to call the plug-in, set the value to one. To disallow calls to the plug-in, set the value to zero. You do not need to restart the service because the service loads the plug-in automatically.</li>
 * </ol>
 * @see https://learn.microsoft.com/windows/win32/api/tspubplugincom/nn-tspubplugincom-itspubplugin
 * @namespace Windows.Win32.System.RemoteDesktop
 */
export default struct ItsPubPlugin extends IUnknown {
    /**
     * The interface identifier for ItsPubPlugin
     * @type {Guid}
     */
    static IID := Guid("{70c04b05-f347-412b-822f-36c99c54ca45}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ItsPubPlugin interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetResourceList        : IntPtr
        GetResource            : IntPtr
        GetCacheLastUpdateTime : IntPtr
        get_pluginName         : IntPtr
        get_pluginVersion      : IntPtr
        ResolveResource        : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ItsPubPlugin.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    pluginName {
        get => this.get_pluginName()
    }

    /**
     * @type {BSTR} 
     */
    pluginVersion {
        get => this.get_pluginVersion()
    }

    /**
     * Retrieves a list of resources assigned to the specified user. (ItsPubPlugin.GetResourceList)
     * @param {PWSTR} userID The user security identifier (SID).
     * @param {Pointer<Integer>} pceAppListSize A pointer to a <b>LONG</b> variable to receive the number of elements in the <i>resourceList</i>.
     * @param {Pointer<Pointer<pluginResource>>} resourceList The address of a pointer to an array of <a href="https://docs.microsoft.com/windows/win32/api/tspubplugincom/ns-tspubplugincom-pluginresource">pluginResource</a> structures that receive the resources assigned to the specified user. You must use the <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemalloc">CoTaskMemAlloc</a> function to allocate this memory. The caller is responsible for freeing this memory.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/tspubplugincom/nf-tspubplugincom-itspubplugin-getresourcelist
     */
    GetResourceList(userID, pceAppListSize, resourceList) {
        userID := userID is String ? StrPtr(userID) : userID

        pceAppListSizeMarshal := pceAppListSize is VarRef ? "int*" : "ptr"
        resourceListMarshal := resourceList is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, "ptr", userID, pceAppListSizeMarshal, pceAppListSize, resourceListMarshal, resourceList, "HRESULT")
        return result
    }

    /**
     * This method is reserved and should always return E_NOTIMPL. (ItsPubPlugin.GetResource)
     * @param {PWSTR} alias This parameter is reserved.
     * @param {Integer} flags This parameter is reserved.
     * @returns {pluginResource} This parameter is reserved.
     * @see https://learn.microsoft.com/windows/win32/api/tspubplugincom/nf-tspubplugincom-itspubplugin-getresource
     */
    GetResource(alias, flags) {
        alias := alias is String ? StrPtr(alias) : alias

        resource := pluginResource()
        result := ComCall(4, this, "ptr", alias, "int", flags, pluginResource.Ptr, resource, "HRESULT")
        return resource
    }

    /**
     * Returns the time that the cache was last updated.
     * @remarks
     * The RemoteApp and Desktop Connection Management service calls this method to get the last time that the cache was refreshed. If your plug-in does not implement caching, return the current system time. This tells the service that it must call <a href="https://docs.microsoft.com/windows/desktop/api/tspubplugincom/nf-tspubplugincom-itspubplugin-getresourcelist">GetResourceList</a> to get the current list of resources. We recommend implementing the plug-in with caching because caching reduces the number of calls the service must make to <b>GetResourceList</b>.
     * @returns {Integer} A pointer to an  <b>unsigned long long</b> variable that receives the time that the cache was last updated.
     * @see https://learn.microsoft.com/windows/win32/api/tspubplugincom/nf-tspubplugincom-itspubplugin-getcachelastupdatetime
     */
    GetCacheLastUpdateTime() {
        result := ComCall(5, this, "uint*", &lastUpdateTime := 0, "HRESULT")
        return lastUpdateTime
    }

    /**
     * Retrieves the name of the plug-in.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/tspubplugincom/nf-tspubplugincom-itspubplugin-get_pluginname
     */
    get_pluginName() {
        pVal := BSTR.Owned()
        result := ComCall(6, this, BSTR.Ptr, pVal, "HRESULT")
        return pVal
    }

    /**
     * Retrieves the version of the plug-in.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/tspubplugincom/nf-tspubplugincom-itspubplugin-get_pluginversion
     */
    get_pluginVersion() {
        pVal := BSTR.Owned()
        result := ComCall(7, this, BSTR.Ptr, pVal, "HRESULT")
        return pVal
    }

    /**
     * Provides information about how to connect to a user's assigned personal virtual desktop.
     * @remarks
     * RD Connection Broker only calls one plug-in when connecting a user to a resource. To receive calls, you must register your plug-in before starting RD Connection Broker, or you must add a "LoadBalanceInfo" setting to the .rdp file that the client uses to connect. For example, if your plug-in is for personal virtual desktops and is called "plugin1", you would add the following line to the .rdp file: "LoadBalanceInfo:s:tsv://vmresource1.2.plugin1"
     * @param {PWSTR} resourceLocation The name of the resource plug-in.
     * @param {PWSTR} endPointName The name of the endpoint. For personal virtual desktops, specify the name of the desktop assigned to the user. For virtual desktop pools, specify the name of the pool.
     * @param {PWSTR} userID A pointer to a string that contains the user security identifier (SID).
     * @param {PWSTR} alias A pointer to a string that contains the alias of the user.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/tspubplugincom/nf-tspubplugincom-itspubplugin-resolveresource
     */
    ResolveResource(resourceLocation, endPointName, userID, alias) {
        resourceLocation := resourceLocation is String ? StrPtr(resourceLocation) : resourceLocation
        endPointName := endPointName is String ? StrPtr(endPointName) : endPointName
        userID := userID is String ? StrPtr(userID) : userID
        alias := alias is String ? StrPtr(alias) : alias

        result := ComCall(8, this, "uint*", &_resourceType := 0, "ptr", resourceLocation, "ptr", endPointName, "ptr", userID, "ptr", alias, "HRESULT")
        return _resourceType
    }

    Query(iid) {
        if (ItsPubPlugin.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetResourceList := CallbackCreate(GetMethod(implObj, "GetResourceList"), flags, 4)
        this.vtbl.GetResource := CallbackCreate(GetMethod(implObj, "GetResource"), flags, 4)
        this.vtbl.GetCacheLastUpdateTime := CallbackCreate(GetMethod(implObj, "GetCacheLastUpdateTime"), flags, 2)
        this.vtbl.get_pluginName := CallbackCreate(GetMethod(implObj, "get_pluginName"), flags, 2)
        this.vtbl.get_pluginVersion := CallbackCreate(GetMethod(implObj, "get_pluginVersion"), flags, 2)
        this.vtbl.ResolveResource := CallbackCreate(GetMethod(implObj, "ResolveResource"), flags, 6)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetResourceList)
        CallbackFree(this.vtbl.GetResource)
        CallbackFree(this.vtbl.GetCacheLastUpdateTime)
        CallbackFree(this.vtbl.get_pluginName)
        CallbackFree(this.vtbl.get_pluginVersion)
        CallbackFree(this.vtbl.ResolveResource)
    }
}
