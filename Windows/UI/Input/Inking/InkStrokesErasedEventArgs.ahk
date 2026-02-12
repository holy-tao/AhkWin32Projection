#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IInkStrokesErasedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Contains event data for the [StrokesErased](inkpresenter_strokeserased.md) event of the [InkPresenter](inkpresenter.md) associated with an [InkCanvas](../windows.ui.xaml.controls/inkcanvas.md) control.
  * 
  * By default, ink stroke data and rendering is managed entirely by the [InkCanvas](../windows.ui.xaml.controls/inkcanvas.md) control. However, this behavior can be overridden by calling the [ActivateCustomDrying](inkpresenter_activatecustomdrying_1826048524.md) method prior to loading the [InkCanvas](../windows.ui.xaml.controls/inkcanvas.md).
 * @remarks
 * The [StrokesErased](inkpresenter_strokeserased.md) event is not raised in custom dry mode ([ActivateCustomDrying](inkpresenter_activatecustomdrying_1826048524.md)).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.inkstrokeserasedeventargs
 * @namespace Windows.UI.Input.Inking
 * @version WindowsRuntime 1.4
 */
class InkStrokesErasedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IInkStrokesErasedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IInkStrokesErasedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the collection of ink strokes associated with the [StrokesErased](inkpresenter_strokeserased.md) event.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.inkstrokeserasedeventargs.strokes
     * @type {IVectorView<InkStroke>} 
     */
    Strokes {
        get => this.get_Strokes()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {IVectorView<InkStroke>} 
     */
    get_Strokes() {
        if (!this.HasProp("__IInkStrokesErasedEventArgs")) {
            if ((queryResult := this.QueryInterface(IInkStrokesErasedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkStrokesErasedEventArgs := IInkStrokesErasedEventArgs(outPtr)
        }

        return this.__IInkStrokesErasedEventArgs.get_Strokes()
    }

;@endregion Instance Methods
}
