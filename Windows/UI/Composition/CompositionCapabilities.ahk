#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ICompositionCapabilities.ahk
#Include .\ICompositionCapabilitiesStatics.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\CompositionCapabilities.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Provides the ability to check system hardware capabilities so that Visual Layer Effects may be scaled accordingly. This allows you to ensure that your application's use of rendering-intensive operations is tailored to match the device's capabilities, providing optimum performance and pleasant visual results.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositioncapabilities
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class CompositionCapabilities extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICompositionCapabilities

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICompositionCapabilities.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Gets the supported composition capabilities for the current view.
     * @returns {CompositionCapabilities} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositioncapabilities.getforcurrentview
     */
    static GetForCurrentView() {
        if (!CompositionCapabilities.HasProp("__ICompositionCapabilitiesStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Composition.CompositionCapabilities")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICompositionCapabilitiesStatics.IID)
            CompositionCapabilities.__ICompositionCapabilitiesStatics := ICompositionCapabilitiesStatics(factoryPtr)
        }

        return CompositionCapabilities.__ICompositionCapabilitiesStatics.GetForCurrentView()
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnChangedToken")) {
            this.remove_Changed(this.__OnChangedToken)
            this.__OnChanged.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * Indicates whether effects are supported.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositioncapabilities.areeffectssupported
     */
    AreEffectsSupported() {
        if (!this.HasProp("__ICompositionCapabilities")) {
            if ((queryResult := this.QueryInterface(ICompositionCapabilities.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionCapabilities := ICompositionCapabilities(outPtr)
        }

        return this.__ICompositionCapabilities.AreEffectsSupported()
    }

    /**
     * Indicates whether fast effects are supported.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositioncapabilities.areeffectsfast
     */
    AreEffectsFast() {
        if (!this.HasProp("__ICompositionCapabilities")) {
            if ((queryResult := this.QueryInterface(ICompositionCapabilities.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionCapabilities := ICompositionCapabilities(outPtr)
        }

        return this.__ICompositionCapabilities.AreEffectsFast()
    }

    /**
     * 
     * @param {TypedEventHandler<CompositionCapabilities, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Changed(handler) {
        if (!this.HasProp("__ICompositionCapabilities")) {
            if ((queryResult := this.QueryInterface(ICompositionCapabilities.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionCapabilities := ICompositionCapabilities(outPtr)
        }

        return this.__ICompositionCapabilities.add_Changed(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Changed(token) {
        if (!this.HasProp("__ICompositionCapabilities")) {
            if ((queryResult := this.QueryInterface(ICompositionCapabilities.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionCapabilities := ICompositionCapabilities(outPtr)
        }

        return this.__ICompositionCapabilities.remove_Changed(token)
    }

;@endregion Instance Methods
}
