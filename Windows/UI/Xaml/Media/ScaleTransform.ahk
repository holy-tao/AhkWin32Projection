#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\Transform.ahk
#Include .\IScaleTransform.ahk
#Include .\IScaleTransformStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Scales an object in the two-dimensional x-y coordinate system.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.scaletransform
 * @namespace Windows.UI.Xaml.Media
 * @version WindowsRuntime 1.4
 */
class ScaleTransform extends Transform {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IScaleTransform

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IScaleTransform.IID

    /**
     * Identifies the [CenterX](scaletransform_centerx.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.scaletransform.centerxproperty
     * @type {DependencyProperty} 
     */
    static CenterXProperty {
        get => ScaleTransform.get_CenterXProperty()
    }

    /**
     * Identifies the [CenterY](scaletransform_centery.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.scaletransform.centeryproperty
     * @type {DependencyProperty} 
     */
    static CenterYProperty {
        get => ScaleTransform.get_CenterYProperty()
    }

    /**
     * Identifies the [ScaleX](scaletransform_scalex.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.scaletransform.scalexproperty
     * @type {DependencyProperty} 
     */
    static ScaleXProperty {
        get => ScaleTransform.get_ScaleXProperty()
    }

    /**
     * Identifies the [ScaleY](scaletransform_scaley.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.scaletransform.scaleyproperty
     * @type {DependencyProperty} 
     */
    static ScaleYProperty {
        get => ScaleTransform.get_ScaleYProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_CenterXProperty() {
        if (!ScaleTransform.HasProp("__IScaleTransformStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.ScaleTransform")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IScaleTransformStatics.IID)
            ScaleTransform.__IScaleTransformStatics := IScaleTransformStatics(factoryPtr)
        }

        return ScaleTransform.__IScaleTransformStatics.get_CenterXProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_CenterYProperty() {
        if (!ScaleTransform.HasProp("__IScaleTransformStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.ScaleTransform")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IScaleTransformStatics.IID)
            ScaleTransform.__IScaleTransformStatics := IScaleTransformStatics(factoryPtr)
        }

        return ScaleTransform.__IScaleTransformStatics.get_CenterYProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ScaleXProperty() {
        if (!ScaleTransform.HasProp("__IScaleTransformStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.ScaleTransform")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IScaleTransformStatics.IID)
            ScaleTransform.__IScaleTransformStatics := IScaleTransformStatics(factoryPtr)
        }

        return ScaleTransform.__IScaleTransformStatics.get_ScaleXProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ScaleYProperty() {
        if (!ScaleTransform.HasProp("__IScaleTransformStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.ScaleTransform")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IScaleTransformStatics.IID)
            ScaleTransform.__IScaleTransformStatics := IScaleTransformStatics(factoryPtr)
        }

        return ScaleTransform.__IScaleTransformStatics.get_ScaleYProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the x-coordinate of the center point of this [ScaleTransform](scaletransform.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.scaletransform.centerx
     * @type {Float} 
     */
    CenterX {
        get => this.get_CenterX()
        set => this.put_CenterX(value)
    }

    /**
     * Gets or sets the y-coordinate of the center point of this [ScaleTransform](scaletransform.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.scaletransform.centery
     * @type {Float} 
     */
    CenterY {
        get => this.get_CenterY()
        set => this.put_CenterY(value)
    }

    /**
     * Gets or sets the x-axis scale factor.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.scaletransform.scalex
     * @type {Float} 
     */
    ScaleX {
        get => this.get_ScaleX()
        set => this.put_ScaleX(value)
    }

    /**
     * Gets or sets the y-axis scale factor.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.scaletransform.scaley
     * @type {Float} 
     */
    ScaleY {
        get => this.get_ScaleY()
        set => this.put_ScaleY(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [ScaleTransform](scaletransform.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.ScaleTransform")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_CenterX() {
        if (!this.HasProp("__IScaleTransform")) {
            if ((queryResult := this.QueryInterface(IScaleTransform.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScaleTransform := IScaleTransform(outPtr)
        }

        return this.__IScaleTransform.get_CenterX()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_CenterX(value) {
        if (!this.HasProp("__IScaleTransform")) {
            if ((queryResult := this.QueryInterface(IScaleTransform.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScaleTransform := IScaleTransform(outPtr)
        }

        return this.__IScaleTransform.put_CenterX(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_CenterY() {
        if (!this.HasProp("__IScaleTransform")) {
            if ((queryResult := this.QueryInterface(IScaleTransform.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScaleTransform := IScaleTransform(outPtr)
        }

        return this.__IScaleTransform.get_CenterY()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_CenterY(value) {
        if (!this.HasProp("__IScaleTransform")) {
            if ((queryResult := this.QueryInterface(IScaleTransform.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScaleTransform := IScaleTransform(outPtr)
        }

        return this.__IScaleTransform.put_CenterY(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_ScaleX() {
        if (!this.HasProp("__IScaleTransform")) {
            if ((queryResult := this.QueryInterface(IScaleTransform.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScaleTransform := IScaleTransform(outPtr)
        }

        return this.__IScaleTransform.get_ScaleX()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_ScaleX(value) {
        if (!this.HasProp("__IScaleTransform")) {
            if ((queryResult := this.QueryInterface(IScaleTransform.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScaleTransform := IScaleTransform(outPtr)
        }

        return this.__IScaleTransform.put_ScaleX(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_ScaleY() {
        if (!this.HasProp("__IScaleTransform")) {
            if ((queryResult := this.QueryInterface(IScaleTransform.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScaleTransform := IScaleTransform(outPtr)
        }

        return this.__IScaleTransform.get_ScaleY()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_ScaleY(value) {
        if (!this.HasProp("__IScaleTransform")) {
            if ((queryResult := this.QueryInterface(IScaleTransform.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IScaleTransform := IScaleTransform(outPtr)
        }

        return this.__IScaleTransform.put_ScaleY(value)
    }

;@endregion Instance Methods
}
