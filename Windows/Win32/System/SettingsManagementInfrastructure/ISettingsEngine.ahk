#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * @param {Pointer<IItemEnumerator>} Namespaces 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wcmconfig/nf-wcmconfig-isettingsengine-getnamespaces
     */
    GetNamespaces(Flags, Reserved, Namespaces) {
        ReservedMarshal := Reserved is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, "int", Flags, ReservedMarshal, Reserved, "ptr*", Namespaces, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ISettingsIdentity} SettingsID 
     * @param {Integer} Access 
     * @param {Pointer<Void>} Reserved 
     * @param {Pointer<ISettingsNamespace>} NamespaceItem 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wcmconfig/nf-wcmconfig-isettingsengine-getnamespace
     */
    GetNamespace(SettingsID, Access, Reserved, NamespaceItem) {
        ReservedMarshal := Reserved is VarRef ? "ptr" : "ptr"

        result := ComCall(4, this, "ptr", SettingsID, "int", Access, ReservedMarshal, Reserved, "ptr*", NamespaceItem, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} HResult 
     * @param {Pointer<BSTR>} Message 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wcmconfig/nf-wcmconfig-isettingsengine-geterrordescription
     */
    GetErrorDescription(HResult, Message) {
        result := ComCall(5, this, "int", HResult, "ptr", Message, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ISettingsIdentity>} SettingsID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wcmconfig/nf-wcmconfig-isettingsengine-createsettingsidentity
     */
    CreateSettingsIdentity(SettingsID) {
        result := ComCall(6, this, "ptr*", SettingsID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} Reserved 
     * @param {Pointer<Integer>} Status 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wcmconfig/nf-wcmconfig-isettingsengine-getstorestatus
     */
    GetStoreStatus(Reserved, Status) {
        ReservedMarshal := Reserved is VarRef ? "ptr" : "ptr"
        StatusMarshal := Status is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, ReservedMarshal, Reserved, StatusMarshal, Status, "HRESULT")
        return result
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
     * @param {Pointer<VARIANT>} Results 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wcmconfig/nf-wcmconfig-isettingsengine-registernamespace
     */
    RegisterNamespace(SettingsID, Stream, PushSettings, Results) {
        result := ComCall(10, this, "ptr", SettingsID, "ptr", Stream, "int", PushSettings, "ptr", Results, "HRESULT")
        return result
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
     * @param {Pointer<ITargetInfo>} Target 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wcmconfig/nf-wcmconfig-isettingsengine-createtargetinfo
     */
    CreateTargetInfo(Target) {
        result := ComCall(12, this, "ptr*", Target, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ITargetInfo>} Target 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wcmconfig/nf-wcmconfig-isettingsengine-gettargetinfo
     */
    GetTargetInfo(Target) {
        result := ComCall(13, this, "ptr*", Target, "HRESULT")
        return result
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
     * @param {Pointer<ISettingsContext>} SettingsContext 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wcmconfig/nf-wcmconfig-isettingsengine-createsettingscontext
     */
    CreateSettingsContext(Flags, Reserved, SettingsContext) {
        ReservedMarshal := Reserved is VarRef ? "ptr" : "ptr"

        result := ComCall(15, this, "uint", Flags, ReservedMarshal, Reserved, "ptr*", SettingsContext, "HRESULT")
        return result
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
     * @param {Pointer<Pointer>} pcIdentities 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wcmconfig/nf-wcmconfig-isettingsengine-applysettingscontext
     */
    ApplySettingsContext(SettingsContext, pppwzIdentities, pcIdentities) {
        pcIdentitiesMarshal := pcIdentities is VarRef ? "ptr*" : "ptr"

        result := ComCall(17, this, "ptr", SettingsContext, "ptr*", pppwzIdentities, pcIdentitiesMarshal, pcIdentities, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ISettingsContext>} SettingsContext 
     * @returns {HRESULT} 
     */
    GetSettingsContext(SettingsContext) {
        result := ComCall(18, this, "ptr*", SettingsContext, "HRESULT")
        return result
    }
}
