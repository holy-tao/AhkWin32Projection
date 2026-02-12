#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IInkStrokesCollectedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Contains event data for the [StrokesCollected](inkpresenter_strokescollected.md) event of the [InkPresenter](inkpresenter.md) associated with an [InkCanvas](../windows.ui.xaml.controls/inkcanvas.md) control.
  * 
  * By default, an ink stroke is processed on a low-latency background thread and rendered wet as it is drawn. When the stroke is completed (pen or finger lifted, or mouse button released), the stroke is processed on the UI thread and rendered dry to the [InkCanvas](../windows.ui.xaml.controls/inkcanvas.md) layer (above the application content). If the UI thread is busy, more than one ink stroke might be processed (collected) when the thread becomes available.
  * 
  * This behavior can be overridden by calling the [ActivateCustomDrying](inkpresenter_activatecustomdrying_1826048524.md) method prior to loading the [InkCanvas](../windows.ui.xaml.controls/inkcanvas.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.inkstrokescollectedeventargs
 * @namespace Windows.UI.Input.Inking
 * @version WindowsRuntime 1.4
 */
class InkStrokesCollectedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IInkStrokesCollectedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IInkStrokesCollectedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the collection of processed ink strokes ("wet" to "dry") associated with the [StrokesCollected](inkpresenter_strokescollected.md) event.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.inkstrokescollectedeventargs.strokes
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
        if (!this.HasProp("__IInkStrokesCollectedEventArgs")) {
            if ((queryResult := this.QueryInterface(IInkStrokesCollectedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkStrokesCollectedEventArgs := IInkStrokesCollectedEventArgs(outPtr)
        }

        return this.__IInkStrokesCollectedEventArgs.get_Strokes()
    }

;@endregion Instance Methods
}
