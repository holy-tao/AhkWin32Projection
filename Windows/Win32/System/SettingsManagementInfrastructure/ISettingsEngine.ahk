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
     * 
     * @param {Integer} Flags 
     * @param {Pointer<Void>} Reserved 
     * @param {Pointer<IItemEnumerator>} Namespaces 
     * @returns {HRESULT} 
     */
    GetNamespaces(Flags, Reserved, Namespaces) {
        result := ComCall(3, this, "int", Flags, "ptr", Reserved, "ptr", Namespaces, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISettingsIdentity>} SettingsID 
     * @param {Integer} Access 
     * @param {Pointer<Void>} Reserved 
     * @param {Pointer<ISettingsNamespace>} NamespaceItem 
     * @returns {HRESULT} 
     */
    GetNamespace(SettingsID, Access, Reserved, NamespaceItem) {
        result := ComCall(4, this, "ptr", SettingsID, "int", Access, "ptr", Reserved, "ptr", NamespaceItem, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} HResult 
     * @param {Pointer<BSTR>} Message 
     * @returns {HRESULT} 
     */
    GetErrorDescription(HResult, Message) {
        result := ComCall(5, this, "int", HResult, "ptr", Message, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISettingsIdentity>} SettingsID 
     * @returns {HRESULT} 
     */
    CreateSettingsIdentity(SettingsID) {
        result := ComCall(6, this, "ptr", SettingsID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} Reserved 
     * @param {Pointer<Int32>} Status 
     * @returns {HRESULT} 
     */
    GetStoreStatus(Reserved, Status) {
        result := ComCall(7, this, "ptr", Reserved, "int*", Status, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Flags 
     * @returns {HRESULT} 
     */
    LoadStore(Flags) {
        result := ComCall(8, this, "uint", Flags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} Reserved 
     * @returns {HRESULT} 
     */
    UnloadStore(Reserved) {
        result := ComCall(9, this, "ptr", Reserved, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISettingsIdentity>} SettingsID 
     * @param {Pointer<IStream>} Stream 
     * @param {BOOL} PushSettings 
     * @param {Pointer<VARIANT>} Results 
     * @returns {HRESULT} 
     */
    RegisterNamespace(SettingsID, Stream, PushSettings, Results) {
        result := ComCall(10, this, "ptr", SettingsID, "ptr", Stream, "int", PushSettings, "ptr", Results, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISettingsIdentity>} SettingsID 
     * @param {BOOL} RemoveSettings 
     * @returns {HRESULT} 
     */
    UnregisterNamespace(SettingsID, RemoveSettings) {
        result := ComCall(11, this, "ptr", SettingsID, "int", RemoveSettings, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITargetInfo>} Target 
     * @returns {HRESULT} 
     */
    CreateTargetInfo(Target) {
        result := ComCall(12, this, "ptr", Target, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITargetInfo>} Target 
     * @returns {HRESULT} 
     */
    GetTargetInfo(Target) {
        result := ComCall(13, this, "ptr", Target, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITargetInfo>} Target 
     * @returns {HRESULT} 
     */
    SetTargetInfo(Target) {
        result := ComCall(14, this, "ptr", Target, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Flags 
     * @param {Pointer<Void>} Reserved 
     * @param {Pointer<ISettingsContext>} SettingsContext 
     * @returns {HRESULT} 
     */
    CreateSettingsContext(Flags, Reserved, SettingsContext) {
        result := ComCall(15, this, "uint", Flags, "ptr", Reserved, "ptr", SettingsContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISettingsContext>} SettingsContext 
     * @returns {HRESULT} 
     */
    SetSettingsContext(SettingsContext) {
        result := ComCall(16, this, "ptr", SettingsContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISettingsContext>} SettingsContext 
     * @param {Pointer<PWSTR>} pppwzIdentities 
     * @param {Pointer<UIntPtr>} pcIdentities 
     * @returns {HRESULT} 
     */
    ApplySettingsContext(SettingsContext, pppwzIdentities, pcIdentities) {
        result := ComCall(17, this, "ptr", SettingsContext, "ptr", pppwzIdentities, "ptr*", pcIdentities, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISettingsContext>} SettingsContext 
     * @returns {HRESULT} 
     */
    GetSettingsContext(SettingsContext) {
        result := ComCall(18, this, "ptr", SettingsContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
