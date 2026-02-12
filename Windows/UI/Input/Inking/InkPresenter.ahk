#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IInkPresenter.ahk
#Include .\IInkPresenter2.ahk
#Include .\IInkPresenter3.ahk
#Include ..\..\..\Foundation\TypedEventHandler.ahk
#Include .\InkPresenter.ahk
#Include .\InkStrokesCollectedEventArgs.ahk
#Include .\InkStrokesErasedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\..\WinRTEventHandler.ahk

/**
 * Provides properties, methods, and events for managing the input, processing, and rendering of ink input (standard and modified) for an [InkCanvas](../windows.ui.xaml.controls/inkcanvas.md) control.
 * @remarks
 * For Universal Windows apps, we recommend using InkPresenter and the [InkCanvas](../windows.ui.xaml.controls/inkcanvas.md) control instead of [InkManager](inkmanager.md).
 * 
 * The InkPresenter class cannot be instantiated directly. It is returned as a property of an [InkCanvas](../windows.ui.xaml.controls/inkcanvas.md) object.
 * 
 * > [!NOTE]
 * > Standard ink input (pen tip or eraser tip/button) is not modified with a secondary affordance, such as a pen barrel button, right mouse button, or similar (see [RightDragAction](inkinputprocessingconfiguration_rightdragaction.md)).
 * 
 * By default, both standard and modified ink input is managed entirely by the [InkPresenter](inkunprocessedinput_inkpresenter.md) and rendered to the [InkCanvas](../windows.ui.xaml.controls/inkcanvas.md) as either an ink stroke or an erase stroke, based on [InkInputProcessingConfiguration.Mode](inkinputprocessingconfiguration_mode.md).
 * 
 * Modified input can be passed through to your app for processing by setting [InkInputProcessingConfiguration.RightDragAction](inkinputprocessingconfiguration_rightdragaction.md) to [InkInputRightDragAction.LeaveUnprocessed](inkinputrightdragaction.md).
 * 
 * All input can be passed through to your app for processing by setting [InkInputProcessingConfiguration.Mode](inkinputprocessingconfiguration_mode.md) to [None](inkinputprocessingmode.md).
 * 
 * Leaving input unprocessed by the [InkPresenter](inkunprocessedinput_inkpresenter.md) lets you support a customized ink experience and extended functionality such as selection.
 * 
 * For complete control of ink input and to render it to the Direct2D device context of your Universal Windows app, instead of the default [InkCanvas](../windows.ui.xaml.controls/inkcanvas.md) control, call [ActivateCustomDrying](inkpresenter_activatecustomdrying_1826048524.md) prior to loading the [InkCanvas](../windows.ui.xaml.controls/inkcanvas.md). This requires an [IInkD2DRenderer](/windows/desktop/api/inkrenderer/nn-inkrenderer-iinkd2drenderer) object to manage the ink input (see the [Complex ink sample](https://github.com/Microsoft/Windows-universal-samples/tree/master/Samples/ComplexInk)).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.inkpresenter
 * @namespace Windows.UI.Input.Inking
 * @version WindowsRuntime 1.4
 */
class InkPresenter extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IInkPresenter

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IInkPresenter.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets whether input is enabled for inking.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.inkpresenter.isinputenabled
     * @type {Boolean} 
     */
    IsInputEnabled {
        get => this.get_IsInputEnabled()
        set => this.put_IsInputEnabled(value)
    }

    /**
     * Gets or sets the input device type from which input data is collected by the [InkPresenter](inkpresenter.md) to construct and render an [InkStroke](inkstroke.md). The default is [Pen](../windows.ui.core/coreinputdevicetypes.md).
     * @remarks
     * If you set this property to [None](../windows.ui.core/coreinputdevicetypes.md), you should remove listeners for all pointer events, including [PointerEntered](inkunprocessedinput_pointerentered.md), [PointerHovered](inkunprocessedinput_pointerhovered.md), and [PointerExited](inkunprocessedinput_pointerexited.md). In this case, pointer events are passed to the InkCanvas object and not to the InkPresenter object through [InkPresenter.UnprocessedInput](inkpresenter_unprocessedinput.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.inkpresenter.inputdevicetypes
     * @type {Integer} 
     */
    InputDeviceTypes {
        get => this.get_InputDeviceTypes()
        set => this.put_InputDeviceTypes(value)
    }

    /**
     * Gets input (standard or modified) from the associated [InkCanvas](../windows.ui.xaml.controls/inkcanvas.md) control and passes the data through for custom processing by the app. The data is not processed by the [InkPresenter](inkpresenter.md).
     * 
     * > [!NOTE]
     * > Standard input is not modified with a secondary affordance, such as a pen barrel button, right mouse button, or similar.
     * 
     * Use [InkInputProcessingConfiguration](inkinputprocessingconfiguration.md) to indicate the input to be passed as [InkUnprocessedInput](inkunprocessedinput.md) through to your app for custom processing.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.inkpresenter.unprocessedinput
     * @type {InkUnprocessedInput} 
     */
    UnprocessedInput {
        get => this.get_UnprocessedInput()
    }

    /**
     * Gets an [InkStrokeInput](inkstrokeinput.md) object for managing ink input events.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.inkpresenter.strokeinput
     * @type {InkStrokeInput} 
     */
    StrokeInput {
        get => this.get_StrokeInput()
    }

    /**
     * Gets how input is processed by the [InkPresenter](inkpresenter.md) object.
     * @remarks
     * Primary input is not from (or modified by) a secondary affordance, such as a pen barrel button, pen eraser tip, right mouse button, or similar.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.inkpresenter.inputprocessingconfiguration
     * @type {InkInputProcessingConfiguration} 
     */
    InputProcessingConfiguration {
        get => this.get_InputProcessingConfiguration()
    }

    /**
     * Gets or sets an [InkStrokeContainer](inkstrokecontainer.md) object to store and manage the collection of [InkStroke](inkstroke.md) objects rendered by the [InkPresenter](inkpresenter.md).
     * 
     * Modifications made to any of the ink strokes in the stroke container are immediately rendered to the drawing surface associated with the [InkPresenter](inkpresenter.md).
     * @remarks
     * The [StrokesCollected](inkpresenter_strokescollected.md) event is fired when ink strokes are processed ("wet" to "dry") on the UI thread.
     * 
     * For ink recognition, use an [InkRecognizerContainer](inkrecognizercontainer.md) object.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.inkpresenter.strokecontainer
     * @type {InkStrokeContainer} 
     */
    StrokeContainer {
        get => this.get_StrokeContainer()
        set => this.put_StrokeContainer(value)
    }

    /**
     * Gets or sets how the [InkPresenter](inkpresenter.md) object handles input (standard and modified) from the associated [InkCanvas](../windows.ui.xaml.controls/inkcanvas.md) control when system is in high contrast mode.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.inkpresenter.highcontrastadjustment
     * @type {Integer} 
     */
    HighContrastAdjustment {
        get => this.get_HighContrastAdjustment()
        set => this.put_HighContrastAdjustment(value)
    }

    /**
     * Gets which types of secondary input can be processed by the [InkPresenter](inkpresenter.md) object.
     * @remarks
     * Primary input is not from (or modified by) a secondary affordance, such as a pen barrel button, pen eraser tip, right mouse button, or similar.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.inkpresenter.inputconfiguration
     * @type {InkInputConfiguration} 
     */
    InputConfiguration {
        get => this.get_InputConfiguration()
    }

    /**
     * Occurs when one or more ink strokes are processed ("wet" to "dry") by the application thread.
     * 
     * By default, an ink stroke is processed on a low-latency background thread and rendered wet as it is drawn. When the stroke is completed (pen or finger lifted, or mouse button released), the stroke is processed on the UI thread and rendered dry to the [InkCanvas](../windows.ui.xaml.controls/inkcanvas.md) layer (above the application content). If the UI thread is busy, more than one ink stroke might be processed (collected) when the thread becomes available.
     * @type {TypedEventHandler<InkPresenter, InkStrokesCollectedEventArgs>}
    */
    OnStrokesCollected {
        get {
            if(!this.HasProp("__OnStrokesCollected")){
                this.__OnStrokesCollected := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{176bfa8f-c0de-5b3a-b28c-0f3931ca52d3}"),
                    InkPresenter,
                    InkStrokesCollectedEventArgs
                )
                this.__OnStrokesCollectedToken := this.add_StrokesCollected(this.__OnStrokesCollected.iface)
            }
            return this.__OnStrokesCollected
        }
    }

    /**
     * Occurs when an [InkStroke](inkstroke.md) object is removed from an [InkCanvas](../windows.ui.xaml.controls/inkcanvas.md) control using the pen eraser or the pen tip when [Mode](inkinputprocessingconfiguration_mode.md) is set to [Erasing](inkinputprocessingmode.md).
     * @remarks
     * [InkStrokeContainer.DeleteSelected](inkstrokecontainer_deleteselected_2139837948.md) does not cause this event to fire.
     * 
     * This event is not raised in custom dry mode ([ActivateCustomDrying](inkpresenter_activatecustomdrying_1826048524.md)).
     * 
     * 
     * 
     * > **Custom drying and the InkToolbar**
     * > By default, ink input is processed on a low-latency background thread and rendered "wet" as it is drawn. When the stroke is completed (pen or finger lifted, or mouse button released), the stroke is processed on the UI thread and rendered "dry" to the [InkCanvas](../windows.ui.xaml.controls/inkcanvas.md) layer (above the application content and replacing the wet ink). The ink platform enables you to override this behavior and completely customize the inking experience by custom drying the ink input.
     * 
     * If your app overrides the default ink rendering behavior of the [InkPresenter](inkpresenter.md) with a custom drying implementation, the rendered ink strokes are no longer available to the [InkToolbar](../windows.ui.xaml.controls/inktoolbar.md) and the built-in erase commands of the [InkToolbar](../windows.ui.xaml.controls/inktoolbar.md) do not work as expected. To provide erase functionality, you must handle all pointer events, perform hit-testing on each stroke, and override the built-in "Erase all ink" command.
     * 
     * For more info on custom drying, see [Pen interactions and Windows Ink in UWP apps](/windows/uwp/input-and-devices/pen-and-stylus-interactions).
     * @type {TypedEventHandler<InkPresenter, InkStrokesErasedEventArgs>}
    */
    OnStrokesErased {
        get {
            if(!this.HasProp("__OnStrokesErased")){
                this.__OnStrokesErased := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{30fec929-14d0-550f-84f2-137fc6a9f08f}"),
                    InkPresenter,
                    InkStrokesErasedEventArgs
                )
                this.__OnStrokesErasedToken := this.add_StrokesErased(this.__OnStrokesErased.iface)
            }
            return this.__OnStrokesErased
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnStrokesCollectedToken")) {
            this.remove_StrokesCollected(this.__OnStrokesCollectedToken)
            this.__OnStrokesCollected.iface.Dispose()
        }

        if(this.HasProp("__OnStrokesErasedToken")) {
            this.remove_StrokesErased(this.__OnStrokesErasedToken)
            this.__OnStrokesErased.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsInputEnabled() {
        if (!this.HasProp("__IInkPresenter")) {
            if ((queryResult := this.QueryInterface(IInkPresenter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkPresenter := IInkPresenter(outPtr)
        }

        return this.__IInkPresenter.get_IsInputEnabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsInputEnabled(value) {
        if (!this.HasProp("__IInkPresenter")) {
            if ((queryResult := this.QueryInterface(IInkPresenter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkPresenter := IInkPresenter(outPtr)
        }

        return this.__IInkPresenter.put_IsInputEnabled(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_InputDeviceTypes() {
        if (!this.HasProp("__IInkPresenter")) {
            if ((queryResult := this.QueryInterface(IInkPresenter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkPresenter := IInkPresenter(outPtr)
        }

        return this.__IInkPresenter.get_InputDeviceTypes()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_InputDeviceTypes(value) {
        if (!this.HasProp("__IInkPresenter")) {
            if ((queryResult := this.QueryInterface(IInkPresenter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkPresenter := IInkPresenter(outPtr)
        }

        return this.__IInkPresenter.put_InputDeviceTypes(value)
    }

    /**
     * 
     * @returns {InkUnprocessedInput} 
     */
    get_UnprocessedInput() {
        if (!this.HasProp("__IInkPresenter")) {
            if ((queryResult := this.QueryInterface(IInkPresenter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkPresenter := IInkPresenter(outPtr)
        }

        return this.__IInkPresenter.get_UnprocessedInput()
    }

    /**
     * 
     * @returns {InkStrokeInput} 
     */
    get_StrokeInput() {
        if (!this.HasProp("__IInkPresenter")) {
            if ((queryResult := this.QueryInterface(IInkPresenter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkPresenter := IInkPresenter(outPtr)
        }

        return this.__IInkPresenter.get_StrokeInput()
    }

    /**
     * 
     * @returns {InkInputProcessingConfiguration} 
     */
    get_InputProcessingConfiguration() {
        if (!this.HasProp("__IInkPresenter")) {
            if ((queryResult := this.QueryInterface(IInkPresenter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkPresenter := IInkPresenter(outPtr)
        }

        return this.__IInkPresenter.get_InputProcessingConfiguration()
    }

    /**
     * 
     * @returns {InkStrokeContainer} 
     */
    get_StrokeContainer() {
        if (!this.HasProp("__IInkPresenter")) {
            if ((queryResult := this.QueryInterface(IInkPresenter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkPresenter := IInkPresenter(outPtr)
        }

        return this.__IInkPresenter.get_StrokeContainer()
    }

    /**
     * 
     * @param {InkStrokeContainer} value 
     * @returns {HRESULT} 
     */
    put_StrokeContainer(value) {
        if (!this.HasProp("__IInkPresenter")) {
            if ((queryResult := this.QueryInterface(IInkPresenter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkPresenter := IInkPresenter(outPtr)
        }

        return this.__IInkPresenter.put_StrokeContainer(value)
    }

    /**
     * Retrieves the [InkDrawingAttributes](inkdrawingattributes.md) used by the [InkPresenter](inkpresenter.md) when rendering a new [InkStroke](inkstroke.md) on an [InkCanvas](../windows.ui.xaml.controls/inkcanvas.md) control.
     * 
     * This method is used in conjunction with [UpdateDefaultDrawingAttributes](inkpresenter_updatedefaultdrawingattributes_2083673367.md) to set drawing attributes at run time.
     * @remarks
     * This method does not return the attributes of existing, or currently drawing, ink strokes.
     * @returns {InkDrawingAttributes} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.inkpresenter.copydefaultdrawingattributes
     */
    CopyDefaultDrawingAttributes() {
        if (!this.HasProp("__IInkPresenter")) {
            if ((queryResult := this.QueryInterface(IInkPresenter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkPresenter := IInkPresenter(outPtr)
        }

        return this.__IInkPresenter.CopyDefaultDrawingAttributes()
    }

    /**
     * Sets the [InkDrawingAttributes](inkdrawingattributes.md) used by the [InkPresenter](inkpresenter.md) when rendering a new [InkStroke](inkstroke.md) on an [InkCanvas](../windows.ui.xaml.controls/inkcanvas.md) control.
     * 
     * This method is used in conjunction with [CopyDefaultDrawingAttributes](inkpresenter_copydefaultdrawingattributes_553706939.md) to set drawing attributes at run time.
     * @remarks
     * This method does not return the attributes of existing, or currently drawing, ink strokes.
     * @param {InkDrawingAttributes} value The drawing attributes for new ink strokes.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.inkpresenter.updatedefaultdrawingattributes
     */
    UpdateDefaultDrawingAttributes(value) {
        if (!this.HasProp("__IInkPresenter")) {
            if ((queryResult := this.QueryInterface(IInkPresenter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkPresenter := IInkPresenter(outPtr)
        }

        return this.__IInkPresenter.UpdateDefaultDrawingAttributes(value)
    }

    /**
     * Indicates that your app requires complete control of ink input rendering. 
     * 
     * By default, ink input is processed on a low-latency background thread and rendered "wet" as it is drawn. When the stroke is completed (pen or finger lifted, or mouse button released), the stroke is processed on the UI thread and rendered "dry" to the rendering layer (above the application content and replacing the wet ink).
     * @returns {InkSynchronizer} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.inkpresenter.activatecustomdrying
     */
    ActivateCustomDrying() {
        if (!this.HasProp("__IInkPresenter")) {
            if ((queryResult := this.QueryInterface(IInkPresenter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkPresenter := IInkPresenter(outPtr)
        }

        return this.__IInkPresenter.ActivateCustomDrying()
    }

    /**
     * Sets the inking behavior of one or more contact points on the associated [InkCanvas](../windows.ui.xaml.controls/inkcanvas.md) control.
     * @param {Integer} value The inking behavior of one or more contact points. The default is [SimpleSinglePointer](inkpresenterpredefinedconfiguration.md).
     * 
     * [SimpleSinglePointer](inkpresenterpredefinedconfiguration.md) specifies that single pointer inking is supported.
     * 
     * [SimpleMultiplePointer](inkpresenterpredefinedconfiguration.md) specifies that multi-pointer inking is supported. 
     * 
     * > [!NOTE]
     * > Multi-pointer inking requires ink input to be processed in custom drying mode. [ActivateCustomDrying](inkpresenter_activatecustomdrying_1826048524.md) must be called before setting SetPredefinedConfiguration to [SimpleMultiplePointer](inkpresenterpredefinedconfiguration.md).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.inkpresenter.setpredefinedconfiguration
     */
    SetPredefinedConfiguration(value) {
        if (!this.HasProp("__IInkPresenter")) {
            if ((queryResult := this.QueryInterface(IInkPresenter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkPresenter := IInkPresenter(outPtr)
        }

        return this.__IInkPresenter.SetPredefinedConfiguration(value)
    }

    /**
     * 
     * @param {TypedEventHandler<InkPresenter, InkStrokesCollectedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_StrokesCollected(handler) {
        if (!this.HasProp("__IInkPresenter")) {
            if ((queryResult := this.QueryInterface(IInkPresenter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkPresenter := IInkPresenter(outPtr)
        }

        return this.__IInkPresenter.add_StrokesCollected(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} cookie 
     * @returns {HRESULT} 
     */
    remove_StrokesCollected(cookie) {
        if (!this.HasProp("__IInkPresenter")) {
            if ((queryResult := this.QueryInterface(IInkPresenter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkPresenter := IInkPresenter(outPtr)
        }

        return this.__IInkPresenter.remove_StrokesCollected(cookie)
    }

    /**
     * 
     * @param {TypedEventHandler<InkPresenter, InkStrokesErasedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_StrokesErased(handler) {
        if (!this.HasProp("__IInkPresenter")) {
            if ((queryResult := this.QueryInterface(IInkPresenter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkPresenter := IInkPresenter(outPtr)
        }

        return this.__IInkPresenter.add_StrokesErased(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} cookie 
     * @returns {HRESULT} 
     */
    remove_StrokesErased(cookie) {
        if (!this.HasProp("__IInkPresenter")) {
            if ((queryResult := this.QueryInterface(IInkPresenter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkPresenter := IInkPresenter(outPtr)
        }

        return this.__IInkPresenter.remove_StrokesErased(cookie)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_HighContrastAdjustment() {
        if (!this.HasProp("__IInkPresenter2")) {
            if ((queryResult := this.QueryInterface(IInkPresenter2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkPresenter2 := IInkPresenter2(outPtr)
        }

        return this.__IInkPresenter2.get_HighContrastAdjustment()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_HighContrastAdjustment(value) {
        if (!this.HasProp("__IInkPresenter2")) {
            if ((queryResult := this.QueryInterface(IInkPresenter2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkPresenter2 := IInkPresenter2(outPtr)
        }

        return this.__IInkPresenter2.put_HighContrastAdjustment(value)
    }

    /**
     * 
     * @returns {InkInputConfiguration} 
     */
    get_InputConfiguration() {
        if (!this.HasProp("__IInkPresenter3")) {
            if ((queryResult := this.QueryInterface(IInkPresenter3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkPresenter3 := IInkPresenter3(outPtr)
        }

        return this.__IInkPresenter3.get_InputConfiguration()
    }

;@endregion Instance Methods
}
