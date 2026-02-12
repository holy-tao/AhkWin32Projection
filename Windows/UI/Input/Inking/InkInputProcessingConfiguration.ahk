#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IInkInputProcessingConfiguration.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Manages how input is processed by the [InkPresenter](inkpresenter.md) object.
 * @remarks
 * Primary input is not from (or modified by) a secondary affordance, such as a pen barrel button, pen eraser tip, right mouse button, or similar.
 * 
 * Secondary input, by default, is processed as primary input and rendered as an [InkStroke](inkstroke.md) by the [InkPresenter](inkpresenter.md). For custom handling of secondary input by your application, set [InkInputProcessingConfiguration.RightDragAction](inkinputprocessingconfiguration_rightdragaction.md) to [LeaveUnprocessed](inkinputrightdragaction.md). This indicates that input should be passed through the [InkPresenter](inkpresenter.md) as [UnprocessedInput](inkpresenter_unprocessedinput.md) for custom processing.
 * 
 * If [InkInputProcessingConfiguration.Mode](inkinputprocessingconfiguration_mode.md) is set to [None](inkinputprocessingmode.md), the value of [RightDragAction](inkinputprocessingconfiguration_rightdragaction.md) is ignored and input is always passed as [UnprocessedInput](inkpresenter_unprocessedinput.md) through to your app for custom processing.
 * 
 * If [InkInputProcessingConfiguration.Mode](inkinputprocessingconfiguration_mode.md) is set to [Inking](inkinputprocessingmode.md) or [Erasing](inkinputprocessingmode.md), the value of [RightDragAction](inkinputprocessingconfiguration_rightdragaction.md) must be set to [LeaveUnprocessed](inkinputrightdragaction.md) to pass input as [UnprocessedInput](inkpresenter_unprocessedinput.md) through to your app for custom processing.
 * 
 * To manage what secondary input is processed by your app, see [InkInputConfiguration](inkinputconfiguration.md).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.inkinputprocessingconfiguration
 * @namespace Windows.UI.Input.Inking
 * @version WindowsRuntime 1.4
 */
class InkInputProcessingConfiguration extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IInkInputProcessingConfiguration

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IInkInputProcessingConfiguration.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets how the [InkPresenter](inkpresenter.md) object renders secondrary input from a pen barrel button, pen eraser tip, right mouse button, or similar on its associated [InkCanvas](../windows.ui.xaml.controls/inkcanvas.md) control.
     * 
     * By default, this secondary input is processed as primary input and rendered as an [InkStroke](inkstroke.md) (see remarks).
     * @remarks
     * To pass input as [UnprocessedInput](inkpresenter_unprocessedinput.md) through to your app for custom processing, set [RightDragAction](inkinputprocessingconfiguration_rightdragaction.md) to [LeaveUnprocessed](inkinputrightdragaction.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.inkinputprocessingconfiguration.mode
     * @type {Integer} 
     */
    Mode {
        get => this.get_Mode()
        set => this.put_Mode(value)
    }

    /**
     * Gets or sets how the [InkPresenter](inkpresenter.md) object handles secondary input from a pen barrel button, pen eraser tip, right mouse button, or similar.
     * 
     * By default, this secondary input is processed as primary input and rendered as an [InkStroke](inkstroke.md) (see remarks).
     * @remarks
     * To pass input as [UnprocessedInput](inkpresenter_unprocessedinput.md) through to your app for custom processing, set RightDragAction to [LeaveUnprocessed](inkinputrightdragaction.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.inkinputprocessingconfiguration.rightdragaction
     * @type {Integer} 
     */
    RightDragAction {
        get => this.get_RightDragAction()
        set => this.put_RightDragAction(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Mode() {
        if (!this.HasProp("__IInkInputProcessingConfiguration")) {
            if ((queryResult := this.QueryInterface(IInkInputProcessingConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkInputProcessingConfiguration := IInkInputProcessingConfiguration(outPtr)
        }

        return this.__IInkInputProcessingConfiguration.get_Mode()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Mode(value) {
        if (!this.HasProp("__IInkInputProcessingConfiguration")) {
            if ((queryResult := this.QueryInterface(IInkInputProcessingConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkInputProcessingConfiguration := IInkInputProcessingConfiguration(outPtr)
        }

        return this.__IInkInputProcessingConfiguration.put_Mode(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_RightDragAction() {
        if (!this.HasProp("__IInkInputProcessingConfiguration")) {
            if ((queryResult := this.QueryInterface(IInkInputProcessingConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkInputProcessingConfiguration := IInkInputProcessingConfiguration(outPtr)
        }

        return this.__IInkInputProcessingConfiguration.get_RightDragAction()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_RightDragAction(value) {
        if (!this.HasProp("__IInkInputProcessingConfiguration")) {
            if ((queryResult := this.QueryInterface(IInkInputProcessingConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkInputProcessingConfiguration := IInkInputProcessingConfiguration(outPtr)
        }

        return this.__IInkInputProcessingConfiguration.put_RightDragAction(value)
    }

;@endregion Instance Methods
}
