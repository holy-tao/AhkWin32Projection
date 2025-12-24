#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\WRDS_SETTINGS.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Exposes methods for retrieving and adding policy-related settings.
 * @remarks
 * 
 * To avoid a possible deadlock when calling any of the methods on this interface, you should not make any function or method calls that will directly or indirectly result in a Remote Desktop Services API being called. If you need to make any outbound call, you should start a new thread and make the outbound call from the new thread.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//wtsprotocol/nn-wtsprotocol-iwrdsprotocolsettings
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class IWRdsProtocolSettings extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWRdsProtocolSettings
     * @type {Guid}
     */
    static IID => Guid("{654a5a6a-2550-47eb-b6f7-ebd637475265}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetSettings", "MergeSettings"]

    /**
     * Retrieves the settings for a particular policy.
     * @param {Integer} WRdsSettingType A value of the <a href="https://docs.microsoft.com/windows/desktop/api/wtsdefs/ne-wtsdefs-wrds_setting_type">WRDS_SETTING_TYPE</a> enumeration that specifies the area in which to retrieve the settings (machine group policy, user group policy, or user security accounts manager).
     * @param {Integer} WRdsSettingLevel A value of the <a href="https://docs.microsoft.com/windows/desktop/api/wtsdefs/ne-wtsdefs-wrds_setting_level">WRDS_SETTING_LEVEL</a> enumeration that specifies the type of structure contained in the <b>WRdsSetting</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/wtsdefs/ns-wtsdefs-wrds_settings">WRDS_SETTINGS</a> structure.
     * @returns {WRDS_SETTINGS} A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wtsdefs/ns-wtsdefs-wrds_settings">WRDS_SETTINGS</a> structure that contains the returned settings.
     * @see https://docs.microsoft.com/windows/win32/api//wtsprotocol/nf-wtsprotocol-iwrdsprotocolsettings-getsettings
     */
    GetSettings(WRdsSettingType, WRdsSettingLevel) {
        pWRdsSettings := WRDS_SETTINGS()
        result := ComCall(3, this, "int", WRdsSettingType, "int", WRdsSettingLevel, "ptr", pWRdsSettings, "HRESULT")
        return pWRdsSettings
    }

    /**
     * Adds (merges) the specified policy-related settings into the larger group of connection settings.
     * @param {Pointer<WRDS_SETTINGS>} pWRdsSettings A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wtsdefs/ns-wtsdefs-wrds_settings">WRDS_SETTINGS</a> structure that contains the policy-related settings to add.
     * @param {Integer} WRdsConnectionSettingLevel A value of the <a href="https://docs.microsoft.com/windows/desktop/api/wtsdefs/ne-wtsdefs-wrds_connection_setting_level">WRDS_CONNECTION_SETTING_LEVEL</a> enumeration that specifies the type of structure contained in the <b>WRdsConnectionSetting</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/wtsdefs/ns-wtsdefs-wrds_connection_settings">WRDS_CONNECTION_SETTINGS</a> structure.
     * @param {Pointer<WRDS_CONNECTION_SETTINGS>} pWRdsConnectionSettings A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wtsdefs/ns-wtsdefs-wrds_connection_settings">WRDS_CONNECTION_SETTINGS</a> structure that contains the existing connection settings. When the method returns, this structure is updated to include the merged settings.
     * @returns {HRESULT} When you are implementing this method, return <b>S_OK</b> if the function succeeds. If it fails, return an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wtsprotocol/nf-wtsprotocol-iwrdsprotocolsettings-mergesettings
     */
    MergeSettings(pWRdsSettings, WRdsConnectionSettingLevel, pWRdsConnectionSettings) {
        result := ComCall(4, this, "ptr", pWRdsSettings, "int", WRdsConnectionSettingLevel, "ptr", pWRdsConnectionSettings, "HRESULT")
        return result
    }
}
