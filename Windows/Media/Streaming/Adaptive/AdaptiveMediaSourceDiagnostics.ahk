#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAdaptiveMediaSourceDiagnostics.ahk
#Include ..\..\..\Foundation\TypedEventHandler.ahk
#Include .\AdaptiveMediaSourceDiagnostics.ahk
#Include .\AdaptiveMediaSourceDiagnosticAvailableEventArgs.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\..\WinRTEventHandler.ahk

/**
 * Provides an event that is raised when diagnostic information about the adaptive media source is available.
 * @remarks
 * Get an instance of this class by accessing the [Diagnostics](adaptivemediasource_diagnostics.md) property of an [AdaptiveMediaSource](adaptivemediasource.md).
 * 
 * The diagnostics provided by this class are not intended to be used to change the behavior of an app at runtime. Instead, these are provided to enable telemetry collection.
 * @see https://learn.microsoft.com/uwp/api/windows.media.streaming.adaptive.adaptivemediasourcediagnostics
 * @namespace Windows.Media.Streaming.Adaptive
 * @version WindowsRuntime 1.4
 */
class AdaptiveMediaSourceDiagnostics extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAdaptiveMediaSourceDiagnostics

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAdaptiveMediaSourceDiagnostics.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnDiagnosticAvailableToken")) {
            this.remove_DiagnosticAvailable(this.__OnDiagnosticAvailableToken)
            this.__OnDiagnosticAvailable.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @param {TypedEventHandler<AdaptiveMediaSourceDiagnostics, AdaptiveMediaSourceDiagnosticAvailableEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_DiagnosticAvailable(handler) {
        if (!this.HasProp("__IAdaptiveMediaSourceDiagnostics")) {
            if ((queryResult := this.QueryInterface(IAdaptiveMediaSourceDiagnostics.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAdaptiveMediaSourceDiagnostics := IAdaptiveMediaSourceDiagnostics(outPtr)
        }

        return this.__IAdaptiveMediaSourceDiagnostics.add_DiagnosticAvailable(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_DiagnosticAvailable(token) {
        if (!this.HasProp("__IAdaptiveMediaSourceDiagnostics")) {
            if ((queryResult := this.QueryInterface(IAdaptiveMediaSourceDiagnostics.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAdaptiveMediaSourceDiagnostics := IAdaptiveMediaSourceDiagnostics(outPtr)
        }

        return this.__IAdaptiveMediaSourceDiagnostics.remove_DiagnosticAvailable(token)
    }

;@endregion Instance Methods
}
