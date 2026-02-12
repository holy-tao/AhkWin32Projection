#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IInkUnprocessedInput.ahk
#Include ..\..\..\Foundation\TypedEventHandler.ahk
#Include .\InkUnprocessedInput.ahk
#Include ..\..\Core\PointerEventArgs.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\..\WinRTEventHandler.ahk

/**
 * Provides properties and events for custom processing of ink data from an [InkCanvas](../windows.ui.xaml.controls/inkcanvas.md) control. The data is not processed by the [InkPresenter](inkpresenter.md).
  * 
  * Use [InkInputProcessingConfiguration](inkinputprocessingconfiguration.md) to identify the data to pass through as [UnprocessedInput](inkpresenter_unprocessedinput.md).
 * @remarks
 * Input from various devices (including touch, pen, and mouse) is received, processed, and managed as pointer input. User interactions based on any of these devices can produce a [PointerEntered](inkunprocessedinput_pointerentered.md), [PointerExited](inkunprocessedinput_pointerexited.md), [PointerReleased](inkunprocessedinput_pointerreleased.md), [PointerPressed](inkunprocessedinput_pointerpressed.md), [PointerMoved](inkunprocessedinput_pointermoved.md), [PointerLost](inkunprocessedinput_pointerlost.md), or [PointerHovered](inkunprocessedinput_pointerhovered.md), event. For more info, see [Handle pointer input](/windows/uwp/input-and-devices/handle-pointer-input).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.inkunprocessedinput
 * @namespace Windows.UI.Input.Inking
 * @version WindowsRuntime 1.4
 */
class InkUnprocessedInput extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IInkUnprocessedInput

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IInkUnprocessedInput.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the [InkPresenter](inkpresenter.md) object associated with the [InkCanvas](../windows.ui.xaml.controls/inkcanvas.md) control capturing the [InkStroke](inkstroke.md) data. The [InkPresenter](inkpresenter.md) does not process the input, instead the data is passed through for custom processing by the app.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.inkunprocessedinput.inkpresenter
     * @type {InkPresenter} 
     */
    InkPresenter {
        get => this.get_InkPresenter()
    }

    /**
     * Occurs when a pointer enters the hit test, or bounding, area of an [InkCanvas](../windows.ui.xaml.controls/inkcanvas.md) control.
     * @type {TypedEventHandler<InkUnprocessedInput, PointerEventArgs>}
    */
    OnPointerEntered {
        get {
            if(!this.HasProp("__OnPointerEntered")){
                this.__OnPointerEntered := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{4a86bd78-5bcf-5ede-8f65-a8c65235055c}"),
                    InkUnprocessedInput,
                    PointerEventArgs
                )
                this.__OnPointerEnteredToken := this.add_PointerEntered(this.__OnPointerEntered.iface)
            }
            return this.__OnPointerEntered
        }
    }

    /**
     * Occurs when a pointer is detected over, but not down or in contact with, the hit test, or bounding, area of an [InkCanvas](../windows.ui.xaml.controls/inkcanvas.md) control.
     * @type {TypedEventHandler<InkUnprocessedInput, PointerEventArgs>}
    */
    OnPointerHovered {
        get {
            if(!this.HasProp("__OnPointerHovered")){
                this.__OnPointerHovered := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{4a86bd78-5bcf-5ede-8f65-a8c65235055c}"),
                    InkUnprocessedInput,
                    PointerEventArgs
                )
                this.__OnPointerHoveredToken := this.add_PointerHovered(this.__OnPointerHovered.iface)
            }
            return this.__OnPointerHovered
        }
    }

    /**
     * Occurs when a pointer leaves the hit test, or bounding, area of an [InkCanvas](../windows.ui.xaml.controls/inkcanvas.md) control.
     * @type {TypedEventHandler<InkUnprocessedInput, PointerEventArgs>}
    */
    OnPointerExited {
        get {
            if(!this.HasProp("__OnPointerExited")){
                this.__OnPointerExited := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{4a86bd78-5bcf-5ede-8f65-a8c65235055c}"),
                    InkUnprocessedInput,
                    PointerEventArgs
                )
                this.__OnPointerExitedToken := this.add_PointerExited(this.__OnPointerExited.iface)
            }
            return this.__OnPointerExited
        }
    }

    /**
     * Occurs when a pointer registers contact within the hit test, or bounding, area of an [InkCanvas](../windows.ui.xaml.controls/inkcanvas.md) control. This can be when a mouse button is pressed or the digitizer surface is touched by a finger or pen.
     * @type {TypedEventHandler<InkUnprocessedInput, PointerEventArgs>}
    */
    OnPointerPressed {
        get {
            if(!this.HasProp("__OnPointerPressed")){
                this.__OnPointerPressed := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{4a86bd78-5bcf-5ede-8f65-a8c65235055c}"),
                    InkUnprocessedInput,
                    PointerEventArgs
                )
                this.__OnPointerPressedToken := this.add_PointerPressed(this.__OnPointerPressed.iface)
            }
            return this.__OnPointerPressed
        }
    }

    /**
     * Occurs when a pointer moves within the hit test, or bounding, area of an [InkCanvas](../windows.ui.xaml.controls/inkcanvas.md) control.
     * @remarks
     * Input from various devices (including touch, pen, and mouse) is received, processed, and managed as pointer input. User interactions based on any of these devices can produce a PointerMoved event. For more info, see [Handle pointer input](/windows/uwp/input-and-devices/handle-pointer-input).
     * @type {TypedEventHandler<InkUnprocessedInput, PointerEventArgs>}
    */
    OnPointerMoved {
        get {
            if(!this.HasProp("__OnPointerMoved")){
                this.__OnPointerMoved := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{4a86bd78-5bcf-5ede-8f65-a8c65235055c}"),
                    InkUnprocessedInput,
                    PointerEventArgs
                )
                this.__OnPointerMovedToken := this.add_PointerMoved(this.__OnPointerMoved.iface)
            }
            return this.__OnPointerMoved
        }
    }

    /**
     * Can occur when a pointer associated with a [PointerPressed](inkunprocessedinput_pointerpressed.md) event is lifted, or released, while within the hit test, or bounding, area of an [InkCanvas](../windows.ui.xaml.controls/inkcanvas.md) control.
     * 
     * PointerReleased is not guaranteed to occur in concert with [PointerPressed](inkunprocessedinput_pointerpressed.md), as [PointerLost](inkunprocessedinput_pointerlost.md) or [PointerExited](inkunprocessedinput_pointerexited.md) might occur instead. You should handle all events that can conclude [PointerPressed](inkunprocessedinput_pointerpressed.md).
     * 
     * Some reasons why PointerReleased might not occur include: 
     * + Differences in how specific hardware handles input
     * + A programmatic pointer capture from a different pointer
     * + User actions that change the relationship of the display area, such as changing resolution or monitor settings
     * + Input interactions such as a stylus touching the same surface as a previous touch action
     * @type {TypedEventHandler<InkUnprocessedInput, PointerEventArgs>}
    */
    OnPointerReleased {
        get {
            if(!this.HasProp("__OnPointerReleased")){
                this.__OnPointerReleased := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{4a86bd78-5bcf-5ede-8f65-a8c65235055c}"),
                    InkUnprocessedInput,
                    PointerEventArgs
                )
                this.__OnPointerReleasedToken := this.add_PointerReleased(this.__OnPointerReleased.iface)
            }
            return this.__OnPointerReleased
        }
    }

    /**
     * Occurs when a pointer is no longer detected in, or over, the hit test, or bounding, area of an [InkCanvas](../windows.ui.xaml.controls/inkcanvas.md) control.
     * 
     * Typically, a pointer is lost if the contact moves outside the [InkCanvas](../windows.ui.xaml.controls/inkcanvas.md) control or the contact is captured by another element.
     * @type {TypedEventHandler<InkUnprocessedInput, PointerEventArgs>}
    */
    OnPointerLost {
        get {
            if(!this.HasProp("__OnPointerLost")){
                this.__OnPointerLost := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{4a86bd78-5bcf-5ede-8f65-a8c65235055c}"),
                    InkUnprocessedInput,
                    PointerEventArgs
                )
                this.__OnPointerLostToken := this.add_PointerLost(this.__OnPointerLost.iface)
            }
            return this.__OnPointerLost
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnPointerEnteredToken")) {
            this.remove_PointerEntered(this.__OnPointerEnteredToken)
            this.__OnPointerEntered.iface.Dispose()
        }

        if(this.HasProp("__OnPointerHoveredToken")) {
            this.remove_PointerHovered(this.__OnPointerHoveredToken)
            this.__OnPointerHovered.iface.Dispose()
        }

        if(this.HasProp("__OnPointerExitedToken")) {
            this.remove_PointerExited(this.__OnPointerExitedToken)
            this.__OnPointerExited.iface.Dispose()
        }

        if(this.HasProp("__OnPointerPressedToken")) {
            this.remove_PointerPressed(this.__OnPointerPressedToken)
            this.__OnPointerPressed.iface.Dispose()
        }

        if(this.HasProp("__OnPointerMovedToken")) {
            this.remove_PointerMoved(this.__OnPointerMovedToken)
            this.__OnPointerMoved.iface.Dispose()
        }

        if(this.HasProp("__OnPointerReleasedToken")) {
            this.remove_PointerReleased(this.__OnPointerReleasedToken)
            this.__OnPointerReleased.iface.Dispose()
        }

        if(this.HasProp("__OnPointerLostToken")) {
            this.remove_PointerLost(this.__OnPointerLostToken)
            this.__OnPointerLost.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @param {TypedEventHandler<InkUnprocessedInput, PointerEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_PointerEntered(handler) {
        if (!this.HasProp("__IInkUnprocessedInput")) {
            if ((queryResult := this.QueryInterface(IInkUnprocessedInput.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkUnprocessedInput := IInkUnprocessedInput(outPtr)
        }

        return this.__IInkUnprocessedInput.add_PointerEntered(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} cookie 
     * @returns {HRESULT} 
     */
    remove_PointerEntered(cookie) {
        if (!this.HasProp("__IInkUnprocessedInput")) {
            if ((queryResult := this.QueryInterface(IInkUnprocessedInput.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkUnprocessedInput := IInkUnprocessedInput(outPtr)
        }

        return this.__IInkUnprocessedInput.remove_PointerEntered(cookie)
    }

    /**
     * 
     * @param {TypedEventHandler<InkUnprocessedInput, PointerEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_PointerHovered(handler) {
        if (!this.HasProp("__IInkUnprocessedInput")) {
            if ((queryResult := this.QueryInterface(IInkUnprocessedInput.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkUnprocessedInput := IInkUnprocessedInput(outPtr)
        }

        return this.__IInkUnprocessedInput.add_PointerHovered(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} cookie 
     * @returns {HRESULT} 
     */
    remove_PointerHovered(cookie) {
        if (!this.HasProp("__IInkUnprocessedInput")) {
            if ((queryResult := this.QueryInterface(IInkUnprocessedInput.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkUnprocessedInput := IInkUnprocessedInput(outPtr)
        }

        return this.__IInkUnprocessedInput.remove_PointerHovered(cookie)
    }

    /**
     * 
     * @param {TypedEventHandler<InkUnprocessedInput, PointerEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_PointerExited(handler) {
        if (!this.HasProp("__IInkUnprocessedInput")) {
            if ((queryResult := this.QueryInterface(IInkUnprocessedInput.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkUnprocessedInput := IInkUnprocessedInput(outPtr)
        }

        return this.__IInkUnprocessedInput.add_PointerExited(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} cookie 
     * @returns {HRESULT} 
     */
    remove_PointerExited(cookie) {
        if (!this.HasProp("__IInkUnprocessedInput")) {
            if ((queryResult := this.QueryInterface(IInkUnprocessedInput.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkUnprocessedInput := IInkUnprocessedInput(outPtr)
        }

        return this.__IInkUnprocessedInput.remove_PointerExited(cookie)
    }

    /**
     * 
     * @param {TypedEventHandler<InkUnprocessedInput, PointerEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_PointerPressed(handler) {
        if (!this.HasProp("__IInkUnprocessedInput")) {
            if ((queryResult := this.QueryInterface(IInkUnprocessedInput.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkUnprocessedInput := IInkUnprocessedInput(outPtr)
        }

        return this.__IInkUnprocessedInput.add_PointerPressed(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} cookie 
     * @returns {HRESULT} 
     */
    remove_PointerPressed(cookie) {
        if (!this.HasProp("__IInkUnprocessedInput")) {
            if ((queryResult := this.QueryInterface(IInkUnprocessedInput.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkUnprocessedInput := IInkUnprocessedInput(outPtr)
        }

        return this.__IInkUnprocessedInput.remove_PointerPressed(cookie)
    }

    /**
     * 
     * @param {TypedEventHandler<InkUnprocessedInput, PointerEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_PointerMoved(handler) {
        if (!this.HasProp("__IInkUnprocessedInput")) {
            if ((queryResult := this.QueryInterface(IInkUnprocessedInput.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkUnprocessedInput := IInkUnprocessedInput(outPtr)
        }

        return this.__IInkUnprocessedInput.add_PointerMoved(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} cookie 
     * @returns {HRESULT} 
     */
    remove_PointerMoved(cookie) {
        if (!this.HasProp("__IInkUnprocessedInput")) {
            if ((queryResult := this.QueryInterface(IInkUnprocessedInput.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkUnprocessedInput := IInkUnprocessedInput(outPtr)
        }

        return this.__IInkUnprocessedInput.remove_PointerMoved(cookie)
    }

    /**
     * 
     * @param {TypedEventHandler<InkUnprocessedInput, PointerEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_PointerReleased(handler) {
        if (!this.HasProp("__IInkUnprocessedInput")) {
            if ((queryResult := this.QueryInterface(IInkUnprocessedInput.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkUnprocessedInput := IInkUnprocessedInput(outPtr)
        }

        return this.__IInkUnprocessedInput.add_PointerReleased(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} cookie 
     * @returns {HRESULT} 
     */
    remove_PointerReleased(cookie) {
        if (!this.HasProp("__IInkUnprocessedInput")) {
            if ((queryResult := this.QueryInterface(IInkUnprocessedInput.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkUnprocessedInput := IInkUnprocessedInput(outPtr)
        }

        return this.__IInkUnprocessedInput.remove_PointerReleased(cookie)
    }

    /**
     * 
     * @param {TypedEventHandler<InkUnprocessedInput, PointerEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_PointerLost(handler) {
        if (!this.HasProp("__IInkUnprocessedInput")) {
            if ((queryResult := this.QueryInterface(IInkUnprocessedInput.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkUnprocessedInput := IInkUnprocessedInput(outPtr)
        }

        return this.__IInkUnprocessedInput.add_PointerLost(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} cookie 
     * @returns {HRESULT} 
     */
    remove_PointerLost(cookie) {
        if (!this.HasProp("__IInkUnprocessedInput")) {
            if ((queryResult := this.QueryInterface(IInkUnprocessedInput.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkUnprocessedInput := IInkUnprocessedInput(outPtr)
        }

        return this.__IInkUnprocessedInput.remove_PointerLost(cookie)
    }

    /**
     * 
     * @returns {InkPresenter} 
     */
    get_InkPresenter() {
        if (!this.HasProp("__IInkUnprocessedInput")) {
            if ((queryResult := this.QueryInterface(IInkUnprocessedInput.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkUnprocessedInput := IInkUnprocessedInput(outPtr)
        }

        return this.__IInkUnprocessedInput.get_InkPresenter()
    }

;@endregion Instance Methods
}
