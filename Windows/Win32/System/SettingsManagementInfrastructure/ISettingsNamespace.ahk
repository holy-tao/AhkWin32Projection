#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISettingsIdentity.ahk
#Include .\IItemEnumerator.ahk
#Include .\ISettingsResult.ahk
#Include .\ISettingsItem.ahk
#Include ..\Variant\VARIANT.ahk
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
     * Gets the identity of the namespace.
     * @returns {ISettingsIdentity} A pointer to an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wcmconfig/nn-wcmconfig-isettingsidentity">ISettingsIdentity</a> object that represents the namespace identity.
     * @see https://docs.microsoft.com/windows/win32/api//wcmconfig/nf-wcmconfig-isettingsnamespace-getidentity
     */
    GetIdentity() {
        result := ComCall(3, this, "ptr*", &SettingsID := 0, "HRESULT")
        return ISettingsIdentity(SettingsID)
    }

    /**
     * Retrieves an enumerator for the top-level settings for the namespace.
     * @returns {IItemEnumerator} A pointer to an  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wcmconfig/nn-wcmconfig-iitemenumerator">IItemEnumerator</a> object that provides methods to access all the settings for this namespace.
     * @see https://docs.microsoft.com/windows/win32/api//wcmconfig/nf-wcmconfig-isettingsnamespace-settings
     */
    Settings() {
        result := ComCall(4, this, "ptr*", &Settings := 0, "HRESULT")
        return IItemEnumerator(Settings)
    }

    /**
     * Updates the settings namespace to persistent and visible.
     * @param {BOOL} PushSettings Not used. A flag that controls whether to transfer settings to the registry or to an initialization file.
     * @returns {ISettingsResult} A pointer to an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wcmconfig/nn-wcmconfig-isettingsresult">ISettingsResult</a> object that contains any error that may have occurred while saving the namespace.
     * @see https://docs.microsoft.com/windows/win32/api//wcmconfig/nf-wcmconfig-isettingsnamespace-save
     */
    Save(PushSettings) {
        result := ComCall(5, this, "int", PushSettings, "ptr*", &Result := 0, "HRESULT")
        return ISettingsResult(Result)
    }

    /**
     * Gets the setting object specified by a path.
     * @param {PWSTR} Path The path of the object.
     * @returns {ISettingsItem} A pointer to an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wcmconfig/nn-wcmconfig-isettingsitem">ISettingsItem</a> object that represents the retrieved object.
     * @see https://docs.microsoft.com/windows/win32/api//wcmconfig/nf-wcmconfig-isettingsnamespace-getsettingbypath
     */
    GetSettingByPath(Path) {
        Path := Path is String ? StrPtr(Path) : Path

        result := ComCall(6, this, "ptr", Path, "ptr*", &Setting := 0, "HRESULT")
        return ISettingsItem(Setting)
    }

    /**
     * Creates a setting object specified by its path.
     * @param {PWSTR} Path The path of the setting object.
     * @returns {ISettingsItem} A pointer to an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wcmconfig/nn-wcmconfig-isettingsitem">ISettingsItem</a> object that represents 
     *       the created setting.
     * @see https://docs.microsoft.com/windows/win32/api//wcmconfig/nf-wcmconfig-isettingsnamespace-createsettingbypath
     */
    CreateSettingByPath(Path) {
        Path := Path is String ? StrPtr(Path) : Path

        result := ComCall(7, this, "ptr", Path, "ptr*", &Setting := 0, "HRESULT")
        return ISettingsItem(Setting)
    }

    /**
     * Removes the setting object specified by a path.
     * @param {PWSTR} Path The path of the setting object.
     * @returns {HRESULT} This method can return one of these values.
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
     * Indicates success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WCM_E_STATENODENOTFOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates an attempt to remove an item that does not exist.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>HRESULT_FROM_WIN32(ERROR_INVALID_OPERATION)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates an attempt to remove an element that is not in the list.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WCM_E_READONLYITEM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates that the item cannot be written, either because it is a read-only item, or the namespace was opened in ReadOnly mode.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WCM_E_INVALIDPATH</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates that the path is incorrectly formatted.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WCM_E_WRONGESCAPESTRING </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates that the path contains an unrecognized XML escape sequence.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>WCM_E_INVALIDKEY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates that the path is incorrectly specified and references the wrong key for the list item.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wcmconfig/nf-wcmconfig-isettingsnamespace-removesettingbypath
     */
    RemoveSettingByPath(Path) {
        Path := Path is String ? StrPtr(Path) : Path

        result := ComCall(8, this, "ptr", Path, "HRESULT")
        return result
    }

    /**
     * Gets the value of an attribute of the namespace.
     * @param {PWSTR} Name The name of the attribute.
     * @returns {VARIANT} The value of the attribute.
     * @see https://docs.microsoft.com/windows/win32/api//wcmconfig/nf-wcmconfig-isettingsnamespace-getattribute
     */
    GetAttribute(Name) {
        Name := Name is String ? StrPtr(Name) : Name

        Value := VARIANT()
        result := ComCall(9, this, "ptr", Name, "ptr", Value, "HRESULT")
        return Value
    }
}
