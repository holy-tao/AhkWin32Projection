#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ISettingsResult.ahk" { ISettingsResult }
#Import ".\ISettingsItem.ahk" { ISettingsItem }
#Import ".\ISettingsIdentity.ahk" { ISettingsIdentity }
#Import ".\IItemEnumerator.ahk" { IItemEnumerator }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\Variant\VARIANT.ahk" { VARIANT }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Performs operations to set, retrieve, and validate settings, and save changes for a namespace instance.
 * @see https://learn.microsoft.com/windows/win32/api/wcmconfig/nn-wcmconfig-isettingsnamespace
 * @namespace Windows.Win32.System.SettingsManagementInfrastructure
 */
export default struct ISettingsNamespace extends IUnknown {
    /**
     * The interface identifier for ISettingsNamespace
     * @type {Guid}
     */
    static IID := Guid("{9f7d7bba-20b3-11da-81a5-0030f1642e3c}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISettingsNamespace interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetIdentity         : IntPtr
        Settings            : IntPtr
        Save                : IntPtr
        GetSettingByPath    : IntPtr
        CreateSettingByPath : IntPtr
        RemoveSettingByPath : IntPtr
        GetAttribute        : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISettingsNamespace.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the identity of the namespace.
     * @returns {ISettingsIdentity} A pointer to an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wcmconfig/nn-wcmconfig-isettingsidentity">ISettingsIdentity</a> object that represents the namespace identity.
     * @see https://learn.microsoft.com/windows/win32/api/wcmconfig/nf-wcmconfig-isettingsnamespace-getidentity
     */
    GetIdentity() {
        result := ComCall(3, this, "ptr*", &SettingsID := 0, "HRESULT")
        return ISettingsIdentity(SettingsID)
    }

    /**
     * Retrieves an enumerator for the top-level settings for the namespace.
     * @returns {IItemEnumerator} A pointer to an  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wcmconfig/nn-wcmconfig-iitemenumerator">IItemEnumerator</a> object that provides methods to access all the settings for this namespace.
     * @see https://learn.microsoft.com/windows/win32/api/wcmconfig/nf-wcmconfig-isettingsnamespace-settings
     */
    Settings() {
        result := ComCall(4, this, "ptr*", &Settings := 0, "HRESULT")
        return IItemEnumerator(Settings)
    }

    /**
     * Updates the settings namespace to persistent and visible.
     * @param {BOOL} PushSettings Not used. A flag that controls whether to transfer settings to the registry or to an initialization file.
     * @returns {ISettingsResult} A pointer to an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wcmconfig/nn-wcmconfig-isettingsresult">ISettingsResult</a> object that contains any error that may have occurred while saving the namespace.
     * @see https://learn.microsoft.com/windows/win32/api/wcmconfig/nf-wcmconfig-isettingsnamespace-save
     */
    Save(PushSettings) {
        result := ComCall(5, this, BOOL, PushSettings, "ptr*", &Result := 0, "HRESULT")
        return ISettingsResult(Result)
    }

    /**
     * Gets the setting object specified by a path.
     * @param {PWSTR} _Path The path of the object.
     * @returns {ISettingsItem} A pointer to an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wcmconfig/nn-wcmconfig-isettingsitem">ISettingsItem</a> object that represents the retrieved object.
     * @see https://learn.microsoft.com/windows/win32/api/wcmconfig/nf-wcmconfig-isettingsnamespace-getsettingbypath
     */
    GetSettingByPath(_Path) {
        _Path := _Path is String ? StrPtr(_Path) : _Path

        result := ComCall(6, this, "ptr", _Path, "ptr*", &Setting := 0, "HRESULT")
        return ISettingsItem(Setting)
    }

    /**
     * Creates a setting object specified by its path.
     * @param {PWSTR} _Path The path of the setting object.
     * @returns {ISettingsItem} A pointer to an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wcmconfig/nn-wcmconfig-isettingsitem">ISettingsItem</a> object that represents 
     *       the created setting.
     * @see https://learn.microsoft.com/windows/win32/api/wcmconfig/nf-wcmconfig-isettingsnamespace-createsettingbypath
     */
    CreateSettingByPath(_Path) {
        _Path := _Path is String ? StrPtr(_Path) : _Path

        result := ComCall(7, this, "ptr", _Path, "ptr*", &Setting := 0, "HRESULT")
        return ISettingsItem(Setting)
    }

    /**
     * Removes the setting object specified by a path.
     * @param {PWSTR} _Path The path of the setting object.
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
     * @see https://learn.microsoft.com/windows/win32/api/wcmconfig/nf-wcmconfig-isettingsnamespace-removesettingbypath
     */
    RemoveSettingByPath(_Path) {
        _Path := _Path is String ? StrPtr(_Path) : _Path

        result := ComCall(8, this, "ptr", _Path, "HRESULT")
        return result
    }

    /**
     * Gets the value of an attribute of the namespace.
     * @param {PWSTR} Name The name of the attribute.
     * @returns {VARIANT} The value of the attribute.
     * @see https://learn.microsoft.com/windows/win32/api/wcmconfig/nf-wcmconfig-isettingsnamespace-getattribute
     */
    GetAttribute(Name) {
        Name := Name is String ? StrPtr(Name) : Name

        Value := VARIANT()
        result := ComCall(9, this, "ptr", Name, VARIANT.Ptr, Value, "HRESULT")
        return Value
    }

    Query(iid) {
        if (ISettingsNamespace.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetIdentity := CallbackCreate(GetMethod(implObj, "GetIdentity"), flags, 2)
        this.vtbl.Settings := CallbackCreate(GetMethod(implObj, "Settings"), flags, 2)
        this.vtbl.Save := CallbackCreate(GetMethod(implObj, "Save"), flags, 3)
        this.vtbl.GetSettingByPath := CallbackCreate(GetMethod(implObj, "GetSettingByPath"), flags, 3)
        this.vtbl.CreateSettingByPath := CallbackCreate(GetMethod(implObj, "CreateSettingByPath"), flags, 3)
        this.vtbl.RemoveSettingByPath := CallbackCreate(GetMethod(implObj, "RemoveSettingByPath"), flags, 2)
        this.vtbl.GetAttribute := CallbackCreate(GetMethod(implObj, "GetAttribute"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetIdentity)
        CallbackFree(this.vtbl.Settings)
        CallbackFree(this.vtbl.Save)
        CallbackFree(this.vtbl.GetSettingByPath)
        CallbackFree(this.vtbl.CreateSettingByPath)
        CallbackFree(this.vtbl.RemoveSettingByPath)
        CallbackFree(this.vtbl.GetAttribute)
    }
}
