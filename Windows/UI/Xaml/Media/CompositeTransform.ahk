#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\Transform.ahk
#Include .\ICompositeTransform.ahk
#Include .\ICompositeTransformStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Applies multiple transform operations to an object.
 * @remarks
 * CompositeTransform applies multiple transforms in this order:
 * 
 * 
 * 1. Scale ([ScaleX](compositetransform_scalex.md), [ScaleY](compositetransform_scaley.md) )
 * 1. Skew ([SkewX](compositetransform_skewx.md), [SkewY](compositetransform_skewy.md))
 * 1. Rotate ([Rotation](compositetransform_rotation.md))
 * 1. Translate ([TranslateX](compositetransform_translatex.md), [TranslateY](compositetransform_translatey.md))
 * 
 * If you want to apply multiple transforms to an object in a different order, you can create a [TransformGroup](transformgroup.md) and insert the transforms in your intended order.
 * 
 * CompositeTransform uses the same center point ([CenterX](compositetransform_centerx.md), [CenterY](compositetransform_centery.md)) for all transformations. If you want to specify different center points per transform, use [TransformGroup](transformgroup.md).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.compositetransform
 * @namespace Windows.UI.Xaml.Media
 * @version WindowsRuntime 1.4
 */
class CompositeTransform extends Transform {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICompositeTransform

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICompositeTransform.IID

    /**
     * Identifies the [CenterX](compositetransform_centerx.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.compositetransform.centerxproperty
     * @type {DependencyProperty} 
     */
    static CenterXProperty {
        get => CompositeTransform.get_CenterXProperty()
    }

    /**
     * Identifies the [CenterY](compositetransform_centery.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.compositetransform.centeryproperty
     * @type {DependencyProperty} 
     */
    static CenterYProperty {
        get => CompositeTransform.get_CenterYProperty()
    }

    /**
     * Identifies the [ScaleX](compositetransform_scalex.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.compositetransform.scalexproperty
     * @type {DependencyProperty} 
     */
    static ScaleXProperty {
        get => CompositeTransform.get_ScaleXProperty()
    }

    /**
     * Identifies the [ScaleY](compositetransform_scaley.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.compositetransform.scaleyproperty
     * @type {DependencyProperty} 
     */
    static ScaleYProperty {
        get => CompositeTransform.get_ScaleYProperty()
    }

    /**
     * Identifies the [SkewX](compositetransform_skewx.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.compositetransform.skewxproperty
     * @type {DependencyProperty} 
     */
    static SkewXProperty {
        get => CompositeTransform.get_SkewXProperty()
    }

    /**
     * Identifies the [SkewY](compositetransform_skewy.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.compositetransform.skewyproperty
     * @type {DependencyProperty} 
     */
    static SkewYProperty {
        get => CompositeTransform.get_SkewYProperty()
    }

    /**
     * Identifies the [Rotation](compositetransform_rotation.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.compositetransform.rotationproperty
     * @type {DependencyProperty} 
     */
    static RotationProperty {
        get => CompositeTransform.get_RotationProperty()
    }

    /**
     * Identifies the [TranslateX](compositetransform_translatex.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.compositetransform.translatexproperty
     * @type {DependencyProperty} 
     */
    static TranslateXProperty {
        get => CompositeTransform.get_TranslateXProperty()
    }

    /**
     * Identifies the [TranslateY](compositetransform_translatey.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.compositetransform.translateyproperty
     * @type {DependencyProperty} 
     */
    static TranslateYProperty {
        get => CompositeTransform.get_TranslateYProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_CenterXProperty() {
        if (!CompositeTransform.HasProp("__ICompositeTransformStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.CompositeTransform")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICompositeTransformStatics.IID)
            CompositeTransform.__ICompositeTransformStatics := ICompositeTransformStatics(factoryPtr)
        }

        return CompositeTransform.__ICompositeTransformStatics.get_CenterXProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_CenterYProperty() {
        if (!CompositeTransform.HasProp("__ICompositeTransformStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.CompositeTransform")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICompositeTransformStatics.IID)
            CompositeTransform.__ICompositeTransformStatics := ICompositeTransformStatics(factoryPtr)
        }

        return CompositeTransform.__ICompositeTransformStatics.get_CenterYProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ScaleXProperty() {
        if (!CompositeTransform.HasProp("__ICompositeTransformStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.CompositeTransform")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICompositeTransformStatics.IID)
            CompositeTransform.__ICompositeTransformStatics := ICompositeTransformStatics(factoryPtr)
        }

        return CompositeTransform.__ICompositeTransformStatics.get_ScaleXProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ScaleYProperty() {
        if (!CompositeTransform.HasProp("__ICompositeTransformStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.CompositeTransform")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICompositeTransformStatics.IID)
            CompositeTransform.__ICompositeTransformStatics := ICompositeTransformStatics(factoryPtr)
        }

        return CompositeTransform.__ICompositeTransformStatics.get_ScaleYProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_SkewXProperty() {
        if (!CompositeTransform.HasProp("__ICompositeTransformStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.CompositeTransform")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICompositeTransformStatics.IID)
            CompositeTransform.__ICompositeTransformStatics := ICompositeTransformStatics(factoryPtr)
        }

        return CompositeTransform.__ICompositeTransformStatics.get_SkewXProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_SkewYProperty() {
        if (!CompositeTransform.HasProp("__ICompositeTransformStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.CompositeTransform")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICompositeTransformStatics.IID)
            CompositeTransform.__ICompositeTransformStatics := ICompositeTransformStatics(factoryPtr)
        }

        return CompositeTransform.__ICompositeTransformStatics.get_SkewYProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_RotationProperty() {
        if (!CompositeTransform.HasProp("__ICompositeTransformStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.CompositeTransform")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICompositeTransformStatics.IID)
            CompositeTransform.__ICompositeTransformStatics := ICompositeTransformStatics(factoryPtr)
        }

        return CompositeTransform.__ICompositeTransformStatics.get_RotationProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_TranslateXProperty() {
        if (!CompositeTransform.HasProp("__ICompositeTransformStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.CompositeTransform")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICompositeTransformStatics.IID)
            CompositeTransform.__ICompositeTransformStatics := ICompositeTransformStatics(factoryPtr)
        }

        return CompositeTransform.__ICompositeTransformStatics.get_TranslateXProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_TranslateYProperty() {
        if (!CompositeTransform.HasProp("__ICompositeTransformStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.CompositeTransform")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICompositeTransformStatics.IID)
            CompositeTransform.__ICompositeTransformStatics := ICompositeTransformStatics(factoryPtr)
        }

        return CompositeTransform.__ICompositeTransformStatics.get_TranslateYProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the x-coordinate of the center point for all transforms specified by the [CompositeTransform](compositetransform.md) in device-independent pixel (DIP) relative to the upper left-hand corner of the element.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.compositetransform.centerx
     * @type {Float} 
     */
    CenterX {
        get => this.get_CenterX()
        set => this.put_CenterX(value)
    }

    /**
     * Gets or sets the y-coordinate of the center point for all transforms specified by the [CompositeTransform](compositetransform.md) in device-independent pixel (DIP) relative to the upper left-hand corner of the element.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.compositetransform.centery
     * @type {Float} 
     */
    CenterY {
        get => this.get_CenterY()
        set => this.put_CenterY(value)
    }

    /**
     * Gets or sets the x-axis scale factor. You can use this property to stretch or shrink an object horizontally.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.compositetransform.scalex
     * @type {Float} 
     */
    ScaleX {
        get => this.get_ScaleX()
        set => this.put_ScaleX(value)
    }

    /**
     * Gets or sets the y-axis scale factor. You can use this property to stretch or shrink an object vertically.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.compositetransform.scaley
     * @type {Float} 
     */
    ScaleY {
        get => this.get_ScaleY()
        set => this.put_ScaleY(value)
    }

    /**
     * Gets or sets the x-axis skew angle, which is measured in degrees counterclockwise from the y-axis. A skew transform can be useful for creating the illusion of three-dimensional depth in a two-dimensional object.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.compositetransform.skewx
     * @type {Float} 
     */
    SkewX {
        get => this.get_SkewX()
        set => this.put_SkewX(value)
    }

    /**
     * Gets or sets the y-axis skew angle, which is measured in degrees counterclockwise from the x-axis. A skew transform can be useful for creating the illusion of three-dimensional depth in a two-dimensional object.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.compositetransform.skewy
     * @type {Float} 
     */
    SkewY {
        get => this.get_SkewY()
        set => this.put_SkewY(value)
    }

    /**
     * Gets or sets the angle, in degrees, of clockwise rotation.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.compositetransform.rotation
     * @type {Float} 
     */
    Rotation {
        get => this.get_Rotation()
        set => this.put_Rotation(value)
    }

    /**
     * Gets or sets the distance to translate along the x-axis.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.compositetransform.translatex
     * @type {Float} 
     */
    TranslateX {
        get => this.get_TranslateX()
        set => this.put_TranslateX(value)
    }

    /**
     * Gets or sets the distance to translate (move) an object along the y-axis.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.compositetransform.translatey
     * @type {Float} 
     */
    TranslateY {
        get => this.get_TranslateY()
        set => this.put_TranslateY(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [CompositeTransform](compositetransform.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.CompositeTransform")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_CenterX() {
        if (!this.HasProp("__ICompositeTransform")) {
            if ((queryResult := this.QueryInterface(ICompositeTransform.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositeTransform := ICompositeTransform(outPtr)
        }

        return this.__ICompositeTransform.get_CenterX()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_CenterX(value) {
        if (!this.HasProp("__ICompositeTransform")) {
            if ((queryResult := this.QueryInterface(ICompositeTransform.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositeTransform := ICompositeTransform(outPtr)
        }

        return this.__ICompositeTransform.put_CenterX(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_CenterY() {
        if (!this.HasProp("__ICompositeTransform")) {
            if ((queryResult := this.QueryInterface(ICompositeTransform.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositeTransform := ICompositeTransform(outPtr)
        }

        return this.__ICompositeTransform.get_CenterY()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_CenterY(value) {
        if (!this.HasProp("__ICompositeTransform")) {
            if ((queryResult := this.QueryInterface(ICompositeTransform.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositeTransform := ICompositeTransform(outPtr)
        }

        return this.__ICompositeTransform.put_CenterY(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_ScaleX() {
        if (!this.HasProp("__ICompositeTransform")) {
            if ((queryResult := this.QueryInterface(ICompositeTransform.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositeTransform := ICompositeTransform(outPtr)
        }

        return this.__ICompositeTransform.get_ScaleX()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_ScaleX(value) {
        if (!this.HasProp("__ICompositeTransform")) {
            if ((queryResult := this.QueryInterface(ICompositeTransform.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositeTransform := ICompositeTransform(outPtr)
        }

        return this.__ICompositeTransform.put_ScaleX(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_ScaleY() {
        if (!this.HasProp("__ICompositeTransform")) {
            if ((queryResult := this.QueryInterface(ICompositeTransform.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositeTransform := ICompositeTransform(outPtr)
        }

        return this.__ICompositeTransform.get_ScaleY()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_ScaleY(value) {
        if (!this.HasProp("__ICompositeTransform")) {
            if ((queryResult := this.QueryInterface(ICompositeTransform.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositeTransform := ICompositeTransform(outPtr)
        }

        return this.__ICompositeTransform.put_ScaleY(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_SkewX() {
        if (!this.HasProp("__ICompositeTransform")) {
            if ((queryResult := this.QueryInterface(ICompositeTransform.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositeTransform := ICompositeTransform(outPtr)
        }

        return this.__ICompositeTransform.get_SkewX()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_SkewX(value) {
        if (!this.HasProp("__ICompositeTransform")) {
            if ((queryResult := this.QueryInterface(ICompositeTransform.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositeTransform := ICompositeTransform(outPtr)
        }

        return this.__ICompositeTransform.put_SkewX(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_SkewY() {
        if (!this.HasProp("__ICompositeTransform")) {
            if ((queryResult := this.QueryInterface(ICompositeTransform.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositeTransform := ICompositeTransform(outPtr)
        }

        return this.__ICompositeTransform.get_SkewY()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_SkewY(value) {
        if (!this.HasProp("__ICompositeTransform")) {
            if ((queryResult := this.QueryInterface(ICompositeTransform.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositeTransform := ICompositeTransform(outPtr)
        }

        return this.__ICompositeTransform.put_SkewY(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_Rotation() {
        if (!this.HasProp("__ICompositeTransform")) {
            if ((queryResult := this.QueryInterface(ICompositeTransform.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositeTransform := ICompositeTransform(outPtr)
        }

        return this.__ICompositeTransform.get_Rotation()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_Rotation(value) {
        if (!this.HasProp("__ICompositeTransform")) {
            if ((queryResult := this.QueryInterface(ICompositeTransform.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositeTransform := ICompositeTransform(outPtr)
        }

        return this.__ICompositeTransform.put_Rotation(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_TranslateX() {
        if (!this.HasProp("__ICompositeTransform")) {
            if ((queryResult := this.QueryInterface(ICompositeTransform.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositeTransform := ICompositeTransform(outPtr)
        }

        return this.__ICompositeTransform.get_TranslateX()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_TranslateX(value) {
        if (!this.HasProp("__ICompositeTransform")) {
            if ((queryResult := this.QueryInterface(ICompositeTransform.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositeTransform := ICompositeTransform(outPtr)
        }

        return this.__ICompositeTransform.put_TranslateX(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_TranslateY() {
        if (!this.HasProp("__ICompositeTransform")) {
            if ((queryResult := this.QueryInterface(ICompositeTransform.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositeTransform := ICompositeTransform(outPtr)
        }

        return this.__ICompositeTransform.get_TranslateY()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_TranslateY(value) {
        if (!this.HasProp("__ICompositeTransform")) {
            if ((queryResult := this.QueryInterface(ICompositeTransform.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositeTransform := ICompositeTransform(outPtr)
        }

        return this.__ICompositeTransform.put_TranslateY(value)
    }

;@endregion Instance Methods
}
