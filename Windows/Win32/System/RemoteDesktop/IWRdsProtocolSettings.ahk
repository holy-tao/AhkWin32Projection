#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\WRDS_CONNECTION_SETTINGS.ahk" { WRDS_CONNECTION_SETTINGS }
#Import ".\WRDS_SETTING_TYPE.ahk" { WRDS_SETTING_TYPE }
#Import ".\WRDS_CONNECTION_SETTING_LEVEL.ahk" { WRDS_CONNECTION_SETTING_LEVEL }
#Import ".\WRDS_SETTINGS.ahk" { WRDS_SETTINGS }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import ".\WRDS_SETTING_LEVEL.ahk" { WRDS_SETTING_LEVEL }

/**
 * Exposes methods for retrieving and adding policy-related settings.
 * @remarks
 * To avoid a possible deadlock when calling any of the methods on this interface, you should not make any function or method calls that will directly or indirectly result in a Remote Desktop Services API being called. If you need to make any outbound call, you should start a new thread and make the outbound call from the new thread.
 * @see https://learn.microsoft.com/windows/win32/api/wtsprotocol/nn-wtsprotocol-iwrdsprotocolsettings
 * @namespace Windows.Win32.System.RemoteDesktop
 */
export default struct IWRdsProtocolSettings extends IUnknown {
    /**
     * The interface identifier for IWRdsProtocolSettings
     * @type {Guid}
     */
    static IID := Guid("{654a5a6a-2550-47eb-b6f7-ebd637475265}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWRdsProtocolSettings interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetSettings   : IntPtr
        MergeSettings : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWRdsProtocolSettings.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves the settings for a particular policy.
     * @param {WRDS_SETTING_TYPE} WRdsSettingType A value of the <a href="https://docs.microsoft.com/windows/desktop/api/wtsdefs/ne-wtsdefs-wrds_setting_type">WRDS_SETTING_TYPE</a> enumeration that specifies the area in which to retrieve the settings (machine group policy, user group policy, or user security accounts manager).
     * @param {WRDS_SETTING_LEVEL} WRdsSettingLevel A value of the <a href="https://docs.microsoft.com/windows/desktop/api/wtsdefs/ne-wtsdefs-wrds_setting_level">WRDS_SETTING_LEVEL</a> enumeration that specifies the type of structure contained in the <b>WRdsSetting</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/wtsdefs/ns-wtsdefs-wrds_settings">WRDS_SETTINGS</a> structure.
     * @returns {WRDS_SETTINGS} A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wtsdefs/ns-wtsdefs-wrds_settings">WRDS_SETTINGS</a> structure that contains the returned settings.
     * @see https://learn.microsoft.com/windows/win32/api/wtsprotocol/nf-wtsprotocol-iwrdsprotocolsettings-getsettings
     */
    GetSettings(WRdsSettingType, WRdsSettingLevel) {
        pWRdsSettings := WRDS_SETTINGS()
        result := ComCall(3, this, WRDS_SETTING_TYPE, WRdsSettingType, WRDS_SETTING_LEVEL, WRdsSettingLevel, WRDS_SETTINGS.Ptr, pWRdsSettings, "HRESULT")
        return pWRdsSettings
    }

    /**
     * Adds (merges) the specified policy-related settings into the larger group of connection settings.
     * @param {Pointer<WRDS_SETTINGS>} pWRdsSettings A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wtsdefs/ns-wtsdefs-wrds_settings">WRDS_SETTINGS</a> structure that contains the policy-related settings to add.
     * @param {WRDS_CONNECTION_SETTING_LEVEL} WRdsConnectionSettingLevel A value of the <a href="https://docs.microsoft.com/windows/desktop/api/wtsdefs/ne-wtsdefs-wrds_connection_setting_level">WRDS_CONNECTION_SETTING_LEVEL</a> enumeration that specifies the type of structure contained in the <b>WRdsConnectionSetting</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/wtsdefs/ns-wtsdefs-wrds_connection_settings">WRDS_CONNECTION_SETTINGS</a> structure.
     * @param {Pointer<WRDS_CONNECTION_SETTINGS>} pWRdsConnectionSettings A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wtsdefs/ns-wtsdefs-wrds_connection_settings">WRDS_CONNECTION_SETTINGS</a> structure that contains the existing connection settings. When the method returns, this structure is updated to include the merged settings.
     * @returns {HRESULT} When you are implementing this method, return <b>S_OK</b> if the function succeeds. If it fails, return an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/wtsprotocol/nf-wtsprotocol-iwrdsprotocolsettings-mergesettings
     */
    MergeSettings(pWRdsSettings, WRdsConnectionSettingLevel, pWRdsConnectionSettings) {
        result := ComCall(4, this, WRDS_SETTINGS.Ptr, pWRdsSettings, WRDS_CONNECTION_SETTING_LEVEL, WRdsConnectionSettingLevel, WRDS_CONNECTION_SETTINGS.Ptr, pWRdsConnectionSettings, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWRdsProtocolSettings.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetSettings := CallbackCreate(GetMethod(implObj, "GetSettings"), flags, 4)
        this.vtbl.MergeSettings := CallbackCreate(GetMethod(implObj, "MergeSettings"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetSettings)
        CallbackFree(this.vtbl.MergeSettings)
    }
}
