#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\Transform.ahk
#Include .\ISkewTransform.ahk
#Include .\ISkewTransformStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents a two-dimensional skew.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.skewtransform
 * @namespace Windows.UI.Xaml.Media
 * @version WindowsRuntime 1.4
 */
class SkewTransform extends Transform {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISkewTransform

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISkewTransform.IID

    /**
     * Identifies the [CenterX](skewtransform_centerx.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.skewtransform.centerxproperty
     * @type {DependencyProperty} 
     */
    static CenterXProperty {
        get => SkewTransform.get_CenterXProperty()
    }

    /**
     * Identifies the [CenterY](skewtransform_centery.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.skewtransform.centeryproperty
     * @type {DependencyProperty} 
     */
    static CenterYProperty {
        get => SkewTransform.get_CenterYProperty()
    }

    /**
     * Identifies the [AngleX](skewtransform_anglex.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.skewtransform.anglexproperty
     * @type {DependencyProperty} 
     */
    static AngleXProperty {
        get => SkewTransform.get_AngleXProperty()
    }

    /**
     * Identifies the [AngleY](skewtransform_angley.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.skewtransform.angleyproperty
     * @type {DependencyProperty} 
     */
    static AngleYProperty {
        get => SkewTransform.get_AngleYProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_CenterXProperty() {
        if (!SkewTransform.HasProp("__ISkewTransformStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.SkewTransform")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISkewTransformStatics.IID)
            SkewTransform.__ISkewTransformStatics := ISkewTransformStatics(factoryPtr)
        }

        return SkewTransform.__ISkewTransformStatics.get_CenterXProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_CenterYProperty() {
        if (!SkewTransform.HasProp("__ISkewTransformStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.SkewTransform")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISkewTransformStatics.IID)
            SkewTransform.__ISkewTransformStatics := ISkewTransformStatics(factoryPtr)
        }

        return SkewTransform.__ISkewTransformStatics.get_CenterYProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_AngleXProperty() {
        if (!SkewTransform.HasProp("__ISkewTransformStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.SkewTransform")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISkewTransformStatics.IID)
            SkewTransform.__ISkewTransformStatics := ISkewTransformStatics(factoryPtr)
        }

        return SkewTransform.__ISkewTransformStatics.get_AngleXProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_AngleYProperty() {
        if (!SkewTransform.HasProp("__ISkewTransformStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.SkewTransform")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISkewTransformStatics.IID)
            SkewTransform.__ISkewTransformStatics := ISkewTransformStatics(factoryPtr)
        }

        return SkewTransform.__ISkewTransformStatics.get_AngleYProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the x-coordinate of the transform center.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.skewtransform.centerx
     * @type {Float} 
     */
    CenterX {
        get => this.get_CenterX()
        set => this.put_CenterX(value)
    }

    /**
     * Gets or sets the y-coordinate of the transform center.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.skewtransform.centery
     * @type {Float} 
     */
    CenterY {
        get => this.get_CenterY()
        set => this.put_CenterY(value)
    }

    /**
     * Gets or sets the x-axis skew angle, which is measured in degrees counterclockwise from the y-axis.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.skewtransform.anglex
     * @type {Float} 
     */
    AngleX {
        get => this.get_AngleX()
        set => this.put_AngleX(value)
    }

    /**
     * Gets or sets the y-axis skew angle, which is measured in degrees counterclockwise from the x-axis.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.skewtransform.angley
     * @type {Float} 
     */
    AngleY {
        get => this.get_AngleY()
        set => this.put_AngleY(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [SkewTransform](skewtransform.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.SkewTransform")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_CenterX() {
        if (!this.HasProp("__ISkewTransform")) {
            if ((queryResult := this.QueryInterface(ISkewTransform.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISkewTransform := ISkewTransform(outPtr)
        }

        return this.__ISkewTransform.get_CenterX()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_CenterX(value) {
        if (!this.HasProp("__ISkewTransform")) {
            if ((queryResult := this.QueryInterface(ISkewTransform.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISkewTransform := ISkewTransform(outPtr)
        }

        return this.__ISkewTransform.put_CenterX(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_CenterY() {
        if (!this.HasProp("__ISkewTransform")) {
            if ((queryResult := this.QueryInterface(ISkewTransform.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISkewTransform := ISkewTransform(outPtr)
        }

        return this.__ISkewTransform.get_CenterY()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_CenterY(value) {
        if (!this.HasProp("__ISkewTransform")) {
            if ((queryResult := this.QueryInterface(ISkewTransform.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISkewTransform := ISkewTransform(outPtr)
        }

        return this.__ISkewTransform.put_CenterY(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_AngleX() {
        if (!this.HasProp("__ISkewTransform")) {
            if ((queryResult := this.QueryInterface(ISkewTransform.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISkewTransform := ISkewTransform(outPtr)
        }

        return this.__ISkewTransform.get_AngleX()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_AngleX(value) {
        if (!this.HasProp("__ISkewTransform")) {
            if ((queryResult := this.QueryInterface(ISkewTransform.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISkewTransform := ISkewTransform(outPtr)
        }

        return this.__ISkewTransform.put_AngleX(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_AngleY() {
        if (!this.HasProp("__ISkewTransform")) {
            if ((queryResult := this.QueryInterface(ISkewTransform.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISkewTransform := ISkewTransform(outPtr)
        }

        return this.__ISkewTransform.get_AngleY()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_AngleY(value) {
        if (!this.HasProp("__ISkewTransform")) {
            if ((queryResult := this.QueryInterface(ISkewTransform.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISkewTransform := ISkewTransform(outPtr)
        }

        return this.__ISkewTransform.put_AngleY(value)
    }

;@endregion Instance Methods
}
