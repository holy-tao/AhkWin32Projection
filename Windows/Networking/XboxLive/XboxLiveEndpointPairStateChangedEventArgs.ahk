#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IXboxLiveEndpointPairStateChangedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * An **XboxLiveEndpointPairStateChangedEventArgs** object encapsulates details about an **XboxLiveEndpointPair.StateChanged** event.
  * 
  * > [!IMPORTANT]
  * > This API is not available to all apps. Unless your developer account is specially provisioned by Microsoft, calls to these APIs will fail at runtime.
 * @remarks
 * You don't instantiate this class using a constructor. Instead, an instance is created and passed to your **XboxLiveEndpointPair.StateChanged** event handler when the event is raised.
 * @see https://learn.microsoft.com/uwp/api/windows.networking.xboxlive.xboxliveendpointpairstatechangedeventargs
 * @namespace Windows.Networking.XboxLive
 * @version WindowsRuntime 1.4
 */
class XboxLiveEndpointPairStateChangedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IXboxLiveEndpointPairStateChangedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IXboxLiveEndpointPairStateChangedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a **XboxLiveEndpointPairState** representing the state of the endpoint pair before it changed.
     * 
     * > [!IMPORTANT]
     * > This API is not available to all apps. Unless your developer account is specially provisioned by Microsoft, calls to these APIs will fail at runtime.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.xboxlive.xboxliveendpointpairstatechangedeventargs.oldstate
     * @type {Integer} 
     */
    OldState {
        get => this.get_OldState()
    }

    /**
     * Gets an **XboxLiveEndpointPairState** describing the state of the endpoint pair after the state change.
     * 
     * > [!IMPORTANT]
     * > This API is not available to all apps. Unless your developer account is specially provisioned by Microsoft, calls to these APIs will fail at runtime.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.xboxlive.xboxliveendpointpairstatechangedeventargs.newstate
     * @type {Integer} 
     */
    NewState {
        get => this.get_NewState()
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
    get_OldState() {
        if (!this.HasProp("__IXboxLiveEndpointPairStateChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(IXboxLiveEndpointPairStateChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXboxLiveEndpointPairStateChangedEventArgs := IXboxLiveEndpointPairStateChangedEventArgs(outPtr)
        }

        return this.__IXboxLiveEndpointPairStateChangedEventArgs.get_OldState()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_NewState() {
        if (!this.HasProp("__IXboxLiveEndpointPairStateChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(IXboxLiveEndpointPairStateChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IXboxLiveEndpointPairStateChangedEventArgs := IXboxLiveEndpointPairStateChangedEventArgs(outPtr)
        }

        return this.__IXboxLiveEndpointPairStateChangedEventArgs.get_NewState()
    }

;@endregion Instance Methods
}
