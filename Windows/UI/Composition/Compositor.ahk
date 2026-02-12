#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ICompositor.ahk
#Include .\ICompositor2.ahk
#Include .\ICompositor3.ahk
#Include .\ICompositor4.ahk
#Include .\ICompositor5.ahk
#Include .\ICompositor6.ahk
#Include .\ICompositorWithProjectedShadow.ahk
#Include .\ICompositorWithRadialGradient.ahk
#Include .\ICompositorWithVisualSurface.ahk
#Include .\ICompositor7.ahk
#Include .\ICompositorWithBlurredWallpaperBackdropBrush.ahk
#Include .\ICompositor8.ahk
#Include ..\..\Foundation\IClosable.ahk
#Include .\ICompositorStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Manages the session between an application and the system compositor process.
  * 
  * The Compositor class creates an instance of the Compositor for the application that can be used as a factory for a variety of types in the Windows.UI.Composition namespace spanning the visual layer, effects system and animation system. The Compositor class also manages the lifetime of objects created from the factory.
 * @remarks
 * The Compositor implicitly synchronizes changes made to associated visuals to ensure they get applied in a transactional manner.
 * 
 * See the [Composition UI Overview](/windows/uwp/composition/visual-layer) and [Composition Visual Tree Overview](/windows/uwp/composition/composition-visual-tree) for more information.
 * 
 * New instances of Compositor must be created on a thread that has a CoreDispatcher.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositor
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class Compositor extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICompositor

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICompositor.IID

    /**
     * Gets the maximum allowed playback rate for all KeyFrame animations created by this compositor..
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositor.maxglobalplaybackrate
     * @type {Float} 
     */
    static MaxGlobalPlaybackRate {
        get => Compositor.get_MaxGlobalPlaybackRate()
    }

    /**
     * Gets the minimum allowed playback rate for all KeyFrame animations created by this compositor.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositor.minglobalplaybackrate
     * @type {Float} 
     */
    static MinGlobalPlaybackRate {
        get => Compositor.get_MinGlobalPlaybackRate()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {Float} 
     */
    static get_MaxGlobalPlaybackRate() {
        if (!Compositor.HasProp("__ICompositorStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Composition.Compositor")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICompositorStatics.IID)
            Compositor.__ICompositorStatics := ICompositorStatics(factoryPtr)
        }

        return Compositor.__ICompositorStatics.get_MaxGlobalPlaybackRate()
    }

    /**
     * 
     * @returns {Float} 
     */
    static get_MinGlobalPlaybackRate() {
        if (!Compositor.HasProp("__ICompositorStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Composition.Compositor")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICompositorStatics.IID)
            Compositor.__ICompositorStatics := ICompositorStatics(factoryPtr)
        }

        return Compositor.__ICompositorStatics.get_MinGlobalPlaybackRate()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets a string to associate with the Compositor.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositor.comment
     * @type {HSTRING} 
     */
    Comment {
        get => this.get_Comment()
        set => this.put_Comment(value)
    }

    /**
     * Gets or sets the rate at which animation plays for all KeyFrame animations created by this compositor.
     * @remarks
     * This property has an effect only on [KeyFrameAnimation](keyframeanimation.md)s.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositor.globalplaybackrate
     * @type {Float} 
     */
    GlobalPlaybackRate {
        get => this.get_GlobalPlaybackRate()
        set => this.put_GlobalPlaybackRate(value)
    }

    /**
     * Gets the dispatcher queue for this compositor.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositor.dispatcherqueue
     * @type {DispatcherQueue} 
     */
    DispatcherQueue {
        get => this.get_DispatcherQueue()
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Creates an instance of [Compositor](compositor.md).
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Composition.Compositor")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    __Delete() {
        this.Close()

        super.__Delete()
    }

    /**
     * Creates an instance of [ColorKeyFrameAnimation](colorkeyframeanimation.md).
     * @returns {ColorKeyFrameAnimation} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositor.createcolorkeyframeanimation
     */
    CreateColorKeyFrameAnimation() {
        if (!this.HasProp("__ICompositor")) {
            if ((queryResult := this.QueryInterface(ICompositor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositor := ICompositor(outPtr)
        }

        return this.__ICompositor.CreateColorKeyFrameAnimation()
    }

    /**
     * Creates an instance of [CompositionColorBrush](compositioncolorbrush.md) using the specified color.
     * @returns {CompositionColorBrush} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositor.createcolorbrush
     */
    CreateColorBrush() {
        if (!this.HasProp("__ICompositor")) {
            if ((queryResult := this.QueryInterface(ICompositor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositor := ICompositor(outPtr)
        }

        return this.__ICompositor.CreateColorBrush()
    }

    /**
     * Creates an instance of [CompositionColorBrush](compositioncolorbrush.md).
     * @param {Color} color_ 
     * @returns {CompositionColorBrush} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositor.createcolorbrush
     */
    CreateColorBrushWithColor(color_) {
        if (!this.HasProp("__ICompositor")) {
            if ((queryResult := this.QueryInterface(ICompositor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositor := ICompositor(outPtr)
        }

        return this.__ICompositor.CreateColorBrushWithColor(color_)
    }

    /**
     * Creates an instance of [ContainerVisual](containervisual.md).
     * @returns {ContainerVisual} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositor.createcontainervisual
     */
    CreateContainerVisual() {
        if (!this.HasProp("__ICompositor")) {
            if ((queryResult := this.QueryInterface(ICompositor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositor := ICompositor(outPtr)
        }

        return this.__ICompositor.CreateContainerVisual()
    }

    /**
     * Creates an instance of [CubicBezierEasingFunction](cubicbeziereasingfunction.md).
     * @param {Vector2} controlPoint1 The first control point for the easing function.
     * @param {Vector2} controlPoint2 The second control point for the easing function.
     * @returns {CubicBezierEasingFunction} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositor.createcubicbeziereasingfunction
     */
    CreateCubicBezierEasingFunction(controlPoint1, controlPoint2) {
        if (!this.HasProp("__ICompositor")) {
            if ((queryResult := this.QueryInterface(ICompositor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositor := ICompositor(outPtr)
        }

        return this.__ICompositor.CreateCubicBezierEasingFunction(controlPoint1, controlPoint2)
    }

    /**
     * Creates an instance of [CompositionEffectFactory](compositioneffectfactory.md) specifying effect parameters that should be animatable.
     * @param {IGraphicsEffect} graphicsEffect The type of effect to create.
     * @returns {CompositionEffectFactory} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositor.createeffectfactory
     */
    CreateEffectFactory(graphicsEffect) {
        if (!this.HasProp("__ICompositor")) {
            if ((queryResult := this.QueryInterface(ICompositor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositor := ICompositor(outPtr)
        }

        return this.__ICompositor.CreateEffectFactory(graphicsEffect)
    }

    /**
     * Creates an instance of [CompositionEffectFactory](compositioneffectfactory.md).
     * @remarks
     * Creating an effect factory compiles an effect and allows instances of that effect to be created.
     * 
     * See the remarks section of [CompositionEffectBrush](compositioneffectbrush.md) for information on creating and using effects.
     * 
     * Currently supported effects types are:
     * 
     * | Effect Name | Description |
     * | - | -|
     * | [ArithmeticCompositeEffect](https://microsoft.github.io/Win2D/WinUI2/html/T_Microsoft_Graphics_Canvas_Effects_ArithmeticCompositeEffect.htm) | Combines two images using a weighted sum of pixels from the source images. |
     * | [CompositeEffect](https://microsoft.github.io/Win2D/WinUI2/html/T_Microsoft_Graphics_Canvas_Effects_CompositeEffect.htm) | Combines two or more images based on their alpha channel. This effect has 13 different composite modes. The composite effect accepts 2 or more inputs. When you specify 2 images, destination is the first input (index 0) and the source is the second input (index 1). If you specify more than 2 inputs the images are composited starting with the first input and the second and so on. |
     * | [BlendEffect](https://microsoft.github.io/Win2D/WinUI2/html/T_Microsoft_Graphics_Canvas_Effects_BlendEffect.htm) (21 of 26 modes) | Combines 2 images. This effect has 26 blend modes with 21 of the modes currently supported by the Compositon API. The 5 blend modes that are currently not implemented are dissolve, hue, saturation, color, and luminosity. |
     * | [ColorSourceEffect](https://microsoft.github.io/Win2D/WinUI2/html/T_Microsoft_Graphics_Canvas_Effects_ColorSourceEffect.htm) | The color source effect generates a specified solid color. It is useful as a source to other effects, such as tinting an image using a blend with a color source. |
     * | [SaturationEffect](https://microsoft.github.io/Win2D/WinUI2/html/T_Microsoft_Graphics_Canvas_Effects_SaturationEffect.htm) | Alters the saturation of an image. If you set it to 1 the output image is fully saturated. If you set it to 0 the output image is monochrome. |
     * | [Transform2DEffect](https://microsoft.github.io/Win2D/WinUI2/html/T_Microsoft_Graphics_Canvas_Effects_Transform2DEffect.htm) | The 2D affine transform effect applies a spatial transform to an image based on a 3X2 matrix. This effect can be used to rotate, scale, skew, or translate an image. Or, you can combine these operations. Affine transfers preserve parallel lines and the ratio of distances between any three points in an image. |
     * 
     * See the [Win2D](https://microsoft.github.io/Win2D/WinUI2/html/Introduction.htm) namespace, [Microsoft.Graphics.Canvas.Effects](https://microsoft.github.io/Win2D/WinUI2/html/N_Microsoft_Graphics_Canvas_Effects.htm), for more information on the effect types.
     * @param {IGraphicsEffect} graphicsEffect The type of effect to create.
     * @param {IIterable<HSTRING>} animatableProperties 
     * @returns {CompositionEffectFactory} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositor.createeffectfactory
     */
    CreateEffectFactoryWithProperties(graphicsEffect, animatableProperties) {
        if (!this.HasProp("__ICompositor")) {
            if ((queryResult := this.QueryInterface(ICompositor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositor := ICompositor(outPtr)
        }

        return this.__ICompositor.CreateEffectFactoryWithProperties(graphicsEffect, animatableProperties)
    }

    /**
     * Creates an instance of [ExpressionAnimation](expressionanimation.md).
     * @returns {ExpressionAnimation} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositor.createexpressionanimation
     */
    CreateExpressionAnimation() {
        if (!this.HasProp("__ICompositor")) {
            if ((queryResult := this.QueryInterface(ICompositor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositor := ICompositor(outPtr)
        }

        return this.__ICompositor.CreateExpressionAnimation()
    }

    /**
     * Creates an instance of [ExpressionAnimation](expressionanimation.md).
     * @param {HSTRING} expression 
     * @returns {ExpressionAnimation} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositor.createexpressionanimation
     */
    CreateExpressionAnimationWithExpression(expression) {
        if (!this.HasProp("__ICompositor")) {
            if ((queryResult := this.QueryInterface(ICompositor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositor := ICompositor(outPtr)
        }

        return this.__ICompositor.CreateExpressionAnimationWithExpression(expression)
    }

    /**
     * Creates an instance of [InsetClip](insetclip.md).
     * @returns {InsetClip} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositor.createinsetclip
     */
    CreateInsetClip() {
        if (!this.HasProp("__ICompositor")) {
            if ((queryResult := this.QueryInterface(ICompositor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositor := ICompositor(outPtr)
        }

        return this.__ICompositor.CreateInsetClip()
    }

    /**
     * Creates an instance of [InsetClip](insetclip.md).
     * @param {Float} leftInset 
     * @param {Float} topInset 
     * @param {Float} rightInset 
     * @param {Float} bottomInset 
     * @returns {InsetClip} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositor.createinsetclip
     */
    CreateInsetClipWithInsets(leftInset, topInset, rightInset, bottomInset) {
        if (!this.HasProp("__ICompositor")) {
            if ((queryResult := this.QueryInterface(ICompositor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositor := ICompositor(outPtr)
        }

        return this.__ICompositor.CreateInsetClipWithInsets(leftInset, topInset, rightInset, bottomInset)
    }

    /**
     * Creates an instance of [LinearEasingFunction](lineareasingfunction.md).
     * @returns {LinearEasingFunction} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositor.createlineareasingfunction
     */
    CreateLinearEasingFunction() {
        if (!this.HasProp("__ICompositor")) {
            if ((queryResult := this.QueryInterface(ICompositor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositor := ICompositor(outPtr)
        }

        return this.__ICompositor.CreateLinearEasingFunction()
    }

    /**
     * Creates an instance of [CompositionPropertySet](compositionpropertyset.md).
     * @returns {CompositionPropertySet} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositor.createpropertyset
     */
    CreatePropertySet() {
        if (!this.HasProp("__ICompositor")) {
            if ((queryResult := this.QueryInterface(ICompositor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositor := ICompositor(outPtr)
        }

        return this.__ICompositor.CreatePropertySet()
    }

    /**
     * Creates an instance of [QuaternionKeyFrameAnimation](quaternionkeyframeanimation.md).
     * @returns {QuaternionKeyFrameAnimation} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositor.createquaternionkeyframeanimation
     */
    CreateQuaternionKeyFrameAnimation() {
        if (!this.HasProp("__ICompositor")) {
            if ((queryResult := this.QueryInterface(ICompositor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositor := ICompositor(outPtr)
        }

        return this.__ICompositor.CreateQuaternionKeyFrameAnimation()
    }

    /**
     * Creates an instance of [ScalarKeyFrameAnimation](scalarkeyframeanimation.md).
     * @returns {ScalarKeyFrameAnimation} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositor.createscalarkeyframeanimation
     */
    CreateScalarKeyFrameAnimation() {
        if (!this.HasProp("__ICompositor")) {
            if ((queryResult := this.QueryInterface(ICompositor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositor := ICompositor(outPtr)
        }

        return this.__ICompositor.CreateScalarKeyFrameAnimation()
    }

    /**
     * Creates an instance of [CompositionScopedBatch](compositionscopedbatch.md).
     * @param {Integer} batchType The type of composition batch to create.
     * @returns {CompositionScopedBatch} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositor.createscopedbatch
     */
    CreateScopedBatch(batchType) {
        if (!this.HasProp("__ICompositor")) {
            if ((queryResult := this.QueryInterface(ICompositor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositor := ICompositor(outPtr)
        }

        return this.__ICompositor.CreateScopedBatch(batchType)
    }

    /**
     * Creates an instance of [SpriteVisual](spritevisual.md).
     * @returns {SpriteVisual} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositor.createspritevisual
     */
    CreateSpriteVisual() {
        if (!this.HasProp("__ICompositor")) {
            if ((queryResult := this.QueryInterface(ICompositor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositor := ICompositor(outPtr)
        }

        return this.__ICompositor.CreateSpriteVisual()
    }

    /**
     * Creates an instance of [CompositionSurfaceBrush](compositionsurfacebrush.md) using the specified composition surface.
     * @returns {CompositionSurfaceBrush} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositor.createsurfacebrush
     */
    CreateSurfaceBrush() {
        if (!this.HasProp("__ICompositor")) {
            if ((queryResult := this.QueryInterface(ICompositor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositor := ICompositor(outPtr)
        }

        return this.__ICompositor.CreateSurfaceBrush()
    }

    /**
     * Creates an instance of [CompositionSurfaceBrush](compositionsurfacebrush.md).
     * @param {ICompositionSurface} surface 
     * @returns {CompositionSurfaceBrush} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositor.createsurfacebrush
     */
    CreateSurfaceBrushWithSurface(surface) {
        if (!this.HasProp("__ICompositor")) {
            if ((queryResult := this.QueryInterface(ICompositor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositor := ICompositor(outPtr)
        }

        return this.__ICompositor.CreateSurfaceBrushWithSurface(surface)
    }

    /**
     * Creates a [CompositionTarget](compositiontarget.md) for the current view.
     * @returns {CompositionTarget} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositor.createtargetforcurrentview
     */
    CreateTargetForCurrentView() {
        if (!this.HasProp("__ICompositor")) {
            if ((queryResult := this.QueryInterface(ICompositor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositor := ICompositor(outPtr)
        }

        return this.__ICompositor.CreateTargetForCurrentView()
    }

    /**
     * Creates an instance of [Vector2KeyFrameAnimation](vector2keyframeanimation.md).
     * @returns {Vector2KeyFrameAnimation} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositor.createvector2keyframeanimation
     */
    CreateVector2KeyFrameAnimation() {
        if (!this.HasProp("__ICompositor")) {
            if ((queryResult := this.QueryInterface(ICompositor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositor := ICompositor(outPtr)
        }

        return this.__ICompositor.CreateVector2KeyFrameAnimation()
    }

    /**
     * Creates an instance of [Vector3KeyFrameAnimation](vector3keyframeanimation.md).
     * @returns {Vector3KeyFrameAnimation} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositor.createvector3keyframeanimation
     */
    CreateVector3KeyFrameAnimation() {
        if (!this.HasProp("__ICompositor")) {
            if ((queryResult := this.QueryInterface(ICompositor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositor := ICompositor(outPtr)
        }

        return this.__ICompositor.CreateVector3KeyFrameAnimation()
    }

    /**
     * Creates an instance of [Vector4KeyFrameAnimation](vector4keyframeanimation.md).
     * @returns {Vector4KeyFrameAnimation} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositor.createvector4keyframeanimation
     */
    CreateVector4KeyFrameAnimation() {
        if (!this.HasProp("__ICompositor")) {
            if ((queryResult := this.QueryInterface(ICompositor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositor := ICompositor(outPtr)
        }

        return this.__ICompositor.CreateVector4KeyFrameAnimation()
    }

    /**
     * Retrieves a commit batch for the current commit cycle.
     * @param {Integer} batchType The batch type.
     * @returns {CompositionCommitBatch} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositor.getcommitbatch
     */
    GetCommitBatch(batchType) {
        if (!this.HasProp("__ICompositor")) {
            if ((queryResult := this.QueryInterface(ICompositor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositor := ICompositor(outPtr)
        }

        return this.__ICompositor.GetCommitBatch(batchType)
    }

    /**
     * Creates an instance of [AmbientLight](ambientlight.md).
     * @returns {AmbientLight} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositor.createambientlight
     */
    CreateAmbientLight() {
        if (!this.HasProp("__ICompositor2")) {
            if ((queryResult := this.QueryInterface(ICompositor2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositor2 := ICompositor2(outPtr)
        }

        return this.__ICompositor2.CreateAmbientLight()
    }

    /**
     * Creates an instance of [CompositionAnimationGroup](compositionanimationgroup.md).
     * @returns {CompositionAnimationGroup} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositor.createanimationgroup
     */
    CreateAnimationGroup() {
        if (!this.HasProp("__ICompositor2")) {
            if ((queryResult := this.QueryInterface(ICompositor2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositor2 := ICompositor2(outPtr)
        }

        return this.__ICompositor2.CreateAnimationGroup()
    }

    /**
     * Creates an instance of [CompositionBackdropBrush](compositionbackdropbrush.md).
     * @remarks
     * See the remarks section of [CompositionEffectBrush](compositioneffectbrush.md) for information on creating and using effects.
     * @returns {CompositionBackdropBrush} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositor.createbackdropbrush
     */
    CreateBackdropBrush() {
        if (!this.HasProp("__ICompositor2")) {
            if ((queryResult := this.QueryInterface(ICompositor2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositor2 := ICompositor2(outPtr)
        }

        return this.__ICompositor2.CreateBackdropBrush()
    }

    /**
     * Creates an instance of [DistantLight](distantlight.md).
     * @returns {DistantLight} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositor.createdistantlight
     */
    CreateDistantLight() {
        if (!this.HasProp("__ICompositor2")) {
            if ((queryResult := this.QueryInterface(ICompositor2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositor2 := ICompositor2(outPtr)
        }

        return this.__ICompositor2.CreateDistantLight()
    }

    /**
     * Creates an instance of [DropShadow](dropshadow.md).
     * @returns {DropShadow} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositor.createdropshadow
     */
    CreateDropShadow() {
        if (!this.HasProp("__ICompositor2")) {
            if ((queryResult := this.QueryInterface(ICompositor2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositor2 := ICompositor2(outPtr)
        }

        return this.__ICompositor2.CreateDropShadow()
    }

    /**
     * Creates an instance of [ImplicitAnimationCollection](implicitanimationcollection.md).
     * @returns {ImplicitAnimationCollection} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositor.createimplicitanimationcollection
     */
    CreateImplicitAnimationCollection() {
        if (!this.HasProp("__ICompositor2")) {
            if ((queryResult := this.QueryInterface(ICompositor2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositor2 := ICompositor2(outPtr)
        }

        return this.__ICompositor2.CreateImplicitAnimationCollection()
    }

    /**
     * Creates an instance of [LayerVisual](layervisual.md).
     * @returns {LayerVisual} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositor.createlayervisual
     */
    CreateLayerVisual() {
        if (!this.HasProp("__ICompositor2")) {
            if ((queryResult := this.QueryInterface(ICompositor2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositor2 := ICompositor2(outPtr)
        }

        return this.__ICompositor2.CreateLayerVisual()
    }

    /**
     * Creates an instance of [CompositionMaskBrush](compositionmaskbrush.md).
     * @returns {CompositionMaskBrush} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositor.createmaskbrush
     */
    CreateMaskBrush() {
        if (!this.HasProp("__ICompositor2")) {
            if ((queryResult := this.QueryInterface(ICompositor2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositor2 := ICompositor2(outPtr)
        }

        return this.__ICompositor2.CreateMaskBrush()
    }

    /**
     * Creates an instance of [CompositionNineGridBrush](compositionninegridbrush.md).
     * @returns {CompositionNineGridBrush} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositor.createninegridbrush
     */
    CreateNineGridBrush() {
        if (!this.HasProp("__ICompositor2")) {
            if ((queryResult := this.QueryInterface(ICompositor2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositor2 := ICompositor2(outPtr)
        }

        return this.__ICompositor2.CreateNineGridBrush()
    }

    /**
     * Creates an instance of [PointLight](pointlight.md).
     * @returns {PointLight} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositor.createpointlight
     */
    CreatePointLight() {
        if (!this.HasProp("__ICompositor2")) {
            if ((queryResult := this.QueryInterface(ICompositor2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositor2 := ICompositor2(outPtr)
        }

        return this.__ICompositor2.CreatePointLight()
    }

    /**
     * Creates an instance of [SpotLight](spotlight.md).
     * @returns {SpotLight} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositor.createspotlight
     */
    CreateSpotLight() {
        if (!this.HasProp("__ICompositor2")) {
            if ((queryResult := this.QueryInterface(ICompositor2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositor2 := ICompositor2(outPtr)
        }

        return this.__ICompositor2.CreateSpotLight()
    }

    /**
     * Creates an instance of [StepEasingFunction](stepeasingfunction.md) with the specified step count.
     * @returns {StepEasingFunction} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositor.createstepeasingfunction
     */
    CreateStepEasingFunction() {
        if (!this.HasProp("__ICompositor2")) {
            if ((queryResult := this.QueryInterface(ICompositor2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositor2 := ICompositor2(outPtr)
        }

        return this.__ICompositor2.CreateStepEasingFunction()
    }

    /**
     * Creates an instance of [StepEasingFunction](stepeasingfunction.md).
     * @param {Integer} stepCount 
     * @returns {StepEasingFunction} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositor.createstepeasingfunction
     */
    CreateStepEasingFunctionWithStepCount(stepCount) {
        if (!this.HasProp("__ICompositor2")) {
            if ((queryResult := this.QueryInterface(ICompositor2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositor2 := ICompositor2(outPtr)
        }

        return this.__ICompositor2.CreateStepEasingFunctionWithStepCount(stepCount)
    }

    /**
     * Creates an instance of  CompositionBackdropBrush that samples from the area behind the visual, before the window is drawn.
     * @remarks
     * The standard backdrop brush samples the area immediately behind the visual where it is used. The host backdrop brush tells the compositor to sample from the area behind the visual, before the window is drawn. By default, the host backdrop brush is translucent and it hit-tests as opaque. The app cannot read the pixel data back.
     * 
     * The transparency of the host backdrop brush is a property the user can control from **Settings** or by using power policies.
     * @returns {CompositionBackdropBrush} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositor.createhostbackdropbrush
     */
    CreateHostBackdropBrush() {
        if (!this.HasProp("__ICompositor3")) {
            if ((queryResult := this.QueryInterface(ICompositor3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositor3 := ICompositor3(outPtr)
        }

        return this.__ICompositor3.CreateHostBackdropBrush()
    }

    /**
     * Creates an instance of [CompositionColorGradientStop](compositioncolorgradientstop.md).
     * @returns {CompositionColorGradientStop} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositor.createcolorgradientstop
     */
    CreateColorGradientStop() {
        if (!this.HasProp("__ICompositor4")) {
            if ((queryResult := this.QueryInterface(ICompositor4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositor4 := ICompositor4(outPtr)
        }

        return this.__ICompositor4.CreateColorGradientStop()
    }

    /**
     * Creates an instance of [CompositionColorGradientStop](compositioncolorgradientstop.md).
     * @param {Float} offset 
     * @param {Color} color_ 
     * @returns {CompositionColorGradientStop} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositor.createcolorgradientstop
     */
    CreateColorGradientStopWithOffsetAndColor(offset, color_) {
        if (!this.HasProp("__ICompositor4")) {
            if ((queryResult := this.QueryInterface(ICompositor4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositor4 := ICompositor4(outPtr)
        }

        return this.__ICompositor4.CreateColorGradientStopWithOffsetAndColor(offset, color_)
    }

    /**
     * Creates an instance of [CompositionLinearGradientBrush](compositionlineargradientbrush.md).
     * @returns {CompositionLinearGradientBrush} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositor.createlineargradientbrush
     */
    CreateLinearGradientBrush() {
        if (!this.HasProp("__ICompositor4")) {
            if ((queryResult := this.QueryInterface(ICompositor4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositor4 := ICompositor4(outPtr)
        }

        return this.__ICompositor4.CreateLinearGradientBrush()
    }

    /**
     * Creates an instance of [SpringScalarNaturalMotionAnimation](springscalarnaturalmotionanimation.md).
     * @returns {SpringScalarNaturalMotionAnimation} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositor.createspringscalaranimation
     */
    CreateSpringScalarAnimation() {
        if (!this.HasProp("__ICompositor4")) {
            if ((queryResult := this.QueryInterface(ICompositor4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositor4 := ICompositor4(outPtr)
        }

        return this.__ICompositor4.CreateSpringScalarAnimation()
    }

    /**
     * Creates an instance of [SpringVector2NaturalMotionAnimation](springvector2naturalmotionanimation.md).
     * @returns {SpringVector2NaturalMotionAnimation} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositor.createspringvector2animation
     */
    CreateSpringVector2Animation() {
        if (!this.HasProp("__ICompositor4")) {
            if ((queryResult := this.QueryInterface(ICompositor4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositor4 := ICompositor4(outPtr)
        }

        return this.__ICompositor4.CreateSpringVector2Animation()
    }

    /**
     * Creates an instance of [SpringVector3NaturalMotionAnimation](springvector3naturalmotionanimation.md).
     * @returns {SpringVector3NaturalMotionAnimation} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositor.createspringvector3animation
     */
    CreateSpringVector3Animation() {
        if (!this.HasProp("__ICompositor4")) {
            if ((queryResult := this.QueryInterface(ICompositor4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositor4 := ICompositor4(outPtr)
        }

        return this.__ICompositor4.CreateSpringVector3Animation()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Comment() {
        if (!this.HasProp("__ICompositor5")) {
            if ((queryResult := this.QueryInterface(ICompositor5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositor5 := ICompositor5(outPtr)
        }

        return this.__ICompositor5.get_Comment()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Comment(value) {
        if (!this.HasProp("__ICompositor5")) {
            if ((queryResult := this.QueryInterface(ICompositor5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositor5 := ICompositor5(outPtr)
        }

        return this.__ICompositor5.put_Comment(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_GlobalPlaybackRate() {
        if (!this.HasProp("__ICompositor5")) {
            if ((queryResult := this.QueryInterface(ICompositor5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositor5 := ICompositor5(outPtr)
        }

        return this.__ICompositor5.get_GlobalPlaybackRate()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_GlobalPlaybackRate(value) {
        if (!this.HasProp("__ICompositor5")) {
            if ((queryResult := this.QueryInterface(ICompositor5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositor5 := ICompositor5(outPtr)
        }

        return this.__ICompositor5.put_GlobalPlaybackRate(value)
    }

    /**
     * Creates an instance of [BounceScalarNaturalMotionAnimation](bouncescalarnaturalmotionanimation.md).
     * @returns {BounceScalarNaturalMotionAnimation} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositor.createbouncescalaranimation
     */
    CreateBounceScalarAnimation() {
        if (!this.HasProp("__ICompositor5")) {
            if ((queryResult := this.QueryInterface(ICompositor5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositor5 := ICompositor5(outPtr)
        }

        return this.__ICompositor5.CreateBounceScalarAnimation()
    }

    /**
     * Creates an instance of [BounceVector2NaturalMotionAnimation](bouncevector2naturalmotionanimation.md).
     * @returns {BounceVector2NaturalMotionAnimation} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositor.createbouncevector2animation
     */
    CreateBounceVector2Animation() {
        if (!this.HasProp("__ICompositor5")) {
            if ((queryResult := this.QueryInterface(ICompositor5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositor5 := ICompositor5(outPtr)
        }

        return this.__ICompositor5.CreateBounceVector2Animation()
    }

    /**
     * Creates an instance of [BounceVector3NaturalMotionAnimation](bouncevector3naturalmotionanimation.md).
     * @returns {BounceVector3NaturalMotionAnimation} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositor.createbouncevector3animation
     */
    CreateBounceVector3Animation() {
        if (!this.HasProp("__ICompositor5")) {
            if ((queryResult := this.QueryInterface(ICompositor5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositor5 := ICompositor5(outPtr)
        }

        return this.__ICompositor5.CreateBounceVector3Animation()
    }

    /**
     * Creates an instance of [CompositionContainerShape](compositioncontainershape.md).
     * @returns {CompositionContainerShape} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositor.createcontainershape
     */
    CreateContainerShape() {
        if (!this.HasProp("__ICompositor5")) {
            if ((queryResult := this.QueryInterface(ICompositor5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositor5 := ICompositor5(outPtr)
        }

        return this.__ICompositor5.CreateContainerShape()
    }

    /**
     * Creates an instance of [CompositionEllipseGeometry](compositionellipsegeometry.md).
     * @returns {CompositionEllipseGeometry} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositor.createellipsegeometry
     */
    CreateEllipseGeometry() {
        if (!this.HasProp("__ICompositor5")) {
            if ((queryResult := this.QueryInterface(ICompositor5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositor5 := ICompositor5(outPtr)
        }

        return this.__ICompositor5.CreateEllipseGeometry()
    }

    /**
     * Creates an instance of [CompositionLineGeometry](compositionlinegeometry.md).
     * @returns {CompositionLineGeometry} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositor.createlinegeometry
     */
    CreateLineGeometry() {
        if (!this.HasProp("__ICompositor5")) {
            if ((queryResult := this.QueryInterface(ICompositor5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositor5 := ICompositor5(outPtr)
        }

        return this.__ICompositor5.CreateLineGeometry()
    }

    /**
     * Creates an instance of [CompositionPathGeometry](compositionpathgeometry.md) using the specified path.
     * @returns {CompositionPathGeometry} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositor.createpathgeometry
     */
    CreatePathGeometry() {
        if (!this.HasProp("__ICompositor5")) {
            if ((queryResult := this.QueryInterface(ICompositor5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositor5 := ICompositor5(outPtr)
        }

        return this.__ICompositor5.CreatePathGeometry()
    }

    /**
     * Creates an instance of [CompositionPathGeometry](compositionpathgeometry.md).
     * @param {CompositionPath} path_ 
     * @returns {CompositionPathGeometry} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositor.createpathgeometry
     */
    CreatePathGeometryWithPath(path_) {
        if (!this.HasProp("__ICompositor5")) {
            if ((queryResult := this.QueryInterface(ICompositor5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositor5 := ICompositor5(outPtr)
        }

        return this.__ICompositor5.CreatePathGeometryWithPath(path_)
    }

    /**
     * Creates an instance of [PathKeyFrameAnimation](pathkeyframeanimation.md).
     * @returns {PathKeyFrameAnimation} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositor.createpathkeyframeanimation
     */
    CreatePathKeyFrameAnimation() {
        if (!this.HasProp("__ICompositor5")) {
            if ((queryResult := this.QueryInterface(ICompositor5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositor5 := ICompositor5(outPtr)
        }

        return this.__ICompositor5.CreatePathKeyFrameAnimation()
    }

    /**
     * Creates an instance of [CompositionRectangleGeometry](compositionrectanglegeometry.md).
     * @returns {CompositionRectangleGeometry} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositor.createrectanglegeometry
     */
    CreateRectangleGeometry() {
        if (!this.HasProp("__ICompositor5")) {
            if ((queryResult := this.QueryInterface(ICompositor5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositor5 := ICompositor5(outPtr)
        }

        return this.__ICompositor5.CreateRectangleGeometry()
    }

    /**
     * Creates an instance of [CompositionRoundedRectangleGeometry](compositionroundedrectanglegeometry.md).
     * @returns {CompositionRoundedRectangleGeometry} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositor.createroundedrectanglegeometry
     */
    CreateRoundedRectangleGeometry() {
        if (!this.HasProp("__ICompositor5")) {
            if ((queryResult := this.QueryInterface(ICompositor5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositor5 := ICompositor5(outPtr)
        }

        return this.__ICompositor5.CreateRoundedRectangleGeometry()
    }

    /**
     * Creates an instance of [ShapeVisual](shapevisual.md).
     * @returns {ShapeVisual} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositor.createshapevisual
     */
    CreateShapeVisual() {
        if (!this.HasProp("__ICompositor5")) {
            if ((queryResult := this.QueryInterface(ICompositor5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositor5 := ICompositor5(outPtr)
        }

        return this.__ICompositor5.CreateShapeVisual()
    }

    /**
     * Creates an instance of [CompositionSpriteShape](compositionspriteshape.md) using the specified geometry.
     * @returns {CompositionSpriteShape} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositor.createspriteshape
     */
    CreateSpriteShape() {
        if (!this.HasProp("__ICompositor5")) {
            if ((queryResult := this.QueryInterface(ICompositor5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositor5 := ICompositor5(outPtr)
        }

        return this.__ICompositor5.CreateSpriteShape()
    }

    /**
     * Creates an instance of [CompositionSpriteShape](compositionspriteshape.md).
     * @param {CompositionGeometry} geometry_ 
     * @returns {CompositionSpriteShape} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositor.createspriteshape
     */
    CreateSpriteShapeWithGeometry(geometry_) {
        if (!this.HasProp("__ICompositor5")) {
            if ((queryResult := this.QueryInterface(ICompositor5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositor5 := ICompositor5(outPtr)
        }

        return this.__ICompositor5.CreateSpriteShapeWithGeometry(geometry_)
    }

    /**
     * Creates an instance of [CompositionViewBox](compositionviewbox.md).
     * @returns {CompositionViewBox} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositor.createviewbox
     */
    CreateViewBox() {
        if (!this.HasProp("__ICompositor5")) {
            if ((queryResult := this.QueryInterface(ICompositor5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositor5 := ICompositor5(outPtr)
        }

        return this.__ICompositor5.CreateViewBox()
    }

    /**
     * Attempts to initiate a commit cycle ansynchronously.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositor.requestcommitasync
     */
    RequestCommitAsync() {
        if (!this.HasProp("__ICompositor5")) {
            if ((queryResult := this.QueryInterface(ICompositor5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositor5 := ICompositor5(outPtr)
        }

        return this.__ICompositor5.RequestCommitAsync()
    }

    /**
     * Creates an instance of [CompositionGeometricClip](compositiongeometricclip.md) using the specified geometry.
     * @returns {CompositionGeometricClip} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositor.creategeometricclip
     */
    CreateGeometricClip() {
        if (!this.HasProp("__ICompositor6")) {
            if ((queryResult := this.QueryInterface(ICompositor6.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositor6 := ICompositor6(outPtr)
        }

        return this.__ICompositor6.CreateGeometricClip()
    }

    /**
     * Creates an instance of [CompositionGeometricClip](compositiongeometricclip.md).
     * @param {CompositionGeometry} geometry_ 
     * @returns {CompositionGeometricClip} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositor.creategeometricclip
     */
    CreateGeometricClipWithGeometry(geometry_) {
        if (!this.HasProp("__ICompositor6")) {
            if ((queryResult := this.QueryInterface(ICompositor6.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositor6 := ICompositor6(outPtr)
        }

        return this.__ICompositor6.CreateGeometricClipWithGeometry(geometry_)
    }

    /**
     * Creates an instance of [RedirectVisual](redirectvisual.md) using the specified source.
     * @returns {RedirectVisual} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositor.createredirectvisual
     */
    CreateRedirectVisual() {
        if (!this.HasProp("__ICompositor6")) {
            if ((queryResult := this.QueryInterface(ICompositor6.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositor6 := ICompositor6(outPtr)
        }

        return this.__ICompositor6.CreateRedirectVisual()
    }

    /**
     * Creates an instance of [RedirectVisual](redirectvisual.md).
     * @param {Visual} source 
     * @returns {RedirectVisual} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositor.createredirectvisual
     */
    CreateRedirectVisualWithSourceVisual(source) {
        if (!this.HasProp("__ICompositor6")) {
            if ((queryResult := this.QueryInterface(ICompositor6.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositor6 := ICompositor6(outPtr)
        }

        return this.__ICompositor6.CreateRedirectVisualWithSourceVisual(source)
    }

    /**
     * Creates an instance of [BooleanKeyFrameAnimation](booleankeyframeanimation.md).
     * @returns {BooleanKeyFrameAnimation} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositor.createbooleankeyframeanimation
     */
    CreateBooleanKeyFrameAnimation() {
        if (!this.HasProp("__ICompositor6")) {
            if ((queryResult := this.QueryInterface(ICompositor6.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositor6 := ICompositor6(outPtr)
        }

        return this.__ICompositor6.CreateBooleanKeyFrameAnimation()
    }

    /**
     * Creates an instance of [CompositionProjectedShadowCaster](compositionprojectedshadowcaster.md).
     * @returns {CompositionProjectedShadowCaster} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositor.createprojectedshadowcaster
     */
    CreateProjectedShadowCaster() {
        if (!this.HasProp("__ICompositorWithProjectedShadow")) {
            if ((queryResult := this.QueryInterface(ICompositorWithProjectedShadow.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositorWithProjectedShadow := ICompositorWithProjectedShadow(outPtr)
        }

        return this.__ICompositorWithProjectedShadow.CreateProjectedShadowCaster()
    }

    /**
     * Creates an instance of [CompositionProjectedShadow](compositionprojectedshadow.md).
     * @returns {CompositionProjectedShadow} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositor.createprojectedshadow
     */
    CreateProjectedShadow() {
        if (!this.HasProp("__ICompositorWithProjectedShadow")) {
            if ((queryResult := this.QueryInterface(ICompositorWithProjectedShadow.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositorWithProjectedShadow := ICompositorWithProjectedShadow(outPtr)
        }

        return this.__ICompositorWithProjectedShadow.CreateProjectedShadow()
    }

    /**
     * Creates an instance of [CompositionProjectedShadowReceiver](compositionprojectedshadowreceiver.md).
     * @returns {CompositionProjectedShadowReceiver} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositor.createprojectedshadowreceiver
     */
    CreateProjectedShadowReceiver() {
        if (!this.HasProp("__ICompositorWithProjectedShadow")) {
            if ((queryResult := this.QueryInterface(ICompositorWithProjectedShadow.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositorWithProjectedShadow := ICompositorWithProjectedShadow(outPtr)
        }

        return this.__ICompositorWithProjectedShadow.CreateProjectedShadowReceiver()
    }

    /**
     * Creates an instance of [CompositionRadialGradientBrush](compositionradialgradientbrush.md).
     * @returns {CompositionRadialGradientBrush} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositor.createradialgradientbrush
     */
    CreateRadialGradientBrush() {
        if (!this.HasProp("__ICompositorWithRadialGradient")) {
            if ((queryResult := this.QueryInterface(ICompositorWithRadialGradient.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositorWithRadialGradient := ICompositorWithRadialGradient(outPtr)
        }

        return this.__ICompositorWithRadialGradient.CreateRadialGradientBrush()
    }

    /**
     * Creates an instance of [CompositionVisualSurface](compositionvisualsurface.md).
     * @returns {CompositionVisualSurface} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositor.createvisualsurface
     */
    CreateVisualSurface() {
        if (!this.HasProp("__ICompositorWithVisualSurface")) {
            if ((queryResult := this.QueryInterface(ICompositorWithVisualSurface.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositorWithVisualSurface := ICompositorWithVisualSurface(outPtr)
        }

        return this.__ICompositorWithVisualSurface.CreateVisualSurface()
    }

    /**
     * 
     * @returns {DispatcherQueue} 
     */
    get_DispatcherQueue() {
        if (!this.HasProp("__ICompositor7")) {
            if ((queryResult := this.QueryInterface(ICompositor7.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositor7 := ICompositor7(outPtr)
        }

        return this.__ICompositor7.get_DispatcherQueue()
    }

    /**
     * Creates an instance of [AnimationPropertyInfo](animationpropertyinfo.md).
     * @returns {AnimationPropertyInfo} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositor.createanimationpropertyinfo
     */
    CreateAnimationPropertyInfo() {
        if (!this.HasProp("__ICompositor7")) {
            if ((queryResult := this.QueryInterface(ICompositor7.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositor7 := ICompositor7(outPtr)
        }

        return this.__ICompositor7.CreateAnimationPropertyInfo()
    }

    /**
     * Creates an instance of [RectangleClip](rectangleclip.md) with default values.
     * @returns {RectangleClip} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositor.createrectangleclip
     */
    CreateRectangleClip() {
        if (!this.HasProp("__ICompositor7")) {
            if ((queryResult := this.QueryInterface(ICompositor7.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositor7 := ICompositor7(outPtr)
        }

        return this.__ICompositor7.CreateRectangleClip()
    }

    /**
     * Creates an instance of [RectangleClip](rectangleclip.md) with default values.
     * @param {Float} left 
     * @param {Float} top 
     * @param {Float} right 
     * @param {Float} bottom 
     * @returns {RectangleClip} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositor.createrectangleclip
     */
    CreateRectangleClipWithSides(left, top, right, bottom) {
        if (!this.HasProp("__ICompositor7")) {
            if ((queryResult := this.QueryInterface(ICompositor7.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositor7 := ICompositor7(outPtr)
        }

        return this.__ICompositor7.CreateRectangleClipWithSides(left, top, right, bottom)
    }

    /**
     * Creates an instance of [RectangleClip](rectangleclip.md) with default values.
     * @param {Float} left 
     * @param {Float} top 
     * @param {Float} right 
     * @param {Float} bottom 
     * @param {Vector2} topLeftRadius 
     * @param {Vector2} topRightRadius 
     * @param {Vector2} bottomRightRadius 
     * @param {Vector2} bottomLeftRadius 
     * @returns {RectangleClip} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositor.createrectangleclip
     */
    CreateRectangleClipWithSidesAndRadius(left, top, right, bottom, topLeftRadius, topRightRadius, bottomRightRadius, bottomLeftRadius) {
        if (!this.HasProp("__ICompositor7")) {
            if ((queryResult := this.QueryInterface(ICompositor7.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositor7 := ICompositor7(outPtr)
        }

        return this.__ICompositor7.CreateRectangleClipWithSidesAndRadius(left, top, right, bottom, topLeftRadius, topRightRadius, bottomRightRadius, bottomLeftRadius)
    }

    /**
     * Creates an instance of `CompositionBackdropBrush` that draws the blurred wallpaper behind the current visual.
     * @remarks
     * This method creates a `CompositionBackdropBrush` that can be applied as an input to a [CompositionEffectBrush](compositioneffectbrush.md) or directly as a brush on a [SpriteVisual](spritevisual.md). This brush draws a blurred version of the current desktop wallpaper that would be seen directly behind the current visual.
     * @returns {CompositionBackdropBrush} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositor.trycreateblurredwallpaperbackdropbrush
     */
    TryCreateBlurredWallpaperBackdropBrush() {
        if (!this.HasProp("__ICompositorWithBlurredWallpaperBackdropBrush")) {
            if ((queryResult := this.QueryInterface(ICompositorWithBlurredWallpaperBackdropBrush.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositorWithBlurredWallpaperBackdropBrush := ICompositorWithBlurredWallpaperBackdropBrush(outPtr)
        }

        return this.__ICompositorWithBlurredWallpaperBackdropBrush.TryCreateBlurredWallpaperBackdropBrush()
    }

    /**
     * Creates an instance of [AnimationController](animationcontroller.md).
     * @returns {AnimationController} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositor.createanimationcontroller
     */
    CreateAnimationController() {
        if (!this.HasProp("__ICompositor8")) {
            if ((queryResult := this.QueryInterface(ICompositor8.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositor8 := ICompositor8(outPtr)
        }

        return this.__ICompositor8.CreateAnimationController()
    }

    /**
     * Closes the Compositor object and releases system resources.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositor.close
     */
    Close() {
        if (!this.HasProp("__IClosable")) {
            if ((queryResult := this.QueryInterface(IClosable.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClosable := IClosable(outPtr)
        }

        return this.__IClosable.Close()
    }

;@endregion Instance Methods
}
