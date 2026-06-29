#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\UI\Shell\PropertiesSystem\IPropertyStore.ahk" { IPropertyStore }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import ".\ISyncProviderInfo.ahk" { ISyncProviderInfo }

/**
 * Represents configuration UI information used to build and register a synchronization provider.
 * @remarks
 * The writer of a synchronization provider should implement an <b>ISyncProviderConfigUI</b> (a builder) for a synchronization provider if it requires additional information and properties to be set before it can be created. For example, a synchronization provider may require a user to enter credentials before their data can be synchronized.
 * 
 * If the registered synchronization provider is a <a href="https://www.microsoft.com/downloads/details.aspx?familyid=A3EE7BC5-A823-4FB4-B152-9E8CE9D5546F&displaylang=en">Microsoft Sync Framework</a> provider, then the <b>Init</b> method will be called by the Sync Framework synchronization session. For more information about the different types of synchronization providers you can write for Windows, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/winsync/options-for-building-a-synchronization-provider">Options for Building a Synchronization Provider</a>.
 * @see https://learn.microsoft.com/windows/win32/api/syncregistration/nn-syncregistration-isyncproviderconfigui
 * @namespace Windows.Win32.System.WindowsSync
 */
export default struct ISyncProviderConfigUI extends IUnknown {
    /**
     * The interface identifier for ISyncProviderConfigUI
     * @type {Guid}
     */
    static IID := Guid("{7b0705f6-cbcd-4071-ab05-3bdc364d4a0c}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISyncProviderConfigUI interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Init                             : IntPtr
        GetRegisteredProperties          : IntPtr
        CreateAndRegisterNewSyncProvider : IntPtr
        ModifySyncProvider               : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISyncProviderConfigUI.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Initializes the configuration UI for a synchronization provider.
     * @remarks
     * This method will be called by the registration code before the object is returned whenever an instance of the configuration UI is requested from one of the registration interfaces.
     * @param {Pointer<Guid>} pguidInstanceId The instance ID of the configuration UI.
     * @param {Pointer<Guid>} pguidContentType A GUID that represents the content type that is associated with the synchronization provider that this configuration UI will create.
     * @param {IPropertyStore} pConfigurationProperties The properties that should be specified when the configuration UI is registering the synchronization provider. These properties are also used to  properly initialize
     *         the configuration UI object.
     * @returns {HRESULT} The possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/syncregistration/nf-syncregistration-isyncproviderconfigui-init
     */
    Init(pguidInstanceId, pguidContentType, pConfigurationProperties) {
        result := ComCall(3, this, Guid.Ptr, pguidInstanceId, Guid.Ptr, pguidContentType, "ptr", pConfigurationProperties, "HRESULT")
        return result
    }

    /**
     * Obtains configuration UI properties for reading and writing.
     * @returns {IPropertyStore} Returns the <b>IPropertyStore</b> object that contains the configuration UI properties for reading and writing. Both the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/syncregistration/nn-syncregistration-isyncproviderinfo">ISyncProviderInfo</a> and <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/syncregistration/nn-syncregistration-isyncproviderconfiguiinfo">ISyncProviderConfigUIInfo</a> interfaces inherit from <b>IPropertyStore</b>.
     * @see https://learn.microsoft.com/windows/win32/api/syncregistration/nf-syncregistration-isyncproviderconfigui-getregisteredproperties
     */
    GetRegisteredProperties() {
        result := ComCall(4, this, "ptr*", &ppConfigUIProperties := 0, "HRESULT")
        return IPropertyStore(ppConfigUIProperties)
    }

    /**
     * Creates and registers a new synchronization provider.
     * @param {HWND} hwndParent HWND serving as the parent for the configuration UI that needs to be presented before the synchronization provider can be created. 
     *     	The HWND should be <b>NULL</b> only if the <b>dwCapabilities</b> member of the <a href="https://docs.microsoft.com/windows/win32/api/syncregistration/ns-syncregistration-syncproviderconfiguiconfiguration">SyncProviderConfigUIConfiguration</a> structure is set to not support a UI.
     * @param {IUnknown} pUnkContext Pointer to an interface containing additional information needed to generate the synchronization provider. The pointer will be <b>NULL</b> if no additional information is needed.
     * @returns {ISyncProviderInfo} An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/syncregistration/nn-syncregistration-isyncproviderinfo">ISyncProviderInfo</a> object that contains information about the newly created and registered synchronization provider.
     * @see https://learn.microsoft.com/windows/win32/api/syncregistration/nf-syncregistration-isyncproviderconfigui-createandregisternewsyncprovider
     */
    CreateAndRegisterNewSyncProvider(hwndParent, pUnkContext) {
        result := ComCall(5, this, HWND, hwndParent, "ptr", pUnkContext, "ptr*", &ppProviderInfo := 0, "HRESULT")
        return ISyncProviderInfo(ppProviderInfo)
    }

    /**
     * Updates the ISyncProviderInfo of the synchronization provider that is configured by this ISyncProviderConfigUI.
     * @param {HWND} hwndParent HWND serving as the parent for the configuration UI that needs to be presented before the synchronization provider can be created. 
     *     	The HWND should be <b>NULL</b> only if the <b>dwCapabilities</b> member of the <a href="https://docs.microsoft.com/windows/win32/api/syncregistration/ns-syncregistration-syncproviderconfiguiconfiguration">SyncProviderConfigUIConfiguration</a> structure is set to not support a UI.
     * @param {IUnknown} pUnkContext Pointer to an interface containing additional information needed to generate the synchronization provider. The pointer will be <b>NULL</b> if no additional information is needed.
     * @param {ISyncProviderInfo} pProviderInfo An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/syncregistration/nn-syncregistration-isyncproviderinfo">ISyncProviderInfo</a> that provides information about the synchronization provider that is being modified.
     * @returns {HRESULT} The possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid pointer.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/syncregistration/nf-syncregistration-isyncproviderconfigui-modifysyncprovider
     */
    ModifySyncProvider(hwndParent, pUnkContext, pProviderInfo) {
        result := ComCall(6, this, HWND, hwndParent, "ptr", pUnkContext, "ptr", pProviderInfo, "HRESULT")
        return result
    }

    Query(iid) {
        if (ISyncProviderConfigUI.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Init := CallbackCreate(GetMethod(implObj, "Init"), flags, 4)
        this.vtbl.GetRegisteredProperties := CallbackCreate(GetMethod(implObj, "GetRegisteredProperties"), flags, 2)
        this.vtbl.CreateAndRegisterNewSyncProvider := CallbackCreate(GetMethod(implObj, "CreateAndRegisterNewSyncProvider"), flags, 4)
        this.vtbl.ModifySyncProvider := CallbackCreate(GetMethod(implObj, "ModifySyncProvider"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Init)
        CallbackFree(this.vtbl.GetRegisteredProperties)
        CallbackFree(this.vtbl.CreateAndRegisterNewSyncProvider)
        CallbackFree(this.vtbl.ModifySyncProvider)
    }
}
