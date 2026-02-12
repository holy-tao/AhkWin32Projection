#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\DependencyObject.ahk
#Include .\IBrush.ahk
#Include .\IBrushOverrides2.ahk
#Include ..\..\Composition\IAnimationObject.ahk
#Include .\IBrushStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Defines objects used to paint graphical objects. Classes that derive from Brush describe how the area is painted.
 * @remarks
 * For examples and further explanation of the UI drawing concepts represented by Brush, see [Use brushes](/windows/uwp/graphics/using-brushes).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.brush
 * @namespace Windows.UI.Xaml.Media
 * @version WindowsRuntime 1.4
 */
class Brush extends DependencyObject {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IBrush

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IBrush.IID

    /**
     * Identifies the [Opacity](brush_opacity.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.brush.opacityproperty
     * @type {DependencyProperty} 
     */
    static OpacityProperty {
        get => Brush.get_OpacityProperty()
    }

    /**
     * Identifies the [Transform](brush_transform.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.brush.transformproperty
     * @type {DependencyProperty} 
     */
    static TransformProperty {
        get => Brush.get_TransformProperty()
    }

    /**
     * Identifies the [RelativeTransform](brush_relativetransform.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.brush.relativetransformproperty
     * @type {DependencyProperty} 
     */
    static RelativeTransformProperty {
        get => Brush.get_RelativeTransformProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_OpacityProperty() {
        if (!Brush.HasProp("__IBrushStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Brush")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBrushStatics.IID)
            Brush.__IBrushStatics := IBrushStatics(factoryPtr)
        }

        return Brush.__IBrushStatics.get_OpacityProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_TransformProperty() {
        if (!Brush.HasProp("__IBrushStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Brush")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBrushStatics.IID)
            Brush.__IBrushStatics := IBrushStatics(factoryPtr)
        }

        return Brush.__IBrushStatics.get_TransformProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_RelativeTransformProperty() {
        if (!Brush.HasProp("__IBrushStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.Brush")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBrushStatics.IID)
            Brush.__IBrushStatics := IBrushStatics(factoryPtr)
        }

        return Brush.__IBrushStatics.get_RelativeTransformProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the degree of opacity of a [Brush](brush.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.brush.opacity
     * @type {Float} 
     */
    Opacity {
        get => this.get_Opacity()
        set => this.put_Opacity(value)
    }

    /**
     * Gets or sets the transformation that is applied to the brush.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.brush.transform
     * @type {Transform} 
     */
    Transform {
        get => this.get_Transform()
        set => this.put_Transform(value)
    }

    /**
     * Gets or sets the transformation that is applied to the brush using relative coordinates.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.brush.relativetransform
     * @type {Transform} 
     */
    RelativeTransform {
        get => this.get_RelativeTransform()
        set => this.put_RelativeTransform(value)
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
    get_Opacity() {
        if (!this.HasProp("__IBrush")) {
            if ((queryResult := this.QueryInterface(IBrush.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBrush := IBrush(outPtr)
        }

        return this.__IBrush.get_Opacity()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_Opacity(value) {
        if (!this.HasProp("__IBrush")) {
            if ((queryResult := this.QueryInterface(IBrush.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBrush := IBrush(outPtr)
        }

        return this.__IBrush.put_Opacity(value)
    }

    /**
     * 
     * @returns {Transform} 
     */
    get_Transform() {
        if (!this.HasProp("__IBrush")) {
            if ((queryResult := this.QueryInterface(IBrush.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBrush := IBrush(outPtr)
        }

        return this.__IBrush.get_Transform()
    }

    /**
     * 
     * @param {Transform} value 
     * @returns {HRESULT} 
     */
    put_Transform(value) {
        if (!this.HasProp("__IBrush")) {
            if ((queryResult := this.QueryInterface(IBrush.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBrush := IBrush(outPtr)
        }

        return this.__IBrush.put_Transform(value)
    }

    /**
     * 
     * @returns {Transform} 
     */
    get_RelativeTransform() {
        if (!this.HasProp("__IBrush")) {
            if ((queryResult := this.QueryInterface(IBrush.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBrush := IBrush(outPtr)
        }

        return this.__IBrush.get_RelativeTransform()
    }

    /**
     * 
     * @param {Transform} value 
     * @returns {HRESULT} 
     */
    put_RelativeTransform(value) {
        if (!this.HasProp("__IBrush")) {
            if ((queryResult := this.QueryInterface(IBrush.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBrush := IBrush(outPtr)
        }

        return this.__IBrush.put_RelativeTransform(value)
    }

    /**
     * When overridden in a derived class, defines a property that can be animated.
     * @param {HSTRING} propertyName The property that can be animated.
     * @param {AnimationPropertyInfo} animationPropertyInfo_ Information about the property to be animated.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.brush.populatepropertyinfooverride
     */
    PopulatePropertyInfoOverride(propertyName, animationPropertyInfo_) {
        if (!this.HasProp("__IBrushOverrides2")) {
            if ((queryResult := this.QueryInterface(IBrushOverrides2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBrushOverrides2 := IBrushOverrides2(outPtr)
        }

        return this.__IBrushOverrides2.PopulatePropertyInfoOverride(propertyName, animationPropertyInfo_)
    }

    /**
     * Defines a property that can be animated.
     * @param {HSTRING} propertyName The property that can be animated.
     * @param {AnimationPropertyInfo} propertyInfo Information about the property to be animated.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.brush.populatepropertyinfo
     */
    PopulatePropertyInfo(propertyName, propertyInfo) {
        if (!this.HasProp("__IAnimationObject")) {
            if ((queryResult := this.QueryInterface(IAnimationObject.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAnimationObject := IAnimationObject(outPtr)
        }

        return this.__IAnimationObject.PopulatePropertyInfo(propertyName, propertyInfo)
    }

;@endregion Instance Methods
}
