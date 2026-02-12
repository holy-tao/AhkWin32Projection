#Requires AutoHotkey v2.0 64-bit

#Include ..\Win32\System\WinRT\Apis.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk
#Include .\IRemoteLauncherStatics.ahk
#Include ..\..\Guid.ahk

/**
 * Starts the default app associated with the specified URI on a remote device.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.system.remotelauncher
 * @namespace Windows.System
 * @version WindowsRuntime 1.4
 */
class RemoteLauncher extends IInspectable {
;@region Static Methods
    /**
     * Starts the default app associated with the URI scheme name for the specified URI on a remote device, using the specified options.
     * @param {RemoteSystemConnectionRequest} remoteSystemConnectionRequest_ Specifies the remote system (device) to connect to.
     * @param {Uri} uri_ The Uri scheme.
     * @returns {IAsyncOperation<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.remotelauncher.launchuriasync
     */
    static LaunchUriAsync(remoteSystemConnectionRequest_, uri_) {
        if (!RemoteLauncher.HasProp("__IRemoteLauncherStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.RemoteLauncher")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRemoteLauncherStatics.IID)
            RemoteLauncher.__IRemoteLauncherStatics := IRemoteLauncherStatics(factoryPtr)
        }

        return RemoteLauncher.__IRemoteLauncherStatics.LaunchUriAsync(remoteSystemConnectionRequest_, uri_)
    }

    /**
     * Starts the default app associated with the URI scheme name for the specified URI on a remote device, using the specified options and input data.
     * @param {RemoteSystemConnectionRequest} remoteSystemConnectionRequest_ Specifies the remote system (device) to connect to.
     * @param {Uri} uri_ The Uri scheme.
     * @param {RemoteLauncherOptions} options The launch options for the app.
     * @returns {IAsyncOperation<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.remotelauncher.launchuriasync
     */
    static LaunchUriWithOptionsAsync(remoteSystemConnectionRequest_, uri_, options) {
        if (!RemoteLauncher.HasProp("__IRemoteLauncherStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.RemoteLauncher")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRemoteLauncherStatics.IID)
            RemoteLauncher.__IRemoteLauncherStatics := IRemoteLauncherStatics(factoryPtr)
        }

        return RemoteLauncher.__IRemoteLauncherStatics.LaunchUriWithOptionsAsync(remoteSystemConnectionRequest_, uri_, options)
    }

    /**
     * Starts the default app associated with the URI scheme name for the specified URI on a remote device.
     * @param {RemoteSystemConnectionRequest} remoteSystemConnectionRequest_ Specifies the remote system (device) to connect to.
     * @param {Uri} uri_ The URI scheme.
     * @param {RemoteLauncherOptions} options 
     * @param {ValueSet} inputData 
     * @returns {IAsyncOperation<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.remotelauncher.launchuriasync
     */
    static LaunchUriWithDataAsync(remoteSystemConnectionRequest_, uri_, options, inputData) {
        if (!RemoteLauncher.HasProp("__IRemoteLauncherStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.RemoteLauncher")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRemoteLauncherStatics.IID)
            RemoteLauncher.__IRemoteLauncherStatics := IRemoteLauncherStatics(factoryPtr)
        }

        return RemoteLauncher.__IRemoteLauncherStatics.LaunchUriWithDataAsync(remoteSystemConnectionRequest_, uri_, options, inputData)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
