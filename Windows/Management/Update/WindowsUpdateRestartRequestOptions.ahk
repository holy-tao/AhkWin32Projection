#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IWindowsUpdateRestartRequestOptions.ahk
#Include .\IWindowsUpdateRestartRequestOptionsFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a property bag of fields that can be configured, and then passed to [RequestRestart](./windowsupdateadministrator_requestrestart_103435879.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.management.update.windowsupdaterestartrequestoptions
 * @namespace Windows.Management.Update
 * @version WindowsRuntime 1.4
 */
class WindowsUpdateRestartRequestOptions extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IWindowsUpdateRestartRequestOptions

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IWindowsUpdateRestartRequestOptions.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates a new instance of [WindowsUpdateRestartRequestOptions](./windowsupdaterestartrequestoptions.md), with all required properties set for use.
     * @param {HSTRING} title The title of the update.
     * @param {HSTRING} description Description metadata that gives more detailed information about an update.
     * @param {Uri} moreInfoUrl A URL that links to detailed information regarding the update.
     * @param {Integer} complianceDeadlineInDays Indicates the compliance deadline in days before a reboot must occur in order to complete the update.
     * @param {Integer} complianceGracePeriodInDays Indicates the compliance grace period in days before a reboot must occur in order to complete the update.
     * @returns {WindowsUpdateRestartRequestOptions} 
     * @see https://learn.microsoft.com/uwp/api/windows.management.update.windowsupdaterestartrequestoptions.#ctor
     */
    static CreateInstance(title, description, moreInfoUrl, complianceDeadlineInDays, complianceGracePeriodInDays) {
        if (!WindowsUpdateRestartRequestOptions.HasProp("__IWindowsUpdateRestartRequestOptionsFactory")) {
            activatableClassId := HSTRING.Create("Windows.Management.Update.WindowsUpdateRestartRequestOptions")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IWindowsUpdateRestartRequestOptionsFactory.IID)
            WindowsUpdateRestartRequestOptions.__IWindowsUpdateRestartRequestOptionsFactory := IWindowsUpdateRestartRequestOptionsFactory(factoryPtr)
        }

        return WindowsUpdateRestartRequestOptions.__IWindowsUpdateRestartRequestOptionsFactory.CreateInstance(title, description, moreInfoUrl, complianceDeadlineInDays, complianceGracePeriodInDays)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the title of the update.
     * @see https://learn.microsoft.com/uwp/api/windows.management.update.windowsupdaterestartrequestoptions.title
     * @type {HSTRING} 
     */
    Title {
        get => this.get_Title()
        set => this.put_Title(value)
    }

    /**
     * Gets or sets description metadata that gives more detailed information about an update.
     * @see https://learn.microsoft.com/uwp/api/windows.management.update.windowsupdaterestartrequestoptions.description
     * @type {HSTRING} 
     */
    Description {
        get => this.get_Description()
        set => this.put_Description(value)
    }

    /**
     * Gets or sets a URL that links to detailed information regarding the update.
     * @see https://learn.microsoft.com/uwp/api/windows.management.update.windowsupdaterestartrequestoptions.moreinfourl
     * @type {Uri} 
     */
    MoreInfoUrl {
        get => this.get_MoreInfoUrl()
        set => this.put_MoreInfoUrl(value)
    }

    /**
     * Gets or sets a value that indicates the compliance deadline in days before a reboot must occur in order to complete the update.
     * @remarks
     * The end user will have the number of days specified by **ComplianceDeadlineInDays** in which to take the reboot. The end user will then be forced to reboot after the number of days specified by **ComplianceGracePeriodInDays** have passed. Prior to this deadline being reached, the device will attempt to automatically restart overnight when the end user is away. That will happen if the Boolean value of `true` is specified for **OptOutOfAutoReboot**. If a Boolean value of `false` is specified, then the device will not automatically restart when the end user is away. The end user will see a variety of notifications asking them to "schedule the restart", "restart now", or "restart tonight", and they will become progressively more demanding in terms of notification language and frequency as they near the forced restart.
     * @see https://learn.microsoft.com/uwp/api/windows.management.update.windowsupdaterestartrequestoptions.compliancedeadlineindays
     * @type {Integer} 
     */
    ComplianceDeadlineInDays {
        get => this.get_ComplianceDeadlineInDays()
        set => this.put_ComplianceDeadlineInDays(value)
    }

    /**
     * Gets or sets a value indicating the compliance grace period in days before a reboot must occur in order to complete the update.
     * @remarks
     * The end user will have the number of days specified by **ComplianceDeadlineInDays** in which to take the reboot. The end user will then be forced to reboot after the number of days specified by **ComplianceGracePeriodInDays** have passed. Prior to this deadline being reached, the device will attempt to automatically restart overnight when the end user is away. That will happen if the Boolean value of `true` is specified for **OptOutOfAutoReboot**. If a Boolean value of `false` is specified, then the device will not automatically restart when the end user is away. The end user will see a variety of notifications asking them to "schedule the restart", "restart now", or "restart tonight", and they will become progressively more demanding in terms of notification language and frequency as they near the forced restart.
     * 
     * If an update doesn't require a reboot to complete, then this field will have no effect.
     * @see https://learn.microsoft.com/uwp/api/windows.management.update.windowsupdaterestartrequestoptions.compliancegraceperiodindays
     * @type {Integer} 
     */
    ComplianceGracePeriodInDays {
        get => this.get_ComplianceGracePeriodInDays()
        set => this.put_ComplianceGracePeriodInDays(value)
    }

    /**
     * Gets or sets a value indicating the organization name associated with the update restart request.
     * @remarks
     * The organization name provided will be used in any notifications associated with the pending restart. If the specified organization name is greater than 32 characters, then it won't be used in these notifications.
     * @see https://learn.microsoft.com/uwp/api/windows.management.update.windowsupdaterestartrequestoptions.organizationname
     * @type {HSTRING} 
     */
    OrganizationName {
        get => this.get_OrganizationName()
        set => this.put_OrganizationName(value)
    }

    /**
     * Gets or sets a value that indicates whether or not the update should opt out of the auto reboot flow.
     * @remarks
     * If this property value is `true`, then the device will attempt to automatically restart overnight when the end user is away.
     * 
     * If a Boolean value of `false` is specified, then the device won't automatically restart when the end user is away. The end user will see a variety of notifications asking them to "schedule the restart", "restart now", or "restart tonight", and they will become progressively more demanding in terms of notification language and frequency as they near the forced restart.
     * @see https://learn.microsoft.com/uwp/api/windows.management.update.windowsupdaterestartrequestoptions.optoutofautoreboot
     * @type {Boolean} 
     */
    OptOutOfAutoReboot {
        get => this.get_OptOutOfAutoReboot()
        set => this.put_OptOutOfAutoReboot(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Creates a new, generic, instance of [WindowsUpdateRestartRequestOptions](./windowsupdaterestartrequestoptions.md).
     * @remarks
     * Before you pass the object to [RequestRestart](./windowsupdateadministrator_requestrestart_103435879.md), you must configure [Title](./windowsupdaterestartrequestoptions_title.md), [Description](./windowsupdaterestartrequestoptions_description.md), [MoreInfoUrl](./windowsupdaterestartrequestoptions_moreinfourl.md), [ComplianceDeadlineInDays](./windowsupdaterestartrequestoptions_compliancedeadlineindays.md), and [ComplianceGracePeriodInDays](./windowsupdaterestartrequestoptions_compliancegraceperiodindays.md).
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Management.Update.WindowsUpdateRestartRequestOptions")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Title() {
        if (!this.HasProp("__IWindowsUpdateRestartRequestOptions")) {
            if ((queryResult := this.QueryInterface(IWindowsUpdateRestartRequestOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsUpdateRestartRequestOptions := IWindowsUpdateRestartRequestOptions(outPtr)
        }

        return this.__IWindowsUpdateRestartRequestOptions.get_Title()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Title(value) {
        if (!this.HasProp("__IWindowsUpdateRestartRequestOptions")) {
            if ((queryResult := this.QueryInterface(IWindowsUpdateRestartRequestOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsUpdateRestartRequestOptions := IWindowsUpdateRestartRequestOptions(outPtr)
        }

        return this.__IWindowsUpdateRestartRequestOptions.put_Title(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Description() {
        if (!this.HasProp("__IWindowsUpdateRestartRequestOptions")) {
            if ((queryResult := this.QueryInterface(IWindowsUpdateRestartRequestOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsUpdateRestartRequestOptions := IWindowsUpdateRestartRequestOptions(outPtr)
        }

        return this.__IWindowsUpdateRestartRequestOptions.get_Description()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Description(value) {
        if (!this.HasProp("__IWindowsUpdateRestartRequestOptions")) {
            if ((queryResult := this.QueryInterface(IWindowsUpdateRestartRequestOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsUpdateRestartRequestOptions := IWindowsUpdateRestartRequestOptions(outPtr)
        }

        return this.__IWindowsUpdateRestartRequestOptions.put_Description(value)
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_MoreInfoUrl() {
        if (!this.HasProp("__IWindowsUpdateRestartRequestOptions")) {
            if ((queryResult := this.QueryInterface(IWindowsUpdateRestartRequestOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsUpdateRestartRequestOptions := IWindowsUpdateRestartRequestOptions(outPtr)
        }

        return this.__IWindowsUpdateRestartRequestOptions.get_MoreInfoUrl()
    }

    /**
     * 
     * @param {Uri} value 
     * @returns {HRESULT} 
     */
    put_MoreInfoUrl(value) {
        if (!this.HasProp("__IWindowsUpdateRestartRequestOptions")) {
            if ((queryResult := this.QueryInterface(IWindowsUpdateRestartRequestOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsUpdateRestartRequestOptions := IWindowsUpdateRestartRequestOptions(outPtr)
        }

        return this.__IWindowsUpdateRestartRequestOptions.put_MoreInfoUrl(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ComplianceDeadlineInDays() {
        if (!this.HasProp("__IWindowsUpdateRestartRequestOptions")) {
            if ((queryResult := this.QueryInterface(IWindowsUpdateRestartRequestOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsUpdateRestartRequestOptions := IWindowsUpdateRestartRequestOptions(outPtr)
        }

        return this.__IWindowsUpdateRestartRequestOptions.get_ComplianceDeadlineInDays()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_ComplianceDeadlineInDays(value) {
        if (!this.HasProp("__IWindowsUpdateRestartRequestOptions")) {
            if ((queryResult := this.QueryInterface(IWindowsUpdateRestartRequestOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsUpdateRestartRequestOptions := IWindowsUpdateRestartRequestOptions(outPtr)
        }

        return this.__IWindowsUpdateRestartRequestOptions.put_ComplianceDeadlineInDays(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ComplianceGracePeriodInDays() {
        if (!this.HasProp("__IWindowsUpdateRestartRequestOptions")) {
            if ((queryResult := this.QueryInterface(IWindowsUpdateRestartRequestOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsUpdateRestartRequestOptions := IWindowsUpdateRestartRequestOptions(outPtr)
        }

        return this.__IWindowsUpdateRestartRequestOptions.get_ComplianceGracePeriodInDays()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_ComplianceGracePeriodInDays(value) {
        if (!this.HasProp("__IWindowsUpdateRestartRequestOptions")) {
            if ((queryResult := this.QueryInterface(IWindowsUpdateRestartRequestOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsUpdateRestartRequestOptions := IWindowsUpdateRestartRequestOptions(outPtr)
        }

        return this.__IWindowsUpdateRestartRequestOptions.put_ComplianceGracePeriodInDays(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_OrganizationName() {
        if (!this.HasProp("__IWindowsUpdateRestartRequestOptions")) {
            if ((queryResult := this.QueryInterface(IWindowsUpdateRestartRequestOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsUpdateRestartRequestOptions := IWindowsUpdateRestartRequestOptions(outPtr)
        }

        return this.__IWindowsUpdateRestartRequestOptions.get_OrganizationName()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_OrganizationName(value) {
        if (!this.HasProp("__IWindowsUpdateRestartRequestOptions")) {
            if ((queryResult := this.QueryInterface(IWindowsUpdateRestartRequestOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsUpdateRestartRequestOptions := IWindowsUpdateRestartRequestOptions(outPtr)
        }

        return this.__IWindowsUpdateRestartRequestOptions.put_OrganizationName(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_OptOutOfAutoReboot() {
        if (!this.HasProp("__IWindowsUpdateRestartRequestOptions")) {
            if ((queryResult := this.QueryInterface(IWindowsUpdateRestartRequestOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsUpdateRestartRequestOptions := IWindowsUpdateRestartRequestOptions(outPtr)
        }

        return this.__IWindowsUpdateRestartRequestOptions.get_OptOutOfAutoReboot()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_OptOutOfAutoReboot(value) {
        if (!this.HasProp("__IWindowsUpdateRestartRequestOptions")) {
            if ((queryResult := this.QueryInterface(IWindowsUpdateRestartRequestOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsUpdateRestartRequestOptions := IWindowsUpdateRestartRequestOptions(outPtr)
        }

        return this.__IWindowsUpdateRestartRequestOptions.put_OptOutOfAutoReboot(value)
    }

;@endregion Instance Methods
}
