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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetIdentity", "Settings", "Save", "GetSettingByPath", "CreateSettingByPath", "RemoveSettingByPath", "GetAttribute"]

    /**
     * 
     * @param {Pointer<ISettingsIdentity>} SettingsID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wcmconfig/nf-wcmconfig-isettingsnamespace-getidentity
     */
    GetIdentity(SettingsID) {
        result := ComCall(3, this, "ptr*", SettingsID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IItemEnumerator>} Settings 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wcmconfig/nf-wcmconfig-isettingsnamespace-settings
     */
    Settings(Settings) {
        result := ComCall(4, this, "ptr*", Settings, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} PushSettings 
     * @param {Pointer<ISettingsResult>} Result 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wcmconfig/nf-wcmconfig-isettingsnamespace-save
     */
    Save(PushSettings, Result) {
        result := ComCall(5, this, "int", PushSettings, "ptr*", Result, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} Path 
     * @param {Pointer<ISettingsItem>} Setting 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wcmconfig/nf-wcmconfig-isettingsnamespace-getsettingbypath
     */
    GetSettingByPath(Path, Setting) {
        Path := Path is String ? StrPtr(Path) : Path

        result := ComCall(6, this, "ptr", Path, "ptr*", Setting, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} Path 
     * @param {Pointer<ISettingsItem>} Setting 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wcmconfig/nf-wcmconfig-isettingsnamespace-createsettingbypath
     */
    CreateSettingByPath(Path, Setting) {
        Path := Path is String ? StrPtr(Path) : Path

        result := ComCall(7, this, "ptr", Path, "ptr*", Setting, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} Path 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wcmconfig/nf-wcmconfig-isettingsnamespace-removesettingbypath
     */
    RemoveSettingByPath(Path) {
        Path := Path is String ? StrPtr(Path) : Path

        result := ComCall(8, this, "ptr", Path, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} Name 
     * @param {Pointer<VARIANT>} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wcmconfig/nf-wcmconfig-isettingsnamespace-getattribute
     */
    GetAttribute(Name, Value) {
        Name := Name is String ? StrPtr(Name) : Name

        result := ComCall(9, this, "ptr", Name, "ptr", Value, "HRESULT")
        return result
    }
}
