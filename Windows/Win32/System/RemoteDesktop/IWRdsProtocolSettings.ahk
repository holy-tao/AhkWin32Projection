#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * 
     * @param {Integer} WRdsSettingType 
     * @param {Integer} WRdsSettingLevel 
     * @param {Pointer<WRDS_SETTINGS>} pWRdsSettings 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wtsprotocol/nf-wtsprotocol-iwrdsprotocolsettings-getsettings
     */
    GetSettings(WRdsSettingType, WRdsSettingLevel, pWRdsSettings) {
        result := ComCall(3, this, "int", WRdsSettingType, "int", WRdsSettingLevel, "ptr", pWRdsSettings, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<WRDS_SETTINGS>} pWRdsSettings 
     * @param {Integer} WRdsConnectionSettingLevel 
     * @param {Pointer<WRDS_CONNECTION_SETTINGS>} pWRdsConnectionSettings 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wtsprotocol/nf-wtsprotocol-iwrdsprotocolsettings-mergesettings
     */
    MergeSettings(pWRdsSettings, WRdsConnectionSettingLevel, pWRdsConnectionSettings) {
        result := ComCall(4, this, "ptr", pWRdsSettings, "int", WRdsConnectionSettingLevel, "ptr", pWRdsConnectionSettings, "HRESULT")
        return result
    }
}
