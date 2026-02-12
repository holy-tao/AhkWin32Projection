#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISpatialInteractionControllerProperties.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents state specific to motion controllers.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.input.spatial.spatialinteractioncontrollerproperties
 * @namespace Windows.UI.Input.Spatial
 * @version WindowsRuntime 1.4
 */
class SpatialInteractionControllerProperties extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISpatialInteractionControllerProperties

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISpatialInteractionControllerProperties.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets whether a motion controller is experiencing a touchpad touch.
     * @remarks
     * A touchpad touch represents the user's finger being in contact with the touchpad.
     * 
     * Inspect [TouchpadX](spatialinteractioncontrollerproperties_touchpadx.md) and [TouchpadY](spatialinteractioncontrollerproperties_touchpady.md) to determine where the user's finger is contacting the touchpad.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.spatial.spatialinteractioncontrollerproperties.istouchpadtouched
     * @type {Boolean} 
     */
    IsTouchpadTouched {
        get => this.get_IsTouchpadTouched()
    }

    /**
     * Gets whether a motion controller is experiencing a touchpad press.
     * @remarks
     * A touchpad press represents the user clicking down on the touchpad.
     * 
     * Inspect [TouchpadX](spatialinteractioncontrollerproperties_touchpadx.md) and [TouchpadY](spatialinteractioncontrollerproperties_touchpady.md) to determine where the user's finger is contacting the touchpad.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.spatial.spatialinteractioncontrollerproperties.istouchpadpressed
     * @type {Boolean} 
     */
    IsTouchpadPressed {
        get => this.get_IsTouchpadPressed()
    }

    /**
     * Gets whether a motion controller is experiencing a thumbstick press.
     * @remarks
     * A touchpad press represents the user clicking down on the thumbstick.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.spatial.spatialinteractioncontrollerproperties.isthumbstickpressed
     * @type {Boolean} 
     */
    IsThumbstickPressed {
        get => this.get_IsThumbstickPressed()
    }

    /**
     * Gets a value between -1.0 and 1.0 representing the horizontal position of the thumbstick.
     * @remarks
     * This value ranges from -1.0 on the left to 1.0 on the right, with a center near 0.0.  Note that there is no deadzone applied, so this value will not quite reach 0.0 when the thumbstick is released.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.spatial.spatialinteractioncontrollerproperties.thumbstickx
     * @type {Float} 
     */
    ThumbstickX {
        get => this.get_ThumbstickX()
    }

    /**
     * Gets a value between -1.0 and 1.0 representing the vertical position of the thumbstick.
     * @remarks
     * This value ranges from -1.0 on the bottom to 1.0 on the top, with a center near 0.0.  Note that there is no deadzone applied, so this value will not quite reach 0.0 when the thumbstick is released.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.spatial.spatialinteractioncontrollerproperties.thumbsticky
     * @type {Float} 
     */
    ThumbstickY {
        get => this.get_ThumbstickY()
    }

    /**
     * Gets a value between -1.0 and 1.0 representing the horizontal position of the user's finger on the touchpad.
     * @remarks
     * This value ranges from -1.0 on the left to 1.0 on the right, with a center of 0.0.
     * 
     * Inspect [IsTouchpadTouched](spatialinteractioncontrollerproperties_istouchpadtouched.md) before reading this value to ensure that the user is touching the touchpad.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.spatial.spatialinteractioncontrollerproperties.touchpadx
     * @type {Float} 
     */
    TouchpadX {
        get => this.get_TouchpadX()
    }

    /**
     * Gets a value between -1.0 and 1.0 representing the vertical position of the user's finger on the touchpad.
     * @remarks
     * This value ranges from -1.0 on the bottom to 1.0 on the top, with a center of 0.0.
     * 
     * Inspect [IsTouchpadTouched](spatialinteractioncontrollerproperties_istouchpadtouched.md) before reading this value to ensure that the user is touching the touchpad.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.spatial.spatialinteractioncontrollerproperties.touchpady
     * @type {Float} 
     */
    TouchpadY {
        get => this.get_TouchpadY()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsTouchpadTouched() {
        if (!this.HasProp("__ISpatialInteractionControllerProperties")) {
            if ((queryResult := this.QueryInterface(ISpatialInteractionControllerProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialInteractionControllerProperties := ISpatialInteractionControllerProperties(outPtr)
        }

        return this.__ISpatialInteractionControllerProperties.get_IsTouchpadTouched()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsTouchpadPressed() {
        if (!this.HasProp("__ISpatialInteractionControllerProperties")) {
            if ((queryResult := this.QueryInterface(ISpatialInteractionControllerProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialInteractionControllerProperties := ISpatialInteractionControllerProperties(outPtr)
        }

        return this.__ISpatialInteractionControllerProperties.get_IsTouchpadPressed()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsThumbstickPressed() {
        if (!this.HasProp("__ISpatialInteractionControllerProperties")) {
            if ((queryResult := this.QueryInterface(ISpatialInteractionControllerProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialInteractionControllerProperties := ISpatialInteractionControllerProperties(outPtr)
        }

        return this.__ISpatialInteractionControllerProperties.get_IsThumbstickPressed()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_ThumbstickX() {
        if (!this.HasProp("__ISpatialInteractionControllerProperties")) {
            if ((queryResult := this.QueryInterface(ISpatialInteractionControllerProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialInteractionControllerProperties := ISpatialInteractionControllerProperties(outPtr)
        }

        return this.__ISpatialInteractionControllerProperties.get_ThumbstickX()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_ThumbstickY() {
        if (!this.HasProp("__ISpatialInteractionControllerProperties")) {
            if ((queryResult := this.QueryInterface(ISpatialInteractionControllerProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialInteractionControllerProperties := ISpatialInteractionControllerProperties(outPtr)
        }

        return this.__ISpatialInteractionControllerProperties.get_ThumbstickY()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_TouchpadX() {
        if (!this.HasProp("__ISpatialInteractionControllerProperties")) {
            if ((queryResult := this.QueryInterface(ISpatialInteractionControllerProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialInteractionControllerProperties := ISpatialInteractionControllerProperties(outPtr)
        }

        return this.__ISpatialInteractionControllerProperties.get_TouchpadX()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_TouchpadY() {
        if (!this.HasProp("__ISpatialInteractionControllerProperties")) {
            if ((queryResult := this.QueryInterface(ISpatialInteractionControllerProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialInteractionControllerProperties := ISpatialInteractionControllerProperties(outPtr)
        }

        return this.__ISpatialInteractionControllerProperties.get_TouchpadY()
    }

;@endregion Instance Methods
}
