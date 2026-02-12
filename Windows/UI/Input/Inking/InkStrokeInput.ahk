#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IInkStrokeInput.ahk
#Include ..\..\..\Foundation\TypedEventHandler.ahk
#Include .\InkStrokeInput.ahk
#Include ..\..\Core\PointerEventArgs.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\..\WinRTEventHandler.ahk

/**
 * Provides properties and events for [StrokeInput](inkpresenter_strokeinput.md) associated with an [InkPresenter](inkpresenter.md) object.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.inkstrokeinput
 * @namespace Windows.UI.Input.Inking
 * @version WindowsRuntime 1.4
 */
class InkStrokeInput extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IInkStrokeInput

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IInkStrokeInput.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the [InkPresenter](inkpresenter.md) object associated with the ink input data.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.inkstrokeinput.inkpresenter
     * @type {InkPresenter} 
     */
    InkPresenter {
        get => this.get_InkPresenter()
    }

    /**
     * Occurs when stroke input is first detected by an [InkPresenter](inkpresenter.md) object.
     * @type {TypedEventHandler<InkStrokeInput, PointerEventArgs>}
    */
    OnStrokeStarted {
        get {
            if(!this.HasProp("__OnStrokeStarted")){
                this.__OnStrokeStarted := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{bf66b962-702d-5c07-a2d5-15f21583c43a}"),
                    InkStrokeInput,
                    PointerEventArgs
                )
                this.__OnStrokeStartedToken := this.add_StrokeStarted(this.__OnStrokeStarted.iface)
            }
            return this.__OnStrokeStarted
        }
    }

    /**
     * Occurs when stroke input has started ([StrokeStarted](inkstrokeinput_strokestarted.md)) and continues to be captured by an [InkPresenter](inkpresenter.md) object.
     * @type {TypedEventHandler<InkStrokeInput, PointerEventArgs>}
    */
    OnStrokeContinued {
        get {
            if(!this.HasProp("__OnStrokeContinued")){
                this.__OnStrokeContinued := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{bf66b962-702d-5c07-a2d5-15f21583c43a}"),
                    InkStrokeInput,
                    PointerEventArgs
                )
                this.__OnStrokeContinuedToken := this.add_StrokeContinued(this.__OnStrokeContinued.iface)
            }
            return this.__OnStrokeContinued
        }
    }

    /**
     * Occurs when stroke input has stopped being detected by an [InkPresenter](inkpresenter.md) object.
     * @type {TypedEventHandler<InkStrokeInput, PointerEventArgs>}
    */
    OnStrokeEnded {
        get {
            if(!this.HasProp("__OnStrokeEnded")){
                this.__OnStrokeEnded := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{bf66b962-702d-5c07-a2d5-15f21583c43a}"),
                    InkStrokeInput,
                    PointerEventArgs
                )
                this.__OnStrokeEndedToken := this.add_StrokeEnded(this.__OnStrokeEnded.iface)
            }
            return this.__OnStrokeEnded
        }
    }

    /**
     * Occurs when ink input bubbles up to another system event handler, such as a context menu.
     * @type {TypedEventHandler<InkStrokeInput, PointerEventArgs>}
    */
    OnStrokeCanceled {
        get {
            if(!this.HasProp("__OnStrokeCanceled")){
                this.__OnStrokeCanceled := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{bf66b962-702d-5c07-a2d5-15f21583c43a}"),
                    InkStrokeInput,
                    PointerEventArgs
                )
                this.__OnStrokeCanceledToken := this.add_StrokeCanceled(this.__OnStrokeCanceled.iface)
            }
            return this.__OnStrokeCanceled
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnStrokeStartedToken")) {
            this.remove_StrokeStarted(this.__OnStrokeStartedToken)
            this.__OnStrokeStarted.iface.Dispose()
        }

        if(this.HasProp("__OnStrokeContinuedToken")) {
            this.remove_StrokeContinued(this.__OnStrokeContinuedToken)
            this.__OnStrokeContinued.iface.Dispose()
        }

        if(this.HasProp("__OnStrokeEndedToken")) {
            this.remove_StrokeEnded(this.__OnStrokeEndedToken)
            this.__OnStrokeEnded.iface.Dispose()
        }

        if(this.HasProp("__OnStrokeCanceledToken")) {
            this.remove_StrokeCanceled(this.__OnStrokeCanceledToken)
            this.__OnStrokeCanceled.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @param {TypedEventHandler<InkStrokeInput, PointerEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_StrokeStarted(handler) {
        if (!this.HasProp("__IInkStrokeInput")) {
            if ((queryResult := this.QueryInterface(IInkStrokeInput.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkStrokeInput := IInkStrokeInput(outPtr)
        }

        return this.__IInkStrokeInput.add_StrokeStarted(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} cookie 
     * @returns {HRESULT} 
     */
    remove_StrokeStarted(cookie) {
        if (!this.HasProp("__IInkStrokeInput")) {
            if ((queryResult := this.QueryInterface(IInkStrokeInput.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkStrokeInput := IInkStrokeInput(outPtr)
        }

        return this.__IInkStrokeInput.remove_StrokeStarted(cookie)
    }

    /**
     * 
     * @param {TypedEventHandler<InkStrokeInput, PointerEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_StrokeContinued(handler) {
        if (!this.HasProp("__IInkStrokeInput")) {
            if ((queryResult := this.QueryInterface(IInkStrokeInput.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkStrokeInput := IInkStrokeInput(outPtr)
        }

        return this.__IInkStrokeInput.add_StrokeContinued(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} cookie 
     * @returns {HRESULT} 
     */
    remove_StrokeContinued(cookie) {
        if (!this.HasProp("__IInkStrokeInput")) {
            if ((queryResult := this.QueryInterface(IInkStrokeInput.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkStrokeInput := IInkStrokeInput(outPtr)
        }

        return this.__IInkStrokeInput.remove_StrokeContinued(cookie)
    }

    /**
     * 
     * @param {TypedEventHandler<InkStrokeInput, PointerEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_StrokeEnded(handler) {
        if (!this.HasProp("__IInkStrokeInput")) {
            if ((queryResult := this.QueryInterface(IInkStrokeInput.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkStrokeInput := IInkStrokeInput(outPtr)
        }

        return this.__IInkStrokeInput.add_StrokeEnded(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} cookie 
     * @returns {HRESULT} 
     */
    remove_StrokeEnded(cookie) {
        if (!this.HasProp("__IInkStrokeInput")) {
            if ((queryResult := this.QueryInterface(IInkStrokeInput.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkStrokeInput := IInkStrokeInput(outPtr)
        }

        return this.__IInkStrokeInput.remove_StrokeEnded(cookie)
    }

    /**
     * 
     * @param {TypedEventHandler<InkStrokeInput, PointerEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_StrokeCanceled(handler) {
        if (!this.HasProp("__IInkStrokeInput")) {
            if ((queryResult := this.QueryInterface(IInkStrokeInput.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkStrokeInput := IInkStrokeInput(outPtr)
        }

        return this.__IInkStrokeInput.add_StrokeCanceled(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} cookie 
     * @returns {HRESULT} 
     */
    remove_StrokeCanceled(cookie) {
        if (!this.HasProp("__IInkStrokeInput")) {
            if ((queryResult := this.QueryInterface(IInkStrokeInput.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkStrokeInput := IInkStrokeInput(outPtr)
        }

        return this.__IInkStrokeInput.remove_StrokeCanceled(cookie)
    }

    /**
     * 
     * @returns {InkPresenter} 
     */
    get_InkPresenter() {
        if (!this.HasProp("__IInkStrokeInput")) {
            if ((queryResult := this.QueryInterface(IInkStrokeInput.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkStrokeInput := IInkStrokeInput(outPtr)
        }

        return this.__IInkStrokeInput.get_InkPresenter()
    }

;@endregion Instance Methods
}
