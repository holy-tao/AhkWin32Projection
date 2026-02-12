#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAppInstallStatus.ahk
#Include .\IAppInstallStatus2.ahk
#Include .\IAppInstallStatus3.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Describes the status of an app that is in the installation queue.
 * @remarks
 * To retrieve an instance of this class, use the [GetCurrentStatus](appinstallitem_getcurrentstatus_1536936899.md) method of the [AppInstallItem](appinstallitem.md) class.
 * 
 * > [!IMPORTANT]
 * > Access to this API is protected by a private capability that is restricted to apps that are developed by Microsoft.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.preview.installcontrol.appinstallstatus
 * @namespace Windows.ApplicationModel.Store.Preview.InstallControl
 * @version WindowsRuntime 1.4
 */
class AppInstallStatus extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAppInstallStatus

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAppInstallStatus.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the installation state of the current app.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.preview.installcontrol.appinstallstatus.installstate
     * @type {Integer} 
     */
    InstallState {
        get => this.get_InstallState()
    }

    /**
     * Gets the download size in bytes for the current app.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.preview.installcontrol.appinstallstatus.downloadsizeinbytes
     * @type {Integer} 
     */
    DownloadSizeInBytes {
        get => this.get_DownloadSizeInBytes()
    }

    /**
     * Gets the number of bytes that have been downloaded for the current app.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.preview.installcontrol.appinstallstatus.bytesdownloaded
     * @type {Integer} 
     */
    BytesDownloaded {
        get => this.get_BytesDownloaded()
    }

    /**
     * Gets the completion percentage for the installation of the current app.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.preview.installcontrol.appinstallstatus.percentcomplete
     * @type {Float} 
     */
    PercentComplete {
        get => this.get_PercentComplete()
    }

    /**
     * Gets the error code for an app that has encountered an installation failure.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.preview.installcontrol.appinstallstatus.errorcode
     * @type {HRESULT} 
     */
    ErrorCode {
        get => this.get_ErrorCode()
    }

    /**
     * Gets an object that identifies the user for which the app is being installed.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.preview.installcontrol.appinstallstatus.user
     * @type {User} 
     */
    User {
        get => this.get_User()
    }

    /**
     * Gets a value that indicates whether the app can be launched, even if the app has not yet finished installing.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.preview.installcontrol.appinstallstatus.readyforlaunch
     * @type {Boolean} 
     */
    ReadyForLaunch {
        get => this.get_ReadyForLaunch()
    }

    /**
     * Gets a value that indicates whether an app restart is pending.
     * @remarks
     * If this property is **True** and the [InstallState](appinstallstatus_installstate.md) property has the value **Error**, this means that the pending restart is being blocked because the app is currently in use.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.store.preview.installcontrol.appinstallstatus.isstaged
     * @type {Boolean} 
     */
    IsStaged {
        get => this.get_IsStaged()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_InstallState() {
        if (!this.HasProp("__IAppInstallStatus")) {
            if ((queryResult := this.QueryInterface(IAppInstallStatus.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppInstallStatus := IAppInstallStatus(outPtr)
        }

        return this.__IAppInstallStatus.get_InstallState()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DownloadSizeInBytes() {
        if (!this.HasProp("__IAppInstallStatus")) {
            if ((queryResult := this.QueryInterface(IAppInstallStatus.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppInstallStatus := IAppInstallStatus(outPtr)
        }

        return this.__IAppInstallStatus.get_DownloadSizeInBytes()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_BytesDownloaded() {
        if (!this.HasProp("__IAppInstallStatus")) {
            if ((queryResult := this.QueryInterface(IAppInstallStatus.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppInstallStatus := IAppInstallStatus(outPtr)
        }

        return this.__IAppInstallStatus.get_BytesDownloaded()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_PercentComplete() {
        if (!this.HasProp("__IAppInstallStatus")) {
            if ((queryResult := this.QueryInterface(IAppInstallStatus.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppInstallStatus := IAppInstallStatus(outPtr)
        }

        return this.__IAppInstallStatus.get_PercentComplete()
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    get_ErrorCode() {
        if (!this.HasProp("__IAppInstallStatus")) {
            if ((queryResult := this.QueryInterface(IAppInstallStatus.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppInstallStatus := IAppInstallStatus(outPtr)
        }

        return this.__IAppInstallStatus.get_ErrorCode()
    }

    /**
     * 
     * @returns {User} 
     */
    get_User() {
        if (!this.HasProp("__IAppInstallStatus2")) {
            if ((queryResult := this.QueryInterface(IAppInstallStatus2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppInstallStatus2 := IAppInstallStatus2(outPtr)
        }

        return this.__IAppInstallStatus2.get_User()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_ReadyForLaunch() {
        if (!this.HasProp("__IAppInstallStatus2")) {
            if ((queryResult := this.QueryInterface(IAppInstallStatus2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppInstallStatus2 := IAppInstallStatus2(outPtr)
        }

        return this.__IAppInstallStatus2.get_ReadyForLaunch()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsStaged() {
        if (!this.HasProp("__IAppInstallStatus3")) {
            if ((queryResult := this.QueryInterface(IAppInstallStatus3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppInstallStatus3 := IAppInstallStatus3(outPtr)
        }

        return this.__IAppInstallStatus3.get_IsStaged()
    }

;@endregion Instance Methods
}
