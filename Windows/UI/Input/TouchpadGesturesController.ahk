#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ITouchpadGesturesController.ahk
#Include .\ITouchpadGesturesControllerStatics.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\TouchpadGesturesController.ahk
#Include ..\Core\PointerEventArgs.ahk
#Include .\TouchpadGlobalActionEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * @namespace Windows.UI.Input
 * @version WindowsRuntime 1.4
 */
class TouchpadGesturesController extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ITouchpadGesturesController

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ITouchpadGesturesController.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {Boolean} 
     */
    static IsSupported() {
        if (!TouchpadGesturesController.HasProp("__ITouchpadGesturesControllerStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Input.TouchpadGesturesController")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITouchpadGesturesControllerStatics.IID)
            TouchpadGesturesController.__ITouchpadGesturesControllerStatics := ITouchpadGesturesControllerStatics(factoryPtr)
        }

        return TouchpadGesturesController.__ITouchpadGesturesControllerStatics.IsSupported()
    }

    /**
     * 
     * @returns {TouchpadGesturesController} 
     */
    static CreateForProcess() {
        if (!TouchpadGesturesController.HasProp("__ITouchpadGesturesControllerStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Input.TouchpadGesturesController")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITouchpadGesturesControllerStatics.IID)
            TouchpadGesturesController.__ITouchpadGesturesControllerStatics := ITouchpadGesturesControllerStatics(factoryPtr)
        }

        return TouchpadGesturesController.__ITouchpadGesturesControllerStatics.CreateForProcess()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * @type {Boolean} 
     */
    Enabled {
        get => this.get_Enabled()
        set => this.put_Enabled(value)
    }

    /**
     * @type {Integer} 
     */
    SupportedGestures {
        get => this.get_SupportedGestures()
        set => this.put_SupportedGestures(value)
    }

    OnPointerPressed {
        get {
            if(!this.HasProp("__OnPointerPressed")){
                this.__OnPointerPressed := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{0b05a28c-2064-5b06-94f3-324fb004ece0}"),
                    TouchpadGesturesController,
                    PointerEventArgs
                )
                this.__OnPointerPressedToken := this.add_PointerPressed(this.__OnPointerPressed.iface)
            }
            return this.__OnPointerPressed
        }
    }

    OnPointerMoved {
        get {
            if(!this.HasProp("__OnPointerMoved")){
                this.__OnPointerMoved := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{0b05a28c-2064-5b06-94f3-324fb004ece0}"),
                    TouchpadGesturesController,
                    PointerEventArgs
                )
                this.__OnPointerMovedToken := this.add_PointerMoved(this.__OnPointerMoved.iface)
            }
            return this.__OnPointerMoved
        }
    }

    OnPointerReleased {
        get {
            if(!this.HasProp("__OnPointerReleased")){
                this.__OnPointerReleased := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{0b05a28c-2064-5b06-94f3-324fb004ece0}"),
                    TouchpadGesturesController,
                    PointerEventArgs
                )
                this.__OnPointerReleasedToken := this.add_PointerReleased(this.__OnPointerReleased.iface)
            }
            return this.__OnPointerReleased
        }
    }

    OnGlobalActionPerformed {
        get {
            if(!this.HasProp("__OnGlobalActionPerformed")){
                this.__OnGlobalActionPerformed := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{3fdb14d0-c3b2-576e-b900-aaa14e0ff77c}"),
                    TouchpadGesturesController,
                    TouchpadGlobalActionEventArgs
                )
                this.__OnGlobalActionPerformedToken := this.add_GlobalActionPerformed(this.__OnGlobalActionPerformed.iface)
            }
            return this.__OnGlobalActionPerformed
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
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

        if(this.HasProp("__OnGlobalActionPerformedToken")) {
            this.remove_GlobalActionPerformed(this.__OnGlobalActionPerformedToken)
            this.__OnGlobalActionPerformed.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Enabled() {
        if (!this.HasProp("__ITouchpadGesturesController")) {
            if ((queryResult := this.QueryInterface(ITouchpadGesturesController.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITouchpadGesturesController := ITouchpadGesturesController(outPtr)
        }

        return this.__ITouchpadGesturesController.get_Enabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_Enabled(value) {
        if (!this.HasProp("__ITouchpadGesturesController")) {
            if ((queryResult := this.QueryInterface(ITouchpadGesturesController.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITouchpadGesturesController := ITouchpadGesturesController(outPtr)
        }

        return this.__ITouchpadGesturesController.put_Enabled(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SupportedGestures() {
        if (!this.HasProp("__ITouchpadGesturesController")) {
            if ((queryResult := this.QueryInterface(ITouchpadGesturesController.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITouchpadGesturesController := ITouchpadGesturesController(outPtr)
        }

        return this.__ITouchpadGesturesController.get_SupportedGestures()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_SupportedGestures(value) {
        if (!this.HasProp("__ITouchpadGesturesController")) {
            if ((queryResult := this.QueryInterface(ITouchpadGesturesController.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITouchpadGesturesController := ITouchpadGesturesController(outPtr)
        }

        return this.__ITouchpadGesturesController.put_SupportedGestures(value)
    }

    /**
     * 
     * @param {TypedEventHandler<TouchpadGesturesController, PointerEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_PointerPressed(handler) {
        if (!this.HasProp("__ITouchpadGesturesController")) {
            if ((queryResult := this.QueryInterface(ITouchpadGesturesController.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITouchpadGesturesController := ITouchpadGesturesController(outPtr)
        }

        return this.__ITouchpadGesturesController.add_PointerPressed(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_PointerPressed(token) {
        if (!this.HasProp("__ITouchpadGesturesController")) {
            if ((queryResult := this.QueryInterface(ITouchpadGesturesController.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITouchpadGesturesController := ITouchpadGesturesController(outPtr)
        }

        return this.__ITouchpadGesturesController.remove_PointerPressed(token)
    }

    /**
     * 
     * @param {TypedEventHandler<TouchpadGesturesController, PointerEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_PointerMoved(handler) {
        if (!this.HasProp("__ITouchpadGesturesController")) {
            if ((queryResult := this.QueryInterface(ITouchpadGesturesController.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITouchpadGesturesController := ITouchpadGesturesController(outPtr)
        }

        return this.__ITouchpadGesturesController.add_PointerMoved(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_PointerMoved(token) {
        if (!this.HasProp("__ITouchpadGesturesController")) {
            if ((queryResult := this.QueryInterface(ITouchpadGesturesController.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITouchpadGesturesController := ITouchpadGesturesController(outPtr)
        }

        return this.__ITouchpadGesturesController.remove_PointerMoved(token)
    }

    /**
     * 
     * @param {TypedEventHandler<TouchpadGesturesController, PointerEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_PointerReleased(handler) {
        if (!this.HasProp("__ITouchpadGesturesController")) {
            if ((queryResult := this.QueryInterface(ITouchpadGesturesController.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITouchpadGesturesController := ITouchpadGesturesController(outPtr)
        }

        return this.__ITouchpadGesturesController.add_PointerReleased(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_PointerReleased(token) {
        if (!this.HasProp("__ITouchpadGesturesController")) {
            if ((queryResult := this.QueryInterface(ITouchpadGesturesController.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITouchpadGesturesController := ITouchpadGesturesController(outPtr)
        }

        return this.__ITouchpadGesturesController.remove_PointerReleased(token)
    }

    /**
     * 
     * @param {TypedEventHandler<TouchpadGesturesController, TouchpadGlobalActionEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_GlobalActionPerformed(handler) {
        if (!this.HasProp("__ITouchpadGesturesController")) {
            if ((queryResult := this.QueryInterface(ITouchpadGesturesController.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITouchpadGesturesController := ITouchpadGesturesController(outPtr)
        }

        return this.__ITouchpadGesturesController.add_GlobalActionPerformed(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_GlobalActionPerformed(token) {
        if (!this.HasProp("__ITouchpadGesturesController")) {
            if ((queryResult := this.QueryInterface(ITouchpadGesturesController.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITouchpadGesturesController := ITouchpadGesturesController(outPtr)
        }

        return this.__ITouchpadGesturesController.remove_GlobalActionPerformed(token)
    }

;@endregion Instance Methods
}
