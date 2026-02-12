#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IConnectedAnimationService.ahk
#Include .\IConnectedAnimationServiceStatics.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Represents a service that provides properties and methods to display a [ConnectedAnimation](connectedanimation.md).
 * @remarks
 * To get an instance of ConnectedAnimationService, call the static [GetForCurrentView](connectedanimationservice_getforcurrentview_1363600702.md) method.
 * 
 * When you call [PrepareToAnimate](connectedanimationservice_preparetoanimate_910589761.md), you supply a key to associate with the newly created [ConnectedAnimation](connectedanimation.md) returned by the method. You can later use this key to retrieve the same animation by calling [GetAnimation](connectedanimationservice_getanimation_1121981282.md). This lets you connect the animation between two different pages without having to manually pass the reference to the [ConnectedAnimation](connectedanimation.md) object between pages.
 * 
 * See the [Connected animation sample](https://github.com/microsoft/WindowsCompositionSamples/tree/master/SampleGallery/Samples/SDK%2014393/ConnectedAnimationSample) for a complete example of ConnectedAnimationService.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.connectedanimationservice
 * @namespace Windows.UI.Xaml.Media.Animation
 * @version WindowsRuntime 1.4
 */
class ConnectedAnimationService extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IConnectedAnimationService

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IConnectedAnimationService.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Returns an instance of [ConnectedAnimationService](connectedanimationservice.md) for the current view.
     * @returns {ConnectedAnimationService} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.connectedanimationservice.getforcurrentview
     */
    static GetForCurrentView() {
        if (!ConnectedAnimationService.HasProp("__IConnectedAnimationServiceStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Animation.ConnectedAnimationService")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IConnectedAnimationServiceStatics.IID)
            ConnectedAnimationService.__IConnectedAnimationServiceStatics := IConnectedAnimationServiceStatics(factoryPtr)
        }

        return ConnectedAnimationService.__IConnectedAnimationServiceStatics.GetForCurrentView()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the default time that the animation runs.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.connectedanimationservice.defaultduration
     * @type {TimeSpan} 
     */
    DefaultDuration {
        get => this.get_DefaultDuration()
        set => this.put_DefaultDuration(value)
    }

    /**
     * Gets or sets the default [CompositionEasingFunction](../windows.ui.composition/compositioneasingfunction.md) used by the animation.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.connectedanimationservice.defaulteasingfunction
     * @type {CompositionEasingFunction} 
     */
    DefaultEasingFunction {
        get => this.get_DefaultEasingFunction()
        set => this.put_DefaultEasingFunction(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_DefaultDuration() {
        if (!this.HasProp("__IConnectedAnimationService")) {
            if ((queryResult := this.QueryInterface(IConnectedAnimationService.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IConnectedAnimationService := IConnectedAnimationService(outPtr)
        }

        return this.__IConnectedAnimationService.get_DefaultDuration()
    }

    /**
     * 
     * @param {TimeSpan} value 
     * @returns {HRESULT} 
     */
    put_DefaultDuration(value) {
        if (!this.HasProp("__IConnectedAnimationService")) {
            if ((queryResult := this.QueryInterface(IConnectedAnimationService.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IConnectedAnimationService := IConnectedAnimationService(outPtr)
        }

        return this.__IConnectedAnimationService.put_DefaultDuration(value)
    }

    /**
     * 
     * @returns {CompositionEasingFunction} 
     */
    get_DefaultEasingFunction() {
        if (!this.HasProp("__IConnectedAnimationService")) {
            if ((queryResult := this.QueryInterface(IConnectedAnimationService.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IConnectedAnimationService := IConnectedAnimationService(outPtr)
        }

        return this.__IConnectedAnimationService.get_DefaultEasingFunction()
    }

    /**
     * 
     * @param {CompositionEasingFunction} value 
     * @returns {HRESULT} 
     */
    put_DefaultEasingFunction(value) {
        if (!this.HasProp("__IConnectedAnimationService")) {
            if ((queryResult := this.QueryInterface(IConnectedAnimationService.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IConnectedAnimationService := IConnectedAnimationService(outPtr)
        }

        return this.__IConnectedAnimationService.put_DefaultEasingFunction(value)
    }

    /**
     * Returns a connected animation that's associated with the specified key and source element.
     * @remarks
     * When you call PrepareToAnimate, you supply a key to associate with the newly created [ConnectedAnimation](connectedanimation.md) returned by the method. You can later use this key to retrieve the same animation by calling [GetAnimation](connectedanimationservice_getanimation_1121981282.md). This lets you connect the animation between two different pages without having to manually pass the reference to the [ConnectedAnimation](connectedanimation.md) object between pages.
     * @param {HSTRING} key The key for the animation.
     * @param {UIElement} source The element that is animated out of view.
     * @returns {ConnectedAnimation} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.connectedanimationservice.preparetoanimate
     */
    PrepareToAnimate(key, source) {
        if (!this.HasProp("__IConnectedAnimationService")) {
            if ((queryResult := this.QueryInterface(IConnectedAnimationService.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IConnectedAnimationService := IConnectedAnimationService(outPtr)
        }

        return this.__IConnectedAnimationService.PrepareToAnimate(key, source)
    }

    /**
     * Returns the animation with the specified key.
     * @remarks
     * A [ConnectedAnimation](connectedanimation.md) is no longer active when:
     * + It has been canceled.
     * + The animation has completed.
     * + The source has expired ([PrepareToAnimate](connectedanimationservice_preparetoanimate_910589761.md) was called and then the animation was not started for ~2 seconds).
     * @param {HSTRING} key The key for the animation.
     * @returns {ConnectedAnimation} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.connectedanimationservice.getanimation
     */
    GetAnimation(key) {
        if (!this.HasProp("__IConnectedAnimationService")) {
            if ((queryResult := this.QueryInterface(IConnectedAnimationService.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IConnectedAnimationService := IConnectedAnimationService(outPtr)
        }

        return this.__IConnectedAnimationService.GetAnimation(key)
    }

;@endregion Instance Methods
}
