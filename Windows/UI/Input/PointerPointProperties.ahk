#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPointerPointProperties.ahk
#Include .\IPointerPointProperties2.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides extended properties for a [PointerPoint](pointerpoint.md) object.
  * 
  * In most cases, we recommend that you obtain pointer info through the pointer event handlers of your chosen Windows 8 language framework (Windows app using JavaScript, UWP app using C++, C#, or Visual Basic, or UWP app using DirectX with C++).
  * 
  * If the event argument doesn't expose the pointer details required by your app, you can get access to extended pointer data from the event argument through the [getCurrentPoint](XREF:TODO:wwa.MSPointerEvent_getCurrentPoint) and [getIntermediatePoints](XREF:TODO:wwa.MSPointerEvent_getIntermediatePoints) methods or [currentPoint](XREF:TODO:wwa.MSPointerEvent_currentPoint) and [intermediatePoints](XREF:TODO:ie.MSPointerEvent_intermediatePoints) properties. We recommend using the [getCurrentPoint](XREF:TODO:wwa.MSPointerEvent_getCurrentPoint) and [getIntermediatePoints](XREF:TODO:wwa.MSPointerEvent_getIntermediatePoints) methods as you can specify the context of the pointer data.
  * 
  * The static [PointerPoint](pointerpoint.md) methods, [GetCurrentPoint](pointerpoint_getcurrentpoint_131721878.md) and [GetIntermediatePoints](pointerpoint_getintermediatepoints_143894736.md), always use the context of the app.
 * @remarks
 * The PointerPointProperties class implements IPointerPointProperties.
 * 
 * <!-- confirmed -->
 * > [!NOTE]
 * > This class is not agile, which means that you need to consider its threading model and marshaling behavior. For more info, see [Threading and Marshaling (C++/CX)](/cpp/cppcx/threading-and-marshaling-c-cx) and [Using Windows Runtime objects in a multithreaded environment (.NET)](/windows/uwp/threading-async/using-windows-runtime-objects-in-a-multithreaded-environment).
 * 
 * The core of the Microsoft interactive input device architecture is based on the Universal Serial Bus (USB) standard Device Class Definition for Human Interface Device (HID), which is defined by the [ Implementers Forum, Inc.](https://www.usb.org/home)
 * 
 * The Universal Serial Bus (USB) Human Interface Device (HID) standard defines the configuration and communication protocols for Human Interface Device (HID), such as keyboards, mouse devices, joysticks, and virtual reality devices, that humans use to enter data directly into a computer. (For detailed information about the USB HID standard, see the [USB Implementers Forum](https://www.usb.org/home) website.)
 * 
 * Although the core of the Windows input architecture is based on the Universal Serial Bus (USB) Human Interface Device (HID) standard, the architecture is not limited to Universal Serial Bus (USB) devices. The input architecture also supports serial port devices, i8042 port devices, and proprietary input devices.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.input.pointerpointproperties
 * @namespace Windows.UI.Input
 * @version WindowsRuntime 1.4
 */
class PointerPointProperties extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPointerPointProperties

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPointerPointProperties.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a value that indicates the force that the pointer device (typically a pen/stylus) exerts on the surface of the digitizer.
     * @remarks
     * A device reports pressure information through the Human Interface Device (HID) tip pressure usage. Pressure is set through the value of this usage.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.pointerpointproperties.pressure
     * @type {Float} 
     */
    Pressure {
        get => this.get_Pressure()
    }

    /**
     * Gets a value that indicates whether the digitizer pen is inverted.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.pointerpointproperties.isinverted
     * @type {Boolean} 
     */
    IsInverted {
        get => this.get_IsInverted()
    }

    /**
     * Gets a value that indicates whether the input is from a pen eraser.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.pointerpointproperties.iseraser
     * @type {Boolean} 
     */
    IsEraser {
        get => this.get_IsEraser()
    }

    /**
     * Gets the counter-clockwise angle of rotation around the major axis of the pointer device (the z-axis, perpendicular to the surface of the digitizer). A value of 0.0 degrees indicates the device is oriented towards the top of the digitizer.
     * @remarks
     * Orientation is also referred to as azimuth.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.pointerpointproperties.orientation
     * @type {Float} 
     */
    Orientation {
        get => this.get_Orientation()
    }

    /**
     * Gets the plane angle between the Y-Z plane and the plane that contains the Y axis and the axis of the input device (typically a pen/stylus).
     * @remarks
     * This property is used in conjunction with [YTilt](pointerpointproperties_ytilt.md) to indicate the tilt away from normal of the input device.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.pointerpointproperties.xtilt
     * @type {Float} 
     */
    XTilt {
        get => this.get_XTilt()
    }

    /**
     * Gets the plane angle between the X-Z plane and the plane that contains the X axis and the axis of the input device (typically a pen/stylus).
     * @remarks
     * This property is used in conjunction with [XTilt](pointerpointproperties_xtilt.md) to indicate the tilt away from normal of the input device.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.pointerpointproperties.ytilt
     * @type {Float} 
     */
    YTilt {
        get => this.get_YTilt()
    }

    /**
     * Gets the clockwise rotation in degrees of a pen device around its own major axis (such as when the user spins the pen in their fingers).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.pointerpointproperties.twist
     * @type {Float} 
     */
    Twist {
        get => this.get_Twist()
    }

    /**
     * Gets the bounding rectangle of the contact area (typically from touch input).
     * @remarks
     * ContactRect contains the bounding rectangle of the contact area as interpreted by the system. Under some circumstances, such as input prediction, this data can be modified by the system to compensate for hardware latency or message latency due to inherent delays in sensing and processing the pointer location on the digitizer.
     * 
     * See [ContactRectRaw](pointerpointproperties_contactrectraw.md) for more information on raw input data.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.pointerpointproperties.contactrect
     * @type {RECT} 
     */
    ContactRect {
        get => this.get_ContactRect()
    }

    /**
     * Gets the bounding rectangle of the raw input (typically from touch input).
     * @remarks
     * ContactRectRaw contains the bounding rectangle of the raw input as reported by the input device. Under some circumstances, such as input prediction, this data can be modified by the system to compensate for hardware latency or message latency due to inherent delays in sensing and processing the pointer location on the digitizer.
     * 
     * See [ContactRect](pointerpointproperties_contactrect.md) for more information on handling modified input data.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.pointerpointproperties.contactrectraw
     * @type {RECT} 
     */
    ContactRectRaw {
        get => this.get_ContactRectRaw()
    }

    /**
     * Gets a value that indicates whether the pointer device rejected the touch contact.
     * @remarks
     * A device rejects accidental touches and reports this information through the Human Interface Device (HID) confidence usage (see note above). TouchConfidence is set through the value of this usage.
     * 
     * The confidence usage helps improve the accuracy and reliability of accidental touch rejection. (In addition to confidence, additional heuristics are applied to the touch input stream to improve the accuracy of accidental touch rejection.)
     * 
     * Touch input is most often rejected due to palm detection or through input arbitration (such as when pen/stylus proximity overrides touch input).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.pointerpointproperties.touchconfidence
     * @type {Boolean} 
     */
    TouchConfidence {
        get => this.get_TouchConfidence()
    }

    /**
     * Gets a value that indicates whether the pointer input was triggered by the primary action mode of an input device.
     * @remarks
     * Examples of primary action modes for various input devices:
     * - A touch pointer when it is in contact with the digitizer surface.
     * - A pen pointer when the pen tip is in contact with the digitizer surface and no modifying buttons, such as a barrel button (see [IsBarrelButtonPressed](pointerpointproperties_isbarrelbuttonpressed.md)), are pressed. An eraser tip does not set this property either (see [IsEraser](pointerpointproperties_iseraser.md)).
     * - A mouse pointer when the left mouse button is pressed.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.pointerpointproperties.isleftbuttonpressed
     * @type {Boolean} 
     */
    IsLeftButtonPressed {
        get => this.get_IsLeftButtonPressed()
    }

    /**
     * Gets a value that indicates whether the pointer input was triggered by the secondary action mode (if supported) of an input device.
     * @remarks
     * Examples of secondary action modes for various input devices:
     * - A touch pointer does not set this property.
     * - A pen pointer when the pen tip is in contact with the digitizer surface and a modifying button, such as a barrel button (see [IsBarrelButtonPressed](pointerpointproperties_isbarrelbuttonpressed.md)), is pressed. An eraser tip does not set this property (see [IsEraser](pointerpointproperties_iseraser.md)).
     * - A mouse pointer when the right mouse button is pressed.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.pointerpointproperties.isrightbuttonpressed
     * @type {Boolean} 
     */
    IsRightButtonPressed {
        get => this.get_IsRightButtonPressed()
    }

    /**
     * Gets a value that indicates whether the pointer input was triggered by the tertiary action mode of an input device.
     * @remarks
     * Examples of tertiary action modes for various input devices:
     * - A touch pointer does not set this property.
     * - A pen pointer does not set this property.
     * - A mouse pointer when the mouse wheel button is pressed.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.pointerpointproperties.ismiddlebuttonpressed
     * @type {Boolean} 
     */
    IsMiddleButtonPressed {
        get => this.get_IsMiddleButtonPressed()
    }

    /**
     * Gets a value (the raw value reported by the device) that indicates the change in wheel button input from the last pointer event.
     * @remarks
     * The mouse wheel button has discrete, evenly spaced notches or distance thresholds (also called detents). When you rotate or tilt the wheel, a wheel message is sent as each detent is encountered.
     * 
     * The windows constant, WHEEL_DELTA (defined as a value of 120), describes one detent. Each detent marks the threshold for a single increment of an associated action (for example, scrolling a line or page).
     * 
     * A positive value indicates that the wheel was rotated forward (away from the user) or tilted to the right; a negative value indicates that the wheel was rotated backward (toward the user) or tilted to the left.
     * 
     * Wheel button input is oriented along the vertical axis (rotate forward or backward) or the horizontal axis (tilt left or right). Check [IsHorizontalMouseWheel](pointerpointproperties_ishorizontalmousewheel.md) to identify whether the input is along the horizontal axis.
     * 
     * > [!NOTE]
     * > The delta was set to 120 to enable finer-resolution wheels (such as freely-rotating wheels with no notches) that send more messages per rotation, but with smaller values per message.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.pointerpointproperties.mousewheeldelta
     * @type {Integer} 
     */
    MouseWheelDelta {
        get => this.get_MouseWheelDelta()
    }

    /**
     * Gets a value that indicates whether the input is from a mouse tilt wheel.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.pointerpointproperties.ishorizontalmousewheel
     * @type {Boolean} 
     */
    IsHorizontalMouseWheel {
        get => this.get_IsHorizontalMouseWheel()
    }

    /**
     * Gets a value that indicates whether the input is from the primary pointer when multiple pointers are registered.
     * @remarks
     * The primary pointer is a single pointer (touch, mouse, and pen/stylus) in the current interaction.
     * 
     * For mouse, the primary pointer is the only pointer for which mouse events can be generated.
     * 
     * For touch (where there can be multiple concurrent pointers), the primary pointer is the first contact in an interaction. For any interaction after the first **[PointerPressed](../windows.ui.xaml/uielement_pointerpressed.md)** event, IsPrimary returns false.
     * 
     * A new primary pointer is only registered when all contacts in that interaction are removed and a new contact is subsequently detected.
     * 
     * A primary pointer can perform actions that are not available to other pointers. For example, when a primary pointer generates a [WM_POINTERDOWN](/previous-versions/windows/desktop/inputmsg/wm-pointerdown) message on an inactive window, a [WM_POINTERACTIVATE](/previous-versions/windows/desktop/inputmsg/wm-pointeractivate)] message is also sent to that window.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.pointerpointproperties.isprimary
     * @type {Boolean} 
     */
    IsPrimary {
        get => this.get_IsPrimary()
    }

    /**
     * Gets a value that indicates whether the pointer device is within detection range of a sensor or digitizer (the pointer continues to exist).
     * @remarks
     * A pointer comes into existence when the pointer device enters detection range and is canceled when the pointer device leaves detection range.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.pointerpointproperties.isinrange
     * @type {Boolean} 
     */
    IsInRange {
        get => this.get_IsInRange()
    }

    /**
     * Gets a value that indicates whether the input was canceled by the pointer device.
     * @remarks
     * Pointer input can be canceled for various reasons, including:
     * + Palm rejection
     * + Input arbitration (such as pen/stylus proximity overriding touch input)
     * + Device removal
     * + Invalid state transition
     * + Screen rotation
     * + Desktop switching
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.pointerpointproperties.iscanceled
     * @type {Boolean} 
     */
    IsCanceled {
        get => this.get_IsCanceled()
    }

    /**
     * Gets a value that indicates whether the barrel button of the pen/stylus device is pressed.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.pointerpointproperties.isbarrelbuttonpressed
     * @type {Boolean} 
     */
    IsBarrelButtonPressed {
        get => this.get_IsBarrelButtonPressed()
    }

    /**
     * Gets a value that indicates whether the pointer input was triggered by the first extended mouse button (XButton1).
     * @remarks
     * XBUTTON1 is an additional button used on many mouse devices. It returns the same data as standard mouse buttons.
     * 
     * A touch pointer does not set this property.
     * 
     * A pen pointer does not set this property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.pointerpointproperties.isxbutton1pressed
     * @type {Boolean} 
     */
    IsXButton1Pressed {
        get => this.get_IsXButton1Pressed()
    }

    /**
     * Gets a value that indicates whether the pointer input was triggered by the second extended mouse button (XButton2).
     * @remarks
     * XButton2 is an additional button used on many mouse devices. It returns the same data as standard mouse buttons.
     * 
     * A touch pointer does not set this property.
     * 
     * A pen pointer does not set this property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.pointerpointproperties.isxbutton2pressed
     * @type {Boolean} 
     */
    IsXButton2Pressed {
        get => this.get_IsXButton2Pressed()
    }

    /**
     * Gets the kind of pointer state change.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.pointerpointproperties.pointerupdatekind
     * @type {Integer} 
     */
    PointerUpdateKind {
        get => this.get_PointerUpdateKind()
    }

    /**
     * Gets the z-coordinate (or distance) of the pointer from the screen surface, in device-independent pixels.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.pointerpointproperties.zdistance
     * @type {IReference<Float>} 
     */
    ZDistance {
        get => this.get_ZDistance()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_Pressure() {
        if (!this.HasProp("__IPointerPointProperties")) {
            if ((queryResult := this.QueryInterface(IPointerPointProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPointerPointProperties := IPointerPointProperties(outPtr)
        }

        return this.__IPointerPointProperties.get_Pressure()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsInverted() {
        if (!this.HasProp("__IPointerPointProperties")) {
            if ((queryResult := this.QueryInterface(IPointerPointProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPointerPointProperties := IPointerPointProperties(outPtr)
        }

        return this.__IPointerPointProperties.get_IsInverted()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsEraser() {
        if (!this.HasProp("__IPointerPointProperties")) {
            if ((queryResult := this.QueryInterface(IPointerPointProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPointerPointProperties := IPointerPointProperties(outPtr)
        }

        return this.__IPointerPointProperties.get_IsEraser()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_Orientation() {
        if (!this.HasProp("__IPointerPointProperties")) {
            if ((queryResult := this.QueryInterface(IPointerPointProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPointerPointProperties := IPointerPointProperties(outPtr)
        }

        return this.__IPointerPointProperties.get_Orientation()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_XTilt() {
        if (!this.HasProp("__IPointerPointProperties")) {
            if ((queryResult := this.QueryInterface(IPointerPointProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPointerPointProperties := IPointerPointProperties(outPtr)
        }

        return this.__IPointerPointProperties.get_XTilt()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_YTilt() {
        if (!this.HasProp("__IPointerPointProperties")) {
            if ((queryResult := this.QueryInterface(IPointerPointProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPointerPointProperties := IPointerPointProperties(outPtr)
        }

        return this.__IPointerPointProperties.get_YTilt()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_Twist() {
        if (!this.HasProp("__IPointerPointProperties")) {
            if ((queryResult := this.QueryInterface(IPointerPointProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPointerPointProperties := IPointerPointProperties(outPtr)
        }

        return this.__IPointerPointProperties.get_Twist()
    }

    /**
     * 
     * @returns {RECT} 
     */
    get_ContactRect() {
        if (!this.HasProp("__IPointerPointProperties")) {
            if ((queryResult := this.QueryInterface(IPointerPointProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPointerPointProperties := IPointerPointProperties(outPtr)
        }

        return this.__IPointerPointProperties.get_ContactRect()
    }

    /**
     * 
     * @returns {RECT} 
     */
    get_ContactRectRaw() {
        if (!this.HasProp("__IPointerPointProperties")) {
            if ((queryResult := this.QueryInterface(IPointerPointProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPointerPointProperties := IPointerPointProperties(outPtr)
        }

        return this.__IPointerPointProperties.get_ContactRectRaw()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_TouchConfidence() {
        if (!this.HasProp("__IPointerPointProperties")) {
            if ((queryResult := this.QueryInterface(IPointerPointProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPointerPointProperties := IPointerPointProperties(outPtr)
        }

        return this.__IPointerPointProperties.get_TouchConfidence()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsLeftButtonPressed() {
        if (!this.HasProp("__IPointerPointProperties")) {
            if ((queryResult := this.QueryInterface(IPointerPointProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPointerPointProperties := IPointerPointProperties(outPtr)
        }

        return this.__IPointerPointProperties.get_IsLeftButtonPressed()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsRightButtonPressed() {
        if (!this.HasProp("__IPointerPointProperties")) {
            if ((queryResult := this.QueryInterface(IPointerPointProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPointerPointProperties := IPointerPointProperties(outPtr)
        }

        return this.__IPointerPointProperties.get_IsRightButtonPressed()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsMiddleButtonPressed() {
        if (!this.HasProp("__IPointerPointProperties")) {
            if ((queryResult := this.QueryInterface(IPointerPointProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPointerPointProperties := IPointerPointProperties(outPtr)
        }

        return this.__IPointerPointProperties.get_IsMiddleButtonPressed()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MouseWheelDelta() {
        if (!this.HasProp("__IPointerPointProperties")) {
            if ((queryResult := this.QueryInterface(IPointerPointProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPointerPointProperties := IPointerPointProperties(outPtr)
        }

        return this.__IPointerPointProperties.get_MouseWheelDelta()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsHorizontalMouseWheel() {
        if (!this.HasProp("__IPointerPointProperties")) {
            if ((queryResult := this.QueryInterface(IPointerPointProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPointerPointProperties := IPointerPointProperties(outPtr)
        }

        return this.__IPointerPointProperties.get_IsHorizontalMouseWheel()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsPrimary() {
        if (!this.HasProp("__IPointerPointProperties")) {
            if ((queryResult := this.QueryInterface(IPointerPointProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPointerPointProperties := IPointerPointProperties(outPtr)
        }

        return this.__IPointerPointProperties.get_IsPrimary()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsInRange() {
        if (!this.HasProp("__IPointerPointProperties")) {
            if ((queryResult := this.QueryInterface(IPointerPointProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPointerPointProperties := IPointerPointProperties(outPtr)
        }

        return this.__IPointerPointProperties.get_IsInRange()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsCanceled() {
        if (!this.HasProp("__IPointerPointProperties")) {
            if ((queryResult := this.QueryInterface(IPointerPointProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPointerPointProperties := IPointerPointProperties(outPtr)
        }

        return this.__IPointerPointProperties.get_IsCanceled()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsBarrelButtonPressed() {
        if (!this.HasProp("__IPointerPointProperties")) {
            if ((queryResult := this.QueryInterface(IPointerPointProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPointerPointProperties := IPointerPointProperties(outPtr)
        }

        return this.__IPointerPointProperties.get_IsBarrelButtonPressed()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsXButton1Pressed() {
        if (!this.HasProp("__IPointerPointProperties")) {
            if ((queryResult := this.QueryInterface(IPointerPointProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPointerPointProperties := IPointerPointProperties(outPtr)
        }

        return this.__IPointerPointProperties.get_IsXButton1Pressed()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsXButton2Pressed() {
        if (!this.HasProp("__IPointerPointProperties")) {
            if ((queryResult := this.QueryInterface(IPointerPointProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPointerPointProperties := IPointerPointProperties(outPtr)
        }

        return this.__IPointerPointProperties.get_IsXButton2Pressed()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PointerUpdateKind() {
        if (!this.HasProp("__IPointerPointProperties")) {
            if ((queryResult := this.QueryInterface(IPointerPointProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPointerPointProperties := IPointerPointProperties(outPtr)
        }

        return this.__IPointerPointProperties.get_PointerUpdateKind()
    }

    /**
     * Gets a value that indicates whether the input data from the pointer device contains the specified Human Interface Device (HID) usage information.
     * @remarks
     * [PointerPoint](pointerpoint.md) and [PointerPointProperties](pointerpointproperties.md) expose common Human Interface Device (HID) usages directly.
     * 
     * Use HasUsage to query for additional, custom, and device-specific usages or when you need to verify that a device actually supports a property (where [PointerPoint](pointerpoint.md) and [PointerPointProperties](pointerpointproperties.md) return a default value).
     * 
     * The following table lists the Human Interface Device (HID) usages that are exposed directly through [PointerPoint](pointerpoint.md) and [PointerPointProperties](pointerpointproperties.md).
     * 
     * | Property | Usage page | Usage |
     * | --- | --- | --- |
     * |  [Position (X)](pointerpoint_position.md) | 0x01 | 0x30 |
     * |  [Position (Y)](pointerpoint_position.md) | 0x01 | 0x31 |
     * |  [RawPosition (X)](pointerpoint_rawposition.md) | 0x01 | 0x30 |
     * |  [RawPosition (Y)](pointerpoint_rawposition.md) | 0x01 | 0x31 |
     * |  [IsInContact](pointerpoint_isincontact.md) | 0x0D | 0x42 (tip) or 0x45 (eraser tip) |
     * |  [Pressure](pointerpointproperties_pressure.md) | 0x0D | 0x30 |
     * |  [IsInverted](pointerpointproperties_isinverted.md) | 0x0D | 0x3C |
     * |  [IsEraser](pointerpointproperties_iseraser.md) | 0x0D | 0x45 |
     * |  [Orientation](pointerpointproperties_orientation.md) | 0x0D | 0x3F |
     * |  [XTilt](pointerpointproperties_xtilt.md) | 0x0D | 0x3D |
     * |  [YTilt](pointerpointproperties_ytilt.md) | 0x0D | 0x3E |
     * |  [Twist](pointerpointproperties_twist.md) | 0x0D | 0x41 |
     * |  [ContactRect (Width)](pointerpointproperties_contactrect.md) | 0x0D | 0x48 |
     * |  [ContactRect (Height)](pointerpointproperties_contactrect.md) | 0x0D | 0x49 |
     * |  [ContactRectRaw (Width)](pointerpointproperties_contactrectraw.md) | 0x0D | 0x48 |
     * |  [ContactRectRaw (Height)](pointerpointproperties_contactrectraw.md) | 0x0D | 0x49 |
     * |  [TouchConfidence](pointerpointproperties_touchconfidence.md) | 0x0D | 0x47 |
     * |  [IsInRange](pointerpointproperties_isinrange.md) | 0x0D | 0x32 |
     * @param {Integer} usagePage The Human Interface Device (HID) usage page of the pointer device. Usage pages specify the class of device. For example, touch digitizers (0x0D) and generic input (0x01).
     * @param {Integer} usageId Indicates a usage in a usage page.Usage ID specify a device or property in the **usagePage**. For example, for touch digitizers this includes tip switch (0x42) to indicate finger contact or tip pressure (0x30).
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.pointerpointproperties.hasusage
     */
    HasUsage(usagePage, usageId) {
        if (!this.HasProp("__IPointerPointProperties")) {
            if ((queryResult := this.QueryInterface(IPointerPointProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPointerPointProperties := IPointerPointProperties(outPtr)
        }

        return this.__IPointerPointProperties.HasUsage(usagePage, usageId)
    }

    /**
     * Gets the Human Interface Device (HID) usage value of the raw input.
     * @param {Integer} usagePage The Human Interface Device (HID) usage page of the pointer device. Usage pages specify the class of device. For example, touch digitizers (0x0D) and generic input (0x01).
     * @param {Integer} usageId Indicates a usage in a usage page.Usage ID specify a device or property in the **usagePage**. For example, for touch digitizers this includes tip switch (0x42) to indicate finger contact or tip pressure (0x30).
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.pointerpointproperties.getusagevalue
     */
    GetUsageValue(usagePage, usageId) {
        if (!this.HasProp("__IPointerPointProperties")) {
            if ((queryResult := this.QueryInterface(IPointerPointProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPointerPointProperties := IPointerPointProperties(outPtr)
        }

        return this.__IPointerPointProperties.GetUsageValue(usagePage, usageId)
    }

    /**
     * 
     * @returns {IReference<Float>} 
     */
    get_ZDistance() {
        if (!this.HasProp("__IPointerPointProperties2")) {
            if ((queryResult := this.QueryInterface(IPointerPointProperties2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPointerPointProperties2 := IPointerPointProperties2(outPtr)
        }

        return this.__IPointerPointProperties2.get_ZDistance()
    }

;@endregion Instance Methods
}
