#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IItemEnumerator.ahk
#Include .\ISettingsNamespace.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\ISettingsIdentity.ahk
#Include ..\Variant\VARIANT.ahk
#Include .\ITargetInfo.ahk
#Include .\ISettingsContext.ahk
#Include ..\Com\IUnknown.ahk

/**
 * The central interface for opening namespaces and controlling how they are opened.
 * @see https://docs.microsoft.com/windows/win32/api//wcmconfig/nn-wcmconfig-isettingsengine
 * @namespace Windows.Win32.System.SettingsManagementInfrastructure
 * @version v4.0.30319
 */
class ISettingsEngine extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISettingsEngine
     * @type {Guid}
     */
    static IID => Guid("{9f7d7bb9-20b3-11da-81a5-0030f1642e3c}")

    /**
     * The class identifier for SettingsEngine
     * @type {Guid}
     */
    static CLSID => Guid("{9f7d7bb5-20b3-11da-81a5-0030f1642e3c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetNamespaces", "GetNamespace", "GetErrorDescription", "CreateSettingsIdentity", "GetStoreStatus", "LoadStore", "UnloadStore", "RegisterNamespace", "UnregisterNamespace", "CreateTargetInfo", "GetTargetInfo", "SetTargetInfo", "CreateSettingsContext", "SetSettingsContext", "ApplySettingsContext", "GetSettingsContext"]

    /**
     * Returns an enumerator to the installed namespaces.
     * @param {Integer} Flags A <a href="https://docs.microsoft.com/windows/win32/api/wcmconfig/ne-wcmconfig-wcmnamespaceenumerationflags">WcmNamespaceEnumerationFlags</a> value that specifies the context to include in the collection of namespaces.
     * @param {Pointer<Void>} Reserved Reserved. Must be <b>NULL</b>.
     * @returns {IItemEnumerator} An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wcmconfig/nn-wcmconfig-iitemenumerator">IItemEnumerator</a> interface pointer whose methods can be used to access members of the collection.
     * @see https://docs.microsoft.com/windows/win32/api//wcmconfig/nf-wcmconfig-isettingsengine-getnamespaces
     */
    GetNamespaces(Flags, Reserved) {
        ReservedMarshal := Reserved is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, "int", Flags, ReservedMarshal, Reserved, "ptr*", &Namespaces := 0, "HRESULT")
        return IItemEnumerator(Namespaces)
    }

    /**
     * Opens an existing namespace as specified by the ISettingsIdentity parameter.
     * @param {ISettingsIdentity} SettingsID An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wcmconfig/nn-wcmconfig-isettingsidentity">ISettingsIdentity</a> object that specifies an existing namespace to get.
     * @param {Integer} Access A <a href="https://docs.microsoft.com/windows/win32/api/wcmconfig/ne-wcmconfig-wcmnamespaceaccess">WcmNamespaceAccess</a> value that specifies the type of access, whether it is read-only or read and write access.
     * @param {Pointer<Void>} Reserved Reserved. Must be <b>NULL</b>.
     * @returns {ISettingsNamespace} A pointer to an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wcmconfig/nn-wcmconfig-isettingsnamespace">ISettingsNamespace</a> object that is the result of the get operation.
     * @see https://docs.microsoft.com/windows/win32/api//wcmconfig/nf-wcmconfig-isettingsengine-getnamespace
     */
    GetNamespace(SettingsID, Access, Reserved) {
        ReservedMarshal := Reserved is VarRef ? "ptr" : "ptr"

        result := ComCall(4, this, "ptr", SettingsID, "int", Access, ReservedMarshal, Reserved, "ptr*", &NamespaceItem := 0, "HRESULT")
        return ISettingsNamespace(NamespaceItem)
    }

    /**
     * Retrieves a text message for a returned HRESULT code.
     * @param {Integer} HResult The HRESULT code for which this method retrieves the error description.
     * @returns {BSTR} The text message that corresponds to the HRESULT code.
     * @see https://docs.microsoft.com/windows/win32/api//wcmconfig/nf-wcmconfig-isettingsengine-geterrordescription
     */
    GetErrorDescription(HResult) {
        Message := BSTR()
        result := ComCall(5, this, "int", HResult, "ptr", Message, "HRESULT")
        return Message
    }

    /**
     * Creates an empty settings identity.
     * @returns {ISettingsIdentity} A value that returns a pointer to an empty <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wcmconfig/nn-wcmconfig-isettingsengine">ISettingsIdentity</a> object.
     * @see https://docs.microsoft.com/windows/win32/api//wcmconfig/nf-wcmconfig-isettingsengine-createsettingsidentity
     */
    CreateSettingsIdentity() {
        result := ComCall(6, this, "ptr*", &SettingsID := 0, "HRESULT")
        return ISettingsIdentity(SettingsID)
    }

    /**
     * Gets the status of the schema store.
     * @param {Pointer<Void>} Reserved Reserved. Must be <b>NULL</b>.
     * @returns {Integer} A <a href="https://docs.microsoft.com/windows/win32/api/wcmconfig/ne-wcmconfig-wcmuserstatus">WcmUserStatus</a> value that indicates the status of the store.
     * @see https://docs.microsoft.com/windows/win32/api//wcmconfig/nf-wcmconfig-isettingsengine-getstorestatus
     */
    GetStoreStatus(Reserved) {
        ReservedMarshal := Reserved is VarRef ? "ptr" : "ptr"

        result := ComCall(7, this, ReservedMarshal, Reserved, "int*", &Status := 0, "HRESULT")
        return Status
    }

    /**
     * Initializes and loads the schema store hive.
     * @param {Integer} Flags Flags must have a value 0 or have the value <b>LINK_STORE_TO_ENGINE_INSTANCE</b>. In a normal operation, loading the store is a persistent operation which affects the overall state of the system. The store is not cleaned up after the process exits. The developer must call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wcmconfig/nf-wcmconfig-isettingsengine-unloadstore">UnloadStore</a> to avoid a leak in the hive. A leak in the hive can cause future issues when accessing the same image.
     * @returns {HRESULT} This method returns an HRESULT value. <b>S_OK</b> indicates success.
     * @see https://docs.microsoft.com/windows/win32/api//wcmconfig/nf-wcmconfig-isettingsengine-loadstore
     */
    LoadStore(Flags) {
        result := ComCall(8, this, "uint", Flags, "HRESULT")
        return result
    }

    /**
     * Unloads the schema store hive and frees resources.
     * @param {Pointer<Void>} Reserved Reserved.
     * @returns {HRESULT} This method returns an HRESULT value. <b>S_OK</b> indicates success. If there are currently unreleased SMI objects when calling <b>UnloadStore</b>, <b>UnloadStore</b> will fail and return <b>E_ACCESSDENIED</b>. Before calling <b>UnloadStore</b>, release all SMI objects. If the store was not already loaded, it may return <b>E_INVALIDARG</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wcmconfig/nf-wcmconfig-isettingsengine-unloadstore
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
     * @see https://docs.microsoft.com/windows/win32/api//wcmconfig/nf-wcmconfig-isettingsengine-registernamespace
     */
    RegisterNamespace(SettingsID, Stream, PushSettings) {
        Results := VARIANT()
        result := ComCall(10, this, "ptr", SettingsID, "ptr", Stream, "int", PushSettings, "ptr", Results, "HRESULT")
        return Results
    }

    /**
     * Unregisters an existing namespace.
     * @param {ISettingsIdentity} SettingsID An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wcmconfig/nn-wcmconfig-isettingsidentity">ISettingsIdentity</a> interface value that identifies the namespace to be unregistered.
     * @param {BOOL} RemoveSettings When <b>true</b>, specifies that settings must be removed.
     * @returns {HRESULT} This method returns an HRESULT value. <b>S_OK</b> indicates success.
     * @see https://docs.microsoft.com/windows/win32/api//wcmconfig/nf-wcmconfig-isettingsengine-unregisternamespace
     */
    UnregisterNamespace(SettingsID, RemoveSettings) {
        result := ComCall(11, this, "ptr", SettingsID, "int", RemoveSettings, "HRESULT")
        return result
    }

    /**
     * Creates an empty target.
     * @returns {ITargetInfo} An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wcmconfig/nn-wcmconfig-itargetinfo">ITargetInfo</a> interface pointer to an empty target.
     * @see https://docs.microsoft.com/windows/win32/api//wcmconfig/nf-wcmconfig-isettingsengine-createtargetinfo
     */
    CreateTargetInfo() {
        result := ComCall(12, this, "ptr*", &Target := 0, "HRESULT")
        return ITargetInfo(Target)
    }

    /**
     * Gets the current offline target for the engine.
     * @returns {ITargetInfo} A pointer to an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wcmconfig/nn-wcmconfig-itargetinfo">ITargetInfo</a> object that is the current target for the engine.
     * @see https://docs.microsoft.com/windows/win32/api//wcmconfig/nf-wcmconfig-isettingsengine-gettargetinfo
     */
    GetTargetInfo() {
        result := ComCall(13, this, "ptr*", &Target := 0, "HRESULT")
        return ITargetInfo(Target)
    }

    /**
     * Sets the current offline target for the engine.
     * @param {ITargetInfo} Target An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wcmconfig/nn-wcmconfig-itargetinfo">ITargetInfo</a> value that specifies the target.
     * @returns {HRESULT} This method returns an HRESULT value. <b>S_OK</b> indicates success.
     * @see https://docs.microsoft.com/windows/win32/api//wcmconfig/nf-wcmconfig-isettingsengine-settargetinfo
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
     * @see https://docs.microsoft.com/windows/win32/api//wcmconfig/nf-wcmconfig-isettingsengine-createsettingscontext
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
     * @see https://docs.microsoft.com/windows/win32/api//wcmconfig/nf-wcmconfig-isettingsengine-applysettingscontext
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
}
