#Requires AutoHotkey v2.0 64-bit

#Include ..\Win32\System\WinRT\Apis.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAppResourceGroupInfoWatcherEventArgs.ahk
#Include ..\..\Guid.ahk

/**
 * Provides information about app resource groups.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.system.appresourcegroupinfowatchereventargs
 * @namespace Windows.System
 * @version WindowsRuntime 1.4
 */
class AppResourceGroupInfoWatcherEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAppResourceGroupInfoWatcherEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAppResourceGroupInfoWatcherEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets diagnostic info for the resource group.
     * @remarks
     * Typically there will only be one app associated with the  **AppResourceGroupInfo**, but there can be more.
     * @see https://learn.microsoft.com/uwp/api/windows.system.appresourcegroupinfowatchereventargs.appdiagnosticinfos
     * @type {IVectorView<AppDiagnosticInfo>} 
     */
    AppDiagnosticInfos {
        get => this.get_AppDiagnosticInfos()
    }

    /**
     * Gets diagnostic info, such as memory usage, and energy use.
     * @see https://learn.microsoft.com/uwp/api/windows.system.appresourcegroupinfowatchereventargs.appresourcegroupinfo
     * @type {AppResourceGroupInfo} 
     */
    AppResourceGroupInfo {
        get => this.get_AppResourceGroupInfo()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {IVectorView<AppDiagnosticInfo>} 
     */
    get_AppDiagnosticInfos() {
        if (!this.HasProp("__IAppResourceGroupInfoWatcherEventArgs")) {
            if ((queryResult := this.QueryInterface(IAppResourceGroupInfoWatcherEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppResourceGroupInfoWatcherEventArgs := IAppResourceGroupInfoWatcherEventArgs(outPtr)
        }

        return this.__IAppResourceGroupInfoWatcherEventArgs.get_AppDiagnosticInfos()
    }

    /**
     * 
     * @returns {AppResourceGroupInfo} 
     */
    get_AppResourceGroupInfo() {
        if (!this.HasProp("__IAppResourceGroupInfoWatcherEventArgs")) {
            if ((queryResult := this.QueryInterface(IAppResourceGroupInfoWatcherEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppResourceGroupInfoWatcherEventArgs := IAppResourceGroupInfoWatcherEventArgs(outPtr)
        }

        return this.__IAppResourceGroupInfoWatcherEventArgs.get_AppResourceGroupInfo()
    }

;@endregion Instance Methods
}
