#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ICoreInkIndependentInputSource.ahk
#Include .\ICoreInkIndependentInputSource2.ahk
#Include .\ICoreInkIndependentInputSourceStatics.ahk
#Include ..\..\..\..\Foundation\TypedEventHandler.ahk
#Include .\CoreInkIndependentInputSource.ahk
#Include ..\..\..\Core\PointerEventArgs.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\..\WinRTEventHandler.ahk

/**
 * Provides properties, methods, and events for handling pointer input prior to processing by an [InkPresenter](../windows.ui.input.inking/inkpresenter.md) object.
  * 
  * > [!IMPORTANT]
  * > These events occur on the ink background thread. For this reason, ensure any custom processing of ink input is as lightweight as possible to avoid degraded performance and to keep your app as responsive as possible.
 * @remarks
 * Standard [Windows.UI.Input.Inking](../windows.ui.input.inking/windows_ui_input_inking.md) events occur after ink strokes have been rendered.
 * 
 * Use the [Windows.UI.Input.Inking.Core](windows_ui_input_inking_core.md) pointer events to intercept raw pointer data and suppress, or cancel, ink rendering at any point along a stroke. This can be useful when protecting existing ink strokes or providing custom gesture support, such as press and hold, without creating ink artifacts.
 * 
 * Input from various devices (including touch, pen, and mouse) is received, processed, and managed as pointer input. User interactions from any of these devices can produce the following events. For more info, see [Handle pointer input](/windows/uwp/input-and-devices/handle-pointer-input).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.core.coreinkindependentinputsource
 * @namespace Windows.UI.Input.Inking.Core
 * @version WindowsRuntime 1.4
 */
class CoreInkIndependentInputSource extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICoreInkIndependentInputSource

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICoreInkIndependentInputSource.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Retrieves a [CoreInkIndependentInputSource](coreinkindependentinputsource.md) object for handling pointer input prior to processing by an [InkPresenter](../windows.ui.input.inking/inkpresenter.md) object.
     * @param {InkPresenter} inkPresenter_ Object that manages the input, processing, and rendering of [InkStroke](../windows.ui.input.inking/inkstroke.md) data for an [InkCanvas](../windows.ui.xaml.controls/inkcanvas.md) control.
     * @returns {CoreInkIndependentInputSource} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.core.coreinkindependentinputsource.create
     */
    static Create(inkPresenter_) {
        if (!CoreInkIndependentInputSource.HasProp("__ICoreInkIndependentInputSourceStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Input.Inking.Core.CoreInkIndependentInputSource")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICoreInkIndependentInputSourceStatics.IID)
            CoreInkIndependentInputSource.__ICoreInkIndependentInputSourceStatics := ICoreInkIndependentInputSourceStatics(factoryPtr)
        }

        return CoreInkIndependentInputSource.__ICoreInkIndependentInputSourceStatics.Create(inkPresenter_)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the [InkPresenter](../windows.ui.input.inking/inkpresenter.md) object that manages the input, processing, and rendering of ink stroke data.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.core.coreinkindependentinputsource.inkpresenter
     * @type {InkPresenter} 
     */
    InkPresenter {
        get => this.get_InkPresenter()
    }

    /**
     * Gets or sets the pointer cursor used when inking.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.core.coreinkindependentinputsource.pointercursor
     * @type {CoreCursor} 
     */
    PointerCursor {
        get => this.get_PointerCursor()
        set => this.put_PointerCursor(value)
    }

    /**
     * Occurs as a pointer is detected entering the hit test, or bounding, area of the [InkCanvas](../windows.ui.xaml.controls/inkcanvas.md) associated with the [InkPresenter](coreinkindependentinputsource_inkpresenter.md) object.
     * @type {TypedEventHandler<CoreInkIndependentInputSource, PointerEventArgs>}
    */
    OnPointerEntering {
        get {
            if(!this.HasProp("__OnPointerEntering")){
                this.__OnPointerEntering := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{b83fbe98-882a-5b69-bd1c-c66690707fef}"),
                    CoreInkIndependentInputSource,
                    PointerEventArgs
                )
                this.__OnPointerEnteringToken := this.add_PointerEntering(this.__OnPointerEntering.iface)
            }
            return this.__OnPointerEntering
        }
    }

    /**
     * Occurs as a pointer is detected over, but not down or in contact with, the hit test, or bounding, area of the [InkCanvas](../windows.ui.xaml.controls/inkcanvas.md) associated with the [InkPresenter](coreinkindependentinputsource_inkpresenter.md) object.
     * @type {TypedEventHandler<CoreInkIndependentInputSource, PointerEventArgs>}
    */
    OnPointerHovering {
        get {
            if(!this.HasProp("__OnPointerHovering")){
                this.__OnPointerHovering := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{b83fbe98-882a-5b69-bd1c-c66690707fef}"),
                    CoreInkIndependentInputSource,
                    PointerEventArgs
                )
                this.__OnPointerHoveringToken := this.add_PointerHovering(this.__OnPointerHovering.iface)
            }
            return this.__OnPointerHovering
        }
    }

    /**
     * Occurs as a pointer is detected leaving the hit test, or bounding, area of the [InkCanvas](../windows.ui.xaml.controls/inkcanvas.md) associated with the [InkPresenter](coreinkindependentinputsource_inkpresenter.md) object.
     * @type {TypedEventHandler<CoreInkIndependentInputSource, PointerEventArgs>}
    */
    OnPointerExiting {
        get {
            if(!this.HasProp("__OnPointerExiting")){
                this.__OnPointerExiting := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{b83fbe98-882a-5b69-bd1c-c66690707fef}"),
                    CoreInkIndependentInputSource,
                    PointerEventArgs
                )
                this.__OnPointerExitingToken := this.add_PointerExiting(this.__OnPointerExiting.iface)
            }
            return this.__OnPointerExiting
        }
    }

    /**
     * Occurs as a pointer registers contact within the hit test, or bounding, area of the [InkCanvas](../windows.ui.xaml.controls/inkcanvas.md) associated with the [InkPresenter](coreinkindependentinputsource_inkpresenter.md) object. This can be when a mouse button is pressed or the digitizer surface is touched by a finger or pen.
     * @type {TypedEventHandler<CoreInkIndependentInputSource, PointerEventArgs>}
    */
    OnPointerPressing {
        get {
            if(!this.HasProp("__OnPointerPressing")){
                this.__OnPointerPressing := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{b83fbe98-882a-5b69-bd1c-c66690707fef}"),
                    CoreInkIndependentInputSource,
                    PointerEventArgs
                )
                this.__OnPointerPressingToken := this.add_PointerPressing(this.__OnPointerPressing.iface)
            }
            return this.__OnPointerPressing
        }
    }

    /**
     * Occurs as a pointer moves within the hit test, or bounding, area of the [InkCanvas](../windows.ui.xaml.controls/inkcanvas.md) associated with the [InkPresenter](coreinkindependentinputsource_inkpresenter.md) object.
     * @type {TypedEventHandler<CoreInkIndependentInputSource, PointerEventArgs>}
    */
    OnPointerMoving {
        get {
            if(!this.HasProp("__OnPointerMoving")){
                this.__OnPointerMoving := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{b83fbe98-882a-5b69-bd1c-c66690707fef}"),
                    CoreInkIndependentInputSource,
                    PointerEventArgs
                )
                this.__OnPointerMovingToken := this.add_PointerMoving(this.__OnPointerMoving.iface)
            }
            return this.__OnPointerMoving
        }
    }

    /**
     * Can occur as a pointer associated with a [PointerPressing](coreinkindependentinputsource_pointerpressing.md) event is lifted, or released, while within the hit test, or bounding, area of the [InkCanvas](../windows.ui.xaml.controls/inkcanvas.md) associated with the [InkPresenter](coreinkindependentinputsource_inkpresenter.md) object.
     * 
     * PointerReleasing is not guaranteed to occur in concert with [PointerPressing](coreinkindependentinputsource_pointerpressing.md), as [PointerLost](coreinkindependentinputsource_pointerlost.md) or [PointerExiting](coreinkindependentinputsource_pointerexiting.md) might occur instead. You should handle all events that can conclude [PointerPressing](coreinkindependentinputsource_pointerpressing.md).
     * 
     * Some reasons why PointerReleasing might not occur include:
     * 
     * - Differences in how specific hardware handles input
     * - A programmatic pointer capture from a different pointer
     * - User actions that change the relationship of the display area, such as changing resolution or monitor settings
     * - Input interactions such as a stylus touching the same surface as a previous touch action
     * @type {TypedEventHandler<CoreInkIndependentInputSource, PointerEventArgs>}
    */
    OnPointerReleasing {
        get {
            if(!this.HasProp("__OnPointerReleasing")){
                this.__OnPointerReleasing := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{b83fbe98-882a-5b69-bd1c-c66690707fef}"),
                    CoreInkIndependentInputSource,
                    PointerEventArgs
                )
                this.__OnPointerReleasingToken := this.add_PointerReleasing(this.__OnPointerReleasing.iface)
            }
            return this.__OnPointerReleasing
        }
    }

    /**
     * Occurs as a pointer is no longer detected in, or over, the hit test, or bounding, area of the [InkCanvas](../windows.ui.xaml.controls/inkcanvas.md) associated with the [InkPresenter](coreinkindependentinputsource_inkpresenter.md) object.
     * 
     * Typically, a pointer is lost if the contact moves outside the [InkCanvas](../windows.ui.xaml.controls/inkcanvas.md) control or the contact is captured by another element.
     * @type {TypedEventHandler<CoreInkIndependentInputSource, PointerEventArgs>}
    */
    OnPointerLost {
        get {
            if(!this.HasProp("__OnPointerLost")){
                this.__OnPointerLost := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{b83fbe98-882a-5b69-bd1c-c66690707fef}"),
                    CoreInkIndependentInputSource,
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
        if(this.HasProp("__OnPointerEnteringToken")) {
            this.remove_PointerEntering(this.__OnPointerEnteringToken)
            this.__OnPointerEntering.iface.Dispose()
        }

        if(this.HasProp("__OnPointerHoveringToken")) {
            this.remove_PointerHovering(this.__OnPointerHoveringToken)
            this.__OnPointerHovering.iface.Dispose()
        }

        if(this.HasProp("__OnPointerExitingToken")) {
            this.remove_PointerExiting(this.__OnPointerExitingToken)
            this.__OnPointerExiting.iface.Dispose()
        }

        if(this.HasProp("__OnPointerPressingToken")) {
            this.remove_PointerPressing(this.__OnPointerPressingToken)
            this.__OnPointerPressing.iface.Dispose()
        }

        if(this.HasProp("__OnPointerMovingToken")) {
            this.remove_PointerMoving(this.__OnPointerMovingToken)
            this.__OnPointerMoving.iface.Dispose()
        }

        if(this.HasProp("__OnPointerReleasingToken")) {
            this.remove_PointerReleasing(this.__OnPointerReleasingToken)
            this.__OnPointerReleasing.iface.Dispose()
        }

        if(this.HasProp("__OnPointerLostToken")) {
            this.remove_PointerLost(this.__OnPointerLostToken)
            this.__OnPointerLost.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @param {TypedEventHandler<CoreInkIndependentInputSource, PointerEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_PointerEntering(handler) {
        if (!this.HasProp("__ICoreInkIndependentInputSource")) {
            if ((queryResult := this.QueryInterface(ICoreInkIndependentInputSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreInkIndependentInputSource := ICoreInkIndependentInputSource(outPtr)
        }

        return this.__ICoreInkIndependentInputSource.add_PointerEntering(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} cookie 
     * @returns {HRESULT} 
     */
    remove_PointerEntering(cookie) {
        if (!this.HasProp("__ICoreInkIndependentInputSource")) {
            if ((queryResult := this.QueryInterface(ICoreInkIndependentInputSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreInkIndependentInputSource := ICoreInkIndependentInputSource(outPtr)
        }

        return this.__ICoreInkIndependentInputSource.remove_PointerEntering(cookie)
    }

    /**
     * 
     * @param {TypedEventHandler<CoreInkIndependentInputSource, PointerEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_PointerHovering(handler) {
        if (!this.HasProp("__ICoreInkIndependentInputSource")) {
            if ((queryResult := this.QueryInterface(ICoreInkIndependentInputSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreInkIndependentInputSource := ICoreInkIndependentInputSource(outPtr)
        }

        return this.__ICoreInkIndependentInputSource.add_PointerHovering(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} cookie 
     * @returns {HRESULT} 
     */
    remove_PointerHovering(cookie) {
        if (!this.HasProp("__ICoreInkIndependentInputSource")) {
            if ((queryResult := this.QueryInterface(ICoreInkIndependentInputSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreInkIndependentInputSource := ICoreInkIndependentInputSource(outPtr)
        }

        return this.__ICoreInkIndependentInputSource.remove_PointerHovering(cookie)
    }

    /**
     * 
     * @param {TypedEventHandler<CoreInkIndependentInputSource, PointerEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_PointerExiting(handler) {
        if (!this.HasProp("__ICoreInkIndependentInputSource")) {
            if ((queryResult := this.QueryInterface(ICoreInkIndependentInputSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreInkIndependentInputSource := ICoreInkIndependentInputSource(outPtr)
        }

        return this.__ICoreInkIndependentInputSource.add_PointerExiting(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} cookie 
     * @returns {HRESULT} 
     */
    remove_PointerExiting(cookie) {
        if (!this.HasProp("__ICoreInkIndependentInputSource")) {
            if ((queryResult := this.QueryInterface(ICoreInkIndependentInputSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreInkIndependentInputSource := ICoreInkIndependentInputSource(outPtr)
        }

        return this.__ICoreInkIndependentInputSource.remove_PointerExiting(cookie)
    }

    /**
     * 
     * @param {TypedEventHandler<CoreInkIndependentInputSource, PointerEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_PointerPressing(handler) {
        if (!this.HasProp("__ICoreInkIndependentInputSource")) {
            if ((queryResult := this.QueryInterface(ICoreInkIndependentInputSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreInkIndependentInputSource := ICoreInkIndependentInputSource(outPtr)
        }

        return this.__ICoreInkIndependentInputSource.add_PointerPressing(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} cookie 
     * @returns {HRESULT} 
     */
    remove_PointerPressing(cookie) {
        if (!this.HasProp("__ICoreInkIndependentInputSource")) {
            if ((queryResult := this.QueryInterface(ICoreInkIndependentInputSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreInkIndependentInputSource := ICoreInkIndependentInputSource(outPtr)
        }

        return this.__ICoreInkIndependentInputSource.remove_PointerPressing(cookie)
    }

    /**
     * 
     * @param {TypedEventHandler<CoreInkIndependentInputSource, PointerEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_PointerMoving(handler) {
        if (!this.HasProp("__ICoreInkIndependentInputSource")) {
            if ((queryResult := this.QueryInterface(ICoreInkIndependentInputSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreInkIndependentInputSource := ICoreInkIndependentInputSource(outPtr)
        }

        return this.__ICoreInkIndependentInputSource.add_PointerMoving(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} cookie 
     * @returns {HRESULT} 
     */
    remove_PointerMoving(cookie) {
        if (!this.HasProp("__ICoreInkIndependentInputSource")) {
            if ((queryResult := this.QueryInterface(ICoreInkIndependentInputSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreInkIndependentInputSource := ICoreInkIndependentInputSource(outPtr)
        }

        return this.__ICoreInkIndependentInputSource.remove_PointerMoving(cookie)
    }

    /**
     * 
     * @param {TypedEventHandler<CoreInkIndependentInputSource, PointerEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_PointerReleasing(handler) {
        if (!this.HasProp("__ICoreInkIndependentInputSource")) {
            if ((queryResult := this.QueryInterface(ICoreInkIndependentInputSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreInkIndependentInputSource := ICoreInkIndependentInputSource(outPtr)
        }

        return this.__ICoreInkIndependentInputSource.add_PointerReleasing(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} cookie 
     * @returns {HRESULT} 
     */
    remove_PointerReleasing(cookie) {
        if (!this.HasProp("__ICoreInkIndependentInputSource")) {
            if ((queryResult := this.QueryInterface(ICoreInkIndependentInputSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreInkIndependentInputSource := ICoreInkIndependentInputSource(outPtr)
        }

        return this.__ICoreInkIndependentInputSource.remove_PointerReleasing(cookie)
    }

    /**
     * 
     * @param {TypedEventHandler<CoreInkIndependentInputSource, PointerEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_PointerLost(handler) {
        if (!this.HasProp("__ICoreInkIndependentInputSource")) {
            if ((queryResult := this.QueryInterface(ICoreInkIndependentInputSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreInkIndependentInputSource := ICoreInkIndependentInputSource(outPtr)
        }

        return this.__ICoreInkIndependentInputSource.add_PointerLost(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} cookie 
     * @returns {HRESULT} 
     */
    remove_PointerLost(cookie) {
        if (!this.HasProp("__ICoreInkIndependentInputSource")) {
            if ((queryResult := this.QueryInterface(ICoreInkIndependentInputSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreInkIndependentInputSource := ICoreInkIndependentInputSource(outPtr)
        }

        return this.__ICoreInkIndependentInputSource.remove_PointerLost(cookie)
    }

    /**
     * 
     * @returns {InkPresenter} 
     */
    get_InkPresenter() {
        if (!this.HasProp("__ICoreInkIndependentInputSource")) {
            if ((queryResult := this.QueryInterface(ICoreInkIndependentInputSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreInkIndependentInputSource := ICoreInkIndependentInputSource(outPtr)
        }

        return this.__ICoreInkIndependentInputSource.get_InkPresenter()
    }

    /**
     * 
     * @returns {CoreCursor} 
     */
    get_PointerCursor() {
        if (!this.HasProp("__ICoreInkIndependentInputSource2")) {
            if ((queryResult := this.QueryInterface(ICoreInkIndependentInputSource2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreInkIndependentInputSource2 := ICoreInkIndependentInputSource2(outPtr)
        }

        return this.__ICoreInkIndependentInputSource2.get_PointerCursor()
    }

    /**
     * 
     * @param {CoreCursor} value 
     * @returns {HRESULT} 
     */
    put_PointerCursor(value) {
        if (!this.HasProp("__ICoreInkIndependentInputSource2")) {
            if ((queryResult := this.QueryInterface(ICoreInkIndependentInputSource2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICoreInkIndependentInputSource2 := ICoreInkIndependentInputSource2(outPtr)
        }

        return this.__ICoreInkIndependentInputSource2.put_PointerCursor(value)
    }

;@endregion Instance Methods
}
