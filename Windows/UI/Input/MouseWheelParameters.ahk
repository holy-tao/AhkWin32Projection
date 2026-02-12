#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IMouseWheelParameters.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides properties associated with the button wheel of a mouse device.
 * @remarks
 * The properties exposed through MouseWheelParameters are used in conjunction with the **Wheel** settings in the **Mouse** control panel to define the UI experience when using the button wheel.
 * 
 * The mouse wheel button has discrete, evenly spaced notches or distance thresholds (also called detents). When you rotate or tilt the wheel, a wheel message is sent as each detent is encountered.
 * 
 * <!-- confirmed -->
 * > [!NOTE]
 * > This class is not agile, which means that you need to consider its threading model and marshaling behavior. For more info, see [Threading and Marshaling (C++/CX)](/cpp/cppcx/threading-and-marshaling-c-cx) and [Using Windows Runtime objects in a multithreaded environment (.NET)](/windows/uwp/threading-async/using-windows-runtime-objects-in-a-multithreaded-environment).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.input.mousewheelparameters
 * @namespace Windows.UI.Input
 * @version WindowsRuntime 1.4
 */
class MouseWheelParameters extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IMouseWheelParameters

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IMouseWheelParameters.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the conversion factors for both character width and line height units, in device-independent pixel (DIP).
     * @remarks
     * The following image shows the default control panel settings for the button wheel. These settings map a single detent to a specific unit of distance in the UI (character width and line height). CharTranslation provides the means to redefine these distances and specify them in terms of device-independent pixel (DIP).
     * 
     * <img src="images/mouseproperties-buttonwheel.png" alt="Screenshot of the Mouse Settings page showing mouse wheel scrolling settings." />
     * 
     * *Mouse properties dialog with wheel settings displayed*
     * 
     * If the wheel button is set to scroll three lines at a time for each detent and the value of CharTranslation is set to (8,16), vertical scrolling is applied at 3 x 16 = 48 device-independent pixel (DIP) per detent. Horizontal scrolling through the mouse tilt wheel is applied at 3 x 8 = 24 device-independent pixel (DIP) per detent.
     * 
     * > [!NOTE]
     * > If **ManipulationTranslateY*/*ManipulationTranslateRailsY** is disabled and **ManipulationTranslateX*/*ManipulationTranslateRailsX** is enabled through [GestureSettings](gesturerecognizer_gesturesettings.md) then scrolling is applied only along the horizontal axis when the button wheel is rotated or tilted. Similarly, if **ManipulationTranslateY*/*ManipulationTranslateRailsY** is enabled and **ManipulationTranslateX*/*ManipulationTranslateRailsX** is disabled through [GestureSettings](gesturerecognizer_gesturesettings.md) then scrolling is applied only along the vertical axis when the button wheel is rotated or tilted.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.mousewheelparameters.chartranslation
     * @type {POINT} 
     */
    CharTranslation {
        get => this.get_CharTranslation()
        set => this.put_CharTranslation(value)
    }

    /**
     * Gets or sets a value that indicates the change in scale associated with input from the wheel button of a mouse.
     * @remarks
     * DeltaScale maps a single notch (unitary rotation) of the wheel button to a scale multiplier or divider (for example, 1.1).
     * 
     * Rotating the wheel button forward or tilting it to the right results in a scale increase. Rotating backward or tilting to the left results in a scale decrease.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.mousewheelparameters.deltascale
     * @type {Float} 
     */
    DeltaScale {
        get => this.get_DeltaScale()
        set => this.put_DeltaScale(value)
    }

    /**
     * Gets or sets a value that indicates the change in the angle of rotation associated with input from the wheel button of a mouse.
     * @remarks
     * DeltaRotationAngle maps a single detent to the specified angle.
     * 
     * Rotating the wheel button forward or tilting it to the right results in a clockwise rotation. Rotating backward or tilting to the left results in a counter-clockwise rotation.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.mousewheelparameters.deltarotationangle
     * @type {Float} 
     */
    DeltaRotationAngle {
        get => this.get_DeltaRotationAngle()
        set => this.put_DeltaRotationAngle(value)
    }

    /**
     * Gets or sets the conversion factors for both page width and height units, in device-independent pixel (DIP).
     * @remarks
     * The following image shows the default control panel settings for the button wheel. These settings map a single detent to a specific unit of distance in the UI (page width and height). PageTranslation provides the means to redefine these distances and specify the size of a page in terms of device-independent pixel (DIP).
     * 
     * :::image type="content" source="images/mouseproperties-buttonwheel.png" alt-text="Screenshot of the Mouse Settings page showing mouse wheel scrolling settings.":::
     * *Screenshot of the Mouse Settings page showing mouse wheel scrolling settings.*
     * 
     * If the wheel button is set to scroll one screen (page) at a time for each detent and the value of PageTranslation is set to (1200,800), vertical scrolling is applied at 1 x 800 device-independent pixel (DIP) per detent. Horizontal scrolling distance through the mouse tilt wheel is dependent on the value of [CharTranslation](mousewheelparameters_chartranslation.md).
     * 
     * > [!NOTE]
     * > If **ManipulationTranslateY*/*ManipulationTranslateRailsY** is disabled and **ManipulationTranslateX*/*ManipulationTranslateRailsX** is enabled through [GestureSettings](gesturerecognizer_gesturesettings.md) then scrolling is applied only along the horizontal axis when the button wheel is rotated or tilted. In the previous example, the result is horizontal scrolling of 1 x 1200 device-independent pixel (DIP) per detent. Similarly, if **ManipulationTranslateY*/*ManipulationTranslateRailsY** is enabled and **ManipulationTranslateX*/*ManipulationTranslateRailsX** is disabled through [GestureSettings](gesturerecognizer_gesturesettings.md) then scrolling is applied only along the vertical axis when the button wheel is rotated or tilted.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.mousewheelparameters.pagetranslation
     * @type {POINT} 
     */
    PageTranslation {
        get => this.get_PageTranslation()
        set => this.put_PageTranslation(value)
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
    get_CharTranslation() {
        if (!this.HasProp("__IMouseWheelParameters")) {
            if ((queryResult := this.QueryInterface(IMouseWheelParameters.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMouseWheelParameters := IMouseWheelParameters(outPtr)
        }

        return this.__IMouseWheelParameters.get_CharTranslation()
    }

    /**
     * 
     * @param {POINT} value 
     * @returns {HRESULT} 
     */
    put_CharTranslation(value) {
        if (!this.HasProp("__IMouseWheelParameters")) {
            if ((queryResult := this.QueryInterface(IMouseWheelParameters.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMouseWheelParameters := IMouseWheelParameters(outPtr)
        }

        return this.__IMouseWheelParameters.put_CharTranslation(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_DeltaScale() {
        if (!this.HasProp("__IMouseWheelParameters")) {
            if ((queryResult := this.QueryInterface(IMouseWheelParameters.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMouseWheelParameters := IMouseWheelParameters(outPtr)
        }

        return this.__IMouseWheelParameters.get_DeltaScale()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_DeltaScale(value) {
        if (!this.HasProp("__IMouseWheelParameters")) {
            if ((queryResult := this.QueryInterface(IMouseWheelParameters.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMouseWheelParameters := IMouseWheelParameters(outPtr)
        }

        return this.__IMouseWheelParameters.put_DeltaScale(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_DeltaRotationAngle() {
        if (!this.HasProp("__IMouseWheelParameters")) {
            if ((queryResult := this.QueryInterface(IMouseWheelParameters.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMouseWheelParameters := IMouseWheelParameters(outPtr)
        }

        return this.__IMouseWheelParameters.get_DeltaRotationAngle()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_DeltaRotationAngle(value) {
        if (!this.HasProp("__IMouseWheelParameters")) {
            if ((queryResult := this.QueryInterface(IMouseWheelParameters.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMouseWheelParameters := IMouseWheelParameters(outPtr)
        }

        return this.__IMouseWheelParameters.put_DeltaRotationAngle(value)
    }

    /**
     * 
     * @returns {POINT} 
     */
    get_PageTranslation() {
        if (!this.HasProp("__IMouseWheelParameters")) {
            if ((queryResult := this.QueryInterface(IMouseWheelParameters.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMouseWheelParameters := IMouseWheelParameters(outPtr)
        }

        return this.__IMouseWheelParameters.get_PageTranslation()
    }

    /**
     * 
     * @param {POINT} value 
     * @returns {HRESULT} 
     */
    put_PageTranslation(value) {
        if (!this.HasProp("__IMouseWheelParameters")) {
            if ((queryResult := this.QueryInterface(IMouseWheelParameters.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IMouseWheelParameters := IMouseWheelParameters(outPtr)
        }

        return this.__IMouseWheelParameters.put_PageTranslation(value)
    }

;@endregion Instance Methods
}
