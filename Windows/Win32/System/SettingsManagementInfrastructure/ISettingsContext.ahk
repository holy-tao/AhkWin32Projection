#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IItemEnumerator.ahk
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
     * Serializes the data in this context into the provided stream.
     * @param {IStream} pStream The stream into which the XML, produced by the method, is inserted.
     * @param {ITargetInfo} pTarget Defines the parameters of the image against which the context must be serialized. This should match the target used while constructing the context.
     * @returns {HRESULT} This method returns an HRESULT value. <b>S_OK</b> indicates success.
     * @see https://docs.microsoft.com/windows/win32/api//wcmconfig/nf-wcmconfig-isettingscontext-serialize
     */
    Serialize(pStream, pTarget) {
        result := ComCall(3, this, "ptr", pStream, "ptr", pTarget, "HRESULT")
        return result
    }

    /**
     * Deserializes the data in the stream that is provided to this context.
     * @param {IStream} pStream A pointer to an IStream initialized stream object containing the XML representing a settings section of an answer (Unattend.xml) file.
     * An answers file is a file that facilitates the unattend process during setup or migration  to execute all of its tasks automatically, without user intervention.
     * @param {ITargetInfo} pTarget A pointer that identifies <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wcmconfig/nn-wcmconfig-itargetinfo">ITargetInfo</a> target object that should be used while deserializing the stream. This target should match the target which will be used on the engine alongside this context.
     * @param {Pointer<Pointer<ISettingsResult>>} pppResults A pointer to an array of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wcmconfig/nn-wcmconfig-isettingsresult">ISettingsResult</a> interface pointers. Each interface pointer identifies an issue which may have occurred during deserialization.
     * @returns {Pointer} The number of ISettingsResult objects in the array pppResults.
     * @see https://docs.microsoft.com/windows/win32/api//wcmconfig/nf-wcmconfig-isettingscontext-deserialize
     */
    Deserialize(pStream, pTarget, pppResults) {
        pppResultsMarshal := pppResults is VarRef ? "ptr*" : "ptr"

        result := ComCall(4, this, "ptr", pStream, "ptr", pTarget, pppResultsMarshal, pppResults, "ptr*", &pcResultCount := 0, "HRESULT")
        return pcResultCount
    }

    /**
     * Sets the user-defined data.
     * @param {Pointer<Void>} pUserData A pointer to the user-defined data.
     * @returns {HRESULT} This method returns an HRESULT value. <b>S_OK</b> indicates success.
     * @see https://docs.microsoft.com/windows/win32/api//wcmconfig/nf-wcmconfig-isettingscontext-setuserdata
     */
    SetUserData(pUserData) {
        pUserDataMarshal := pUserData is VarRef ? "ptr" : "ptr"

        result := ComCall(5, this, pUserDataMarshal, pUserData, "HRESULT")
        return result
    }

    /**
     * Gets a user-defined data.
     * @returns {Pointer<Void>} The user-defined data.
     * @see https://docs.microsoft.com/windows/win32/api//wcmconfig/nf-wcmconfig-isettingscontext-getuserdata
     */
    GetUserData() {
        result := ComCall(6, this, "ptr*", &pUserData := 0, "HRESULT")
        return pUserData
    }

    /**
     * Gets the namespaces that exist in the context.
     * @returns {IItemEnumerator} An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wcmconfig/nn-wcmconfig-iitemenumerator">IItemEnumerator</a> interface pointer that represents the collection of namespaces.
     * @see https://docs.microsoft.com/windows/win32/api//wcmconfig/nf-wcmconfig-isettingscontext-getnamespaces
     */
    GetNamespaces() {
        result := ComCall(7, this, "ptr*", &ppNamespaceIds := 0, "HRESULT")
        return IItemEnumerator(ppNamespaceIds)
    }

    /**
     * Gets the stored setting changes from the context for the given namespace.
     * @param {ISettingsIdentity} pIdentity The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wcmconfig/nn-wcmconfig-isettingsidentity">ISettingsIdentity</a> object that specifies the namespace to get the settings for. This namespace identity should be fully-specified.
     * @param {Pointer<IItemEnumerator>} ppAddedSettings A pointer to a newly allocated <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wcmconfig/nn-wcmconfig-iitemenumerator">IItemEnumerator</a> object that lists the set of paths for the added settings. Each path identifies a setting added to the context.
     * @param {Pointer<IItemEnumerator>} ppModifiedSettings A pointer to a newly-allocated <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wcmconfig/nn-wcmconfig-iitemenumerator">IItemEnumerator</a> object that lists the set of paths for the modified settings.
     * @param {Pointer<IItemEnumerator>} ppDeletedSettings A pointer to a newly-allocated <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wcmconfig/nn-wcmconfig-iitemenumerator">IItemEnumerator</a> object that lists the set of paths for the deleted settings.
     * @returns {HRESULT} This method returns an HRESULT value. <b>S_OK</b> indicates success. It returns <b>WCM_E_NAMESPACENOTFOUND</b> if <i>pIdentity</i> references a namespace that is not in the context.
     * 
     * It may return <b>E_OUTOFMEMORY</b> if there are insufficient resources on the system to allocate the enumerators.
     * @see https://docs.microsoft.com/windows/win32/api//wcmconfig/nf-wcmconfig-isettingscontext-getstoredsettings
     */
    GetStoredSettings(pIdentity, ppAddedSettings, ppModifiedSettings, ppDeletedSettings) {
        result := ComCall(8, this, "ptr", pIdentity, "ptr*", ppAddedSettings, "ptr*", ppModifiedSettings, "ptr*", ppDeletedSettings, "HRESULT")
        return result
    }

    /**
     * Reverts a setting in the namespace.
     * @param {ISettingsIdentity} pIdentity The fully-specified identity for the namespace that holds the setting  to be reverted.
     * @param {PWSTR} pwzSetting A path to a setting within the namespace that has been overridden in this context.
     * @returns {HRESULT} This method returns an HRESULT value. <b>S_OK</b> indicates success. It returns <b>WCM_E_NAMESPACENOTFOUND</b> if <i>pIdentity</i> specifies a namespace that is not currently in the context. It returns <b>WCM_E_STATENODENOTFOUND</b> if <i>pwzSetting</i> is not changed in the context.
     * @see https://docs.microsoft.com/windows/win32/api//wcmconfig/nf-wcmconfig-isettingscontext-revertsetting
     */
    RevertSetting(pIdentity, pwzSetting) {
        pwzSetting := pwzSetting is String ? StrPtr(pwzSetting) : pwzSetting

        result := ComCall(9, this, "ptr", pIdentity, "ptr", pwzSetting, "HRESULT")
        return result
    }
}
