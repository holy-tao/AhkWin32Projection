#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Exposes properties and methods that provide information about resources available to users of RemoteApp and Desktop Connections.
 * @remarks
 * 
  * <p class="proch"><b>To register your plug-in so that it will be called by the RemoteApp and Desktop Connection Management service</b>
  * 
  * <ol>
  * <li>Implement the plug-in in a DLL and register the DLL by using the Regsvr32.exe tool.</li>
  * <li>Create a subkey named for the CLSID of the DLL under the following key:<pre xml:space="preserve"><b>HKEY_LOCAL_MACHINE</b>
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
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//tspubplugincom/nn-tspubplugincom-itspubplugin
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class ItsPubPlugin extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ItsPubPlugin
     * @type {Guid}
     */
    static IID => Guid("{70c04b05-f347-412b-822f-36c99c54ca45}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetResourceList", "GetResource", "GetCacheLastUpdateTime", "get_pluginName", "get_pluginVersion", "ResolveResource"]

    /**
     * 
     * @param {PWSTR} userID 
     * @param {Pointer<Integer>} pceAppListSize 
     * @param {Pointer<Pointer<pluginResource>>} resourceList 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tspubplugincom/nf-tspubplugincom-itspubplugin-getresourcelist
     */
    GetResourceList(userID, pceAppListSize, resourceList) {
        userID := userID is String ? StrPtr(userID) : userID

        result := ComCall(3, this, "ptr", userID, "int*", pceAppListSize, "ptr*", resourceList, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} alias 
     * @param {Integer} flags 
     * @param {Pointer<pluginResource>} resource 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tspubplugincom/nf-tspubplugincom-itspubplugin-getresource
     */
    GetResource(alias, flags, resource) {
        alias := alias is String ? StrPtr(alias) : alias

        result := ComCall(4, this, "ptr", alias, "int", flags, "ptr", resource, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} lastUpdateTime 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tspubplugincom/nf-tspubplugincom-itspubplugin-getcachelastupdatetime
     */
    GetCacheLastUpdateTime(lastUpdateTime) {
        result := ComCall(5, this, "uint*", lastUpdateTime, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tspubplugincom/nf-tspubplugincom-itspubplugin-get_pluginname
     */
    get_pluginName(pVal) {
        result := ComCall(6, this, "ptr", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tspubplugincom/nf-tspubplugincom-itspubplugin-get_pluginversion
     */
    get_pluginVersion(pVal) {
        result := ComCall(7, this, "ptr", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} resourceType 
     * @param {PWSTR} resourceLocation 
     * @param {PWSTR} endPointName 
     * @param {PWSTR} userID 
     * @param {PWSTR} alias 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tspubplugincom/nf-tspubplugincom-itspubplugin-resolveresource
     */
    ResolveResource(resourceType, resourceLocation, endPointName, userID, alias) {
        resourceLocation := resourceLocation is String ? StrPtr(resourceLocation) : resourceLocation
        endPointName := endPointName is String ? StrPtr(endPointName) : endPointName
        userID := userID is String ? StrPtr(userID) : userID
        alias := alias is String ? StrPtr(alias) : alias

        result := ComCall(8, this, "uint*", resourceType, "ptr", resourceLocation, "ptr", endPointName, "ptr", userID, "ptr", alias, "HRESULT")
        return result
    }
}
