#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Control.ahk
#Include .\IThumb.ahk
#Include .\IThumbStatics.ahk
#Include .\DragStartedEventHandler.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\DragStartedEventArgs.ahk
#Include .\DragDeltaEventHandler.ahk
#Include .\DragDeltaEventArgs.ahk
#Include .\DragCompletedEventHandler.ahk
#Include .\DragCompletedEventArgs.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\..\WinRTEventHandler.ahk

/**
 * Represents a control that can be dragged by the user.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.thumb
 * @namespace Windows.UI.Xaml.Controls.Primitives
 * @version WindowsRuntime 1.4
 */
class Thumb extends Control {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IThumb

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IThumb.IID

    /**
     * Identifies the [IsDragging](thumb_isdragging.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.thumb.isdraggingproperty
     * @type {DependencyProperty} 
     */
    static IsDraggingProperty {
        get => Thumb.get_IsDraggingProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_IsDraggingProperty() {
        if (!Thumb.HasProp("__IThumbStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Primitives.Thumb")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IThumbStatics.IID)
            Thumb.__IThumbStatics := IThumbStatics(factoryPtr)
        }

        return Thumb.__IThumbStatics.get_IsDraggingProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets whether the [Thumb](thumb.md) control has focus and mouse capture.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.thumb.isdragging
     * @type {Boolean} 
     */
    IsDragging {
        get => this.get_IsDragging()
    }

    /**
     * Fires when a [Thumb](thumb.md) control receives logical focus and mouse capture.
     * @type {DragStartedEventHandler}
    */
    OnDragStarted {
        get {
            if(!this.HasProp("__OnDragStarted")){
                this.__OnDragStarted := WinRTEventHandler(
                    DragStartedEventHandler,
                    DragStartedEventHandler.IID,
                    IInspectable,
                    DragStartedEventArgs
                )
                this.__OnDragStartedToken := this.add_DragStarted(this.__OnDragStarted.iface)
            }
            return this.__OnDragStarted
        }
    }

    /**
     * Fires one or more times as the mouse pointer is moved when a [Thumb](thumb.md) control has logical focus and mouse capture.
     * @type {DragDeltaEventHandler}
    */
    OnDragDelta {
        get {
            if(!this.HasProp("__OnDragDelta")){
                this.__OnDragDelta := WinRTEventHandler(
                    DragDeltaEventHandler,
                    DragDeltaEventHandler.IID,
                    IInspectable,
                    DragDeltaEventArgs
                )
                this.__OnDragDeltaToken := this.add_DragDelta(this.__OnDragDelta.iface)
            }
            return this.__OnDragDelta
        }
    }

    /**
     * Fires when the [Thumb](thumb.md) control loses mouse capture.
     * @type {DragCompletedEventHandler}
    */
    OnDragCompleted {
        get {
            if(!this.HasProp("__OnDragCompleted")){
                this.__OnDragCompleted := WinRTEventHandler(
                    DragCompletedEventHandler,
                    DragCompletedEventHandler.IID,
                    IInspectable,
                    DragCompletedEventArgs
                )
                this.__OnDragCompletedToken := this.add_DragCompleted(this.__OnDragCompleted.iface)
            }
            return this.__OnDragCompleted
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [Thumb](thumb.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Primitives.Thumb")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnDragStartedToken")) {
            this.remove_DragStarted(this.__OnDragStartedToken)
            this.__OnDragStarted.iface.Dispose()
        }

        if(this.HasProp("__OnDragDeltaToken")) {
            this.remove_DragDelta(this.__OnDragDeltaToken)
            this.__OnDragDelta.iface.Dispose()
        }

        if(this.HasProp("__OnDragCompletedToken")) {
            this.remove_DragCompleted(this.__OnDragCompletedToken)
            this.__OnDragCompleted.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsDragging() {
        if (!this.HasProp("__IThumb")) {
            if ((queryResult := this.QueryInterface(IThumb.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IThumb := IThumb(outPtr)
        }

        return this.__IThumb.get_IsDragging()
    }

    /**
     * 
     * @param {DragStartedEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_DragStarted(handler) {
        if (!this.HasProp("__IThumb")) {
            if ((queryResult := this.QueryInterface(IThumb.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IThumb := IThumb(outPtr)
        }

        return this.__IThumb.add_DragStarted(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_DragStarted(token) {
        if (!this.HasProp("__IThumb")) {
            if ((queryResult := this.QueryInterface(IThumb.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IThumb := IThumb(outPtr)
        }

        return this.__IThumb.remove_DragStarted(token)
    }

    /**
     * 
     * @param {DragDeltaEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_DragDelta(handler) {
        if (!this.HasProp("__IThumb")) {
            if ((queryResult := this.QueryInterface(IThumb.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IThumb := IThumb(outPtr)
        }

        return this.__IThumb.add_DragDelta(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_DragDelta(token) {
        if (!this.HasProp("__IThumb")) {
            if ((queryResult := this.QueryInterface(IThumb.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IThumb := IThumb(outPtr)
        }

        return this.__IThumb.remove_DragDelta(token)
    }

    /**
     * 
     * @param {DragCompletedEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_DragCompleted(handler) {
        if (!this.HasProp("__IThumb")) {
            if ((queryResult := this.QueryInterface(IThumb.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IThumb := IThumb(outPtr)
        }

        return this.__IThumb.add_DragCompleted(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_DragCompleted(token) {
        if (!this.HasProp("__IThumb")) {
            if ((queryResult := this.QueryInterface(IThumb.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IThumb := IThumb(outPtr)
        }

        return this.__IThumb.remove_DragCompleted(token)
    }

    /**
     * Cancels a drag operation for the [Thumb](thumb.md).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.thumb.canceldrag
     */
    CancelDrag() {
        if (!this.HasProp("__IThumb")) {
            if ((queryResult := this.QueryInterface(IThumb.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IThumb := IThumb(outPtr)
        }

        return this.__IThumb.CancelDrag()
    }

;@endregion Instance Methods
}
