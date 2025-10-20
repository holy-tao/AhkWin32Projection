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
     * 
     * @param {Integer} WRdsSettingType 
     * @param {Integer} WRdsSettingLevel 
     * @param {Pointer<WRDS_SETTINGS>} pWRdsSettings 
     * @returns {HRESULT} 
     */
    GetSettings(WRdsSettingType, WRdsSettingLevel, pWRdsSettings) {
        result := ComCall(3, this, "int", WRdsSettingType, "int", WRdsSettingLevel, "ptr", pWRdsSettings, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<WRDS_SETTINGS>} pWRdsSettings 
     * @param {Integer} WRdsConnectionSettingLevel 
     * @param {Pointer<WRDS_CONNECTION_SETTINGS>} pWRdsConnectionSettings 
     * @returns {HRESULT} 
     */
    MergeSettings(pWRdsSettings, WRdsConnectionSettingLevel, pWRdsConnectionSettings) {
        result := ComCall(4, this, "ptr", pWRdsSettings, "int", WRdsConnectionSettingLevel, "ptr", pWRdsConnectionSettings, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
