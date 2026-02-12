#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\KeyFrameAnimation.ahk
#Include .\IPathKeyFrameAnimation.ahk
#Include ..\..\..\Guid.ahk

/**
 * > [!WARNING]
  * > This API contains a known issue in Windows 10, versions 20H2 and below. Do not use this API in your code.
  * 
  * Represents a time-based animation with one or more key frames where each key frame value is represented by a
  * [CompositionPath](compositionpath.md). The easing specifies the interopolation between paths.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.pathkeyframeanimation
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class PathKeyFrameAnimation extends KeyFrameAnimation {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPathKeyFrameAnimation

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPathKeyFrameAnimation.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Inserts a key frame.
     * @param {Float} normalizedProgressKey The time the key frame should occur at, expressed as a percentage of the animation Duration. Allowed value is from 0.0 to 1.0.
     * @param {CompositionPath} path_ The path used to define the value of the key frame.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.pathkeyframeanimation.insertkeyframe
     */
    InsertKeyFrame(normalizedProgressKey, path_) {
        if (!this.HasProp("__IPathKeyFrameAnimation")) {
            if ((queryResult := this.QueryInterface(IPathKeyFrameAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPathKeyFrameAnimation := IPathKeyFrameAnimation(outPtr)
        }

        return this.__IPathKeyFrameAnimation.InsertKeyFrame(normalizedProgressKey, path_)
    }

    /**
     * Inserts a key frame with the specified easing.
     * @param {Float} normalizedProgressKey The time the key frame should occur at, expressed as a percentage of the animation Duration. Allowed value is from 0.0 to 1.0.
     * @param {CompositionPath} path_ The path used to define the value of the key frame.
     * @param {CompositionEasingFunction} easingFunction The easing function to use when interpolating between frames.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.pathkeyframeanimation.insertkeyframe
     */
    InsertKeyFrameWithEasingFunction(normalizedProgressKey, path_, easingFunction) {
        if (!this.HasProp("__IPathKeyFrameAnimation")) {
            if ((queryResult := this.QueryInterface(IPathKeyFrameAnimation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPathKeyFrameAnimation := IPathKeyFrameAnimation(outPtr)
        }

        return this.__IPathKeyFrameAnimation.InsertKeyFrameWithEasingFunction(normalizedProgressKey, path_, easingFunction)
    }

;@endregion Instance Methods
}
