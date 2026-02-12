#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\DependencyObject.ahk
#Include .\IGradientStop.ahk
#Include .\IGradientStopStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Describes the location and color of a transition point in a gradient.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.gradientstop
 * @namespace Windows.UI.Xaml.Media
 * @version WindowsRuntime 1.4
 */
class GradientStop extends DependencyObject {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IGradientStop

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IGradientStop.IID

    /**
     * Identifies the [Color](gradientstop_color.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.gradientstop.colorproperty
     * @type {DependencyProperty} 
     */
    static ColorProperty {
        get => GradientStop.get_ColorProperty()
    }

    /**
     * Identifies the [Offset](gradientstop_offset.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.gradientstop.offsetproperty
     * @type {DependencyProperty} 
     */
    static OffsetProperty {
        get => GradientStop.get_OffsetProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ColorProperty() {
        if (!GradientStop.HasProp("__IGradientStopStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.GradientStop")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGradientStopStatics.IID)
            GradientStop.__IGradientStopStatics := IGradientStopStatics(factoryPtr)
        }

        return GradientStop.__IGradientStopStatics.get_ColorProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_OffsetProperty() {
        if (!GradientStop.HasProp("__IGradientStopStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.GradientStop")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGradientStopStatics.IID)
            GradientStop.__IGradientStopStatics := IGradientStopStatics(factoryPtr)
        }

        return GradientStop.__IGradientStopStatics.get_OffsetProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the color of the gradient stop.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.gradientstop.color
     * @type {Color} 
     */
    Color {
        get => this.get_Color()
        set => this.put_Color(value)
    }

    /**
     * Gets the location of the gradient stop within the gradient vector.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.gradientstop.offset
     * @type {Float} 
     */
    Offset {
        get => this.get_Offset()
        set => this.put_Offset(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [GradientStop](gradientstop.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.GradientStop")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {Color} 
     */
    get_Color() {
        if (!this.HasProp("__IGradientStop")) {
            if ((queryResult := this.QueryInterface(IGradientStop.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGradientStop := IGradientStop(outPtr)
        }

        return this.__IGradientStop.get_Color()
    }

    /**
     * 
     * @param {Color} value 
     * @returns {HRESULT} 
     */
    put_Color(value) {
        if (!this.HasProp("__IGradientStop")) {
            if ((queryResult := this.QueryInterface(IGradientStop.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGradientStop := IGradientStop(outPtr)
        }

        return this.__IGradientStop.put_Color(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_Offset() {
        if (!this.HasProp("__IGradientStop")) {
            if ((queryResult := this.QueryInterface(IGradientStop.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGradientStop := IGradientStop(outPtr)
        }

        return this.__IGradientStop.get_Offset()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_Offset(value) {
        if (!this.HasProp("__IGradientStop")) {
            if ((queryResult := this.QueryInterface(IGradientStop.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGradientStop := IGradientStop(outPtr)
        }

        return this.__IGradientStop.put_Offset(value)
    }

;@endregion Instance Methods
}
