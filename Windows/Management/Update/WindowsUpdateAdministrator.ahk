#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IWindowsUpdateAdministrator.ahk
#Include .\IWindowsUpdateAdministratorStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Enables administration of Windows Updates on a device.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.management.update.windowsupdateadministrator
 * @namespace Windows.Management.Update
 * @version WindowsRuntime 1.4
 */
class WindowsUpdateAdministrator extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IWindowsUpdateAdministrator

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IWindowsUpdateAdministrator.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Retrieves the administrator object that is needed to call the various update administration APIs.
     * @remarks
     * This call will fail if:
     * 
     * * [RegisterForAdministration](./windowsupdateadministrator_registerforadministration_731932711.md) was not previously called to register a [WindowsUpdateAdministrator](./windowsupdateadministrator.md) on the device.
     * * The organizationName provided does not match the organizationName used when the [WindowsUpdateAdministrator](./windowsupdateadministrator.md) was registered.
     * @param {HSTRING} organizationName The organization name associated with the [WindowsUpdateAdministrator](./windowsupdateadministrator.md) registered to the device.
     * @returns {WindowsUpdateGetAdministratorResult} 
     * @see https://learn.microsoft.com/uwp/api/windows.management.update.windowsupdateadministrator.getregisteredadministrator
     */
    static GetRegisteredAdministrator(organizationName) {
        if (!WindowsUpdateAdministrator.HasProp("__IWindowsUpdateAdministratorStatics")) {
            activatableClassId := HSTRING.Create("Windows.Management.Update.WindowsUpdateAdministrator")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IWindowsUpdateAdministratorStatics.IID)
            WindowsUpdateAdministrator.__IWindowsUpdateAdministratorStatics := IWindowsUpdateAdministratorStatics(factoryPtr)
        }

        return WindowsUpdateAdministrator.__IWindowsUpdateAdministratorStatics.GetRegisteredAdministrator(organizationName)
    }

    /**
     * Registers a Windows update administrator on the device to allow fine-grained control of update activity.
     * @remarks
     * This registration must be performed from a SYSTEM or Administrator elevation on the device.
     * 
     * If there is already a Windows update administrator registered on the device, then this call will fail, because there can be only one active administrator at a time.
     * 
     * The organization name used at registration is required to acquire the **WindowsUpdateAdministrator** object via [GetRegisteredAdministrator](./windowsupdateadministrator_getregisteredadministrator_1823331721.md). It's also required in order to call [UnregisterForAdministration](./windowsupdateadministrator_unregisterforadministration_1234576495.md).
     * @param {HSTRING} organizationName The organization name associated with the update administrator.
     * @param {Integer} options A combination of [WindowsUpdateAdministratorOptions](./windowsupdateadministratoroptions.md) flags that determine which aspects the administrator requires explicit approval for.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.management.update.windowsupdateadministrator.registerforadministration
     */
    static RegisterForAdministration(organizationName, options) {
        if (!WindowsUpdateAdministrator.HasProp("__IWindowsUpdateAdministratorStatics")) {
            activatableClassId := HSTRING.Create("Windows.Management.Update.WindowsUpdateAdministrator")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IWindowsUpdateAdministratorStatics.IID)
            WindowsUpdateAdministrator.__IWindowsUpdateAdministratorStatics := IWindowsUpdateAdministratorStatics(factoryPtr)
        }

        return WindowsUpdateAdministrator.__IWindowsUpdateAdministratorStatics.RegisterForAdministration(organizationName, options)
    }

    /**
     * Unregisters a previously registered Windows update administrator on the device.
     * @remarks
     * The organization name provided must match the one provided when the Windows update administrator was registered using [RegisterForAdministration](./windowsupdateadministrator_registerforadministration_731932711.md).
     * @param {HSTRING} organizationName The organization name associated with the update administrator.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.management.update.windowsupdateadministrator.unregisterforadministration
     */
    static UnregisterForAdministration(organizationName) {
        if (!WindowsUpdateAdministrator.HasProp("__IWindowsUpdateAdministratorStatics")) {
            activatableClassId := HSTRING.Create("Windows.Management.Update.WindowsUpdateAdministrator")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IWindowsUpdateAdministratorStatics.IID)
            WindowsUpdateAdministrator.__IWindowsUpdateAdministratorStatics := IWindowsUpdateAdministratorStatics(factoryPtr)
        }

        return WindowsUpdateAdministrator.__IWindowsUpdateAdministratorStatics.UnregisterForAdministration(organizationName)
    }

    /**
     * Queries the organization name of the currently registered update administrator.
     * @remarks
     * If there is no registered update administrator on the device, then the call will return an empty string.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.management.update.windowsupdateadministrator.getregisteredadministratorname
     */
    static GetRegisteredAdministratorName() {
        if (!WindowsUpdateAdministrator.HasProp("__IWindowsUpdateAdministratorStatics")) {
            activatableClassId := HSTRING.Create("Windows.Management.Update.WindowsUpdateAdministrator")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IWindowsUpdateAdministratorStatics.IID)
            WindowsUpdateAdministrator.__IWindowsUpdateAdministratorStatics := IWindowsUpdateAdministratorStatics(factoryPtr)
        }

        return WindowsUpdateAdministrator.__IWindowsUpdateAdministratorStatics.GetRegisteredAdministratorName()
    }

    /**
     * Requests a restart that will allow the device to complete updates at a convenient time.
     * @remarks
     * This API creates a dummy update that is pending restart, so that it will be treated the same as an actual update that requires a restart.
     * 
     * The identifier returned from this API can be passed to [CancelRestartRequest](./windowsupdateadministrator_cancelrestartrequest_1241125889.md) in order to cancel a previously requested restart.
     * @param {WindowsUpdateRestartRequestOptions} restartOptions [WindowsUpdateRestartRequestOptions](./windowsupdaterestartrequestoptions.md) that specify details about the restart request.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.management.update.windowsupdateadministrator.requestrestart
     */
    static RequestRestart(restartOptions) {
        if (!WindowsUpdateAdministrator.HasProp("__IWindowsUpdateAdministratorStatics")) {
            activatableClassId := HSTRING.Create("Windows.Management.Update.WindowsUpdateAdministrator")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IWindowsUpdateAdministratorStatics.IID)
            WindowsUpdateAdministrator.__IWindowsUpdateAdministratorStatics := IWindowsUpdateAdministratorStatics(factoryPtr)
        }

        return WindowsUpdateAdministrator.__IWindowsUpdateAdministratorStatics.RequestRestart(restartOptions)
    }

    /**
     * Cancels a restart that was requested via [RequestRestart](./windowsupdateadministrator_requestrestart_103435879.md).
     * @remarks
     * The token required to cancel a restart request is returned by [RequestRestart](./windowsupdateadministrator_requestrestart_103435879.md).
     * @param {HSTRING} requestRestartToken The identifier associated with the previously requested restart.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.management.update.windowsupdateadministrator.cancelrestartrequest
     */
    static CancelRestartRequest(requestRestartToken) {
        if (!WindowsUpdateAdministrator.HasProp("__IWindowsUpdateAdministratorStatics")) {
            activatableClassId := HSTRING.Create("Windows.Management.Update.WindowsUpdateAdministrator")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IWindowsUpdateAdministratorStatics.IID)
            WindowsUpdateAdministrator.__IWindowsUpdateAdministratorStatics := IWindowsUpdateAdministratorStatics(factoryPtr)
        }

        return WindowsUpdateAdministrator.__IWindowsUpdateAdministratorStatics.CancelRestartRequest(requestRestartToken)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Starts a background scan for updates.
     * @remarks
     * This call is required for a scan to proceed if [RegisterForAdministration](./windowsupdateadministrator_registerforadministration_731932711.md) was called with the [RequireAdministratorApprovalForScans](./windowsupdateadministratoroptions.md) flag set.
     * 
     * This call will fail if:
     * 
     * * [RegisterForAdministration](./windowsupdateadministrator_registerforadministration_731932711.md) was not previously called to register a [WindowsUpdateAdministrator](./windowsupdateadministrator.md) on the device, this call will fail.
     * * The *updateId* provided doesn't match any updates found by a previous scan.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.management.update.windowsupdateadministrator.startadministratorscan
     */
    StartAdministratorScan() {
        if (!this.HasProp("__IWindowsUpdateAdministrator")) {
            if ((queryResult := this.QueryInterface(IWindowsUpdateAdministrator.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsUpdateAdministrator := IWindowsUpdateAdministrator(outPtr)
        }

        return this.__IWindowsUpdateAdministrator.StartAdministratorScan()
    }

    /**
     * Allows a [WindowsUpdateAdministrator](./windowsupdateadministrator.md) to mark an update action as approved.
     * @remarks
     * The update ID will generally be a GUID, but it can be any string that uniquely identifies it.
     * 
     * The action string will most commonly be "Download" or "Install". Other possible actions include "Uninstall", "Commit", and "PostReboot".
     * 
     * This call fails if the *updateId* provided doesn't match any updates found by a previous scan.
     * @param {HSTRING} updateId The unique ID associated with an update (in order to identify it).
     * @param {HSTRING} action The string associated with the action that the administrator wants to approve.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.management.update.windowsupdateadministrator.approvewindowsupdateaction
     */
    ApproveWindowsUpdateAction(updateId, action) {
        if (!this.HasProp("__IWindowsUpdateAdministrator")) {
            if ((queryResult := this.QueryInterface(IWindowsUpdateAdministrator.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsUpdateAdministrator := IWindowsUpdateAdministrator(outPtr)
        }

        return this.__IWindowsUpdateAdministrator.ApproveWindowsUpdateAction(updateId, action)
    }

    /**
     * Revokes approval for an update action previously approved via [ApproveWindowsUpdateAction](./windowsupdateadministrator_approvewindowsupdateaction_630494726.md).
     * @remarks
     * This call will fail in any of these cases:
     * 
     * * [RegisterForAdministration](./windowsupdateadministrator_registerforadministration_731932711.md) wasn't previously called to register a [WindowsUpdateAdministrator](./windowsupdateadministrator.md) on the device.
     * * the updateId/action combination provided doesn't match a previously approved update action.
     * @param {HSTRING} updateId The unique ID associated with an update (in order to identify it).
     * @param {HSTRING} action The string associated with the action that the administrator wants to approve.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.management.update.windowsupdateadministrator.revokewindowsupdateactionapproval
     */
    RevokeWindowsUpdateActionApproval(updateId, action) {
        if (!this.HasProp("__IWindowsUpdateAdministrator")) {
            if ((queryResult := this.QueryInterface(IWindowsUpdateAdministrator.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsUpdateAdministrator := IWindowsUpdateAdministrator(outPtr)
        }

        return this.__IWindowsUpdateAdministrator.RevokeWindowsUpdateActionApproval(updateId, action)
    }

    /**
     * Allows a [WindowsUpdateAdministrator](./windowsupdateadministrator.md) to mark an update as approved.
     * @remarks
     * The update ID will generally be a GUID, but it can be any string that uniquely identifies it.
     * 
     * This call fails if the *updateId* provided doesn't match any updates found by a previous scan.
     * @param {HSTRING} updateId The unique ID associated with an update (in order to identify it).
     * @param {WindowsUpdateApprovalData} approvalData A collection of additional properties that can change how an update is processed. For details, see [WindowsUpdateApprovalData](./windowsupdateapprovaldata.md).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.management.update.windowsupdateadministrator.approvewindowsupdate
     */
    ApproveWindowsUpdate(updateId, approvalData) {
        if (!this.HasProp("__IWindowsUpdateAdministrator")) {
            if ((queryResult := this.QueryInterface(IWindowsUpdateAdministrator.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsUpdateAdministrator := IWindowsUpdateAdministrator(outPtr)
        }

        return this.__IWindowsUpdateAdministrator.ApproveWindowsUpdate(updateId, approvalData)
    }

    /**
     * Revokes approval for an update action previously approved via [ApproveWindowsUpdate](./windowsupdateadministrator_approvewindowsupdate_1582950728.md).
     * @remarks
     * This call will fail in any of these cases:
     * 
     * * [RegisterForAdministration](./windowsupdateadministrator_registerforadministration_731932711.md) wasn't previously called to register a [WindowsUpdateAdministrator](./windowsupdateadministrator.md) on the device.
     * * The updateId provided doesn't match a previously approved update.
     * @param {HSTRING} updateId The unique ID associated with an update (in order to identify it).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.management.update.windowsupdateadministrator.revokewindowsupdateapproval
     */
    RevokeWindowsUpdateApproval(updateId) {
        if (!this.HasProp("__IWindowsUpdateAdministrator")) {
            if ((queryResult := this.QueryInterface(IWindowsUpdateAdministrator.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsUpdateAdministrator := IWindowsUpdateAdministrator(outPtr)
        }

        return this.__IWindowsUpdateAdministrator.RevokeWindowsUpdateApproval(updateId)
    }

    /**
     * Retrieves a list of all updates that are currently pending actions, and are known to the update administrator.
     * @remarks
     * The returned list is a superset of the updates that can be retrieved with [WindowsUpdateManager.GetApplicableUpdates](./windowsupdatemanager_getapplicableupdates_881665234.md), as it will include updates that have not yet been approved via [ApproveWindowsUpdate](./windowsupdateadministrator_approvewindowsupdate_1582950728.md).
     * @returns {IVectorView<WindowsUpdate>} 
     * @see https://learn.microsoft.com/uwp/api/windows.management.update.windowsupdateadministrator.getupdates
     */
    GetUpdates() {
        if (!this.HasProp("__IWindowsUpdateAdministrator")) {
            if ((queryResult := this.QueryInterface(IWindowsUpdateAdministrator.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowsUpdateAdministrator := IWindowsUpdateAdministrator(outPtr)
        }

        return this.__IWindowsUpdateAdministrator.GetUpdates()
    }

;@endregion Instance Methods
}
