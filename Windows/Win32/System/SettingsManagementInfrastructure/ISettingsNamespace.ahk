#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Performs operations to set, retrieve, and validate settings, and save changes for a namespace instance.
 * @see https://docs.microsoft.com/windows/win32/api//wcmconfig/nn-wcmconfig-isettingsnamespace
 * @namespace Windows.Win32.System.SettingsManagementInfrastructure
 * @version v4.0.30319
 */
class ISettingsNamespace extends IUnknown{
    /**
     * The interface identifier for ISettingsNamespace
     * @type {Guid}
     */
    static IID => Guid("{9f7d7bba-20b3-11da-81a5-0030f1642e3c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<ISettingsIdentity>} SettingsID 
     * @returns {HRESULT} 
     */
    GetIdentity(SettingsID) {
        result := ComCall(3, this, "ptr", SettingsID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IItemEnumerator>} Settings 
     * @returns {HRESULT} 
     */
    Settings(Settings) {
        result := ComCall(4, this, "ptr", Settings, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} PushSettings 
     * @param {Pointer<ISettingsResult>} Result 
     * @returns {HRESULT} 
     */
    Save(PushSettings, Result) {
        result := ComCall(5, this, "int", PushSettings, "ptr", Result, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} Path 
     * @param {Pointer<ISettingsItem>} Setting 
     * @returns {HRESULT} 
     */
    GetSettingByPath(Path, Setting) {
        Path := Path is String ? StrPtr(Path) : Path

        result := ComCall(6, this, "ptr", Path, "ptr", Setting, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} Path 
     * @param {Pointer<ISettingsItem>} Setting 
     * @returns {HRESULT} 
     */
    CreateSettingByPath(Path, Setting) {
        Path := Path is String ? StrPtr(Path) : Path

        result := ComCall(7, this, "ptr", Path, "ptr", Setting, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} Path 
     * @returns {HRESULT} 
     */
    RemoveSettingByPath(Path) {
        Path := Path is String ? StrPtr(Path) : Path

        result := ComCall(8, this, "ptr", Path, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} Name 
     * @param {Pointer<VARIANT>} Value 
     * @returns {HRESULT} 
     */
    GetAttribute(Name, Value) {
        Name := Name is String ? StrPtr(Name) : Name

        result := ComCall(9, this, "ptr", Name, "ptr", Value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
