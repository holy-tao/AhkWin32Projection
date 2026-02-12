#Requires AutoHotkey v2.0 64-bit

#Include ..\Win32\System\WinRT\Apis.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAppResourceGroupInfoWatcherExecutionStateChangedEventArgs.ahk
#Include ..\..\Guid.ahk

/**
 * Provides info about the execution state of this resource group when the state changes.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.system.appresourcegroupinfowatcherexecutionstatechangedeventargs
 * @namespace Windows.System
 * @version WindowsRuntime 1.4
 */
class AppResourceGroupInfoWatcherExecutionStateChangedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAppResourceGroupInfoWatcherExecutionStateChangedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAppResourceGroupInfoWatcherExecutionStateChangedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets diagnostic info for the resource group.
     * @see https://learn.microsoft.com/uwp/api/windows.system.appresourcegroupinfowatcherexecutionstatechangedeventargs.appdiagnosticinfos
     * @type {IVectorView<AppDiagnosticInfo>} 
     */
    AppDiagnosticInfos {
        get => this.get_AppDiagnosticInfos()
    }

    /**
     * Gets diagnostic info, such as memory usage over time, energy use over time, and so on.
     * @see https://learn.microsoft.com/uwp/api/windows.system.appresourcegroupinfowatcherexecutionstatechangedeventargs.appresourcegroupinfo
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
        if (!this.HasProp("__IAppResourceGroupInfoWatcherExecutionStateChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(IAppResourceGroupInfoWatcherExecutionStateChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppResourceGroupInfoWatcherExecutionStateChangedEventArgs := IAppResourceGroupInfoWatcherExecutionStateChangedEventArgs(outPtr)
        }

        return this.__IAppResourceGroupInfoWatcherExecutionStateChangedEventArgs.get_AppDiagnosticInfos()
    }

    /**
     * 
     * @returns {AppResourceGroupInfo} 
     */
    get_AppResourceGroupInfo() {
        if (!this.HasProp("__IAppResourceGroupInfoWatcherExecutionStateChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(IAppResourceGroupInfoWatcherExecutionStateChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppResourceGroupInfoWatcherExecutionStateChangedEventArgs := IAppResourceGroupInfoWatcherExecutionStateChangedEventArgs(outPtr)
        }

        return this.__IAppResourceGroupInfoWatcherExecutionStateChangedEventArgs.get_AppResourceGroupInfo()
    }

;@endregion Instance Methods
}
