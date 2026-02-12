#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IConnectedAnimation.ahk
#Include .\IConnectedAnimation2.ahk
#Include .\IConnectedAnimation3.ahk
#Include ..\..\..\..\Foundation\TypedEventHandler.ahk
#Include .\ConnectedAnimation.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\..\WinRTEventHandler.ahk

/**
 * Represents an animation that simultaneously animates the exit of one element and the entrance of another element.
 * @remarks
 * A ConnectedAnimation instance is returned by the [ConnectedAnimationService.GetAnimation](connectedanimationservice_getanimation_1121981282.md) and [ConnectedAnimationService.PrepareToAnimate](connectedanimationservice_preparetoanimate_910589761.md) methods.
 * 
 * When you call [TryStart](connectedanimation_trystart_323048605.md), the element you pass into the method should have its size defined in layout. This means that either the size of the element should be set in markup, or the content of the element should be fully populated, so that its size can be calculated by the XAML framework. If the layout is part of a [ListView](../windows.ui.xaml.controls/listview.md) or [GridView](../windows.ui.xaml.controls/gridview.md) item with bound properties, you might have to manually update the content to prepare for the animation because bindings can be updated asynchronously.
 * 
 * There is a known limitation where ConnectedAnimation does not work well with theme transitions that have a translation component, including [NavigationThemeTransition](navigationthemetransition.md) and [EntranceThemeTransition](entrancethemetransition.md). We recommend that you remove these transitions, or suppress the navigation using [SuppressNavigationTransitionInfo](suppressnavigationtransitioninfo.md), when you create an experience with ConnectedAnimation.
 * 
 * See the [Connected animation sample](https://github.com/microsoft/WindowsCompositionSamples/tree/master/SampleGallery/Samples/SDK%2014393/ConnectedAnimationSample) for a complete example of ConnectedAnimation.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.connectedanimation
 * @namespace Windows.UI.Xaml.Media.Animation
 * @version WindowsRuntime 1.4
 */
class ConnectedAnimation extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IConnectedAnimation

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IConnectedAnimation.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets a value that indicates whether the scale component of the connected animation should be used.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.connectedanimation.isscaleanimationenabled
     * @type {Boolean} 
     */
    IsScaleAnimationEnabled {
        get => this.get_IsScaleAnimationEnabled()
        set => this.put_IsScaleAnimationEnabled(value)
    }

    /**
     * Gets or sets the configuration that describes the type of connected animation to play.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.connectedanimation.configuration
     * @type {ConnectedAnimationConfiguration} 
     */
    Configuration {
        get => this.get_Configuration()
        set => this.put_Configuration(value)
    }

    /**
     * Occurs when the animation is finished.
     * @type {TypedEventHandler<ConnectedAnimation, IInspectable>}
    */
    OnCompleted {
        get {
            if(!this.HasProp("__OnCompleted")){
                this.__OnCompleted := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{44caa9ea-7598-517a-b78e-abd20d93d587}"),
                    ConnectedAnimation,
                    IInspectable
                )
                this.__OnCompletedToken := this.add_Completed(this.__OnCompleted.iface)
            }
            return this.__OnCompleted
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnCompletedToken")) {
            this.remove_Completed(this.__OnCompletedToken)
            this.__OnCompleted.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @param {TypedEventHandler<ConnectedAnimation, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Completed(handler) {
        if (!this.HasProp("__IConnectedAnimation")) {
            if ((queryResult := this.QueryInterface(IConnectedAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IConnectedAnimation := IConnectedAnimation(outPtr)
        }

        return this.__IConnectedAnimation.add_Completed(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Completed(token) {
        if (!this.HasProp("__IConnectedAnimation")) {
            if ((queryResult := this.QueryInterface(IConnectedAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IConnectedAnimation := IConnectedAnimation(outPtr)
        }

        return this.__IConnectedAnimation.remove_Completed(token)
    }

    /**
     * Attempts to start the animation on the destination element and specified secondary elements.
     * @param {UIElement} destination The element that is animated into view.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.connectedanimation.trystart
     */
    TryStart(destination) {
        if (!this.HasProp("__IConnectedAnimation")) {
            if ((queryResult := this.QueryInterface(IConnectedAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IConnectedAnimation := IConnectedAnimation(outPtr)
        }

        return this.__IConnectedAnimation.TryStart(destination)
    }

    /**
     * Stops the connected animation.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.connectedanimation.cancel
     */
    Cancel() {
        if (!this.HasProp("__IConnectedAnimation")) {
            if ((queryResult := this.QueryInterface(IConnectedAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IConnectedAnimation := IConnectedAnimation(outPtr)
        }

        return this.__IConnectedAnimation.Cancel()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsScaleAnimationEnabled() {
        if (!this.HasProp("__IConnectedAnimation2")) {
            if ((queryResult := this.QueryInterface(IConnectedAnimation2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IConnectedAnimation2 := IConnectedAnimation2(outPtr)
        }

        return this.__IConnectedAnimation2.get_IsScaleAnimationEnabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsScaleAnimationEnabled(value) {
        if (!this.HasProp("__IConnectedAnimation2")) {
            if ((queryResult := this.QueryInterface(IConnectedAnimation2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IConnectedAnimation2 := IConnectedAnimation2(outPtr)
        }

        return this.__IConnectedAnimation2.put_IsScaleAnimationEnabled(value)
    }

    /**
     * Attempts to start the animation.
     * @param {UIElement} destination The element that is animated into view.
     * @param {IIterable<UIElement>} coordinatedElements 
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.connectedanimation.trystart
     */
    TryStartWithCoordinatedElements(destination, coordinatedElements) {
        if (!this.HasProp("__IConnectedAnimation2")) {
            if ((queryResult := this.QueryInterface(IConnectedAnimation2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IConnectedAnimation2 := IConnectedAnimation2(outPtr)
        }

        return this.__IConnectedAnimation2.TryStartWithCoordinatedElements(destination, coordinatedElements)
    }

    /**
     * Sets a custom [CompositionAnimation](./../windows.ui.composition/compositionanimation.md) to change the motion of a particular part of the connected animation.
     * @remarks
     * When creating the animation, use Composition expression strings "StartingValue" and "FinalValue" to represent the starting and ending values from the system. For example:
     * 
     * ```csharp
     * var customKeyFrameAnimation = Window.Compositor.CreateScalarKeyFrameAnimation();
     * customKeyFrameAnimation.Duration = ConnectedAnimationService.GetForCurrentView().DefaultDuration;
     * customKeyFrameAnimation.InsertExpressionKeyFrame(0.0f, "StartingValue");
     * customKeyFrameAnimation.InsertExpressionKeyFrame(0.5f, "FinalValue + 25");
     * customKeyFrameAnimation.InsertExpressionKeyFrame(1.0f, "FinalValue");
     * 
     * myConnectedAnimation.SetAnimationComponent(ConnectedAnimationComponent.OffsetX, customKeyFrameAnimation);
     * ```
     * 
     * See [Expression Keyframes](/windows/uwp/graphics/composition-animation#expression-keyframes) for more information on using Composition expressions.
     * @param {Integer} component_ The part of the connected animation to change.
     * @param {ICompositionAnimationBase} animation The animation to use in place of the default one.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.connectedanimation.setanimationcomponent
     */
    SetAnimationComponent(component_, animation) {
        if (!this.HasProp("__IConnectedAnimation2")) {
            if ((queryResult := this.QueryInterface(IConnectedAnimation2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IConnectedAnimation2 := IConnectedAnimation2(outPtr)
        }

        return this.__IConnectedAnimation2.SetAnimationComponent(component_, animation)
    }

    /**
     * 
     * @returns {ConnectedAnimationConfiguration} 
     */
    get_Configuration() {
        if (!this.HasProp("__IConnectedAnimation3")) {
            if ((queryResult := this.QueryInterface(IConnectedAnimation3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IConnectedAnimation3 := IConnectedAnimation3(outPtr)
        }

        return this.__IConnectedAnimation3.get_Configuration()
    }

    /**
     * 
     * @param {ConnectedAnimationConfiguration} value 
     * @returns {HRESULT} 
     */
    put_Configuration(value) {
        if (!this.HasProp("__IConnectedAnimation3")) {
            if ((queryResult := this.QueryInterface(IConnectedAnimation3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IConnectedAnimation3 := IConnectedAnimation3(outPtr)
        }

        return this.__IConnectedAnimation3.put_Configuration(value)
    }

;@endregion Instance Methods
}
