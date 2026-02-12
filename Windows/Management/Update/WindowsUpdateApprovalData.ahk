#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IWindowsUpdateApprovalData.ahk
#Include ..\..\..\Guid.ahk

/**
 * Allows additional metadata to be configured on an update when approving it via [ApproveWindowsUpdate](./windowsupdateadministrator_approvewindowsupdate_1582950728.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.management.update.windowsupdateapprovaldata
 * @namespace Windows.Management.Update
 * @version WindowsRuntime 1.4
 */
class WindowsUpdateApprovalData extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IWindowsUpdateApprovalData

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IWindowsUpdateApprovalData.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets a value indicating whether an update should be treated as seeker.
     * @remarks
     * When an update is seeker, it won't be surfaced in the normal list of applicable updates, and will require explicit user interaction in order to proceed.
     * @see https://learn.microsoft.com/uwp/api/windows.management.update.windowsupdateapprovaldata.seeker
     * @type {IReference<Boolean>} 
     */
    Seeker {
        get => this.get_Seeker()
        set => this.put_Seeker(value)
    }

    /**
     * Gets or sets a value indicating whether the update is permitted to download over a metered network connection.
     * @see https://learn.microsoft.com/uwp/api/windows.management.update.windowsupdateapprovaldata.allowdownloadonmetered
     * @type {IReference<Boolean>} 
     */
    AllowDownloadOnMetered {
        get => this.get_AllowDownloadOnMetered()
        set => this.put_AllowDownloadOnMetered(value)
    }

    /**
     * Gets or sets a value indicating the compliance deadline in days before a reboot must occur in order to complete the update.
     * @remarks
     * The end user will have the number of days specified by **ComplianceDeadlineInDays** in which to take the reboot. The end user will then be forced to reboot after the number of days specified by **ComplianceGracePeriodInDays** have passed. Prior to this deadline being reached, the device will attempt to automatically restart overnight when the end user is away. That will happen if the Boolean value of `true` is specified for **OptOutOfAutoReboot**. If a Boolean value of `false` is specified, then the device will not automatically restart when the end user is away. The end user will see a variety of notifications asking them to "schedule the restart", "restart now", or "restart tonight", and they will become progressively more demanding in terms of notification language and frequency as they near the forced restart.
     * 
     * If an update doesn't require a reboot to complete, then this field will have no effect.
     * @see https://learn.microsoft.com/uwp/api/windows.management.update.windowsupdateapprovaldata.compliancedeadlineindays
     * @type {IReference<Integer>} 
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
     * @see https://learn.microsoft.com/uwp/api/windows.management.update.windowsupdateapprovaldata.compliancegraceperiodindays
     * @type {IReference<Integer>} 
     */
    ComplianceGracePeriodInDays {
        get => this.get_ComplianceGracePeriodInDays()
        set => this.put_ComplianceGracePeriodInDays(value)
    }

    /**
     * Gets or sets a value indicating whether the update should opt out of the auto reboot flow.
     * @remarks
     * If this property value is `true`, then the device will attempt to automatically restart overnight when the end user is away.
     * 
     * If a Boolean value of `false` is specified, then the device won't automatically restart when the end user is away. The end user will see a variety of notifications asking them to "schedule the restart", "restart now", or "restart tonight", and they will become progressively more demanding in terms of notification language and frequency as they near the forced restart.
     * @see https://learn.microsoft.com/uwp/api/windows.management.update.windowsupdateapprovaldata.optoutofautoreboot
     * @type {IReference<Boolean>} 
     */
    OptOutOfAutoReboot {
        get => this.get_OptOutOfAutoReboot()
        set => this.put_OptOutOfAutoReboot(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Constructs a new **WindowsUpdateApprovalData** instance with all underlying properties set to default values.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Management.Update.WindowsUpdateApprovalData")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {IReference<Boolean>} 
     */
    get_Seeker() {
        if (!this.HasProp("__IWindowsUpdateApprovalData")) {
            if ((queryResult := this.QueryInterface(IWindowsUpdateApprovalData.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsUpdateApprovalData := IWindowsUpdateApprovalData(outPtr)
        }

        return this.__IWindowsUpdateApprovalData.get_Seeker()
    }

    /**
     * 
     * @param {IReference<Boolean>} value 
     * @returns {HRESULT} 
     */
    put_Seeker(value) {
        if (!this.HasProp("__IWindowsUpdateApprovalData")) {
            if ((queryResult := this.QueryInterface(IWindowsUpdateApprovalData.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsUpdateApprovalData := IWindowsUpdateApprovalData(outPtr)
        }

        return this.__IWindowsUpdateApprovalData.put_Seeker(value)
    }

    /**
     * 
     * @returns {IReference<Boolean>} 
     */
    get_AllowDownloadOnMetered() {
        if (!this.HasProp("__IWindowsUpdateApprovalData")) {
            if ((queryResult := this.QueryInterface(IWindowsUpdateApprovalData.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsUpdateApprovalData := IWindowsUpdateApprovalData(outPtr)
        }

        return this.__IWindowsUpdateApprovalData.get_AllowDownloadOnMetered()
    }

    /**
     * 
     * @param {IReference<Boolean>} value 
     * @returns {HRESULT} 
     */
    put_AllowDownloadOnMetered(value) {
        if (!this.HasProp("__IWindowsUpdateApprovalData")) {
            if ((queryResult := this.QueryInterface(IWindowsUpdateApprovalData.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsUpdateApprovalData := IWindowsUpdateApprovalData(outPtr)
        }

        return this.__IWindowsUpdateApprovalData.put_AllowDownloadOnMetered(value)
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_ComplianceDeadlineInDays() {
        if (!this.HasProp("__IWindowsUpdateApprovalData")) {
            if ((queryResult := this.QueryInterface(IWindowsUpdateApprovalData.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsUpdateApprovalData := IWindowsUpdateApprovalData(outPtr)
        }

        return this.__IWindowsUpdateApprovalData.get_ComplianceDeadlineInDays()
    }

    /**
     * 
     * @param {IReference<Integer>} value 
     * @returns {HRESULT} 
     */
    put_ComplianceDeadlineInDays(value) {
        if (!this.HasProp("__IWindowsUpdateApprovalData")) {
            if ((queryResult := this.QueryInterface(IWindowsUpdateApprovalData.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsUpdateApprovalData := IWindowsUpdateApprovalData(outPtr)
        }

        return this.__IWindowsUpdateApprovalData.put_ComplianceDeadlineInDays(value)
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_ComplianceGracePeriodInDays() {
        if (!this.HasProp("__IWindowsUpdateApprovalData")) {
            if ((queryResult := this.QueryInterface(IWindowsUpdateApprovalData.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsUpdateApprovalData := IWindowsUpdateApprovalData(outPtr)
        }

        return this.__IWindowsUpdateApprovalData.get_ComplianceGracePeriodInDays()
    }

    /**
     * 
     * @param {IReference<Integer>} value 
     * @returns {HRESULT} 
     */
    put_ComplianceGracePeriodInDays(value) {
        if (!this.HasProp("__IWindowsUpdateApprovalData")) {
            if ((queryResult := this.QueryInterface(IWindowsUpdateApprovalData.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsUpdateApprovalData := IWindowsUpdateApprovalData(outPtr)
        }

        return this.__IWindowsUpdateApprovalData.put_ComplianceGracePeriodInDays(value)
    }

    /**
     * 
     * @returns {IReference<Boolean>} 
     */
    get_OptOutOfAutoReboot() {
        if (!this.HasProp("__IWindowsUpdateApprovalData")) {
            if ((queryResult := this.QueryInterface(IWindowsUpdateApprovalData.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsUpdateApprovalData := IWindowsUpdateApprovalData(outPtr)
        }

        return this.__IWindowsUpdateApprovalData.get_OptOutOfAutoReboot()
    }

    /**
     * 
     * @param {IReference<Boolean>} value 
     * @returns {HRESULT} 
     */
    put_OptOutOfAutoReboot(value) {
        if (!this.HasProp("__IWindowsUpdateApprovalData")) {
            if ((queryResult := this.QueryInterface(IWindowsUpdateApprovalData.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsUpdateApprovalData := IWindowsUpdateApprovalData(outPtr)
        }

        return this.__IWindowsUpdateApprovalData.put_OptOutOfAutoReboot(value)
    }

;@endregion Instance Methods
}
