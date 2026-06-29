#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ISettingsResult.ahk" { ISettingsResult }
#Import ".\ISettingsIdentity.ahk" { ISettingsIdentity }
#Import ".\IItemEnumerator.ahk" { IItemEnumerator }
#Import "..\Com\IStream.ahk" { IStream }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\ITargetInfo.ahk" { ITargetInfo }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * An interface to a backing store that is used to store setting changes made through the other SMI APIs, and provides operations to serialize to and deserialize from a representation.
 * @see https://learn.microsoft.com/windows/win32/api/wcmconfig/nn-wcmconfig-isettingscontext
 * @namespace Windows.Win32.System.SettingsManagementInfrastructure
 */
export default struct ISettingsContext extends IUnknown {
    /**
     * The interface identifier for ISettingsContext
     * @type {Guid}
     */
    static IID := Guid("{9f7d7bbd-20b3-11da-81a5-0030f1642e3c}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISettingsContext interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Serialize         : IntPtr
        Deserialize       : IntPtr
        SetUserData       : IntPtr
        GetUserData       : IntPtr
        GetNamespaces     : IntPtr
        GetStoredSettings : IntPtr
        RevertSetting     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISettingsContext.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Serializes the data in this context into the provided stream.
     * @param {IStream} pStream The stream into which the XML, produced by the method, is inserted.
     * @param {ITargetInfo} pTarget Defines the parameters of the image against which the context must be serialized. This should match the target used while constructing the context.
     * @returns {HRESULT} This method returns an HRESULT value. <b>S_OK</b> indicates success.
     * @see https://learn.microsoft.com/windows/win32/api/wcmconfig/nf-wcmconfig-isettingscontext-serialize
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
     * @see https://learn.microsoft.com/windows/win32/api/wcmconfig/nf-wcmconfig-isettingscontext-deserialize
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
     * @see https://learn.microsoft.com/windows/win32/api/wcmconfig/nf-wcmconfig-isettingscontext-setuserdata
     */
    SetUserData(pUserData) {
        pUserDataMarshal := pUserData is VarRef ? "ptr" : "ptr"

        result := ComCall(5, this, pUserDataMarshal, pUserData, "HRESULT")
        return result
    }

    /**
     * Gets a user-defined data.
     * @returns {Pointer<Void>} The user-defined data.
     * @see https://learn.microsoft.com/windows/win32/api/wcmconfig/nf-wcmconfig-isettingscontext-getuserdata
     */
    GetUserData() {
        result := ComCall(6, this, "ptr*", &pUserData := 0, "HRESULT")
        return pUserData
    }

    /**
     * Gets the namespaces that exist in the context.
     * @remarks
     * <div class="alert"><b>Note</b>  This method may return <b>E_OUTOFMEMORY</b> if there are insufficient resources in the system to allocate a new enumerator.</div>
     * <div> </div>
     * @returns {IItemEnumerator} An <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wcmconfig/nn-wcmconfig-iitemenumerator">IItemEnumerator</a> interface pointer that represents the collection of namespaces.
     * @see https://learn.microsoft.com/windows/win32/api/wcmconfig/nf-wcmconfig-isettingscontext-getnamespaces
     */
    GetNamespaces() {
        result := ComCall(7, this, "ptr*", &ppNamespaceIds := 0, "HRESULT")
        return IItemEnumerator(ppNamespaceIds)
    }

    /**
     * Gets the stored setting changes from the context for the given namespace.
     * @remarks
     * <i>ppAddedSettings</i>, <i>ppModifiedSettings</i>, and <i>ppDeletedSettings</i> are enumerators for which Current returns a var with variable type BSTR that identifies the paths for the added, modified, and deleted settings respectively. Enumerating through the enumerators produces a set of path strings, each of which identifies a setting that has been added, modified, or deleted in this context. These strings can then be passed to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wcmconfig/nf-wcmconfig-isettingscontext-revertsetting">RevertSetting</a>.
     * @param {ISettingsIdentity} pIdentity The <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wcmconfig/nn-wcmconfig-isettingsidentity">ISettingsIdentity</a> object that specifies the namespace to get the settings for. This namespace identity should be fully-specified.
     * @param {Pointer<IItemEnumerator>} ppAddedSettings A pointer to a newly allocated <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wcmconfig/nn-wcmconfig-iitemenumerator">IItemEnumerator</a> object that lists the set of paths for the added settings. Each path identifies a setting added to the context.
     * @param {Pointer<IItemEnumerator>} ppModifiedSettings A pointer to a newly-allocated <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wcmconfig/nn-wcmconfig-iitemenumerator">IItemEnumerator</a> object that lists the set of paths for the modified settings.
     * @param {Pointer<IItemEnumerator>} ppDeletedSettings A pointer to a newly-allocated <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wcmconfig/nn-wcmconfig-iitemenumerator">IItemEnumerator</a> object that lists the set of paths for the deleted settings.
     * @returns {HRESULT} This method returns an HRESULT value. <b>S_OK</b> indicates success. It returns <b>WCM_E_NAMESPACENOTFOUND</b> if <i>pIdentity</i> references a namespace that is not in the context.
     * 
     * It may return <b>E_OUTOFMEMORY</b> if there are insufficient resources on the system to allocate the enumerators.
     * @see https://learn.microsoft.com/windows/win32/api/wcmconfig/nf-wcmconfig-isettingscontext-getstoredsettings
     */
    GetStoredSettings(pIdentity, ppAddedSettings, ppModifiedSettings, ppDeletedSettings) {
        result := ComCall(8, this, "ptr", pIdentity, IItemEnumerator.Ptr, ppAddedSettings, IItemEnumerator.Ptr, ppModifiedSettings, IItemEnumerator.Ptr, ppDeletedSettings, "HRESULT")
        return result
    }

    /**
     * Reverts a setting in the namespace.
     * @param {ISettingsIdentity} pIdentity The fully-specified identity for the namespace that holds the setting  to be reverted.
     * @param {PWSTR} pwzSetting A path to a setting within the namespace that has been overridden in this context.
     * @returns {HRESULT} This method returns an HRESULT value. <b>S_OK</b> indicates success. It returns <b>WCM_E_NAMESPACENOTFOUND</b> if <i>pIdentity</i> specifies a namespace that is not currently in the context. It returns <b>WCM_E_STATENODENOTFOUND</b> if <i>pwzSetting</i> is not changed in the context.
     * @see https://learn.microsoft.com/windows/win32/api/wcmconfig/nf-wcmconfig-isettingscontext-revertsetting
     */
    RevertSetting(pIdentity, pwzSetting) {
        pwzSetting := pwzSetting is String ? StrPtr(pwzSetting) : pwzSetting

        result := ComCall(9, this, "ptr", pIdentity, "ptr", pwzSetting, "HRESULT")
        return result
    }

    Query(iid) {
        if (ISettingsContext.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Serialize := CallbackCreate(GetMethod(implObj, "Serialize"), flags, 3)
        this.vtbl.Deserialize := CallbackCreate(GetMethod(implObj, "Deserialize"), flags, 5)
        this.vtbl.SetUserData := CallbackCreate(GetMethod(implObj, "SetUserData"), flags, 2)
        this.vtbl.GetUserData := CallbackCreate(GetMethod(implObj, "GetUserData"), flags, 2)
        this.vtbl.GetNamespaces := CallbackCreate(GetMethod(implObj, "GetNamespaces"), flags, 2)
        this.vtbl.GetStoredSettings := CallbackCreate(GetMethod(implObj, "GetStoredSettings"), flags, 5)
        this.vtbl.RevertSetting := CallbackCreate(GetMethod(implObj, "RevertSetting"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Serialize)
        CallbackFree(this.vtbl.Deserialize)
        CallbackFree(this.vtbl.SetUserData)
        CallbackFree(this.vtbl.GetUserData)
        CallbackFree(this.vtbl.GetNamespaces)
        CallbackFree(this.vtbl.GetStoredSettings)
        CallbackFree(this.vtbl.RevertSetting)
    }
}
