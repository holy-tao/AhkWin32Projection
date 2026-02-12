#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IWindowsUpdate.ahk
#Include ..\..\..\Guid.ahk

/**
 * **WindowsUpdate** is essentially a property bag with information about a pending or in-progress update.
 * @remarks
 * You can obtain a **WindowsUpdate** from [WindowsUpdateManager](./windowsupdatemanager.md) via various event callbacks.
 * 
 * Or you can obtain one from [WindowsUpdateAdministrator](./windowsupdateadministrator.md) via the [GetUpdates](./windowsupdateadministrator_getupdates_927795838.md) method.
 * @see https://learn.microsoft.com/uwp/api/windows.management.update.windowsupdate
 * @namespace Windows.Management.Update
 * @version WindowsRuntime 1.4
 */
class WindowsUpdate extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IWindowsUpdate

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IWindowsUpdate.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the provider ID associated with the [WindowsUpdate](./windowsupdate.md) object.
     * @remarks
     * The provider ID indicates which update provider is processing the update. For Windows updates, this will most commonly be "WuProvider".
     * @see https://learn.microsoft.com/uwp/api/windows.management.update.windowsupdate.providerid
     * @type {HSTRING} 
     */
    ProviderId {
        get => this.get_ProviderId()
    }

    /**
     * Gets the update ID associated with the [WindowsUpdate](./windowsupdate.md) object.
     * @remarks
     * The update ID will generally be a GUID, but it can be any string that uniquely identifies. This identifier is required for calling many [WindowsUpdateAdministrator](./windowsupdateadministrator.md) methods.
     * @see https://learn.microsoft.com/uwp/api/windows.management.update.windowsupdate.updateid
     * @type {HSTRING} 
     */
    UpdateId {
        get => this.get_UpdateId()
    }

    /**
     * Gets the title for the [WindowsUpdate](./windowsupdate.md) object.
     * @see https://learn.microsoft.com/uwp/api/windows.management.update.windowsupdate.title
     * @type {HSTRING} 
     */
    Title {
        get => this.get_Title()
    }

    /**
     * Gets the underlying description metadata string associated with the [WindowsUpdate](./windowsupdate.md) object.
     * @see https://learn.microsoft.com/uwp/api/windows.management.update.windowsupdate.description
     * @type {HSTRING} 
     */
    Description {
        get => this.get_Description()
    }

    /**
     * Indicates whether the [WindowsUpdate](./windowsupdate.md) object is classified as a feature update.
     * @see https://learn.microsoft.com/uwp/api/windows.management.update.windowsupdate.isfeatureupdate
     * @type {Boolean} 
     */
    IsFeatureUpdate {
        get => this.get_IsFeatureUpdate()
    }

    /**
     * Indicates whether the [WindowsUpdate](./windowsupdate.md) object is classified as minor impact.
     * @see https://learn.microsoft.com/uwp/api/windows.management.update.windowsupdate.isminorimpact
     * @type {Boolean} 
     */
    IsMinorImpact {
        get => this.get_IsMinorImpact()
    }

    /**
     * Indicates whether the [WindowsUpdate](./windowsupdate.md) object is classified as a security update.
     * @see https://learn.microsoft.com/uwp/api/windows.management.update.windowsupdate.issecurity
     * @type {Boolean} 
     */
    IsSecurity {
        get => this.get_IsSecurity()
    }

    /**
     * Indicates whether the [WindowsUpdate](./windowsupdate.md) object is classified as critical.
     * @see https://learn.microsoft.com/uwp/api/windows.management.update.windowsupdate.iscritical
     * @type {Boolean} 
     */
    IsCritical {
        get => this.get_IsCritical()
    }

    /**
     * Indicates whether the [WindowsUpdate](./windowsupdate.md) object is classified as being for the OS.
     * @see https://learn.microsoft.com/uwp/api/windows.management.update.windowsupdate.isforos
     * @type {Boolean} 
     */
    IsForOS {
        get => this.get_IsForOS()
    }

    /**
     * Indicates whether the [WindowsUpdate](./windowsupdate.md) object is classified as a driver update.
     * @see https://learn.microsoft.com/uwp/api/windows.management.update.windowsupdate.isdriver
     * @type {Boolean} 
     */
    IsDriver {
        get => this.get_IsDriver()
    }

    /**
     * Indicates whether the [WindowsUpdate](./windowsupdate.md) object is classified as mandatory.
     * @see https://learn.microsoft.com/uwp/api/windows.management.update.windowsupdate.ismandatory
     * @type {Boolean} 
     */
    IsMandatory {
        get => this.get_IsMandatory()
    }

    /**
     * Indicates whether the [WindowsUpdate](./windowsupdate.md) object is classified as urgent.
     * @see https://learn.microsoft.com/uwp/api/windows.management.update.windowsupdate.isurgent
     * @type {Boolean} 
     */
    IsUrgent {
        get => this.get_IsUrgent()
    }

    /**
     * Indicates whether the [WindowsUpdate](./windowsupdate.md) object is classified as seeker.
     * @see https://learn.microsoft.com/uwp/api/windows.management.update.windowsupdate.isseeker
     * @type {Boolean} 
     */
    IsSeeker {
        get => this.get_IsSeeker()
    }

    /**
     * Gets the underlying *more info* URL associated with the [WindowsUpdate](./windowsupdate.md) object.
     * @see https://learn.microsoft.com/uwp/api/windows.management.update.windowsupdate.moreinfourl
     * @type {Uri} 
     */
    MoreInfoUrl {
        get => this.get_MoreInfoUrl()
    }

    /**
     * Gets the underlying support URL associated with the [WindowsUpdate](./windowsupdate.md) object.
     * @see https://learn.microsoft.com/uwp/api/windows.management.update.windowsupdate.supporturl
     * @type {Uri} 
     */
    SupportUrl {
        get => this.get_SupportUrl()
    }

    /**
     * Indicates whether the End-User License Agreement (EULA) has been accepted for the [WindowsUpdate](./windowsupdate.md) object.
     * @see https://learn.microsoft.com/uwp/api/windows.management.update.windowsupdate.iseulaaccepted
     * @type {Boolean} 
     */
    IsEulaAccepted {
        get => this.get_IsEulaAccepted()
    }

    /**
     * Gets the underlying End-User License Agreement (EULA) text associated with the [WindowsUpdate](./windowsupdate.md) object.
     * @see https://learn.microsoft.com/uwp/api/windows.management.update.windowsupdate.eulatext
     * @type {HSTRING} 
     */
    EulaText {
        get => this.get_EulaText()
    }

    /**
     * Gets the underlying deadline associated with the [WindowsUpdate](./windowsupdate.md) object.
     * @remarks
     * The deadline for an update is a specific time that it should be installed by, and will influence how aggressive USO is in ensuring that the update is downloaded and installed in order to meet the deadline.
     * @see https://learn.microsoft.com/uwp/api/windows.management.update.windowsupdate.deadline
     * @type {IReference<DateTime>} 
     */
    Deadline {
        get => this.get_Deadline()
    }

    /**
     * Gets the underlying [WindowsUpdateAttentionRequiredInfo](./windowsupdateattentionrequiredinfo.md) associated with the [WindowsUpdate](./windowsupdate.md) object.
     * @see https://learn.microsoft.com/uwp/api/windows.management.update.windowsupdate.attentionrequiredinfo
     * @type {WindowsUpdateAttentionRequiredInfo} 
     */
    AttentionRequiredInfo {
        get => this.get_AttentionRequiredInfo()
    }

    /**
     * Gets the underlying [WindowsUpdateActionResult](./windowsupdateactionresult.md) associated with the [WindowsUpdate](./windowsupdate.md) object.
     * @see https://learn.microsoft.com/uwp/api/windows.management.update.windowsupdate.actionresult
     * @type {WindowsUpdateActionResult} 
     */
    ActionResult {
        get => this.get_ActionResult()
    }

    /**
     * Gets the current action that the [WindowsUpdate](./windowsupdate.md) object is in the process of.
     * @remarks
     * This will most commonly be "Download" or "Install". Other possible actions include "Uninstall", "Commit", and "PostReboot".
     * @see https://learn.microsoft.com/uwp/api/windows.management.update.windowsupdate.currentaction
     * @type {HSTRING} 
     */
    CurrentAction {
        get => this.get_CurrentAction()
    }

    /**
     * Gets the underlying [WindowsUpdateActionProgress](./windowsupdateactionprogress.md) associated with the [WindowsUpdate](./windowsupdate.md) object.
     * @see https://learn.microsoft.com/uwp/api/windows.management.update.windowsupdate.actionprogress
     * @type {WindowsUpdateActionProgress} 
     */
    ActionProgress {
        get => this.get_ActionProgress()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ProviderId() {
        if (!this.HasProp("__IWindowsUpdate")) {
            if ((queryResult := this.QueryInterface(IWindowsUpdate.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsUpdate := IWindowsUpdate(outPtr)
        }

        return this.__IWindowsUpdate.get_ProviderId()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_UpdateId() {
        if (!this.HasProp("__IWindowsUpdate")) {
            if ((queryResult := this.QueryInterface(IWindowsUpdate.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsUpdate := IWindowsUpdate(outPtr)
        }

        return this.__IWindowsUpdate.get_UpdateId()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Title() {
        if (!this.HasProp("__IWindowsUpdate")) {
            if ((queryResult := this.QueryInterface(IWindowsUpdate.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsUpdate := IWindowsUpdate(outPtr)
        }

        return this.__IWindowsUpdate.get_Title()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Description() {
        if (!this.HasProp("__IWindowsUpdate")) {
            if ((queryResult := this.QueryInterface(IWindowsUpdate.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsUpdate := IWindowsUpdate(outPtr)
        }

        return this.__IWindowsUpdate.get_Description()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsFeatureUpdate() {
        if (!this.HasProp("__IWindowsUpdate")) {
            if ((queryResult := this.QueryInterface(IWindowsUpdate.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsUpdate := IWindowsUpdate(outPtr)
        }

        return this.__IWindowsUpdate.get_IsFeatureUpdate()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsMinorImpact() {
        if (!this.HasProp("__IWindowsUpdate")) {
            if ((queryResult := this.QueryInterface(IWindowsUpdate.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsUpdate := IWindowsUpdate(outPtr)
        }

        return this.__IWindowsUpdate.get_IsMinorImpact()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsSecurity() {
        if (!this.HasProp("__IWindowsUpdate")) {
            if ((queryResult := this.QueryInterface(IWindowsUpdate.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsUpdate := IWindowsUpdate(outPtr)
        }

        return this.__IWindowsUpdate.get_IsSecurity()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsCritical() {
        if (!this.HasProp("__IWindowsUpdate")) {
            if ((queryResult := this.QueryInterface(IWindowsUpdate.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsUpdate := IWindowsUpdate(outPtr)
        }

        return this.__IWindowsUpdate.get_IsCritical()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsForOS() {
        if (!this.HasProp("__IWindowsUpdate")) {
            if ((queryResult := this.QueryInterface(IWindowsUpdate.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsUpdate := IWindowsUpdate(outPtr)
        }

        return this.__IWindowsUpdate.get_IsForOS()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsDriver() {
        if (!this.HasProp("__IWindowsUpdate")) {
            if ((queryResult := this.QueryInterface(IWindowsUpdate.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsUpdate := IWindowsUpdate(outPtr)
        }

        return this.__IWindowsUpdate.get_IsDriver()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsMandatory() {
        if (!this.HasProp("__IWindowsUpdate")) {
            if ((queryResult := this.QueryInterface(IWindowsUpdate.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsUpdate := IWindowsUpdate(outPtr)
        }

        return this.__IWindowsUpdate.get_IsMandatory()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsUrgent() {
        if (!this.HasProp("__IWindowsUpdate")) {
            if ((queryResult := this.QueryInterface(IWindowsUpdate.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsUpdate := IWindowsUpdate(outPtr)
        }

        return this.__IWindowsUpdate.get_IsUrgent()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsSeeker() {
        if (!this.HasProp("__IWindowsUpdate")) {
            if ((queryResult := this.QueryInterface(IWindowsUpdate.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsUpdate := IWindowsUpdate(outPtr)
        }

        return this.__IWindowsUpdate.get_IsSeeker()
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_MoreInfoUrl() {
        if (!this.HasProp("__IWindowsUpdate")) {
            if ((queryResult := this.QueryInterface(IWindowsUpdate.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsUpdate := IWindowsUpdate(outPtr)
        }

        return this.__IWindowsUpdate.get_MoreInfoUrl()
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_SupportUrl() {
        if (!this.HasProp("__IWindowsUpdate")) {
            if ((queryResult := this.QueryInterface(IWindowsUpdate.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsUpdate := IWindowsUpdate(outPtr)
        }

        return this.__IWindowsUpdate.get_SupportUrl()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsEulaAccepted() {
        if (!this.HasProp("__IWindowsUpdate")) {
            if ((queryResult := this.QueryInterface(IWindowsUpdate.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsUpdate := IWindowsUpdate(outPtr)
        }

        return this.__IWindowsUpdate.get_IsEulaAccepted()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_EulaText() {
        if (!this.HasProp("__IWindowsUpdate")) {
            if ((queryResult := this.QueryInterface(IWindowsUpdate.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsUpdate := IWindowsUpdate(outPtr)
        }

        return this.__IWindowsUpdate.get_EulaText()
    }

    /**
     * 
     * @returns {IReference<DateTime>} 
     */
    get_Deadline() {
        if (!this.HasProp("__IWindowsUpdate")) {
            if ((queryResult := this.QueryInterface(IWindowsUpdate.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsUpdate := IWindowsUpdate(outPtr)
        }

        return this.__IWindowsUpdate.get_Deadline()
    }

    /**
     * 
     * @returns {WindowsUpdateAttentionRequiredInfo} 
     */
    get_AttentionRequiredInfo() {
        if (!this.HasProp("__IWindowsUpdate")) {
            if ((queryResult := this.QueryInterface(IWindowsUpdate.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsUpdate := IWindowsUpdate(outPtr)
        }

        return this.__IWindowsUpdate.get_AttentionRequiredInfo()
    }

    /**
     * 
     * @returns {WindowsUpdateActionResult} 
     */
    get_ActionResult() {
        if (!this.HasProp("__IWindowsUpdate")) {
            if ((queryResult := this.QueryInterface(IWindowsUpdate.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsUpdate := IWindowsUpdate(outPtr)
        }

        return this.__IWindowsUpdate.get_ActionResult()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_CurrentAction() {
        if (!this.HasProp("__IWindowsUpdate")) {
            if ((queryResult := this.QueryInterface(IWindowsUpdate.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsUpdate := IWindowsUpdate(outPtr)
        }

        return this.__IWindowsUpdate.get_CurrentAction()
    }

    /**
     * 
     * @returns {WindowsUpdateActionProgress} 
     */
    get_ActionProgress() {
        if (!this.HasProp("__IWindowsUpdate")) {
            if ((queryResult := this.QueryInterface(IWindowsUpdate.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsUpdate := IWindowsUpdate(outPtr)
        }

        return this.__IWindowsUpdate.get_ActionProgress()
    }

    /**
     * Retrieves the underlying property value of a given name associated with the [WindowsUpdate](./windowsupdate.md) object metadata.
     * @param {HSTRING} propertyName The name of the property value to query in the update metadata.
     * @returns {IInspectable} 
     * @see https://learn.microsoft.com/uwp/api/windows.management.update.windowsupdate.getpropertyvalue
     */
    GetPropertyValue(propertyName) {
        if (!this.HasProp("__IWindowsUpdate")) {
            if ((queryResult := this.QueryInterface(IWindowsUpdate.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsUpdate := IWindowsUpdate(outPtr)
        }

        return this.__IWindowsUpdate.GetPropertyValue(propertyName)
    }

    /**
     * Accepts the End-User License Agreement (EULA) associated with the [WindowsUpdate](./windowsupdate.md) object.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.management.update.windowsupdate.accepteula
     */
    AcceptEula() {
        if (!this.HasProp("__IWindowsUpdate")) {
            if ((queryResult := this.QueryInterface(IWindowsUpdate.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsUpdate := IWindowsUpdate(outPtr)
        }

        return this.__IWindowsUpdate.AcceptEula()
    }

;@endregion Instance Methods
}
