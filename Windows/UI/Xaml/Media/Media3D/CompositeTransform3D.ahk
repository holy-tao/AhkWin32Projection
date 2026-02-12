#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\Transform3D.ahk
#Include .\ICompositeTransform3D.ahk
#Include .\ICompositeTransform3DStatics.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Represents 3-D scale, rotation, and translate transforms to be applied to an element.
 * @remarks
 * For examples and more info about using [CompositeTransform3D class, see the [UIElement.Transform3D](../windows.ui.xaml/uielement_transform3d.md) property.
 * 
 * The available transforms are applied in the following order:
 * 
 * + Scale ([ScaleX](compositetransform3d_scalex.md), [ScaleY](compositetransform3d_scaley.md), [ScaleZ](compositetransform3d_scalez.md))
 * + Rotation ([RotationX](compositetransform3d_rotationx.md), [RotationY](compositetransform3d_rotationy.md), [RotationZ](compositetransform3d_rotationz.md))
 * + Translate ([TranslateX](compositetransform3d_translatex.md), [TranslateY](compositetransform3d_translatey.md), [TranslateZ](compositetransform3d_translatez.md))
 * 
 * All transformations occur around the same center point defined by [CenterX](compositetransform3d_centerx.md), [CenterY](compositetransform3d_centery.md), and [CenterZ](compositetransform3d_centerz.md).
 * 
 * You can animate each property of a CompositeTransform3D independently.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.media3d.compositetransform3d
 * @namespace Windows.UI.Xaml.Media.Media3D
 * @version WindowsRuntime 1.4
 */
class CompositeTransform3D extends Transform3D {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICompositeTransform3D

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICompositeTransform3D.IID

    /**
     * Identifies the [CenterX](compositetransform3d_centerx.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.media3d.compositetransform3d.centerxproperty
     * @type {DependencyProperty} 
     */
    static CenterXProperty {
        get => CompositeTransform3D.get_CenterXProperty()
    }

    /**
     * Identifies the [CenterY](compositetransform3d_centery.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.media3d.compositetransform3d.centeryproperty
     * @type {DependencyProperty} 
     */
    static CenterYProperty {
        get => CompositeTransform3D.get_CenterYProperty()
    }

    /**
     * Identifies the [CenterZ](compositetransform3d_centerz.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.media3d.compositetransform3d.centerzproperty
     * @type {DependencyProperty} 
     */
    static CenterZProperty {
        get => CompositeTransform3D.get_CenterZProperty()
    }

    /**
     * Identifies the [RotationX](compositetransform3d_rotationx.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.media3d.compositetransform3d.rotationxproperty
     * @type {DependencyProperty} 
     */
    static RotationXProperty {
        get => CompositeTransform3D.get_RotationXProperty()
    }

    /**
     * Identifies the [RotationY](compositetransform3d_rotationy.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.media3d.compositetransform3d.rotationyproperty
     * @type {DependencyProperty} 
     */
    static RotationYProperty {
        get => CompositeTransform3D.get_RotationYProperty()
    }

    /**
     * Identifies the [RotationZ](compositetransform3d_rotationz.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.media3d.compositetransform3d.rotationzproperty
     * @type {DependencyProperty} 
     */
    static RotationZProperty {
        get => CompositeTransform3D.get_RotationZProperty()
    }

    /**
     * Identifies the [ScaleX](compositetransform3d_scalex.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.media3d.compositetransform3d.scalexproperty
     * @type {DependencyProperty} 
     */
    static ScaleXProperty {
        get => CompositeTransform3D.get_ScaleXProperty()
    }

    /**
     * Identifies the [ScaleY](compositetransform3d_scaley.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.media3d.compositetransform3d.scaleyproperty
     * @type {DependencyProperty} 
     */
    static ScaleYProperty {
        get => CompositeTransform3D.get_ScaleYProperty()
    }

    /**
     * Identifies the [ScaleZ](compositetransform3d_scalez.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.media3d.compositetransform3d.scalezproperty
     * @type {DependencyProperty} 
     */
    static ScaleZProperty {
        get => CompositeTransform3D.get_ScaleZProperty()
    }

    /**
     * Identifies the [TranslateX](compositetransform3d_translatex.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.media3d.compositetransform3d.translatexproperty
     * @type {DependencyProperty} 
     */
    static TranslateXProperty {
        get => CompositeTransform3D.get_TranslateXProperty()
    }

    /**
     * Identifies the [TranslateY](compositetransform3d_translatey.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.media3d.compositetransform3d.translateyproperty
     * @type {DependencyProperty} 
     */
    static TranslateYProperty {
        get => CompositeTransform3D.get_TranslateYProperty()
    }

    /**
     * Identifies the [TranslateZ](compositetransform3d_translatez.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.media3d.compositetransform3d.translatezproperty
     * @type {DependencyProperty} 
     */
    static TranslateZProperty {
        get => CompositeTransform3D.get_TranslateZProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_CenterXProperty() {
        if (!CompositeTransform3D.HasProp("__ICompositeTransform3DStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Media3D.CompositeTransform3D")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICompositeTransform3DStatics.IID)
            CompositeTransform3D.__ICompositeTransform3DStatics := ICompositeTransform3DStatics(factoryPtr)
        }

        return CompositeTransform3D.__ICompositeTransform3DStatics.get_CenterXProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_CenterYProperty() {
        if (!CompositeTransform3D.HasProp("__ICompositeTransform3DStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Media3D.CompositeTransform3D")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICompositeTransform3DStatics.IID)
            CompositeTransform3D.__ICompositeTransform3DStatics := ICompositeTransform3DStatics(factoryPtr)
        }

        return CompositeTransform3D.__ICompositeTransform3DStatics.get_CenterYProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_CenterZProperty() {
        if (!CompositeTransform3D.HasProp("__ICompositeTransform3DStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Media3D.CompositeTransform3D")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICompositeTransform3DStatics.IID)
            CompositeTransform3D.__ICompositeTransform3DStatics := ICompositeTransform3DStatics(factoryPtr)
        }

        return CompositeTransform3D.__ICompositeTransform3DStatics.get_CenterZProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_RotationXProperty() {
        if (!CompositeTransform3D.HasProp("__ICompositeTransform3DStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Media3D.CompositeTransform3D")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICompositeTransform3DStatics.IID)
            CompositeTransform3D.__ICompositeTransform3DStatics := ICompositeTransform3DStatics(factoryPtr)
        }

        return CompositeTransform3D.__ICompositeTransform3DStatics.get_RotationXProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_RotationYProperty() {
        if (!CompositeTransform3D.HasProp("__ICompositeTransform3DStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Media3D.CompositeTransform3D")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICompositeTransform3DStatics.IID)
            CompositeTransform3D.__ICompositeTransform3DStatics := ICompositeTransform3DStatics(factoryPtr)
        }

        return CompositeTransform3D.__ICompositeTransform3DStatics.get_RotationYProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_RotationZProperty() {
        if (!CompositeTransform3D.HasProp("__ICompositeTransform3DStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Media3D.CompositeTransform3D")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICompositeTransform3DStatics.IID)
            CompositeTransform3D.__ICompositeTransform3DStatics := ICompositeTransform3DStatics(factoryPtr)
        }

        return CompositeTransform3D.__ICompositeTransform3DStatics.get_RotationZProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ScaleXProperty() {
        if (!CompositeTransform3D.HasProp("__ICompositeTransform3DStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Media3D.CompositeTransform3D")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICompositeTransform3DStatics.IID)
            CompositeTransform3D.__ICompositeTransform3DStatics := ICompositeTransform3DStatics(factoryPtr)
        }

        return CompositeTransform3D.__ICompositeTransform3DStatics.get_ScaleXProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ScaleYProperty() {
        if (!CompositeTransform3D.HasProp("__ICompositeTransform3DStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Media3D.CompositeTransform3D")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICompositeTransform3DStatics.IID)
            CompositeTransform3D.__ICompositeTransform3DStatics := ICompositeTransform3DStatics(factoryPtr)
        }

        return CompositeTransform3D.__ICompositeTransform3DStatics.get_ScaleYProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ScaleZProperty() {
        if (!CompositeTransform3D.HasProp("__ICompositeTransform3DStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Media3D.CompositeTransform3D")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICompositeTransform3DStatics.IID)
            CompositeTransform3D.__ICompositeTransform3DStatics := ICompositeTransform3DStatics(factoryPtr)
        }

        return CompositeTransform3D.__ICompositeTransform3DStatics.get_ScaleZProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_TranslateXProperty() {
        if (!CompositeTransform3D.HasProp("__ICompositeTransform3DStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Media3D.CompositeTransform3D")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICompositeTransform3DStatics.IID)
            CompositeTransform3D.__ICompositeTransform3DStatics := ICompositeTransform3DStatics(factoryPtr)
        }

        return CompositeTransform3D.__ICompositeTransform3DStatics.get_TranslateXProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_TranslateYProperty() {
        if (!CompositeTransform3D.HasProp("__ICompositeTransform3DStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Media3D.CompositeTransform3D")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICompositeTransform3DStatics.IID)
            CompositeTransform3D.__ICompositeTransform3DStatics := ICompositeTransform3DStatics(factoryPtr)
        }

        return CompositeTransform3D.__ICompositeTransform3DStatics.get_TranslateYProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_TranslateZProperty() {
        if (!CompositeTransform3D.HasProp("__ICompositeTransform3DStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Media3D.CompositeTransform3D")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICompositeTransform3DStatics.IID)
            CompositeTransform3D.__ICompositeTransform3DStatics := ICompositeTransform3DStatics(factoryPtr)
        }

        return CompositeTransform3D.__ICompositeTransform3DStatics.get_TranslateZProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the x-coordinate of the center point in pixels for all transforms specified by the [CompositeTransform3D](compositetransform3d.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.media3d.compositetransform3d.centerx
     * @type {Float} 
     */
    CenterX {
        get => this.get_CenterX()
        set => this.put_CenterX(value)
    }

    /**
     * Gets the y-coordinate of the center point in pixels for all transforms specified by the [CompositeTransform3D](compositetransform3d.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.media3d.compositetransform3d.centery
     * @type {Float} 
     */
    CenterY {
        get => this.get_CenterY()
        set => this.put_CenterY(value)
    }

    /**
     * Gets the z-coordinate of the center point in pixels for all transforms specified by the [CompositeTransform3D](compositetransform3d.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.media3d.compositetransform3d.centerz
     * @type {Float} 
     */
    CenterZ {
        get => this.get_CenterZ()
        set => this.put_CenterZ(value)
    }

    /**
     * Gets or sets the angle in degrees of counterclockwise rotation around the x-axis.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.media3d.compositetransform3d.rotationx
     * @type {Float} 
     */
    RotationX {
        get => this.get_RotationX()
        set => this.put_RotationX(value)
    }

    /**
     * Gets or sets the angle in degrees of counterclockwise rotation around the y-axis.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.media3d.compositetransform3d.rotationy
     * @type {Float} 
     */
    RotationY {
        get => this.get_RotationY()
        set => this.put_RotationY(value)
    }

    /**
     * Gets or sets the angle in degrees of counterclockwise rotation around the z-axis.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.media3d.compositetransform3d.rotationz
     * @type {Float} 
     */
    RotationZ {
        get => this.get_RotationZ()
        set => this.put_RotationZ(value)
    }

    /**
     * Gets or sets the x-axis scale factor. You can use this property to stretch or shrink an object along this axis.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.media3d.compositetransform3d.scalex
     * @type {Float} 
     */
    ScaleX {
        get => this.get_ScaleX()
        set => this.put_ScaleX(value)
    }

    /**
     * Gets or sets the y-axis scale factor. You can use this property to stretch or shrink an object along this axis.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.media3d.compositetransform3d.scaley
     * @type {Float} 
     */
    ScaleY {
        get => this.get_ScaleY()
        set => this.put_ScaleY(value)
    }

    /**
     * Gets or sets the z-axis scale factor. You can use this property to stretch or shrink an object along this axis.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.media3d.compositetransform3d.scalez
     * @type {Float} 
     */
    ScaleZ {
        get => this.get_ScaleZ()
        set => this.put_ScaleZ(value)
    }

    /**
     * Gets or sets the distance to translate along the x-axis in pixels.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.media3d.compositetransform3d.translatex
     * @type {Float} 
     */
    TranslateX {
        get => this.get_TranslateX()
        set => this.put_TranslateX(value)
    }

    /**
     * Gets or sets the distance to translate along the y-axis in pixels.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.media3d.compositetransform3d.translatey
     * @type {Float} 
     */
    TranslateY {
        get => this.get_TranslateY()
        set => this.put_TranslateY(value)
    }

    /**
     * Gets or sets the distance to translate along the z-axis in pixels.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.media3d.compositetransform3d.translatez
     * @type {Float} 
     */
    TranslateZ {
        get => this.get_TranslateZ()
        set => this.put_TranslateZ(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [CompositeTransform3D](compositetransform3d.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Media3D.CompositeTransform3D")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_CenterX() {
        if (!this.HasProp("__ICompositeTransform3D")) {
            if ((queryResult := this.QueryInterface(ICompositeTransform3D.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositeTransform3D := ICompositeTransform3D(outPtr)
        }

        return this.__ICompositeTransform3D.get_CenterX()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_CenterX(value) {
        if (!this.HasProp("__ICompositeTransform3D")) {
            if ((queryResult := this.QueryInterface(ICompositeTransform3D.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositeTransform3D := ICompositeTransform3D(outPtr)
        }

        return this.__ICompositeTransform3D.put_CenterX(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_CenterY() {
        if (!this.HasProp("__ICompositeTransform3D")) {
            if ((queryResult := this.QueryInterface(ICompositeTransform3D.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositeTransform3D := ICompositeTransform3D(outPtr)
        }

        return this.__ICompositeTransform3D.get_CenterY()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_CenterY(value) {
        if (!this.HasProp("__ICompositeTransform3D")) {
            if ((queryResult := this.QueryInterface(ICompositeTransform3D.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositeTransform3D := ICompositeTransform3D(outPtr)
        }

        return this.__ICompositeTransform3D.put_CenterY(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_CenterZ() {
        if (!this.HasProp("__ICompositeTransform3D")) {
            if ((queryResult := this.QueryInterface(ICompositeTransform3D.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositeTransform3D := ICompositeTransform3D(outPtr)
        }

        return this.__ICompositeTransform3D.get_CenterZ()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_CenterZ(value) {
        if (!this.HasProp("__ICompositeTransform3D")) {
            if ((queryResult := this.QueryInterface(ICompositeTransform3D.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositeTransform3D := ICompositeTransform3D(outPtr)
        }

        return this.__ICompositeTransform3D.put_CenterZ(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_RotationX() {
        if (!this.HasProp("__ICompositeTransform3D")) {
            if ((queryResult := this.QueryInterface(ICompositeTransform3D.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositeTransform3D := ICompositeTransform3D(outPtr)
        }

        return this.__ICompositeTransform3D.get_RotationX()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_RotationX(value) {
        if (!this.HasProp("__ICompositeTransform3D")) {
            if ((queryResult := this.QueryInterface(ICompositeTransform3D.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositeTransform3D := ICompositeTransform3D(outPtr)
        }

        return this.__ICompositeTransform3D.put_RotationX(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_RotationY() {
        if (!this.HasProp("__ICompositeTransform3D")) {
            if ((queryResult := this.QueryInterface(ICompositeTransform3D.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositeTransform3D := ICompositeTransform3D(outPtr)
        }

        return this.__ICompositeTransform3D.get_RotationY()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_RotationY(value) {
        if (!this.HasProp("__ICompositeTransform3D")) {
            if ((queryResult := this.QueryInterface(ICompositeTransform3D.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositeTransform3D := ICompositeTransform3D(outPtr)
        }

        return this.__ICompositeTransform3D.put_RotationY(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_RotationZ() {
        if (!this.HasProp("__ICompositeTransform3D")) {
            if ((queryResult := this.QueryInterface(ICompositeTransform3D.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositeTransform3D := ICompositeTransform3D(outPtr)
        }

        return this.__ICompositeTransform3D.get_RotationZ()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_RotationZ(value) {
        if (!this.HasProp("__ICompositeTransform3D")) {
            if ((queryResult := this.QueryInterface(ICompositeTransform3D.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositeTransform3D := ICompositeTransform3D(outPtr)
        }

        return this.__ICompositeTransform3D.put_RotationZ(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_ScaleX() {
        if (!this.HasProp("__ICompositeTransform3D")) {
            if ((queryResult := this.QueryInterface(ICompositeTransform3D.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositeTransform3D := ICompositeTransform3D(outPtr)
        }

        return this.__ICompositeTransform3D.get_ScaleX()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_ScaleX(value) {
        if (!this.HasProp("__ICompositeTransform3D")) {
            if ((queryResult := this.QueryInterface(ICompositeTransform3D.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositeTransform3D := ICompositeTransform3D(outPtr)
        }

        return this.__ICompositeTransform3D.put_ScaleX(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_ScaleY() {
        if (!this.HasProp("__ICompositeTransform3D")) {
            if ((queryResult := this.QueryInterface(ICompositeTransform3D.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositeTransform3D := ICompositeTransform3D(outPtr)
        }

        return this.__ICompositeTransform3D.get_ScaleY()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_ScaleY(value) {
        if (!this.HasProp("__ICompositeTransform3D")) {
            if ((queryResult := this.QueryInterface(ICompositeTransform3D.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositeTransform3D := ICompositeTransform3D(outPtr)
        }

        return this.__ICompositeTransform3D.put_ScaleY(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_ScaleZ() {
        if (!this.HasProp("__ICompositeTransform3D")) {
            if ((queryResult := this.QueryInterface(ICompositeTransform3D.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositeTransform3D := ICompositeTransform3D(outPtr)
        }

        return this.__ICompositeTransform3D.get_ScaleZ()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_ScaleZ(value) {
        if (!this.HasProp("__ICompositeTransform3D")) {
            if ((queryResult := this.QueryInterface(ICompositeTransform3D.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositeTransform3D := ICompositeTransform3D(outPtr)
        }

        return this.__ICompositeTransform3D.put_ScaleZ(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_TranslateX() {
        if (!this.HasProp("__ICompositeTransform3D")) {
            if ((queryResult := this.QueryInterface(ICompositeTransform3D.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositeTransform3D := ICompositeTransform3D(outPtr)
        }

        return this.__ICompositeTransform3D.get_TranslateX()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_TranslateX(value) {
        if (!this.HasProp("__ICompositeTransform3D")) {
            if ((queryResult := this.QueryInterface(ICompositeTransform3D.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositeTransform3D := ICompositeTransform3D(outPtr)
        }

        return this.__ICompositeTransform3D.put_TranslateX(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_TranslateY() {
        if (!this.HasProp("__ICompositeTransform3D")) {
            if ((queryResult := this.QueryInterface(ICompositeTransform3D.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositeTransform3D := ICompositeTransform3D(outPtr)
        }

        return this.__ICompositeTransform3D.get_TranslateY()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_TranslateY(value) {
        if (!this.HasProp("__ICompositeTransform3D")) {
            if ((queryResult := this.QueryInterface(ICompositeTransform3D.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositeTransform3D := ICompositeTransform3D(outPtr)
        }

        return this.__ICompositeTransform3D.put_TranslateY(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_TranslateZ() {
        if (!this.HasProp("__ICompositeTransform3D")) {
            if ((queryResult := this.QueryInterface(ICompositeTransform3D.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositeTransform3D := ICompositeTransform3D(outPtr)
        }

        return this.__ICompositeTransform3D.get_TranslateZ()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_TranslateZ(value) {
        if (!this.HasProp("__ICompositeTransform3D")) {
            if ((queryResult := this.QueryInterface(ICompositeTransform3D.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositeTransform3D := ICompositeTransform3D(outPtr)
        }

        return this.__ICompositeTransform3D.put_TranslateZ(value)
    }

;@endregion Instance Methods
}
