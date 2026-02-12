#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPerformLocalActionRequestedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides data for the [PerformLocalActionRequested](/uwp/api/windows.system.remotedesktop.provider.remotedesktopconnectionremoteinfo.performlocalactionrequested) event.
  * 
  * > [!IMPORTANT]
  * > The **PerformLocalActionRequestedEventArgs** API is part of a Limited Access Feature (see [LimitedAccessFeatures class](/uwp/api/windows.applicationmodel.limitedaccessfeatures)). For more information or to request an unlock token, please use the [LAF Access Token Request Form](https://go.microsoft.com/fwlink/?linkid=2271232&clcid=0x409).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.system.remotedesktop.provider.performlocalactionrequestedeventargs
 * @namespace Windows.System.RemoteDesktop.Provider
 * @version WindowsRuntime 1.4
 */
class PerformLocalActionRequestedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPerformLocalActionRequestedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPerformLocalActionRequestedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the requested action associated with a [PerformLocalActionRequested](/uwp/api/windows.system.remotedesktop.provider.remotedesktopconnectionremoteinfo.performlocalactionrequested) event.
     * @see https://learn.microsoft.com/uwp/api/windows.system.remotedesktop.provider.performlocalactionrequestedeventargs.action
     * @type {Integer} 
     */
    Action {
        get => this.get_Action()
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
    get_Action() {
        if (!this.HasProp("__IPerformLocalActionRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(IPerformLocalActionRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPerformLocalActionRequestedEventArgs := IPerformLocalActionRequestedEventArgs(outPtr)
        }

        return this.__IPerformLocalActionRequestedEventArgs.get_Action()
    }

;@endregion Instance Methods
}
