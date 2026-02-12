#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IEffectiveViewportChangedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides data for the [FrameworkElement.EffectiveViewportChanged](frameworkelement_effectiveviewportchanged.md) event.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.effectiveviewportchangedeventargs
 * @namespace Windows.UI.Xaml
 * @version WindowsRuntime 1.4
 */
class EffectiveViewportChangedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IEffectiveViewportChangedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IEffectiveViewportChangedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the [Rect](../windows.foundation/rect.md) representing the effective viewport.
     * @remarks
     * For more info, see the [EffectiveViewportChanged](frameworkelement_effectiveviewportchanged.md) event.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.effectiveviewportchangedeventargs.effectiveviewport
     * @type {RECT} 
     */
    EffectiveViewport {
        get => this.get_EffectiveViewport()
    }

    /**
     * Gets the [Rect](../windows.foundation/rect.md) representing the maximum effective viewport with the current viewport sizes.
     * @remarks
     * For more info, see the [EffectiveViewportChanged](frameworkelement_effectiveviewportchanged.md) event.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.effectiveviewportchangedeventargs.maxviewport
     * @type {RECT} 
     */
    MaxViewport {
        get => this.get_MaxViewport()
    }

    /**
     * Gets the sum of translation in the X-axis that is required to bring the [FrameworkElement](frameworkelement.md) into view of each viewport containing the element.
     * @remarks
     * The value does not account for the possibility of a scrolling control that has scrolling disabled.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.effectiveviewportchangedeventargs.bringintoviewdistancex
     * @type {Float} 
     */
    BringIntoViewDistanceX {
        get => this.get_BringIntoViewDistanceX()
    }

    /**
     * Gets the sum of translation in the Y-axis that is required to bring the [FrameworkElement](frameworkelement.md) into view of each viewport containing the element.
     * @remarks
     * The value does not account for the possibility of a scrolling control that has scrolling disabled.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.effectiveviewportchangedeventargs.bringintoviewdistancey
     * @type {Float} 
     */
    BringIntoViewDistanceY {
        get => this.get_BringIntoViewDistanceY()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {RECT} 
     */
    get_EffectiveViewport() {
        if (!this.HasProp("__IEffectiveViewportChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(IEffectiveViewportChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEffectiveViewportChangedEventArgs := IEffectiveViewportChangedEventArgs(outPtr)
        }

        return this.__IEffectiveViewportChangedEventArgs.get_EffectiveViewport()
    }

    /**
     * 
     * @returns {RECT} 
     */
    get_MaxViewport() {
        if (!this.HasProp("__IEffectiveViewportChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(IEffectiveViewportChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEffectiveViewportChangedEventArgs := IEffectiveViewportChangedEventArgs(outPtr)
        }

        return this.__IEffectiveViewportChangedEventArgs.get_MaxViewport()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_BringIntoViewDistanceX() {
        if (!this.HasProp("__IEffectiveViewportChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(IEffectiveViewportChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEffectiveViewportChangedEventArgs := IEffectiveViewportChangedEventArgs(outPtr)
        }

        return this.__IEffectiveViewportChangedEventArgs.get_BringIntoViewDistanceX()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_BringIntoViewDistanceY() {
        if (!this.HasProp("__IEffectiveViewportChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(IEffectiveViewportChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEffectiveViewportChangedEventArgs := IEffectiveViewportChangedEventArgs(outPtr)
        }

        return this.__IEffectiveViewportChangedEventArgs.get_BringIntoViewDistanceY()
    }

;@endregion Instance Methods
}
