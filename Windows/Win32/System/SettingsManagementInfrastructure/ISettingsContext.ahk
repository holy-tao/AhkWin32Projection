#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * An interface to a backing store that is used to store setting changes made through the other SMI APIs, and provides operations to serialize to and deserialize from a representation.
 * @see https://docs.microsoft.com/windows/win32/api//wcmconfig/nn-wcmconfig-isettingscontext
 * @namespace Windows.Win32.System.SettingsManagementInfrastructure
 * @version v4.0.30319
 */
class ISettingsContext extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISettingsContext
     * @type {Guid}
     */
    static IID => Guid("{9f7d7bbd-20b3-11da-81a5-0030f1642e3c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Serialize", "Deserialize", "SetUserData", "GetUserData", "GetNamespaces", "GetStoredSettings", "RevertSetting"]

    /**
     * 
     * @param {IStream} pStream 
     * @param {ITargetInfo} pTarget 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wcmconfig/nf-wcmconfig-isettingscontext-serialize
     */
    Serialize(pStream, pTarget) {
        result := ComCall(3, this, "ptr", pStream, "ptr", pTarget, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IStream} pStream 
     * @param {ITargetInfo} pTarget 
     * @param {Pointer<Pointer<ISettingsResult>>} pppResults 
     * @param {Pointer<Pointer>} pcResultCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wcmconfig/nf-wcmconfig-isettingscontext-deserialize
     */
    Deserialize(pStream, pTarget, pppResults, pcResultCount) {
        pcResultCountMarshal := pcResultCount is VarRef ? "ptr*" : "ptr"

        result := ComCall(4, this, "ptr", pStream, "ptr", pTarget, "ptr*", pppResults, pcResultCountMarshal, pcResultCount, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} pUserData 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wcmconfig/nf-wcmconfig-isettingscontext-setuserdata
     */
    SetUserData(pUserData) {
        pUserDataMarshal := pUserData is VarRef ? "ptr" : "ptr"

        result := ComCall(5, this, pUserDataMarshal, pUserData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<Void>>} pUserData 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wcmconfig/nf-wcmconfig-isettingscontext-getuserdata
     */
    GetUserData(pUserData) {
        result := ComCall(6, this, "ptr*", pUserData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IItemEnumerator>} ppNamespaceIds 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wcmconfig/nf-wcmconfig-isettingscontext-getnamespaces
     */
    GetNamespaces(ppNamespaceIds) {
        result := ComCall(7, this, "ptr*", ppNamespaceIds, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ISettingsIdentity} pIdentity 
     * @param {Pointer<IItemEnumerator>} ppAddedSettings 
     * @param {Pointer<IItemEnumerator>} ppModifiedSettings 
     * @param {Pointer<IItemEnumerator>} ppDeletedSettings 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wcmconfig/nf-wcmconfig-isettingscontext-getstoredsettings
     */
    GetStoredSettings(pIdentity, ppAddedSettings, ppModifiedSettings, ppDeletedSettings) {
        result := ComCall(8, this, "ptr", pIdentity, "ptr*", ppAddedSettings, "ptr*", ppModifiedSettings, "ptr*", ppDeletedSettings, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ISettingsIdentity} pIdentity 
     * @param {PWSTR} pwzSetting 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wcmconfig/nf-wcmconfig-isettingscontext-revertsetting
     */
    RevertSetting(pIdentity, pwzSetting) {
        pwzSetting := pwzSetting is String ? StrPtr(pwzSetting) : pwzSetting

        result := ComCall(9, this, "ptr", pIdentity, "ptr", pwzSetting, "HRESULT")
        return result
    }
}
