#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\Transform.ahk
#Include .\IRotateTransform.ahk
#Include .\IRotateTransformStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Rotates an object around a specified point in a two-dimensional x-y coordinate system.
 * @remarks
 * A RotateTransform is defined by an [Angle](rotatetransform_angle.md) that rotates an object through an arc around the point [CenterX](rotatetransform_centerx.md), [CenterY](rotatetransform_centery.md).
 * 
 * If the [Angle](rotatetransform_angle.md) value applied is positive, the rotation applied is in the clockwise direction. It's legal to use an [Angle](rotatetransform_angle.md) value that's negative, which causes the rotation to be counterclockwise. For values less than –360 or greater than 360, the values wrap around and are treated as if the mathematical operation `mod(360)` was applied.
 * 
 * To rotate in place, leave [CenterX](rotatetransform_centerx.md), [CenterY](rotatetransform_centery.md) as the default (0,0). You might use a nondefault [CenterX](rotatetransform_centerx.md), [CenterY](rotatetransform_centery.md) if you don't want to rotate in place and instead want to rotate around a point in the transform's frame of reference. For example, you can simulate an orbit.
 * 
 * A [Transform](transform.md) is typically used to fill the [UIElement.RenderTransform](../windows.ui.xaml/uielement_rendertransform.md) property, to change how an element renders. [UIElement](../windows.ui.xaml/uielement.md) also has the [UIElement.RenderTransformOrigin](../windows.ui.xaml/uielement_rendertransformorigin.md) property, which defaults to (0,0). [RenderTransformOrigin](../windows.ui.xaml/uielement_rendertransformorigin.md) establishes the coordinate frame of reference for how all transformations including the RotateTransform will apply. A common scenario for RotateTransform is to rotate an object in place around its center (either as an animation or as a one-time transformation). With the default [UIElement.RenderTransformOrigin](../windows.ui.xaml/uielement_rendertransformorigin.md) of (0,0) an object won't rotate around its center, it rotates around the top left corner of its bounding box. Therefore, the common way to cause an object to rotate around its center is to leave [CenterX](rotatetransform_centerx.md), [CenterY](rotatetransform_centery.md) as (0,0) but set [UIElement.RenderTransformOrigin](../windows.ui.xaml/uielement_rendertransformorigin.md) to be a logical [Point](../windows.foundation/point.md) where the values are (0.5,0.5). Using the logical point convention, that puts the [UIElement.RenderTransformOrigin](../windows.ui.xaml/uielement_rendertransformorigin.md) at the center point of the object, in other words at an origin where (*x*,*y*) are exactly half of the [ActualHeight](../windows.ui.xaml/frameworkelement_actualheight.md) and [ActualWidth](../windows.ui.xaml/frameworkelement_actualwidth.md) values.
 * 
 * [UIElement.RenderTransformOrigin](../windows.ui.xaml/uielement_rendertransformorigin.md) uses the logical point convention; [CenterX](rotatetransform_centerx.md) and [CenterY](rotatetransform_centery.md) don't use that convention, they use actual pixel values.
 * 
 * The rendering position for an object can be offset on a [Canvas](../windows.ui.xaml.controls/canvas.md) using [Canvas.Left](/uwp/api/windows.ui.xaml.controls.canvas.left) and [Canvas.Top](/uwp/api/windows.ui.xaml.controls.canvas.top), but this does not count as a transformation; the object retains its own local (0,0) origin when it's positioned in a [Canvas](../windows.ui.xaml.controls/canvas.md).
 * 
 * There are other properties and relationships that can affect how the rotation appears. If there are multiple transformations applied by using a [TransformGroup](transformgroup.md), the order matters. The transformations are applied in the order that they appear in the [TransformCollection](transformcollection.md). Especially if one of the transformations is a [TranslateTransform](translatetransform.md), you might have to alter the order to get the rotation effect you want.
 * 
 * There are three ways to apply multiple transformations to the same object: 
 * + Using a [TransformGroup](transformgroup.md), where you can specify the order that each transformation applies.
 * + Using a [CompositeTransform](compositetransform.md), where each of the transformations is enabled by properties of a shared [Transform](transform.md) object and the transformations are applied in a fixed, known order.
 * + Using a [MatrixTransform](matrixtransform.md), where you set the various properties that control the 3×3 matrix in such a way that you're combining the typical classifications of transformations into one [Transform](transform.md). Unless you're using a design tool to help set the values, this is probably the most advanced technique.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.rotatetransform
 * @namespace Windows.UI.Xaml.Media
 * @version WindowsRuntime 1.4
 */
class RotateTransform extends Transform {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IRotateTransform

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IRotateTransform.IID

    /**
     * Identifies the [CenterX](rotatetransform_centerx.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.rotatetransform.centerxproperty
     * @type {DependencyProperty} 
     */
    static CenterXProperty {
        get => RotateTransform.get_CenterXProperty()
    }

    /**
     * Identifies the [CenterY](rotatetransform_centery.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.rotatetransform.centeryproperty
     * @type {DependencyProperty} 
     */
    static CenterYProperty {
        get => RotateTransform.get_CenterYProperty()
    }

    /**
     * Identifies the [Angle](rotatetransform_angle.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.rotatetransform.angleproperty
     * @type {DependencyProperty} 
     */
    static AngleProperty {
        get => RotateTransform.get_AngleProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_CenterXProperty() {
        if (!RotateTransform.HasProp("__IRotateTransformStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.RotateTransform")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRotateTransformStatics.IID)
            RotateTransform.__IRotateTransformStatics := IRotateTransformStatics(factoryPtr)
        }

        return RotateTransform.__IRotateTransformStatics.get_CenterXProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_CenterYProperty() {
        if (!RotateTransform.HasProp("__IRotateTransformStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.RotateTransform")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRotateTransformStatics.IID)
            RotateTransform.__IRotateTransformStatics := IRotateTransformStatics(factoryPtr)
        }

        return RotateTransform.__IRotateTransformStatics.get_CenterYProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_AngleProperty() {
        if (!RotateTransform.HasProp("__IRotateTransformStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.RotateTransform")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRotateTransformStatics.IID)
            RotateTransform.__IRotateTransformStatics := IRotateTransformStatics(factoryPtr)
        }

        return RotateTransform.__IRotateTransformStatics.get_AngleProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the x-coordinate of the rotation center point for this transformation.
     * @remarks
     * When a [RotateTransform](rotatetransform.md) is applied as the [RenderTransform](../windows.ui.xaml/uielement_rendertransform.md) for a [UIElement](../windows.ui.xaml/uielement.md), the [RenderTransformOrigin](../windows.ui.xaml/uielement_rendertransformorigin.md) can also affect how the transformation behaves. In particular this affects the center point that the [UIElement](../windows.ui.xaml/uielement.md) rotates around. For more info, see Remarks in [RotateTransform](rotatetransform.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.rotatetransform.centerx
     * @type {Float} 
     */
    CenterX {
        get => this.get_CenterX()
        set => this.put_CenterX(value)
    }

    /**
     * Gets or sets the y-coordinate of the rotation center point for this transformation.
     * @remarks
     * When a [RotateTransform](rotatetransform.md) is applied as the [RenderTransform](../windows.ui.xaml/uielement_rendertransform.md) for a [UIElement](../windows.ui.xaml/uielement.md), the [RenderTransformOrigin](../windows.ui.xaml/uielement_rendertransformorigin.md) can also affect how the transformation behaves. In particular this affects the center point that the [UIElement](../windows.ui.xaml/uielement.md) rotates around. For more info, see Remarks in [RotateTransform](rotatetransform.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.rotatetransform.centery
     * @type {Float} 
     */
    CenterY {
        get => this.get_CenterY()
        set => this.put_CenterY(value)
    }

    /**
     * Gets or sets the angle, in degrees, of clockwise rotation.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.rotatetransform.angle
     * @type {Float} 
     */
    Angle {
        get => this.get_Angle()
        set => this.put_Angle(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [RotateTransform](rotatetransform.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.RotateTransform")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_CenterX() {
        if (!this.HasProp("__IRotateTransform")) {
            if ((queryResult := this.QueryInterface(IRotateTransform.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRotateTransform := IRotateTransform(outPtr)
        }

        return this.__IRotateTransform.get_CenterX()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_CenterX(value) {
        if (!this.HasProp("__IRotateTransform")) {
            if ((queryResult := this.QueryInterface(IRotateTransform.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRotateTransform := IRotateTransform(outPtr)
        }

        return this.__IRotateTransform.put_CenterX(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_CenterY() {
        if (!this.HasProp("__IRotateTransform")) {
            if ((queryResult := this.QueryInterface(IRotateTransform.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRotateTransform := IRotateTransform(outPtr)
        }

        return this.__IRotateTransform.get_CenterY()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_CenterY(value) {
        if (!this.HasProp("__IRotateTransform")) {
            if ((queryResult := this.QueryInterface(IRotateTransform.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRotateTransform := IRotateTransform(outPtr)
        }

        return this.__IRotateTransform.put_CenterY(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_Angle() {
        if (!this.HasProp("__IRotateTransform")) {
            if ((queryResult := this.QueryInterface(IRotateTransform.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRotateTransform := IRotateTransform(outPtr)
        }

        return this.__IRotateTransform.get_Angle()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_Angle(value) {
        if (!this.HasProp("__IRotateTransform")) {
            if ((queryResult := this.QueryInterface(IRotateTransform.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRotateTransform := IRotateTransform(outPtr)
        }

        return this.__IRotateTransform.put_Angle(value)
    }

;@endregion Instance Methods
}
