#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISystemUpdateManagerStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * The **SystemUpdateManager** allows interactive control of system updates.
 * @remarks
 * <img src="images/systemupdateflow.png" alt="SystemUpdateFlow" />
 * 
 * The system update process has the following states:
 * 
 * 1. Detect. Determine if any update packages are available.
 * 2. Download. Download the update packages from the server.
 * 3. Stage. Unpack the update packages and stage them to be committed later.
 * 4. Wait for reboot into the Update OS.  The Update OS shows gears on Windows 10 IoT Core while the OS changes are being committed.
 * 5. Commit.  Boot into the Update OS which shows gears while system update changes are committed.
 * 6. Reboot into updated Main OS.  At this point the update process is complete.
 * 
 * Installing an update package includes staging the update package by extracting the files and settings to a staging area, and then later committing the staged changes. Update packages cannot be rolled back on Windows 10 IoT Core once the commit phase begins.  Uncommitted update packages which have only been staged can be discarded if necessary by cancelling the update.  Once the commit process is started it cannot be interrupted.
 * 
 * The automatic update process is controlled by policy.  An OEM can control the policy through a policy manager like MDM, or DUC(Device Update Center).
 * 
 * Interactive update process sessions are controlled by the device user.  Policies that would defer the automatic update process may be overridden during an interactive update process session.  For example the user can scan for update packages, and download them with an interactive process session when an automatic update process session would be blocked from performing these actions by the current policies.  The interactive update process may also stage the update packages.  Staging update packages unpacks the packages and prepares the files and settings in the package to be committed.
 * 
 * Once the update packages are downloaded and staged, the interactive update process may be continued by the developer by rebooting into the Update OS and committing the update packages.  The Update OS is a very small OS that has the sole purpose of committing update packages.  On Windows 10 IoT Core the Update OS shows a screen with moving gears.  Rebooting into the Update OS can be done in response to user input or as part of the business logic of a single purpose device.  [RebootToCompleteInstall](systemupdatemanager_reboottocompleteinstall_1952341376.md) must be called to proceed to the Update OS.  Turning the power on and off, or using an alternate API to reboot the device will have no effect.  Alternatively the developer may choose to wait until the next scheduled automatic update process reboot window as configured by current policies (outside of active hours for example.)
 * @see https://learn.microsoft.com/uwp/api/windows.system.update.systemupdatemanager
 * @namespace Windows.System.Update
 * @version WindowsRuntime 1.4
 */
class SystemUpdateManager extends IInspectable {
;@region Static Properties
    /**
     * The current state of the **SystemUpdateManager**.
     * @see https://learn.microsoft.com/uwp/api/windows.system.update.systemupdatemanager.state
     * @type {Integer} 
     */
    static State {
        get => SystemUpdateManager.get_State()
    }

    /**
     * Download progress percentage.
     * @see https://learn.microsoft.com/uwp/api/windows.system.update.systemupdatemanager.downloadprogress
     * @type {Float} 
     */
    static DownloadProgress {
        get => SystemUpdateManager.get_DownloadProgress()
    }

    /**
     * Install progress percentage.
     * @see https://learn.microsoft.com/uwp/api/windows.system.update.systemupdatemanager.installprogress
     * @type {Float} 
     */
    static InstallProgress {
        get => SystemUpdateManager.get_InstallProgress()
    }

    /**
     * Gets the user active hours start time value.
     * @see https://learn.microsoft.com/uwp/api/windows.system.update.systemupdatemanager.useractivehoursstart
     * @type {TimeSpan} 
     */
    static UserActiveHoursStart {
        get => SystemUpdateManager.get_UserActiveHoursStart()
    }

    /**
     * Gets the user active hours end time value.
     * @see https://learn.microsoft.com/uwp/api/windows.system.update.systemupdatemanager.useractivehoursend
     * @type {TimeSpan} 
     */
    static UserActiveHoursEnd {
        get => SystemUpdateManager.get_UserActiveHoursEnd()
    }

    /**
     * Gets the maximum interval allowed between **UserActiveHoursStart** and **UserActiveHoursEnd** in hours.
     * @see https://learn.microsoft.com/uwp/api/windows.system.update.systemupdatemanager.useractivehoursmax
     * @type {Integer} 
     */
    static UserActiveHoursMax {
        get => SystemUpdateManager.get_UserActiveHoursMax()
    }

    /**
     * Time of last check for updates.
     * @see https://learn.microsoft.com/uwp/api/windows.system.update.systemupdatemanager.lastupdatechecktime
     * @type {DateTime} 
     */
    static LastUpdateCheckTime {
        get => SystemUpdateManager.get_LastUpdateCheckTime()
    }

    /**
     * Time of last update install.
     * @see https://learn.microsoft.com/uwp/api/windows.system.update.systemupdatemanager.lastupdateinstalltime
     * @type {DateTime} 
     */
    static LastUpdateInstallTime {
        get => SystemUpdateManager.get_LastUpdateInstallTime()
    }

    /**
     * Information about the last failed system update.
     * @see https://learn.microsoft.com/uwp/api/windows.system.update.systemupdatemanager.lasterrorinfo
     * @type {SystemUpdateLastErrorInfo} 
     */
    static LastErrorInfo {
        get => SystemUpdateManager.get_LastErrorInfo()
    }

    /**
     * Extended error information if available.
     * @remarks
     * If an error occurs, then the extended error can be retrieved through this property even if an exception is not thrown.
     * @see https://learn.microsoft.com/uwp/api/windows.system.update.systemupdatemanager.extendederror
     * @type {HRESULT} 
     */
    static ExtendedError {
        get => SystemUpdateManager.get_ExtendedError()
    }

    /**
     * Reason why user attention is required.
     * @see https://learn.microsoft.com/uwp/api/windows.system.update.systemupdatemanager.attentionrequiredreason
     * @type {Integer} 
     */
    static AttentionRequiredReason {
        get => SystemUpdateManager.get_AttentionRequiredReason()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * Indicates whether this API is supported on this device.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.update.systemupdatemanager.issupported
     */
    static IsSupported() {
        if (!SystemUpdateManager.HasProp("__ISystemUpdateManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.Update.SystemUpdateManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISystemUpdateManagerStatics.IID)
            SystemUpdateManager.__ISystemUpdateManagerStatics := ISystemUpdateManagerStatics(factoryPtr)
        }

        return SystemUpdateManager.__ISystemUpdateManagerStatics.IsSupported()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_State() {
        if (!SystemUpdateManager.HasProp("__ISystemUpdateManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.Update.SystemUpdateManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISystemUpdateManagerStatics.IID)
            SystemUpdateManager.__ISystemUpdateManagerStatics := ISystemUpdateManagerStatics(factoryPtr)
        }

        return SystemUpdateManager.__ISystemUpdateManagerStatics.get_State()
    }

    /**
     * 
     * @param {EventHandler<IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    static add_StateChanged(handler) {
        if (!SystemUpdateManager.HasProp("__ISystemUpdateManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.Update.SystemUpdateManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISystemUpdateManagerStatics.IID)
            SystemUpdateManager.__ISystemUpdateManagerStatics := ISystemUpdateManagerStatics(factoryPtr)
        }

        return SystemUpdateManager.__ISystemUpdateManagerStatics.add_StateChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    static remove_StateChanged(token) {
        if (!SystemUpdateManager.HasProp("__ISystemUpdateManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.Update.SystemUpdateManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISystemUpdateManagerStatics.IID)
            SystemUpdateManager.__ISystemUpdateManagerStatics := ISystemUpdateManagerStatics(factoryPtr)
        }

        return SystemUpdateManager.__ISystemUpdateManagerStatics.remove_StateChanged(token)
    }

    /**
     * 
     * @returns {Float} 
     */
    static get_DownloadProgress() {
        if (!SystemUpdateManager.HasProp("__ISystemUpdateManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.Update.SystemUpdateManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISystemUpdateManagerStatics.IID)
            SystemUpdateManager.__ISystemUpdateManagerStatics := ISystemUpdateManagerStatics(factoryPtr)
        }

        return SystemUpdateManager.__ISystemUpdateManagerStatics.get_DownloadProgress()
    }

    /**
     * 
     * @returns {Float} 
     */
    static get_InstallProgress() {
        if (!SystemUpdateManager.HasProp("__ISystemUpdateManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.Update.SystemUpdateManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISystemUpdateManagerStatics.IID)
            SystemUpdateManager.__ISystemUpdateManagerStatics := ISystemUpdateManagerStatics(factoryPtr)
        }

        return SystemUpdateManager.__ISystemUpdateManagerStatics.get_InstallProgress()
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    static get_UserActiveHoursStart() {
        if (!SystemUpdateManager.HasProp("__ISystemUpdateManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.Update.SystemUpdateManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISystemUpdateManagerStatics.IID)
            SystemUpdateManager.__ISystemUpdateManagerStatics := ISystemUpdateManagerStatics(factoryPtr)
        }

        return SystemUpdateManager.__ISystemUpdateManagerStatics.get_UserActiveHoursStart()
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    static get_UserActiveHoursEnd() {
        if (!SystemUpdateManager.HasProp("__ISystemUpdateManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.Update.SystemUpdateManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISystemUpdateManagerStatics.IID)
            SystemUpdateManager.__ISystemUpdateManagerStatics := ISystemUpdateManagerStatics(factoryPtr)
        }

        return SystemUpdateManager.__ISystemUpdateManagerStatics.get_UserActiveHoursEnd()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_UserActiveHoursMax() {
        if (!SystemUpdateManager.HasProp("__ISystemUpdateManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.Update.SystemUpdateManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISystemUpdateManagerStatics.IID)
            SystemUpdateManager.__ISystemUpdateManagerStatics := ISystemUpdateManagerStatics(factoryPtr)
        }

        return SystemUpdateManager.__ISystemUpdateManagerStatics.get_UserActiveHoursMax()
    }

    /**
     * Try to set the user defined Active Hours during which automatic reboots for update will not be allowed.
     * @remarks
     * The maximum number of hours allowed between start time and end time can be retrieved using [Windows.System.Update.SystemUpdateManager.UserActiveHoursMax](systemupdatemanager_useractivehoursstart.md)
     * @param {TimeSpan} start Start time of active hours.
     * @param {TimeSpan} end End time of active hours.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.update.systemupdatemanager.trysetuseractivehours
     */
    static TrySetUserActiveHours(start, end) {
        if (!SystemUpdateManager.HasProp("__ISystemUpdateManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.Update.SystemUpdateManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISystemUpdateManagerStatics.IID)
            SystemUpdateManager.__ISystemUpdateManagerStatics := ISystemUpdateManagerStatics(factoryPtr)
        }

        return SystemUpdateManager.__ISystemUpdateManagerStatics.TrySetUserActiveHours(start, end)
    }

    /**
     * 
     * @returns {DateTime} 
     */
    static get_LastUpdateCheckTime() {
        if (!SystemUpdateManager.HasProp("__ISystemUpdateManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.Update.SystemUpdateManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISystemUpdateManagerStatics.IID)
            SystemUpdateManager.__ISystemUpdateManagerStatics := ISystemUpdateManagerStatics(factoryPtr)
        }

        return SystemUpdateManager.__ISystemUpdateManagerStatics.get_LastUpdateCheckTime()
    }

    /**
     * 
     * @returns {DateTime} 
     */
    static get_LastUpdateInstallTime() {
        if (!SystemUpdateManager.HasProp("__ISystemUpdateManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.Update.SystemUpdateManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISystemUpdateManagerStatics.IID)
            SystemUpdateManager.__ISystemUpdateManagerStatics := ISystemUpdateManagerStatics(factoryPtr)
        }

        return SystemUpdateManager.__ISystemUpdateManagerStatics.get_LastUpdateInstallTime()
    }

    /**
     * 
     * @returns {SystemUpdateLastErrorInfo} 
     */
    static get_LastErrorInfo() {
        if (!SystemUpdateManager.HasProp("__ISystemUpdateManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.Update.SystemUpdateManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISystemUpdateManagerStatics.IID)
            SystemUpdateManager.__ISystemUpdateManagerStatics := ISystemUpdateManagerStatics(factoryPtr)
        }

        return SystemUpdateManager.__ISystemUpdateManagerStatics.get_LastErrorInfo()
    }

    /**
     * Get the IDs of automatic reboot block requests.
     * @returns {IVectorView<HSTRING>} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.update.systemupdatemanager.getautomaticrebootblockids
     */
    static GetAutomaticRebootBlockIds() {
        if (!SystemUpdateManager.HasProp("__ISystemUpdateManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.Update.SystemUpdateManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISystemUpdateManagerStatics.IID)
            SystemUpdateManager.__ISystemUpdateManagerStatics := ISystemUpdateManagerStatics(factoryPtr)
        }

        return SystemUpdateManager.__ISystemUpdateManagerStatics.GetAutomaticRebootBlockIds()
    }

    /**
     * Block automatic reboots for update until UnblockAutomaticRebootAsync is called or until reboot is enforced by system policy.
     * @param {HSTRING} lockId Identifier consisting of A-Z,a-z,0-9.  Use Guid.NewGuid.ToString() to generate a new random id.
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.update.systemupdatemanager.blockautomaticrebootasync
     */
    static BlockAutomaticRebootAsync(lockId) {
        if (!SystemUpdateManager.HasProp("__ISystemUpdateManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.Update.SystemUpdateManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISystemUpdateManagerStatics.IID)
            SystemUpdateManager.__ISystemUpdateManagerStatics := ISystemUpdateManagerStatics(factoryPtr)
        }

        return SystemUpdateManager.__ISystemUpdateManagerStatics.BlockAutomaticRebootAsync(lockId)
    }

    /**
     * Unblock automatic update reboots, if blocked.
     * @param {HSTRING} lockId Identifier consisting of A-Z,a-z,0-9.  Use Guid.NewGuid.ToString() to generate a new random id. Must match the value passed into [BlockAutomaticRebootAsync](systemupdatemanager_blockautomaticrebootasync_2067935084.md).
     * @returns {IAsyncOperation<Boolean>} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.update.systemupdatemanager.unblockautomaticrebootasync
     */
    static UnblockAutomaticRebootAsync(lockId) {
        if (!SystemUpdateManager.HasProp("__ISystemUpdateManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.Update.SystemUpdateManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISystemUpdateManagerStatics.IID)
            SystemUpdateManager.__ISystemUpdateManagerStatics := ISystemUpdateManagerStatics(factoryPtr)
        }

        return SystemUpdateManager.__ISystemUpdateManagerStatics.UnblockAutomaticRebootAsync(lockId)
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    static get_ExtendedError() {
        if (!SystemUpdateManager.HasProp("__ISystemUpdateManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.Update.SystemUpdateManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISystemUpdateManagerStatics.IID)
            SystemUpdateManager.__ISystemUpdateManagerStatics := ISystemUpdateManagerStatics(factoryPtr)
        }

        return SystemUpdateManager.__ISystemUpdateManagerStatics.get_ExtendedError()
    }

    /**
     * Get list of pending update items.
     * @returns {IVectorView<SystemUpdateItem>} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.update.systemupdatemanager.getupdateitems
     */
    static GetUpdateItems() {
        if (!SystemUpdateManager.HasProp("__ISystemUpdateManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.Update.SystemUpdateManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISystemUpdateManagerStatics.IID)
            SystemUpdateManager.__ISystemUpdateManagerStatics := ISystemUpdateManagerStatics(factoryPtr)
        }

        return SystemUpdateManager.__ISystemUpdateManagerStatics.GetUpdateItems()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_AttentionRequiredReason() {
        if (!SystemUpdateManager.HasProp("__ISystemUpdateManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.Update.SystemUpdateManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISystemUpdateManagerStatics.IID)
            SystemUpdateManager.__ISystemUpdateManagerStatics := ISystemUpdateManagerStatics(factoryPtr)
        }

        return SystemUpdateManager.__ISystemUpdateManagerStatics.get_AttentionRequiredReason()
    }

    /**
     * Sets the flight ring.
     * @param {HSTRING} flightRing 
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.update.systemupdatemanager.setflightring
     */
    static SetFlightRing(flightRing) {
        if (!SystemUpdateManager.HasProp("__ISystemUpdateManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.Update.SystemUpdateManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISystemUpdateManagerStatics.IID)
            SystemUpdateManager.__ISystemUpdateManagerStatics := ISystemUpdateManagerStatics(factoryPtr)
        }

        return SystemUpdateManager.__ISystemUpdateManagerStatics.SetFlightRing(flightRing)
    }

    /**
     * Get the flight ring.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.update.systemupdatemanager.getflightring
     */
    static GetFlightRing() {
        if (!SystemUpdateManager.HasProp("__ISystemUpdateManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.Update.SystemUpdateManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISystemUpdateManagerStatics.IID)
            SystemUpdateManager.__ISystemUpdateManagerStatics := ISystemUpdateManagerStatics(factoryPtr)
        }

        return SystemUpdateManager.__ISystemUpdateManagerStatics.GetFlightRing()
    }

    /**
     * Start the detection, downloading, and installation of pending updates.
     * @param {Integer} action See [SystemUpdateStartInstallAction](systemupdatestartinstallaction.md)
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.update.systemupdatemanager.startinstall
     */
    static StartInstall(action) {
        if (!SystemUpdateManager.HasProp("__ISystemUpdateManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.Update.SystemUpdateManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISystemUpdateManagerStatics.IID)
            SystemUpdateManager.__ISystemUpdateManagerStatics := ISystemUpdateManagerStatics(factoryPtr)
        }

        return SystemUpdateManager.__ISystemUpdateManagerStatics.StartInstall(action)
    }

    /**
     * Reboots the device to complete the install, if a reboot is required.
     * @remarks
     * A normal reboot is not sufficient to complete the installation.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.update.systemupdatemanager.reboottocompleteinstall
     */
    static RebootToCompleteInstall() {
        if (!SystemUpdateManager.HasProp("__ISystemUpdateManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.Update.SystemUpdateManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISystemUpdateManagerStatics.IID)
            SystemUpdateManager.__ISystemUpdateManagerStatics := ISystemUpdateManagerStatics(factoryPtr)
        }

        return SystemUpdateManager.__ISystemUpdateManagerStatics.RebootToCompleteInstall()
    }

    /**
     * Start cancelling updates if any updates are in progress.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.update.systemupdatemanager.startcancelupdates
     */
    static StartCancelUpdates() {
        if (!SystemUpdateManager.HasProp("__ISystemUpdateManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.Update.SystemUpdateManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISystemUpdateManagerStatics.IID)
            SystemUpdateManager.__ISystemUpdateManagerStatics := ISystemUpdateManagerStatics(factoryPtr)
        }

        return SystemUpdateManager.__ISystemUpdateManagerStatics.StartCancelUpdates()
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
