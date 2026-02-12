#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\CompositionObject.ahk
#Include .\IVisual.ahk
#Include .\IVisual2.ahk
#Include .\IVisual3.ahk
#Include .\IVisual4.ahk
#Include .\IVisualFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * The base visual object in the visual hierarchy.
 * @remarks
 * Visual objects compose and render serialized drawing content and form the basis of a retained mode visual system. The Visual class supports basic position and clipping and can have 2D and 3D transformations applied to them. Additional functionality like solid colors, images, and content with effects is provided through subclasses like [SpriteVisual](spritevisual.md) or [ContainerVisual](containervisual.md), and by setting the [Brush](spritevisual_brush.md) property of the visual to CompositionBrush subclasses such as [CompositionColorBrush](compositioncolorbrush.md), [CompositionEffectBrush](compositioneffectbrush.md), or [CompositionSurfaceBrush](compositionsurfacebrush.md).
 * 
 * Visual objects are thread-agile and not bound to the UI thread.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.visual
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class Visual extends CompositionObject {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IVisual

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IVisual.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * The point on the visual to be positioned at the visual's offset. Value is normalized with respect to the size of the visual. Animatable.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.visual.anchorpoint
     * @type {Vector2} 
     */
    AnchorPoint {
        get => this.get_AnchorPoint()
        set => this.put_AnchorPoint(value)
    }

    /**
     * Specifies whether the back face of the visual should be visible during a 3D transform.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.visual.backfacevisibility
     * @type {Integer} 
     */
    BackfaceVisibility {
        get => this.get_BackfaceVisibility()
        set => this.put_BackfaceVisibility(value)
    }

    /**
     * Specifies how to compose the edges of bitmaps and clips associated with a visual, or with all visuals in the subtree rooted at this visual. Setting BorderMode at a parent Visual will affect all children visuals in the subtree and can be selectively turned off at each child visual.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.visual.bordermode
     * @type {Integer} 
     */
    BorderMode {
        get => this.get_BorderMode()
        set => this.put_BorderMode(value)
    }

    /**
     * The point about which rotation or scaling occurs. Animatable
     * @remarks
     * CenterPoint is relative to the offset specified in the [AnchorPoint](visual_anchorpoint.md) property.
     * 
     * This property can be animated. Call [CompositionObject.StartAnimation](compositionobject_startanimation_709050842.md) to associate it with a [CompositionAnimation](/windows/uwp/composition/composition-animation).
     * 
     * 
     * <!--
     *       <rem>Visual supports two forms of rotation, by axis-angle, and by orientation.  
     * 
     *       <p>Axis-angle rotation uses the <xref targtype="property_winrt" rid="w_ui_comp.visual_rotationangle">RotationAngle</xref>, 
     *       <xref targtype="property_winrt" rid="w_ui_comp.visual_rotationaxis">RotationAxis</xref>, and <xref targtype="property_winrt" rid="w_ui_comp.visual_centerpoint">CenterPoint</xref> properties 
     *       to specify the rotation in degrees, which axis to rotate around, and the center point of the visual to rotate around.</p>
     *         
     *       <p>Rotation by orientation uses the <xref targtype="property_winrt" rid="w_ui_comp.visual_orientation">Orientation</xref> property to specify a quaternion describing 
     *       an orientation and rotation in 3D space.</p></rem>-->
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.visual.centerpoint
     * @type {Vector3} 
     */
    CenterPoint {
        get => this.get_CenterPoint()
        set => this.put_CenterPoint(value)
    }

    /**
     * Specifies the clipping region for the visual. When a visual is rendered, only the portion of the visual that falls inside the clipping region is displayed, while any content that extends outside the clipping region is clipped (that is, not displayed).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.visual.clip
     * @type {CompositionClip} 
     */
    Clip {
        get => this.get_Clip()
        set => this.put_Clip(value)
    }

    /**
     * Specifies how a visual's bitmap is blended with the screen.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.visual.compositemode
     * @type {Integer} 
     */
    CompositeMode {
        get => this.get_CompositeMode()
        set => this.put_CompositeMode(value)
    }

    /**
     * Indicates whether the visual and its entire subtree of child visuals is visible.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.visual.isvisible
     * @type {Boolean} 
     */
    IsVisible {
        get => this.get_IsVisible()
        set => this.put_IsVisible(value)
    }

    /**
     * The offset of the visual relative to its parent or for a root visual the offset relative to the upper-left corner of the windows that hosts the visual. Animatable.
     * @remarks
     * This property can be animated. Call [CompositionObject.StartAnimation](compositionobject_startanimation_709050842.md) to associate it with a [CompositionAnimation](/windows/uwp/composition/composition-animation).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.visual.offset
     * @type {Vector3} 
     */
    Offset {
        get => this.get_Offset()
        set => this.put_Offset(value)
    }

    /**
     * The opacity of the visual. Animatable.
     * 
     * The opacity property determines the transparency, if any, of the Visual and is a value from 0 to 1. 0 is fully transparent and 1 is full opaque. A Visual with an Opacity property of 0 is still present in the tree. Like other properties on the Visual, Opacity can be animated using the Windows,UI.Composition animation system.
     * @remarks
     * This property can be animated. Call [CompositionObject.StartAnimation](compositionobject_startanimation_709050842.md) to associate it with a [CompositionAnimation](/windows/uwp/composition/composition-animation).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.visual.opacity
     * @type {Float} 
     */
    Opacity {
        get => this.get_Opacity()
        set => this.put_Opacity(value)
    }

    /**
     * A quaternion describing an orientation and rotation in 3D space that will be applied to the visual. Animatable.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.visual.orientation
     * @type {Quaternion} 
     */
    Orientation {
        get => this.get_Orientation()
        set => this.put_Orientation(value)
    }

    /**
     * The parent of the visual.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.visual.parent
     * @type {ContainerVisual} 
     */
    Parent {
        get => this.get_Parent()
    }

    /**
     * The rotation angle in radians of the visual. Animatable.
     * @remarks
     * To use degrees instead of radians use [RotationAngleInDegrees](visual_rotationangleindegrees.md).
     * 
     * [Visual](visual.md) supports two forms of rotation, by axis-angle, and by orientation.
     * 
     * This property can be animated. Call [CompositionObject.StartAnimation](compositionobject_startanimation_709050842.md) to associate it with a [CompositionAnimation](/windows/uwp/composition/composition-animation).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.visual.rotationangle
     * @type {Float} 
     */
    RotationAngle {
        get => this.get_RotationAngle()
        set => this.put_RotationAngle(value)
    }

    /**
     * The rotation angle of the visual in degrees. Animatable.
     * @remarks
     * This property can be animated. Call [CompositionObject.StartAnimation](compositionobject_startanimation_709050842.md) to associate it with a [CompositionAnimation](/windows/uwp/composition/composition-animation).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.visual.rotationangleindegrees
     * @type {Float} 
     */
    RotationAngleInDegrees {
        get => this.get_RotationAngleInDegrees()
        set => this.put_RotationAngleInDegrees(value)
    }

    /**
     * The axis to rotate the visual around. Animatable.
     * @remarks
     * This property can be animated. Call [CompositionObject.StartAnimation](compositionobject_startanimation_709050842.md) to associate it with a [CompositionAnimation](/windows/uwp/composition/composition-animation).
     * 
     * [Visual](visual.md) supports two forms of rotation, by axis-angle, and by orientation.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.visual.rotationaxis
     * @type {Vector3} 
     */
    RotationAxis {
        get => this.get_RotationAxis()
        set => this.put_RotationAxis(value)
    }

    /**
     * The scale to apply to the visual.
     * @remarks
     * The [CenterPoint](visual_centerpoint.md) property affects the center point of the scale transform.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.visual.scale
     * @type {Vector3} 
     */
    Scale {
        get => this.get_Scale()
        set => this.put_Scale(value)
    }

    /**
     * The width and height of the visual. Animatable.
     * @remarks
     * This property can be animated. Call [CompositionObject.StartAnimation](compositionobject_startanimation_709050842.md) to associate it with a [CompositionAnimation](/windows/uwp/composition/composition-animation).
     * 
     * 
     * The effective size of a `Visual` is found by adding its `Size` to its [RelativeSizeAdjustment](visual_relativesizeadjustment.md) combined with the effective size of the [Parent](visual_parent.md) `Visual`:
     * 
     * `var Effective_Size = Size + (RelativeSizeAdjustment * Parent.Effective_Size)`.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.visual.size
     * @type {Vector2} 
     */
    Size {
        get => this.get_Size()
        set => this.put_Size(value)
    }

    /**
     * The transformation matrix to apply to the visual. Animatable.
     * @remarks
     * This property can be animated. Call [CompositionObject.StartAnimation](compositionobject_startanimation_709050842.md) to associate it with a [CompositionAnimation](/windows/uwp/composition/composition-animation).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.visual.transformmatrix
     * @type {Matrix4x4} 
     */
    TransformMatrix {
        get => this.get_TransformMatrix()
        set => this.put_TransformMatrix(value)
    }

    /**
     * Visual specifying the coordinate system in which this visual is composed.
     * @remarks
     * ParentForTransform allows you to change the coordinate system in which a visual is composed. You can specify another visual that acts as a visual's "transform parent". That is, the visual in question will inherit accumulated transforms as though it were the child of that other visual. Note that this includes the effects of all properties that relate to transform, such as Visual.RotationAngle, or Visual.AnchorPoint, on the specified "transform parent" visual and all of its "transform ancestors".
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.visual.parentfortransform
     * @type {Visual} 
     */
    ParentForTransform {
        get => this.get_ParentForTransform()
        set => this.put_ParentForTransform(value)
    }

    /**
     * Specifies the offset of the visual with respect to the size of its parent visual.
     * @remarks
     * Value is normalized with respect to the size of the visual's parent. For example, a value of (0.0, 0.5, 0.0) means that the 
     * vertical position of the visual is at the midpoint between the top and bottom of its parent visual's bounds. This property is a Vector3 for consistency with the Offset property, however the Z component of the RelativeOffsetAdjustment property currently has no effect.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.visual.relativeoffsetadjustment
     * @type {Vector3} 
     */
    RelativeOffsetAdjustment {
        get => this.get_RelativeOffsetAdjustment()
        set => this.put_RelativeOffsetAdjustment(value)
    }

    /**
     * Gets or sets the size of the visual with respect to the size of its parent visual.
     * @remarks
     * The value is normalized with respect to the size of the visual's parent. For example, a value of (1.0, 0.5) indicates that the visual should be the full width of its parent but only half the height.
     * 
     * The effective size of a `Visual` is found by adding its [Size](visual_size.md) to its `RelativeSizeAdjustment` combined with the effective size of the [Parent](visual_parent.md) `Visual`:
     * 
     * `var Effective_Size = Size + (RelativeSizeAdjustment * Parent.Effective_Size)`.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.visual.relativesizeadjustment
     * @type {Vector2} 
     */
    RelativeSizeAdjustment {
        get => this.get_RelativeSizeAdjustment()
        set => this.put_RelativeSizeAdjustment(value)
    }

    /**
     * Gets or sets a value that indicates whether the visual sub-tree rooted at this visual participates in hit testing.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.visual.ishittestvisible
     * @type {Boolean} 
     */
    IsHitTestVisible {
        get => this.get_IsHitTestVisible()
        set => this.put_IsHitTestVisible(value)
    }

    /**
     * Gets or sets a value that indicates whether the composition engine aligns the rendered visual with a pixel boundary.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.visual.ispixelsnappingenabled
     * @type {Boolean} 
     */
    IsPixelSnappingEnabled {
        get => this.get_IsPixelSnappingEnabled()
        set => this.put_IsPixelSnappingEnabled(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Vector2} 
     */
    get_AnchorPoint() {
        if (!this.HasProp("__IVisual")) {
            if ((queryResult := this.QueryInterface(IVisual.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVisual := IVisual(outPtr)
        }

        return this.__IVisual.get_AnchorPoint()
    }

    /**
     * 
     * @param {Vector2} value 
     * @returns {HRESULT} 
     */
    put_AnchorPoint(value) {
        if (!this.HasProp("__IVisual")) {
            if ((queryResult := this.QueryInterface(IVisual.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVisual := IVisual(outPtr)
        }

        return this.__IVisual.put_AnchorPoint(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_BackfaceVisibility() {
        if (!this.HasProp("__IVisual")) {
            if ((queryResult := this.QueryInterface(IVisual.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVisual := IVisual(outPtr)
        }

        return this.__IVisual.get_BackfaceVisibility()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_BackfaceVisibility(value) {
        if (!this.HasProp("__IVisual")) {
            if ((queryResult := this.QueryInterface(IVisual.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVisual := IVisual(outPtr)
        }

        return this.__IVisual.put_BackfaceVisibility(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_BorderMode() {
        if (!this.HasProp("__IVisual")) {
            if ((queryResult := this.QueryInterface(IVisual.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVisual := IVisual(outPtr)
        }

        return this.__IVisual.get_BorderMode()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_BorderMode(value) {
        if (!this.HasProp("__IVisual")) {
            if ((queryResult := this.QueryInterface(IVisual.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVisual := IVisual(outPtr)
        }

        return this.__IVisual.put_BorderMode(value)
    }

    /**
     * 
     * @returns {Vector3} 
     */
    get_CenterPoint() {
        if (!this.HasProp("__IVisual")) {
            if ((queryResult := this.QueryInterface(IVisual.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVisual := IVisual(outPtr)
        }

        return this.__IVisual.get_CenterPoint()
    }

    /**
     * 
     * @param {Vector3} value 
     * @returns {HRESULT} 
     */
    put_CenterPoint(value) {
        if (!this.HasProp("__IVisual")) {
            if ((queryResult := this.QueryInterface(IVisual.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVisual := IVisual(outPtr)
        }

        return this.__IVisual.put_CenterPoint(value)
    }

    /**
     * 
     * @returns {CompositionClip} 
     */
    get_Clip() {
        if (!this.HasProp("__IVisual")) {
            if ((queryResult := this.QueryInterface(IVisual.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVisual := IVisual(outPtr)
        }

        return this.__IVisual.get_Clip()
    }

    /**
     * 
     * @param {CompositionClip} value 
     * @returns {HRESULT} 
     */
    put_Clip(value) {
        if (!this.HasProp("__IVisual")) {
            if ((queryResult := this.QueryInterface(IVisual.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVisual := IVisual(outPtr)
        }

        return this.__IVisual.put_Clip(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CompositeMode() {
        if (!this.HasProp("__IVisual")) {
            if ((queryResult := this.QueryInterface(IVisual.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVisual := IVisual(outPtr)
        }

        return this.__IVisual.get_CompositeMode()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_CompositeMode(value) {
        if (!this.HasProp("__IVisual")) {
            if ((queryResult := this.QueryInterface(IVisual.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVisual := IVisual(outPtr)
        }

        return this.__IVisual.put_CompositeMode(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsVisible() {
        if (!this.HasProp("__IVisual")) {
            if ((queryResult := this.QueryInterface(IVisual.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVisual := IVisual(outPtr)
        }

        return this.__IVisual.get_IsVisible()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsVisible(value) {
        if (!this.HasProp("__IVisual")) {
            if ((queryResult := this.QueryInterface(IVisual.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVisual := IVisual(outPtr)
        }

        return this.__IVisual.put_IsVisible(value)
    }

    /**
     * 
     * @returns {Vector3} 
     */
    get_Offset() {
        if (!this.HasProp("__IVisual")) {
            if ((queryResult := this.QueryInterface(IVisual.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVisual := IVisual(outPtr)
        }

        return this.__IVisual.get_Offset()
    }

    /**
     * 
     * @param {Vector3} value 
     * @returns {HRESULT} 
     */
    put_Offset(value) {
        if (!this.HasProp("__IVisual")) {
            if ((queryResult := this.QueryInterface(IVisual.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVisual := IVisual(outPtr)
        }

        return this.__IVisual.put_Offset(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_Opacity() {
        if (!this.HasProp("__IVisual")) {
            if ((queryResult := this.QueryInterface(IVisual.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVisual := IVisual(outPtr)
        }

        return this.__IVisual.get_Opacity()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_Opacity(value) {
        if (!this.HasProp("__IVisual")) {
            if ((queryResult := this.QueryInterface(IVisual.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVisual := IVisual(outPtr)
        }

        return this.__IVisual.put_Opacity(value)
    }

    /**
     * 
     * @returns {Quaternion} 
     */
    get_Orientation() {
        if (!this.HasProp("__IVisual")) {
            if ((queryResult := this.QueryInterface(IVisual.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVisual := IVisual(outPtr)
        }

        return this.__IVisual.get_Orientation()
    }

    /**
     * 
     * @param {Quaternion} value 
     * @returns {HRESULT} 
     */
    put_Orientation(value) {
        if (!this.HasProp("__IVisual")) {
            if ((queryResult := this.QueryInterface(IVisual.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVisual := IVisual(outPtr)
        }

        return this.__IVisual.put_Orientation(value)
    }

    /**
     * 
     * @returns {ContainerVisual} 
     */
    get_Parent() {
        if (!this.HasProp("__IVisual")) {
            if ((queryResult := this.QueryInterface(IVisual.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVisual := IVisual(outPtr)
        }

        return this.__IVisual.get_Parent()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_RotationAngle() {
        if (!this.HasProp("__IVisual")) {
            if ((queryResult := this.QueryInterface(IVisual.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVisual := IVisual(outPtr)
        }

        return this.__IVisual.get_RotationAngle()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_RotationAngle(value) {
        if (!this.HasProp("__IVisual")) {
            if ((queryResult := this.QueryInterface(IVisual.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVisual := IVisual(outPtr)
        }

        return this.__IVisual.put_RotationAngle(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_RotationAngleInDegrees() {
        if (!this.HasProp("__IVisual")) {
            if ((queryResult := this.QueryInterface(IVisual.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVisual := IVisual(outPtr)
        }

        return this.__IVisual.get_RotationAngleInDegrees()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_RotationAngleInDegrees(value) {
        if (!this.HasProp("__IVisual")) {
            if ((queryResult := this.QueryInterface(IVisual.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVisual := IVisual(outPtr)
        }

        return this.__IVisual.put_RotationAngleInDegrees(value)
    }

    /**
     * 
     * @returns {Vector3} 
     */
    get_RotationAxis() {
        if (!this.HasProp("__IVisual")) {
            if ((queryResult := this.QueryInterface(IVisual.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVisual := IVisual(outPtr)
        }

        return this.__IVisual.get_RotationAxis()
    }

    /**
     * 
     * @param {Vector3} value 
     * @returns {HRESULT} 
     */
    put_RotationAxis(value) {
        if (!this.HasProp("__IVisual")) {
            if ((queryResult := this.QueryInterface(IVisual.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVisual := IVisual(outPtr)
        }

        return this.__IVisual.put_RotationAxis(value)
    }

    /**
     * 
     * @returns {Vector3} 
     */
    get_Scale() {
        if (!this.HasProp("__IVisual")) {
            if ((queryResult := this.QueryInterface(IVisual.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVisual := IVisual(outPtr)
        }

        return this.__IVisual.get_Scale()
    }

    /**
     * 
     * @param {Vector3} value 
     * @returns {HRESULT} 
     */
    put_Scale(value) {
        if (!this.HasProp("__IVisual")) {
            if ((queryResult := this.QueryInterface(IVisual.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVisual := IVisual(outPtr)
        }

        return this.__IVisual.put_Scale(value)
    }

    /**
     * 
     * @returns {Vector2} 
     */
    get_Size() {
        if (!this.HasProp("__IVisual")) {
            if ((queryResult := this.QueryInterface(IVisual.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVisual := IVisual(outPtr)
        }

        return this.__IVisual.get_Size()
    }

    /**
     * 
     * @param {Vector2} value 
     * @returns {HRESULT} 
     */
    put_Size(value) {
        if (!this.HasProp("__IVisual")) {
            if ((queryResult := this.QueryInterface(IVisual.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVisual := IVisual(outPtr)
        }

        return this.__IVisual.put_Size(value)
    }

    /**
     * 
     * @returns {Matrix4x4} 
     */
    get_TransformMatrix() {
        if (!this.HasProp("__IVisual")) {
            if ((queryResult := this.QueryInterface(IVisual.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVisual := IVisual(outPtr)
        }

        return this.__IVisual.get_TransformMatrix()
    }

    /**
     * 
     * @param {Matrix4x4} value 
     * @returns {HRESULT} 
     */
    put_TransformMatrix(value) {
        if (!this.HasProp("__IVisual")) {
            if ((queryResult := this.QueryInterface(IVisual.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVisual := IVisual(outPtr)
        }

        return this.__IVisual.put_TransformMatrix(value)
    }

    /**
     * 
     * @returns {Visual} 
     */
    get_ParentForTransform() {
        if (!this.HasProp("__IVisual2")) {
            if ((queryResult := this.QueryInterface(IVisual2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVisual2 := IVisual2(outPtr)
        }

        return this.__IVisual2.get_ParentForTransform()
    }

    /**
     * 
     * @param {Visual} value 
     * @returns {HRESULT} 
     */
    put_ParentForTransform(value) {
        if (!this.HasProp("__IVisual2")) {
            if ((queryResult := this.QueryInterface(IVisual2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVisual2 := IVisual2(outPtr)
        }

        return this.__IVisual2.put_ParentForTransform(value)
    }

    /**
     * 
     * @returns {Vector3} 
     */
    get_RelativeOffsetAdjustment() {
        if (!this.HasProp("__IVisual2")) {
            if ((queryResult := this.QueryInterface(IVisual2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVisual2 := IVisual2(outPtr)
        }

        return this.__IVisual2.get_RelativeOffsetAdjustment()
    }

    /**
     * 
     * @param {Vector3} value 
     * @returns {HRESULT} 
     */
    put_RelativeOffsetAdjustment(value) {
        if (!this.HasProp("__IVisual2")) {
            if ((queryResult := this.QueryInterface(IVisual2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVisual2 := IVisual2(outPtr)
        }

        return this.__IVisual2.put_RelativeOffsetAdjustment(value)
    }

    /**
     * 
     * @returns {Vector2} 
     */
    get_RelativeSizeAdjustment() {
        if (!this.HasProp("__IVisual2")) {
            if ((queryResult := this.QueryInterface(IVisual2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVisual2 := IVisual2(outPtr)
        }

        return this.__IVisual2.get_RelativeSizeAdjustment()
    }

    /**
     * 
     * @param {Vector2} value 
     * @returns {HRESULT} 
     */
    put_RelativeSizeAdjustment(value) {
        if (!this.HasProp("__IVisual2")) {
            if ((queryResult := this.QueryInterface(IVisual2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVisual2 := IVisual2(outPtr)
        }

        return this.__IVisual2.put_RelativeSizeAdjustment(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsHitTestVisible() {
        if (!this.HasProp("__IVisual3")) {
            if ((queryResult := this.QueryInterface(IVisual3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVisual3 := IVisual3(outPtr)
        }

        return this.__IVisual3.get_IsHitTestVisible()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsHitTestVisible(value) {
        if (!this.HasProp("__IVisual3")) {
            if ((queryResult := this.QueryInterface(IVisual3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVisual3 := IVisual3(outPtr)
        }

        return this.__IVisual3.put_IsHitTestVisible(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsPixelSnappingEnabled() {
        if (!this.HasProp("__IVisual4")) {
            if ((queryResult := this.QueryInterface(IVisual4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVisual4 := IVisual4(outPtr)
        }

        return this.__IVisual4.get_IsPixelSnappingEnabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsPixelSnappingEnabled(value) {
        if (!this.HasProp("__IVisual4")) {
            if ((queryResult := this.QueryInterface(IVisual4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVisual4 := IVisual4(outPtr)
        }

        return this.__IVisual4.put_IsPixelSnappingEnabled(value)
    }

;@endregion Instance Methods
}
