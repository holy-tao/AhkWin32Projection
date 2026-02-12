#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\CompositionEasingFunction.ahk
#Include .\ILinearEasingFunction.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a linear function for interpolating between animation key frames.
 * @remarks
 * The linear function of another supported easing function that can be used with KeyFrame Animations. When used, the animating property will change in between two KeyFrames linearly over time.
 * 
 * To create a new instance of `LinearEasingFunction`, call [CompositionEasingFunction.CreateLinearEasingFunction.md](compositioneasingfunction_createlineareasingfunction_64116208.md) or [Compositor.CreateLinearEasingFunction](compositor_createlineareasingfunction_957807217.md).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.lineareasingfunction
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class LinearEasingFunction extends CompositionEasingFunction {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ILinearEasingFunction

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ILinearEasingFunction.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
