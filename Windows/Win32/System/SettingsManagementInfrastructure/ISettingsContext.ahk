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
     * 
     * @param {Pointer<IStream>} pStream 
     * @param {Pointer<ITargetInfo>} pTarget 
     * @returns {HRESULT} 
     */
    Serialize(pStream, pTarget) {
        result := ComCall(3, this, "ptr", pStream, "ptr", pTarget, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IStream>} pStream 
     * @param {Pointer<ITargetInfo>} pTarget 
     * @param {Pointer<ISettingsResult>} pppResults 
     * @param {Pointer<UIntPtr>} pcResultCount 
     * @returns {HRESULT} 
     */
    Deserialize(pStream, pTarget, pppResults, pcResultCount) {
        result := ComCall(4, this, "ptr", pStream, "ptr", pTarget, "ptr", pppResults, "ptr*", pcResultCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} pUserData 
     * @returns {HRESULT} 
     */
    SetUserData(pUserData) {
        result := ComCall(5, this, "ptr", pUserData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Void>} pUserData 
     * @returns {HRESULT} 
     */
    GetUserData(pUserData) {
        result := ComCall(6, this, "ptr", pUserData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IItemEnumerator>} ppNamespaceIds 
     * @returns {HRESULT} 
     */
    GetNamespaces(ppNamespaceIds) {
        result := ComCall(7, this, "ptr", ppNamespaceIds, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISettingsIdentity>} pIdentity 
     * @param {Pointer<IItemEnumerator>} ppAddedSettings 
     * @param {Pointer<IItemEnumerator>} ppModifiedSettings 
     * @param {Pointer<IItemEnumerator>} ppDeletedSettings 
     * @returns {HRESULT} 
     */
    GetStoredSettings(pIdentity, ppAddedSettings, ppModifiedSettings, ppDeletedSettings) {
        result := ComCall(8, this, "ptr", pIdentity, "ptr", ppAddedSettings, "ptr", ppModifiedSettings, "ptr", ppDeletedSettings, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISettingsIdentity>} pIdentity 
     * @param {PWSTR} pwzSetting 
     * @returns {HRESULT} 
     */
    RevertSetting(pIdentity, pwzSetting) {
        pwzSetting := pwzSetting is String ? StrPtr(pwzSetting) : pwzSetting

        result := ComCall(9, this, "ptr", pIdentity, "ptr", pwzSetting, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
