#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\FrameworkElement.ahk
#Include .\IInkCanvas.ahk
#Include .\IInkCanvasFactory.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Defines an area that receives and displays all pen input as either an ink stroke or an erase stroke (input from an eraser tip, or the pen tip when modified with an erase button).
 * @remarks
 * An InkCanvas has default Height and Width properties of zero, unless it is the child of an element that automatically sizes its child elements, such as [StackPanel](stackpanel.md) or [Grid](grid.md) controls.
 * 
 * InkCanvas has maximum height and width dimensions of 2^21 physical pixels.
 * 
 * By default, the InkCanvas does not support ink input from devices other than pen. You must specify support for other devices through the [InputDeviceTypes](../windows.ui.input.inking/inkpresenter_inputdevicetypes.md) of an [InkPresenter](../windows.ui.input.inking/inkpresenter.md) object.
 * 
 * Associate an [InkToolbar](inktoolbar.md) with an InkCanvas to provide a customizable and extensible collection of buttons that activate ink-related features in the InkCanvas. By default, the toolbar includes buttons for drawing, erasing, highlighting, and displaying a ruler.
 * 
 * An [InkCanvas](inkcanvas_inkcanvas_1221375020.md) control is bound to a single instance of an [InkPresenter](../windows.ui.input.inking/inkpresenter.md) object (exposed through the [InkPresenter](inkcanvas_inkpresenter.md) property). This object provides all default inking functionality exposed by the InkCanvas, along with a comprehensive set of APIs for additional customization.
 * 
 * The configuration of the [InkPresenter](../windows.ui.input.inking/inkpresenter.md) determines the pointer event handling behavior of the InkCanvas. You must set [InkPresenter.InputDeviceTypes](../windows.ui.input.inking/inkpresenter_inputdevicetypes.md) to [CoreInputDeviceTypes.None](../windows.ui.core/coreinputdevicetypes.md) for the [InkCanvas](inkcanvas_inkcanvas_1221375020.md) to process pointer events, otherwise they are passed to the [InkPresenter](../windows.ui.input.inking/inkpresenter.md) object. 
 * 
 * To handle pointer events with the InkPresenter object, you must set [RightDragAction](../windows.ui.input.inking/inkinputprocessingconfiguration_rightdragaction.md) to [LeaveUnprocessed](../windows.ui.input.inking/inkinputrightdragaction.md) to pass the input through as [UnprocessedInput](../windows.ui.input.inking/inkpresenter_unprocessedinput.md) for custom processing by your app.
 * 
 * The InkCanvas control doesn't work if a [Transform3D](../windows.ui.xaml/uielement_transform3d.md) is set on the control or on any element in the XAML tree above the control.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.inkcanvas
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class InkCanvas extends FrameworkElement {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IInkCanvas

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IInkCanvas.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {InkCanvas} 
     */
    static CreateInstance() {
        if (!InkCanvas.HasProp("__IInkCanvasFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.InkCanvas")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IInkCanvasFactory.IID)
            InkCanvas.__IInkCanvasFactory := IInkCanvasFactory(factoryPtr)
        }

        return InkCanvas.__IInkCanvasFactory.CreateInstance(0, Buffer(A_PtrSize))
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the underlying [InkPresenter](../windows.ui.input.inking/inkpresenter.md) object associated with the [InkCanvas](inkcanvas.md).
     * 
     * Each [InkCanvas](inkcanvas_inkcanvas_1221375020.md) control is associated with an instance of an [InkPresenter](../windows.ui.input.inking/inkpresenter.md) object (exposed through the InkPresenter property). The [InkPresenter](../windows.ui.input.inking/inkpresenter.md) provides properties, methods, and events for managing the input, processing, and rendering of ink data for an [InkCanvas](inkcanvas.md) control.
     * 
     * The [InkPresenter](../windows.ui.input.inking/inkpresenter.md) cannot be instantiated directly.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.inkcanvas.inkpresenter
     * @type {InkPresenter} 
     */
    InkPresenter {
        get => this.get_InkPresenter()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {InkPresenter} 
     */
    get_InkPresenter() {
        if (!this.HasProp("__IInkCanvas")) {
            if ((queryResult := this.QueryInterface(IInkCanvas.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkCanvas := IInkCanvas(outPtr)
        }

        return this.__IInkCanvas.get_InkPresenter()
    }

;@endregion Instance Methods
}
