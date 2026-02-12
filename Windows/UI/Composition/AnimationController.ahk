#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\CompositionObject.ahk
#Include .\IAnimationController.ahk
#Include .\IAnimationControllerStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides playback controls for a KeyFrameAnimation.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.animationcontroller
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class AnimationController extends CompositionObject {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAnimationController

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAnimationController.IID

    /**
     * Gets the maximum allowed playback rate.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.animationcontroller.maxplaybackrate
     * @type {Float} 
     */
    static MaxPlaybackRate {
        get => AnimationController.get_MaxPlaybackRate()
    }

    /**
     * Gets the minimum allowed playback rate.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.animationcontroller.minplaybackrate
     * @type {Float} 
     */
    static MinPlaybackRate {
        get => AnimationController.get_MinPlaybackRate()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {Float} 
     */
    static get_MaxPlaybackRate() {
        if (!AnimationController.HasProp("__IAnimationControllerStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Composition.AnimationController")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAnimationControllerStatics.IID)
            AnimationController.__IAnimationControllerStatics := IAnimationControllerStatics(factoryPtr)
        }

        return AnimationController.__IAnimationControllerStatics.get_MaxPlaybackRate()
    }

    /**
     * 
     * @returns {Float} 
     */
    static get_MinPlaybackRate() {
        if (!AnimationController.HasProp("__IAnimationControllerStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Composition.AnimationController")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAnimationControllerStatics.IID)
            AnimationController.__IAnimationControllerStatics := IAnimationControllerStatics(factoryPtr)
        }

        return AnimationController.__IAnimationControllerStatics.get_MinPlaybackRate()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the rate at which the animation plays.
     * @remarks
     * You can modify the playback rate to speed up or reverse the animation. Playback rate can range from -16 to 16. A positive value greater than 1 speeds up the animation. A negative value reverses the animation.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.animationcontroller.playbackrate
     * @type {Float} 
     */
    PlaybackRate {
        get => this.get_PlaybackRate()
        set => this.put_PlaybackRate(value)
    }

    /**
     * Gets or sets a value that indicates the current playback position of the animation.
     * @remarks
     * Valid values range from 0 to the duration of the animation being controlled.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.animationcontroller.progress
     * @type {Float} 
     */
    Progress {
        get => this.get_Progress()
        set => this.put_Progress(value)
    }

    /**
     * Gets or sets a value that indicates how progress is determined.
     * @remarks
     * Use **IncludesDelayTime** to include delay time in the progress value.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.animationcontroller.progressbehavior
     * @type {Integer} 
     */
    ProgressBehavior {
        get => this.get_ProgressBehavior()
        set => this.put_ProgressBehavior(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_PlaybackRate() {
        if (!this.HasProp("__IAnimationController")) {
            if ((queryResult := this.QueryInterface(IAnimationController.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAnimationController := IAnimationController(outPtr)
        }

        return this.__IAnimationController.get_PlaybackRate()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_PlaybackRate(value) {
        if (!this.HasProp("__IAnimationController")) {
            if ((queryResult := this.QueryInterface(IAnimationController.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAnimationController := IAnimationController(outPtr)
        }

        return this.__IAnimationController.put_PlaybackRate(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_Progress() {
        if (!this.HasProp("__IAnimationController")) {
            if ((queryResult := this.QueryInterface(IAnimationController.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAnimationController := IAnimationController(outPtr)
        }

        return this.__IAnimationController.get_Progress()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_Progress(value) {
        if (!this.HasProp("__IAnimationController")) {
            if ((queryResult := this.QueryInterface(IAnimationController.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAnimationController := IAnimationController(outPtr)
        }

        return this.__IAnimationController.put_Progress(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ProgressBehavior() {
        if (!this.HasProp("__IAnimationController")) {
            if ((queryResult := this.QueryInterface(IAnimationController.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAnimationController := IAnimationController(outPtr)
        }

        return this.__IAnimationController.get_ProgressBehavior()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_ProgressBehavior(value) {
        if (!this.HasProp("__IAnimationController")) {
            if ((queryResult := this.QueryInterface(IAnimationController.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAnimationController := IAnimationController(outPtr)
        }

        return this.__IAnimationController.put_ProgressBehavior(value)
    }

    /**
     * Pauses playback of the animation.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.animationcontroller.pause
     */
    Pause() {
        if (!this.HasProp("__IAnimationController")) {
            if ((queryResult := this.QueryInterface(IAnimationController.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAnimationController := IAnimationController(outPtr)
        }

        return this.__IAnimationController.Pause()
    }

    /**
     * Starts playback of an animation that was previously paused.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.animationcontroller.resume
     */
    Resume() {
        if (!this.HasProp("__IAnimationController")) {
            if ((queryResult := this.QueryInterface(IAnimationController.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAnimationController := IAnimationController(outPtr)
        }

        return this.__IAnimationController.Resume()
    }

;@endregion Instance Methods
}
