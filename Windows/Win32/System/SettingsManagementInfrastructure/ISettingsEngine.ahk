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
     * 
     * @param {Integer} Flags 
     * @param {Pointer<Void>} Reserved 
     * @returns {IItemEnumerator} 
     * @see https://learn.microsoft.com/windows/win32/api/wcmconfig/nf-wcmconfig-isettingsengine-getnamespaces
     */
    GetNamespaces(Flags, Reserved) {
        ReservedMarshal := Reserved is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, "int", Flags, ReservedMarshal, Reserved, "ptr*", &Namespaces := 0, "HRESULT")
        return IItemEnumerator(Namespaces)
    }

    /**
     * 
     * @param {ISettingsIdentity} SettingsID 
     * @param {Integer} Access 
     * @param {Pointer<Void>} Reserved 
     * @returns {ISettingsNamespace} 
     * @see https://learn.microsoft.com/windows/win32/api/wcmconfig/nf-wcmconfig-isettingsengine-getnamespace
     */
    GetNamespace(SettingsID, Access, Reserved) {
        ReservedMarshal := Reserved is VarRef ? "ptr" : "ptr"

        result := ComCall(4, this, "ptr", SettingsID, "int", Access, ReservedMarshal, Reserved, "ptr*", &NamespaceItem := 0, "HRESULT")
        return ISettingsNamespace(NamespaceItem)
    }

    /**
     * 
     * @param {Integer} HResult 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/wcmconfig/nf-wcmconfig-isettingsengine-geterrordescription
     */
    GetErrorDescription(HResult) {
        Message := BSTR()
        result := ComCall(5, this, "int", HResult, "ptr", Message, "HRESULT")
        return Message
    }

    /**
     * 
     * @returns {ISettingsIdentity} 
     * @see https://learn.microsoft.com/windows/win32/api/wcmconfig/nf-wcmconfig-isettingsengine-createsettingsidentity
     */
    CreateSettingsIdentity() {
        result := ComCall(6, this, "ptr*", &SettingsID := 0, "HRESULT")
        return ISettingsIdentity(SettingsID)
    }

    /**
     * 
     * @param {Pointer<Void>} Reserved 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wcmconfig/nf-wcmconfig-isettingsengine-getstorestatus
     */
    GetStoreStatus(Reserved) {
        ReservedMarshal := Reserved is VarRef ? "ptr" : "ptr"

        result := ComCall(7, this, ReservedMarshal, Reserved, "int*", &Status := 0, "HRESULT")
        return Status
    }

    /**
     * 
     * @param {Integer} Flags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wcmconfig/nf-wcmconfig-isettingsengine-loadstore
     */
    LoadStore(Flags) {
        result := ComCall(8, this, "uint", Flags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} Reserved 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wcmconfig/nf-wcmconfig-isettingsengine-unloadstore
     */
    UnloadStore(Reserved) {
        ReservedMarshal := Reserved is VarRef ? "ptr" : "ptr"

        result := ComCall(9, this, ReservedMarshal, Reserved, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ISettingsIdentity} SettingsID 
     * @param {IStream} Stream 
     * @param {BOOL} PushSettings 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/wcmconfig/nf-wcmconfig-isettingsengine-registernamespace
     */
    RegisterNamespace(SettingsID, Stream, PushSettings) {
        Results := VARIANT()
        result := ComCall(10, this, "ptr", SettingsID, "ptr", Stream, "int", PushSettings, "ptr", Results, "HRESULT")
        return Results
    }

    /**
     * 
     * @param {ISettingsIdentity} SettingsID 
     * @param {BOOL} RemoveSettings 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wcmconfig/nf-wcmconfig-isettingsengine-unregisternamespace
     */
    UnregisterNamespace(SettingsID, RemoveSettings) {
        result := ComCall(11, this, "ptr", SettingsID, "int", RemoveSettings, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {ITargetInfo} 
     * @see https://learn.microsoft.com/windows/win32/api/wcmconfig/nf-wcmconfig-isettingsengine-createtargetinfo
     */
    CreateTargetInfo() {
        result := ComCall(12, this, "ptr*", &Target := 0, "HRESULT")
        return ITargetInfo(Target)
    }

    /**
     * 
     * @returns {ITargetInfo} 
     * @see https://learn.microsoft.com/windows/win32/api/wcmconfig/nf-wcmconfig-isettingsengine-gettargetinfo
     */
    GetTargetInfo() {
        result := ComCall(13, this, "ptr*", &Target := 0, "HRESULT")
        return ITargetInfo(Target)
    }

    /**
     * 
     * @param {ITargetInfo} Target 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wcmconfig/nf-wcmconfig-isettingsengine-settargetinfo
     */
    SetTargetInfo(Target) {
        result := ComCall(14, this, "ptr", Target, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Flags 
     * @param {Pointer<Void>} Reserved 
     * @returns {ISettingsContext} 
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
     * 
     * @param {ISettingsContext} SettingsContext 
     * @param {Pointer<Pointer<PWSTR>>} pppwzIdentities 
     * @returns {Pointer} 
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
}
