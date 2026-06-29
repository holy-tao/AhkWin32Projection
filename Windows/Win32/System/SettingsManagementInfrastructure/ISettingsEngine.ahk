#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ISettingsNamespace.ahk" { ISettingsNamespace }
#Import ".\WcmNamespaceEnumerationFlags.ahk" { WcmNamespaceEnumerationFlags }
#Import ".\ISettingsIdentity.ahk" { ISettingsIdentity }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\WcmNamespaceAccess.ahk" { WcmNamespaceAccess }
#Import ".\ISettingsContext.ahk" { ISettingsContext }
#Import ".\WcmUserStatus.ahk" { WcmUserStatus }
#Import ".\IItemEnumerator.ahk" { IItemEnumerator }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\Variant\VARIANT.ahk" { VARIANT }
#Import "..\Com\IStream.ahk" { IStream }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\ITargetInfo.ahk" { ITargetInfo }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * The central interface for opening namespaces and controlling how they are opened.
 * @see https://learn.microsoft.com/windows/win32/api/wcmconfig/nn-wcmconfig-isettingsengine
 * @namespace Windows.Win32.System.SettingsManagementInfrastructure
 */
export default struct ISettingsEngine extends IUnknown {
    /**
     * The interface identifier for ISettingsEngine
     * @type {Guid}
     */
    static IID := Guid("{9f7d7bb9-20b3-11da-81a5-0030f1642e3c}")

    /**
     * The class identifier for SettingsEngine
     * @type {Guid}
     */
    static CLSID := Guid("{9f7d7bb5-20b3-11da-81a5-0030f1642e3c}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISettingsEngine interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetNamespaces          : IntPtr
        GetNamespace           : IntPtr
        GetErrorDescription    : IntPtr
        CreateSettingsIdentity : IntPtr
        GetStoreStatus         : IntPtr
        LoadStore              : IntPtr
        UnloadStore            : IntPtr
        RegisterNamespace      : IntPtr
        UnregisterNamespace    : IntPtr
        CreateTargetInfo       : IntPtr
        GetTargetInfo          : IntPtr
        SetTargetInfo          : IntPtr
        CreateSettingsContext  : IntPtr
        SetSettingsContext     : IntPtr
        ApplySettingsContext   : IntPtr
        GetSettingsContext     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISettingsEngine.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Returns an enumerator to the installed namespaces.
     * @param {WcmNamespaceEnumerationFlags} Flags A <a href="https://docs.microsoft.com/windows/win32/api/wcmconfig/ne-wcmconfig-wcmnamespaceenumerationflags">WcmNamespaceEnumerationFlags</a> value that specifies the context to include in the collection of namespaces.
     * @param {Pointer<Void>} Reserved Reserved. Must be <b>NULL</b>.
     * @returns {IItemEnumerator} An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wcmconfig/nn-wcmconfig-iitemenumerator">IItemEnumerator</a> interface pointer whose methods can be used to access members of the collection.
     * @see https://learn.microsoft.com/windows/win32/api/wcmconfig/nf-wcmconfig-isettingsengine-getnamespaces
     */
    GetNamespaces(Flags, Reserved) {
        ReservedMarshal := Reserved is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, WcmNamespaceEnumerationFlags, Flags, ReservedMarshal, Reserved, "ptr*", &Namespaces := 0, "HRESULT")
        return IItemEnumerator(Namespaces)
    }

    /**
     * Opens an existing namespace as specified by the ISettingsIdentity parameter.
     * @param {ISettingsIdentity} SettingsID An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wcmconfig/nn-wcmconfig-isettingsidentity">ISettingsIdentity</a> object that specifies an existing namespace to get.
     * @param {WcmNamespaceAccess} Access A <a href="https://docs.microsoft.com/windows/win32/api/wcmconfig/ne-wcmconfig-wcmnamespaceaccess">WcmNamespaceAccess</a> value that specifies the type of access, whether it is read-only or read and write access.
     * @param {Pointer<Void>} Reserved Reserved. Must be <b>NULL</b>.
     * @returns {ISettingsNamespace} A pointer to an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wcmconfig/nn-wcmconfig-isettingsnamespace">ISettingsNamespace</a> object that is the result of the get operation.
     * @see https://learn.microsoft.com/windows/win32/api/wcmconfig/nf-wcmconfig-isettingsengine-getnamespace
     */
    GetNamespace(SettingsID, Access, Reserved) {
        ReservedMarshal := Reserved is VarRef ? "ptr" : "ptr"

        result := ComCall(4, this, "ptr", SettingsID, WcmNamespaceAccess, Access, ReservedMarshal, Reserved, "ptr*", &NamespaceItem := 0, "HRESULT")
        return ISettingsNamespace(NamespaceItem)
    }

    /**
     * Retrieves a text message for a returned HRESULT code.
     * @param {Integer} _HResult The HRESULT code for which this method retrieves the error description.
     * @returns {BSTR} The text message that corresponds to the HRESULT code.
     * @see https://learn.microsoft.com/windows/win32/api/wcmconfig/nf-wcmconfig-isettingsengine-geterrordescription
     */
    GetErrorDescription(_HResult) {
        Message := BSTR.Owned()
        result := ComCall(5, this, "int", _HResult, BSTR.Ptr, Message, "HRESULT")
        return Message
    }

    /**
     * Creates an empty settings identity.
     * @returns {ISettingsIdentity} A value that returns a pointer to an empty <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wcmconfig/nn-wcmconfig-isettingsengine">ISettingsIdentity</a> object.
     * @see https://learn.microsoft.com/windows/win32/api/wcmconfig/nf-wcmconfig-isettingsengine-createsettingsidentity
     */
    CreateSettingsIdentity() {
        result := ComCall(6, this, "ptr*", &SettingsID := 0, "HRESULT")
        return ISettingsIdentity(SettingsID)
    }

    /**
     * Gets the status of the schema store.
     * @param {Pointer<Void>} Reserved Reserved. Must be <b>NULL</b>.
     * @returns {WcmUserStatus} A <a href="https://docs.microsoft.com/windows/win32/api/wcmconfig/ne-wcmconfig-wcmuserstatus">WcmUserStatus</a> value that indicates the status of the store.
     * @see https://learn.microsoft.com/windows/win32/api/wcmconfig/nf-wcmconfig-isettingsengine-getstorestatus
     */
    GetStoreStatus(Reserved) {
        ReservedMarshal := Reserved is VarRef ? "ptr" : "ptr"

        result := ComCall(7, this, ReservedMarshal, Reserved, "int*", &_Status := 0, "HRESULT")
        return _Status
    }

    /**
     * Initializes and loads the schema store hive.
     * @remarks
     * <div class="alert"><b>Note</b>  If the flag <b>LINK_STORE_TO_ENGINE_INSTANCE</b> is passed as an input parameter, the loaded store is considered attached to the current engine and will be unloaded when the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wcmconfig/nn-wcmconfig-isettingsengine">ISettingsEngine</a> object on which this method was called is finalized. The <b>ISettingsEngine</b> object can be finalized either by releasing all pointers to it, or by terminating the process. Developers can call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wcmconfig/nf-wcmconfig-isettingsengine-unloadstore">UnloadStore</a> to force the store to be unloaded early, but it is not necessary when this flag is used.</div>
     * <div> </div>
     * <div class="alert"><b>Note</b>  When using a target; that is, if you are not loading the store from the default file to the default location in the registry, you must call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wcmconfig/nf-wcmconfig-isettingsengine-unloadstore">UnloadStore</a> to verify that you do not lock the file.</div>
     * <div> </div>
     * @param {Integer} Flags Flags must have a value 0 or have the value <b>LINK_STORE_TO_ENGINE_INSTANCE</b>. In a normal operation, loading the store is a persistent operation which affects the overall state of the system. The store is not cleaned up after the process exits. The developer must call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wcmconfig/nf-wcmconfig-isettingsengine-unloadstore">UnloadStore</a> to avoid a leak in the hive. A leak in the hive can cause future issues when accessing the same image.
     * @returns {HRESULT} This method returns an HRESULT value. <b>S_OK</b> indicates success.
     * @see https://learn.microsoft.com/windows/win32/api/wcmconfig/nf-wcmconfig-isettingsengine-loadstore
     */
    LoadStore(Flags) {
        result := ComCall(8, this, "uint", Flags, "HRESULT")
        return result
    }

    /**
     * Unloads the schema store hive and frees resources.
     * @param {Pointer<Void>} Reserved Reserved.
     * @returns {HRESULT} This method returns an HRESULT value. <b>S_OK</b> indicates success. If there are currently unreleased SMI objects when calling <b>UnloadStore</b>, <b>UnloadStore</b> will fail and return <b>E_ACCESSDENIED</b>. Before calling <b>UnloadStore</b>, release all SMI objects. If the store was not already loaded, it may return <b>E_INVALIDARG</b>.
     * @see https://learn.microsoft.com/windows/win32/api/wcmconfig/nf-wcmconfig-isettingsengine-unloadstore
     */
    UnloadStore(Reserved) {
        ReservedMarshal := Reserved is VarRef ? "ptr" : "ptr"

        result := ComCall(9, this, ReservedMarshal, Reserved, "HRESULT")
        return result
    }

    /**
     * Registers a namespace from a stream.
     * @param {ISettingsIdentity} SettingsID An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wcmconfig/nn-wcmconfig-isettingsidentity">ISettingsIdentity</a> value that identifies the namespace to be registered.
     * @param {IStream} Stream The stream that specifies the configuration.
     * @param {BOOL} PushSettings When this flag is set to <b>TRUE</b>, settings are pushed to the registry or to the initialization files. If the flag is not set, only the store for settings is changed.
     * @returns {VARIANT} Results is a variant of type <b>VT_VARIANT</b> or <b>VT_ARRAY</b>, each of which points to an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wcmconfig/nn-wcmconfig-isettingsresult">ISettingsResult</a> object which describes an error or warning uncovered during manifest compilation.
     * @see https://learn.microsoft.com/windows/win32/api/wcmconfig/nf-wcmconfig-isettingsengine-registernamespace
     */
    RegisterNamespace(SettingsID, Stream, PushSettings) {
        Results := VARIANT()
        result := ComCall(10, this, "ptr", SettingsID, "ptr", Stream, BOOL, PushSettings, VARIANT.Ptr, Results, "HRESULT")
        return Results
    }

    /**
     * Unregisters an existing namespace.
     * @param {ISettingsIdentity} SettingsID An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wcmconfig/nn-wcmconfig-isettingsidentity">ISettingsIdentity</a> interface value that identifies the namespace to be unregistered.
     * @param {BOOL} RemoveSettings When <b>true</b>, specifies that settings must be removed.
     * @returns {HRESULT} This method returns an HRESULT value. <b>S_OK</b> indicates success.
     * @see https://learn.microsoft.com/windows/win32/api/wcmconfig/nf-wcmconfig-isettingsengine-unregisternamespace
     */
    UnregisterNamespace(SettingsID, RemoveSettings) {
        result := ComCall(11, this, "ptr", SettingsID, BOOL, RemoveSettings, "HRESULT")
        return result
    }

    /**
     * Creates an empty target.
     * @returns {ITargetInfo} An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wcmconfig/nn-wcmconfig-itargetinfo">ITargetInfo</a> interface pointer to an empty target.
     * @see https://learn.microsoft.com/windows/win32/api/wcmconfig/nf-wcmconfig-isettingsengine-createtargetinfo
     */
    CreateTargetInfo() {
        result := ComCall(12, this, "ptr*", &Target := 0, "HRESULT")
        return ITargetInfo(Target)
    }

    /**
     * Gets the current offline target for the engine.
     * @returns {ITargetInfo} A pointer to an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wcmconfig/nn-wcmconfig-itargetinfo">ITargetInfo</a> object that is the current target for the engine.
     * @see https://learn.microsoft.com/windows/win32/api/wcmconfig/nf-wcmconfig-isettingsengine-gettargetinfo
     */
    GetTargetInfo() {
        result := ComCall(13, this, "ptr*", &Target := 0, "HRESULT")
        return ITargetInfo(Target)
    }

    /**
     * Sets the current offline target for the engine.
     * @param {ITargetInfo} Target An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wcmconfig/nn-wcmconfig-itargetinfo">ITargetInfo</a> value that specifies the target.
     * @returns {HRESULT} This method returns an HRESULT value. <b>S_OK</b> indicates success.
     * @see https://learn.microsoft.com/windows/win32/api/wcmconfig/nf-wcmconfig-isettingsengine-settargetinfo
     */
    SetTargetInfo(Target) {
        result := ComCall(14, this, "ptr", Target, "HRESULT")
        return result
    }

    /**
     * Creates a settings context.
     * @param {Integer} Flags The value of the Flags parameter may be 0, indicating "normal mode"  or 0x00000001, indicating <b>LIMITED_VALIDATION_MODE</b>. In normal mode, the settings context validates any changes made to list items against the current state of the target image. For example, if an  attempt is made to create a list element that already exists in the image, the create operation fails. In <b>LIMITED_VALIDATION_MODE</b>, contradictory data is not accepted. You cannot modify and then add a list item. However, no attempt is made to verify the changes made against the current state of the system. Only use <b>LIMITED_VALIDATION_MODE</b> when the intention is to author a context which is to be serialized. Do not specify this flag when creating a context to be used for <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wcmconfig/nf-wcmconfig-isettingsengine-applysettingscontext">ISettingsEngine::ApplySettingsContext</a>. If used, the context may not be sufficiently validated and may fail during an application.
     * @param {Pointer<Void>} Reserved Reserved. Must be <b>NULL</b>.
     * @returns {ISettingsContext} A pointer to an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wcmconfig/nn-wcmconfig-isettingscontext">ISettingsContext</a> object that represents the created context.
     * @see https://learn.microsoft.com/windows/win32/api/wcmconfig/nf-wcmconfig-isettingsengine-createsettingscontext
     */
    CreateSettingsContext(Flags, Reserved) {
        ReservedMarshal := Reserved is VarRef ? "ptr" : "ptr"

        result := ComCall(15, this, "uint", Flags, ReservedMarshal, Reserved, "ptr*", &SettingsContext := 0, "HRESULT")
        return ISettingsContext(SettingsContext)
    }

    /**
     * 
     * @param {ISettingsContext} SettingsContext 
     * @returns {HRESULT} 
     */
    SetSettingsContext(SettingsContext) {
        result := ComCall(16, this, "ptr", SettingsContext, "HRESULT")
        return result
    }

    /**
     * Applies a settings context.
     * @param {ISettingsContext} SettingsContext The context that contains the setting data to apply.
     * @param {Pointer<Pointer<PWSTR>>} pppwzIdentities Identities of the namespaces that were applied to the system in a string format.
     * @returns {Pointer} The number of identities in <i>pppwzIdentities</i>.
     * @see https://learn.microsoft.com/windows/win32/api/wcmconfig/nf-wcmconfig-isettingsengine-applysettingscontext
     */
    ApplySettingsContext(SettingsContext, pppwzIdentities) {
        pppwzIdentitiesMarshal := pppwzIdentities is VarRef ? "ptr*" : "ptr"

        result := ComCall(17, this, "ptr", SettingsContext, pppwzIdentitiesMarshal, pppwzIdentities, "ptr*", &pcIdentities := 0, "HRESULT")
        return pcIdentities
    }

    /**
     * 
     * @returns {ISettingsContext} 
     */
    GetSettingsContext() {
        result := ComCall(18, this, "ptr*", &SettingsContext := 0, "HRESULT")
        return ISettingsContext(SettingsContext)
    }

    Query(iid) {
        if (ISettingsEngine.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetNamespaces := CallbackCreate(GetMethod(implObj, "GetNamespaces"), flags, 4)
        this.vtbl.GetNamespace := CallbackCreate(GetMethod(implObj, "GetNamespace"), flags, 5)
        this.vtbl.GetErrorDescription := CallbackCreate(GetMethod(implObj, "GetErrorDescription"), flags, 3)
        this.vtbl.CreateSettingsIdentity := CallbackCreate(GetMethod(implObj, "CreateSettingsIdentity"), flags, 2)
        this.vtbl.GetStoreStatus := CallbackCreate(GetMethod(implObj, "GetStoreStatus"), flags, 3)
        this.vtbl.LoadStore := CallbackCreate(GetMethod(implObj, "LoadStore"), flags, 2)
        this.vtbl.UnloadStore := CallbackCreate(GetMethod(implObj, "UnloadStore"), flags, 2)
        this.vtbl.RegisterNamespace := CallbackCreate(GetMethod(implObj, "RegisterNamespace"), flags, 5)
        this.vtbl.UnregisterNamespace := CallbackCreate(GetMethod(implObj, "UnregisterNamespace"), flags, 3)
        this.vtbl.CreateTargetInfo := CallbackCreate(GetMethod(implObj, "CreateTargetInfo"), flags, 2)
        this.vtbl.GetTargetInfo := CallbackCreate(GetMethod(implObj, "GetTargetInfo"), flags, 2)
        this.vtbl.SetTargetInfo := CallbackCreate(GetMethod(implObj, "SetTargetInfo"), flags, 2)
        this.vtbl.CreateSettingsContext := CallbackCreate(GetMethod(implObj, "CreateSettingsContext"), flags, 4)
        this.vtbl.SetSettingsContext := CallbackCreate(GetMethod(implObj, "SetSettingsContext"), flags, 2)
        this.vtbl.ApplySettingsContext := CallbackCreate(GetMethod(implObj, "ApplySettingsContext"), flags, 4)
        this.vtbl.GetSettingsContext := CallbackCreate(GetMethod(implObj, "GetSettingsContext"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetNamespaces)
        CallbackFree(this.vtbl.GetNamespace)
        CallbackFree(this.vtbl.GetErrorDescription)
        CallbackFree(this.vtbl.CreateSettingsIdentity)
        CallbackFree(this.vtbl.GetStoreStatus)
        CallbackFree(this.vtbl.LoadStore)
        CallbackFree(this.vtbl.UnloadStore)
        CallbackFree(this.vtbl.RegisterNamespace)
        CallbackFree(this.vtbl.UnregisterNamespace)
        CallbackFree(this.vtbl.CreateTargetInfo)
        CallbackFree(this.vtbl.GetTargetInfo)
        CallbackFree(this.vtbl.SetTargetInfo)
        CallbackFree(this.vtbl.CreateSettingsContext)
        CallbackFree(this.vtbl.SetSettingsContext)
        CallbackFree(this.vtbl.ApplySettingsContext)
        CallbackFree(this.vtbl.GetSettingsContext)
    }
}
