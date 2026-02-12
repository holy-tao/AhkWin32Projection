#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IInkPoint.ahk
#Include .\IInkPoint2.ahk
#Include .\IInkPointFactory.ahk
#Include .\IInkPointFactory2.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides raw input data for a single point used in the construction of an [InkStroke](inkstroke.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.inkpoint
 * @namespace Windows.UI.Input.Inking
 * @version WindowsRuntime 1.4
 */
class InkPoint extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IInkPoint

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IInkPoint.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates a basic [InkPoint](inkpoint.md) object used in the construction of an [InkStroke](inkstroke.md).
     * @param {POINT} position The screen coordinates for the [InkPoint](inkpoint.md) object.
     * @param {Float} pressure The pressure of the contact on the digitizer surface. The default is 0.5.
     * @returns {InkPoint} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.inkpoint.#ctor
     */
    static CreateInkPoint(position, pressure) {
        if (!InkPoint.HasProp("__IInkPointFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Input.Inking.InkPoint")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IInkPointFactory.IID)
            InkPoint.__IInkPointFactory := IInkPointFactory(factoryPtr)
        }

        return InkPoint.__IInkPointFactory.CreateInkPoint(position, pressure)
    }

    /**
     * Creates a complex [InkPoint](inkpoint.md) object used in the construction of an [InkStroke](inkstroke.md).
     * @param {POINT} position The screen coordinates for the [InkPoint](inkpoint.md) object.
     * @param {Float} pressure The pressure of the contact on the digitizer surface. The default is 0.5.
     * @param {Float} tiltX The plane angle between the Y-Z plane and the plane containing the Y axis and the axis of the input device. The default is 0.
     * @param {Float} tiltY The plane angle between the X-Z plane and the plane containing the X axis and the axis of the input device. The default is 0.
     * @param {Integer} timestamp_ The timestamp for the first [InkPoint](inkpoint.md) of an InkStroke, or when an entire InkStroke is pasted or loaded.
     * @returns {InkPoint} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.inkpoint.#ctor
     */
    static CreateInkPointWithTiltAndTimestamp(position, pressure, tiltX, tiltY, timestamp_) {
        if (!InkPoint.HasProp("__IInkPointFactory2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Input.Inking.InkPoint")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IInkPointFactory2.IID)
            InkPoint.__IInkPointFactory2 := IInkPointFactory2(factoryPtr)
        }

        return InkPoint.__IInkPointFactory2.CreateInkPointWithTiltAndTimestamp(position, pressure, tiltX, tiltY, timestamp_)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * The X, Y coordinates of the [InkPoint](inkpoint.md), in device-independent pixel (DIP) relative to the upper left-hand corner of the inking area.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.inkpoint.position
     * @type {POINT} 
     */
    Position {
        get => this.get_Position()
    }

    /**
     * The pressure of the contact on the digitizer surface for the [InkPoint](inkpoint.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.inkpoint.pressure
     * @type {Float} 
     */
    Pressure {
        get => this.get_Pressure()
    }

    /**
     * Gets the plane angle between the Y-Z plane and the plane containing the Y axis and the axis of the input device.
     * @remarks
     * This property is used in conjunction with [tilty](inkpoint_tilty.md) to represent the tilt away from normal of the input device.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.inkpoint.tiltx
     * @type {Float} 
     */
    TiltX {
        get => this.get_TiltX()
    }

    /**
     * Gets the plane angle between the X-Z plane and the plane containing the X axis and the axis of the input device.
     * @remarks
     * This property is used in conjunction with [tiltx](inkpoint_tiltx.md) to represent the tilt away from normal of the input device.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.inkpoint.tilty
     * @type {Float} 
     */
    TiltY {
        get => this.get_TiltY()
    }

    /**
     * Gets the timestamp for the first [InkPoint](inkpoint.md) of an InkStroke, or when an entire InkStroke is pasted or loaded.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.inking.inkpoint.timestamp
     * @type {Integer} 
     */
    Timestamp {
        get => this.get_Timestamp()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {POINT} 
     */
    get_Position() {
        if (!this.HasProp("__IInkPoint")) {
            if ((queryResult := this.QueryInterface(IInkPoint.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkPoint := IInkPoint(outPtr)
        }

        return this.__IInkPoint.get_Position()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_Pressure() {
        if (!this.HasProp("__IInkPoint")) {
            if ((queryResult := this.QueryInterface(IInkPoint.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkPoint := IInkPoint(outPtr)
        }

        return this.__IInkPoint.get_Pressure()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_TiltX() {
        if (!this.HasProp("__IInkPoint2")) {
            if ((queryResult := this.QueryInterface(IInkPoint2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkPoint2 := IInkPoint2(outPtr)
        }

        return this.__IInkPoint2.get_TiltX()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_TiltY() {
        if (!this.HasProp("__IInkPoint2")) {
            if ((queryResult := this.QueryInterface(IInkPoint2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkPoint2 := IInkPoint2(outPtr)
        }

        return this.__IInkPoint2.get_TiltY()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Timestamp() {
        if (!this.HasProp("__IInkPoint2")) {
            if ((queryResult := this.QueryInterface(IInkPoint2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IInkPoint2 := IInkPoint2(outPtr)
        }

        return this.__IInkPoint2.get_Timestamp()
    }

;@endregion Instance Methods
}
