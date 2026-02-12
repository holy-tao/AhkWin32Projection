#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IBackgroundExecutionManagerStatics3.ahk
#Include .\IBackgroundExecutionManagerStatics2.ahk
#Include .\IBackgroundExecutionManagerStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Manage permission to run background tasks.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.backgroundexecutionmanager
 * @namespace Windows.ApplicationModel.Background
 * @version WindowsRuntime 1.4
 */
class BackgroundExecutionManager extends IInspectable {
;@region Static Methods
    /**
     * Requests user consent to allow the app to perform the specified level of background activity in the background while the device is in connected standby mode. On the Desktop OS Edition this may present a prompt to the user for their consent.
     * @param {Integer} requestedAccess A value from the [BackgroundAccessRequestKind](backgroundaccessrequestkind.md) enumeration specifying the requested type of background access.
     * @param {HSTRING} reason The string to display in the prompt that the system will raise to the user to describe why the app is requesting to run in the background. For example, the string that appears after "The app says:"
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.backgroundexecutionmanager.requestaccesskindformodernstandbyasync
     */
    static RequestAccessKindForModernStandbyAsync(requestedAccess, reason) {
        if (!BackgroundExecutionManager.HasProp("__IBackgroundExecutionManagerStatics3")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Background.BackgroundExecutionManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBackgroundExecutionManagerStatics3.IID)
            BackgroundExecutionManager.__IBackgroundExecutionManagerStatics3 := IBackgroundExecutionManagerStatics3(factoryPtr)
        }

        return BackgroundExecutionManager.__IBackgroundExecutionManagerStatics3.RequestAccessKindForModernStandbyAsync(requestedAccess, reason)
    }

    /**
     * Retreives a value that indicates the specified app's background task execution capability while the device is in connected standby mode.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.backgroundexecutionmanager.getaccessstatusformodernstandby
     */
    static GetAccessStatusForModernStandby() {
        if (!BackgroundExecutionManager.HasProp("__IBackgroundExecutionManagerStatics3")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Background.BackgroundExecutionManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBackgroundExecutionManagerStatics3.IID)
            BackgroundExecutionManager.__IBackgroundExecutionManagerStatics3 := IBackgroundExecutionManagerStatics3(factoryPtr)
        }

        return BackgroundExecutionManager.__IBackgroundExecutionManagerStatics3.GetAccessStatusForModernStandby()
    }

    /**
     * Gets a value that indicates the calling app's background task execution capability while the device is in connected standby mode.
     * @param {HSTRING} applicationId 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.backgroundexecutionmanager.getaccessstatusformodernstandby
     */
    static GetAccessStatusForModernStandbyForApplication(applicationId) {
        if (!BackgroundExecutionManager.HasProp("__IBackgroundExecutionManagerStatics3")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Background.BackgroundExecutionManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBackgroundExecutionManagerStatics3.IID)
            BackgroundExecutionManager.__IBackgroundExecutionManagerStatics3 := IBackgroundExecutionManagerStatics3(factoryPtr)
        }

        return BackgroundExecutionManager.__IBackgroundExecutionManagerStatics3.GetAccessStatusForModernStandbyForApplication(applicationId)
    }

    /**
     * Prompts the user whether they consent to allow the app to perform the specified level of background activity in the background. On the Desktop OS Edition this may present a prompt to the user for their consent.
     * @param {Integer} requestedAccess The type of background activity the app wishes to perform.
     * @param {HSTRING} reason The string to display in the prompt that the system will raise to the user to describe why the app is requesting to run in the background. For example, the string that appears after "The app says:"
     * 
     * ![Prompt to run in the background](images/BackgroundPrompt.png)
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.backgroundexecutionmanager.requestaccesskindasync
     */
    static RequestAccessKindAsync(requestedAccess, reason) {
        if (!BackgroundExecutionManager.HasProp("__IBackgroundExecutionManagerStatics2")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Background.BackgroundExecutionManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBackgroundExecutionManagerStatics2.IID)
            BackgroundExecutionManager.__IBackgroundExecutionManagerStatics2 := IBackgroundExecutionManagerStatics2(factoryPtr)
        }

        return BackgroundExecutionManager.__IBackgroundExecutionManagerStatics2.RequestAccessKindAsync(requestedAccess, reason)
    }

    /**
     * Asynchronously requests that the app be permitted to run background tasks.
     * @remarks
     * | Version | Behavior |
     * |---|---|
     * | Windows 8/Windows 8.1 | Prompts the user with a dialog box that requests that an app be added to the lock screen. Must be called before registering any background tasks. |
     * | Windows Phone 8.1 | Does not prompt the user, but must be called before registering any background tasks. |
     * | Windows 10 | Does not prompt the user, but must be called before registering any background tasks. You do not need to add the app to the lock screen in order to use background tasks in Windows 10, but you still need to call this method, or  [RequestAccessAsync](/uwp/api/windows.applicationmodel.background.backgroundexecutionmanager.RequestAccessAsync), to request background access. |
     * 
     * > [!TIP]
     * > Starting with Windows 10, it is no longer necessary to call this method from the UI thread.
     * @returns {IAsyncOperation<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.backgroundexecutionmanager.requestaccessasync
     */
    static RequestAccessAsync() {
        if (!BackgroundExecutionManager.HasProp("__IBackgroundExecutionManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Background.BackgroundExecutionManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBackgroundExecutionManagerStatics.IID)
            BackgroundExecutionManager.__IBackgroundExecutionManagerStatics := IBackgroundExecutionManagerStatics(factoryPtr)
        }

        return BackgroundExecutionManager.__IBackgroundExecutionManagerStatics.RequestAccessAsync()
    }

    /**
     * Requests that the app be permitted to run background tasks.
     * @remarks
     * <table>
     *    <tr><td>Version</td><td>Behavior</td></tr>
     *    <tr><td>Windows 8/Windows 8.1</td><td>Prompts the user with a dialog box that requests that an app be added to the lock screen. Must be called before registering any background tasks.</td></tr>
     *    <tr><td>Windows Phone 8.1</td><td>Does not prompt the user, but must be called before registering any background tasks.</td></tr>
     *    <tr><td>Windows 10</td><td>Does not prompt the user, but must be called before registering any background tasks. You do not need to add the app to the lock screen in order to use background tasks in Windows 10, but you still need to call this method to request background access.</td></tr>
     * </table>
     * 
     * > [!TIP]
     * > Starting with Windows 10, it is no longer necessary to call this method from the UI thread.
     * @param {HSTRING} applicationId 
     * @returns {IAsyncOperation<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.backgroundexecutionmanager.requestaccessasync
     */
    static RequestAccessForApplicationAsync(applicationId) {
        if (!BackgroundExecutionManager.HasProp("__IBackgroundExecutionManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Background.BackgroundExecutionManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBackgroundExecutionManagerStatics.IID)
            BackgroundExecutionManager.__IBackgroundExecutionManagerStatics := IBackgroundExecutionManagerStatics(factoryPtr)
        }

        return BackgroundExecutionManager.__IBackgroundExecutionManagerStatics.RequestAccessForApplicationAsync(applicationId)
    }

    /**
     * Removes the calling app from the list of apps that may run background tasks.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.backgroundexecutionmanager.removeaccess
     */
    static RemoveAccess() {
        if (!BackgroundExecutionManager.HasProp("__IBackgroundExecutionManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Background.BackgroundExecutionManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBackgroundExecutionManagerStatics.IID)
            BackgroundExecutionManager.__IBackgroundExecutionManagerStatics := IBackgroundExecutionManagerStatics(factoryPtr)
        }

        return BackgroundExecutionManager.__IBackgroundExecutionManagerStatics.RemoveAccess()
    }

    /**
     * Removes a specific app from the list of apps that may run background tasks.
     * @param {HSTRING} applicationId The package-relative application identifier (PRAID) of the app to be removed from the list of apps that may run background tasks. The specified app must be in the same package as the calling app. For more info on the PRAID, see the **Id** attribute of the [Application](/uwp/schemas/appxpackage/appxmanifestschema/element-application#attributes-and-elements) element.
     * 
     * If you are hosting background task(s) in an out-of-process COM server, separate from your main application, then pass as the argument for `applicationId` the PRAID of the application that defines the `windows.backgroundTask` extension in its own package manifest.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.backgroundexecutionmanager.removeaccess
     */
    static RemoveAccessForApplication(applicationId) {
        if (!BackgroundExecutionManager.HasProp("__IBackgroundExecutionManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Background.BackgroundExecutionManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBackgroundExecutionManagerStatics.IID)
            BackgroundExecutionManager.__IBackgroundExecutionManagerStatics := IBackgroundExecutionManagerStatics(factoryPtr)
        }

        return BackgroundExecutionManager.__IBackgroundExecutionManagerStatics.RemoveAccessForApplication(applicationId)
    }

    /**
     * Gets the specified app's background task execution capability.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.backgroundexecutionmanager.getaccessstatus
     */
    static GetAccessStatus() {
        if (!BackgroundExecutionManager.HasProp("__IBackgroundExecutionManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Background.BackgroundExecutionManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBackgroundExecutionManagerStatics.IID)
            BackgroundExecutionManager.__IBackgroundExecutionManagerStatics := IBackgroundExecutionManagerStatics(factoryPtr)
        }

        return BackgroundExecutionManager.__IBackgroundExecutionManagerStatics.GetAccessStatus()
    }

    /**
     * Gets the app's background task execution capability.
     * @param {HSTRING} applicationId 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.backgroundexecutionmanager.getaccessstatus
     */
    static GetAccessStatusForApplication(applicationId) {
        if (!BackgroundExecutionManager.HasProp("__IBackgroundExecutionManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.ApplicationModel.Background.BackgroundExecutionManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBackgroundExecutionManagerStatics.IID)
            BackgroundExecutionManager.__IBackgroundExecutionManagerStatics := IBackgroundExecutionManagerStatics(factoryPtr)
        }

        return BackgroundExecutionManager.__IBackgroundExecutionManagerStatics.GetAccessStatusForApplication(applicationId)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
