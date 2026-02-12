#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\DependencyObject.ahk
#Include .\IKeySpline.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Represents a spline key frame to define animation progress.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.keyspline
 * @namespace Windows.UI.Xaml.Media.Animation
 * @version WindowsRuntime 1.4
 */
class KeySpline extends DependencyObject {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IKeySpline

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IKeySpline.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the first control point used to define a Bezier curve that describes a [KeySpline](keyspline.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.keyspline.controlpoint1
     * @type {POINT} 
     */
    ControlPoint1 {
        get => this.get_ControlPoint1()
        set => this.put_ControlPoint1(value)
    }

    /**
     * Gets or sets the second control point used to define a Bezier curve that describes a [KeySpline](keyspline.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.animation.keyspline.controlpoint2
     * @type {POINT} 
     */
    ControlPoint2 {
        get => this.get_ControlPoint2()
        set => this.put_ControlPoint2(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [KeySpline](keyspline.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Animation.KeySpline")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {POINT} 
     */
    get_ControlPoint1() {
        if (!this.HasProp("__IKeySpline")) {
            if ((queryResult := this.QueryInterface(IKeySpline.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IKeySpline := IKeySpline(outPtr)
        }

        return this.__IKeySpline.get_ControlPoint1()
    }

    /**
     * 
     * @param {POINT} value 
     * @returns {HRESULT} 
     */
    put_ControlPoint1(value) {
        if (!this.HasProp("__IKeySpline")) {
            if ((queryResult := this.QueryInterface(IKeySpline.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IKeySpline := IKeySpline(outPtr)
        }

        return this.__IKeySpline.put_ControlPoint1(value)
    }

    /**
     * 
     * @returns {POINT} 
     */
    get_ControlPoint2() {
        if (!this.HasProp("__IKeySpline")) {
            if ((queryResult := this.QueryInterface(IKeySpline.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IKeySpline := IKeySpline(outPtr)
        }

        return this.__IKeySpline.get_ControlPoint2()
    }

    /**
     * 
     * @param {POINT} value 
     * @returns {HRESULT} 
     */
    put_ControlPoint2(value) {
        if (!this.HasProp("__IKeySpline")) {
            if ((queryResult := this.QueryInterface(IKeySpline.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IKeySpline := IKeySpline(outPtr)
        }

        return this.__IKeySpline.put_ControlPoint2(value)
    }

;@endregion Instance Methods
}
