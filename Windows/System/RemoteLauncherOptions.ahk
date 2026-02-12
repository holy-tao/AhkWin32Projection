#Requires AutoHotkey v2.0 64-bit

#Include ..\Win32\System\WinRT\Apis.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk
#Include .\IRemoteLauncherOptions.ahk
#Include ..\..\Guid.ahk

/**
 * Specifies the options used to launch the default app for URI on a remote device.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.system.remotelauncheroptions
 * @namespace Windows.System
 * @version WindowsRuntime 1.4
 */
class RemoteLauncherOptions extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IRemoteLauncherOptions

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IRemoteLauncherOptions.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Specifies the URI of the web site to view if the app to handle the URI can't be launched on the remote device.
     * @see https://learn.microsoft.com/uwp/api/windows.system.remotelauncheroptions.fallbackuri
     * @type {Uri} 
     */
    FallbackUri {
        get => this.get_FallbackUri()
        set => this.put_FallbackUri(value)
    }

    /**
     * A list of package family names that should be used to launch the URI on the remote device. The first one in the list should be the preferred application to launch on the remote system (device).
     * @remarks
     * A list is provided because the package family name to use on a remote device may differ from device to device.
     * @see https://learn.microsoft.com/uwp/api/windows.system.remotelauncheroptions.preferredappids
     * @type {IVector<HSTRING>} 
     */
    PreferredAppIds {
        get => this.get_PreferredAppIds()
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Creates an instance of the [RemoteLauncherOptions](remotelauncheroptions.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.System.RemoteLauncherOptions")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_FallbackUri() {
        if (!this.HasProp("__IRemoteLauncherOptions")) {
            if ((queryResult := this.QueryInterface(IRemoteLauncherOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRemoteLauncherOptions := IRemoteLauncherOptions(outPtr)
        }

        return this.__IRemoteLauncherOptions.get_FallbackUri()
    }

    /**
     * 
     * @param {Uri} value 
     * @returns {HRESULT} 
     */
    put_FallbackUri(value) {
        if (!this.HasProp("__IRemoteLauncherOptions")) {
            if ((queryResult := this.QueryInterface(IRemoteLauncherOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRemoteLauncherOptions := IRemoteLauncherOptions(outPtr)
        }

        return this.__IRemoteLauncherOptions.put_FallbackUri(value)
    }

    /**
     * 
     * @returns {IVector<HSTRING>} 
     */
    get_PreferredAppIds() {
        if (!this.HasProp("__IRemoteLauncherOptions")) {
            if ((queryResult := this.QueryInterface(IRemoteLauncherOptions.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRemoteLauncherOptions := IRemoteLauncherOptions(outPtr)
        }

        return this.__IRemoteLauncherOptions.get_PreferredAppIds()
    }

;@endregion Instance Methods
}
