#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ICompositionObject.ahk
#Include .\ICompositionObject2.ahk
#Include .\ICompositionObject3.ahk
#Include .\ICompositionObject4.ahk
#Include .\ICompositionObject5.ahk
#Include ..\..\Foundation\IClosable.ahk
#Include .\IAnimationObject.ahk
#Include .\ICompositionObjectStatics.ahk
#Include .\ICompositionObjectFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * Base class of the composition API representing a node in the visual tree structure.
  * 
  * Composition objects are the visual tree structure on which all other features of the composition API use and build on. The API allows developers to define and create one or many [Visual](visual.md) objects each representing a single node in a Visual tree.
 * @remarks
 * Objects are created using a [Compositor](compositor.md) object. The composition objects can be containers only or can hold content. The API allows for ease of use by providing a clear set of Visual objects for specific tasks that exist in a hierarchy:
 * 
 * + [Visual](visual.md) – base object, the majority of the properties are here, and inherited by the other Visual objects.
 * + [ContainerVisual](containervisual.md) – derives from [Visual](visual.md), and adds the ability to create children.
 * + [SpriteVisual](spritevisual.md) – derives from [ContainerVisual](containervisual.md), and contains content in the form of images, effects, and swapchains.
 * + [Compositor](compositor.md) – manages the relationship between an application and the system compositor process.
 * Animations update the properties of any animatable composition object (such as Visual). There are two types of Animations:
 * 
 * + [KeyFrameAnimation](keyframeanimation.md): Time-based animations with two or more key frames. These frames are markers, allowing developers to define what the animated value should be at the specified time. Animations can additionally be fine-tuned by specifying how the animation interpolates (blends) the values between key frames. [KeyFrameAnimation](keyframeanimation.md) has many subclasses each supporting a different type of key frame value.
 * + [ExpressionAnimation](expressionanimation.md): Animations that use a mathematical expression to specify how the animated value should be calculated each frame. The expressions can reference properties from composition objects. [ExpressionAnimation](expressionanimation.md)s are not time-based and are processed each frame (if necessary).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionobject
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class CompositionObject extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICompositionObject

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICompositionObject.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Connects an animation with the specified property of the target object and starts the animation.
     * @param {IAnimationObject} target The object that defines the property to be animated.
     * @param {HSTRING} propertyName The property to associate the animation with.
     * @param {CompositionAnimation} animation The animation to associate with the specified property.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionobject.startanimationwithianimationobject
     */
    static StartAnimationWithIAnimationObject(target, propertyName, animation) {
        if (!CompositionObject.HasProp("__ICompositionObjectStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Composition.CompositionObject")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICompositionObjectStatics.IID)
            CompositionObject.__ICompositionObjectStatics := ICompositionObjectStatics(factoryPtr)
        }

        return CompositionObject.__ICompositionObjectStatics.StartAnimationWithIAnimationObject(target, propertyName, animation)
    }

    /**
     * Starts an animation group on the specified target.
     * @param {IAnimationObject} target The object that defines the property to be animated.
     * @param {ICompositionAnimationBase} animation The animation to associate with the specified property.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionobject.startanimationgroupwithianimationobject
     */
    static StartAnimationGroupWithIAnimationObject(target, animation) {
        if (!CompositionObject.HasProp("__ICompositionObjectStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Composition.CompositionObject")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICompositionObjectStatics.IID)
            CompositionObject.__ICompositionObjectStatics := ICompositionObjectStatics(factoryPtr)
        }

        return CompositionObject.__ICompositionObjectStatics.StartAnimationGroupWithIAnimationObject(target, animation)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * The [Compositor](compositor.md) used to create this [CompositionObject](compositionobject.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionobject.compositor
     * @type {Compositor} 
     */
    Compositor {
        get => this.get_Compositor()
    }

    /**
     * The dispatcher for the [CompositionObject](compositionobject.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionobject.dispatcher
     * @type {CoreDispatcher} 
     */
    Dispatcher {
        get => this.get_Dispatcher()
    }

    /**
     * The collection of properties associated with the [CompositionObject](compositionobject.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionobject.properties
     * @type {CompositionPropertySet} 
     */
    Properties {
        get => this.get_Properties()
    }

    /**
     * A string to associate with the CompositionObject.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionobject.comment
     * @type {HSTRING} 
     */
    Comment {
        get => this.get_Comment()
        set => this.put_Comment(value)
    }

    /**
     * The collection of implicit animations attached to this object.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionobject.implicitanimations
     * @type {ImplicitAnimationCollection} 
     */
    ImplicitAnimations {
        get => this.get_ImplicitAnimations()
        set => this.put_ImplicitAnimations(value)
    }

    /**
     * Gets the [DispatcherQueue](../windows.system/dispatcherqueue.md) for the CompostionObject.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionobject.dispatcherqueue
     * @type {DispatcherQueue} 
     */
    DispatcherQueue {
        get => this.get_DispatcherQueue()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        this.Close()

        super.__Delete()
    }

    /**
     * 
     * @returns {Compositor} 
     */
    get_Compositor() {
        if (!this.HasProp("__ICompositionObject")) {
            if ((queryResult := this.QueryInterface(ICompositionObject.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionObject := ICompositionObject(outPtr)
        }

        return this.__ICompositionObject.get_Compositor()
    }

    /**
     * 
     * @returns {CoreDispatcher} 
     */
    get_Dispatcher() {
        if (!this.HasProp("__ICompositionObject")) {
            if ((queryResult := this.QueryInterface(ICompositionObject.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionObject := ICompositionObject(outPtr)
        }

        return this.__ICompositionObject.get_Dispatcher()
    }

    /**
     * 
     * @returns {CompositionPropertySet} 
     */
    get_Properties() {
        if (!this.HasProp("__ICompositionObject")) {
            if ((queryResult := this.QueryInterface(ICompositionObject.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionObject := ICompositionObject(outPtr)
        }

        return this.__ICompositionObject.get_Properties()
    }

    /**
     * Connects an animation with the specified property of the object and starts the animation.
     * @remarks
     * If an animation is already bound to an object's property when StartAnimation is called, the previous applied animation will be disconnected and the new animation will be assigned. Similarly, setting the property directly will cause the previous animation to be disconnected and the new property value will take effect.
     * 
     * The following table shows the list of animatable properties:
     * 
     * | Object | Property Name | Property Type |
     * |---------|---------|---------|
     * | [Visual](visual.md) | [AnchorPoint](visual_anchorpoint.md) | Vector2 |
     * |  | [CenterPoint](visual_centerpoint.md) | Vector3 |
     * |  | [Offset](visual_offset.md) | Vector3 |
     * |  | [Opacity](visual_opacity.md) | Scalar |
     * |  | [Orientation](visual_orientation.md) | Vector4 |
     * |  | [RotationAngle](visual_rotationangle.md) | Scalar |
     * |  | [RotationAxis](visual_rotationaxis.md) | Vector3 |
     * |  | [Size](visual_size.md) | Vector2 |
     * |  | [TransformMatrix](visual_transformmatrix.md) | Matrix4x4 |
     * | [InsetClip](insetclip.md) | [BottomInset](insetclip_bottominset.md) | Scalar |
     * |  | [LeftInset](insetclip_leftinset.md) | Scalar |
     * |  | [RightInset](insetclip_rightinset.md) | Scalar |
     * |  | [TopInset](insetclip_topinset.md) | Scalar |
     * | [CompositionColorBrush](compositioncolorbrush.md) | [Color](compositioncolorbrush_color.md) | Windows.UI.Color |
     * | [CompositionPropertySet](compositionpropertyset.md) | Set of properties specified by the developer. |  |
     * 
     * In addition, properties of some effects under the [CompositionEffectBrush](compositioneffectbrush.md) object can be animated:
     * 
     * | Effect Name | Property Name | Property Type |
     * |---|---|---|
     * | SaturationEffect | Saturation | Scalar |
     * | ColorSourceEffect | Color | Vector4 |
     * | ArithmeticComposite | Offset | Scalar |
     * | | Source1Amount | Scalar |
     * | | Source2Amount | Scalar |
     * | | MultiplyAmount | Scalar |
     * | Transform2D | TransformMatrix | Matrix3x2 |
     * | ContrastEffect | Contrast | Float |
     * | ExposureEffect | Exposure | Float |
     * | HueRotationEffect | Angle | Float |
     * | SepiaEffect | Intensity | Float |
     * | TemperatureAndTintEffect | Temperature | Float |
     * | | Tint | Float |
     * | GammaTransferEffect | RedAmplitude | Float |
     * | | RedExponent | Float |
     * | | RedOffset | Float |
     * | | GreenAmplitude | Float |
     * | | GreenExponent | Float |
     * | | GreenOffset | Float |
     * | | BlueAmplitude | Float |
     * | | BlueExponent | Float |
     * | | BlueOffset | Float |
     * | | AlphaAmplitude | Float |
     * | | AlphaExponent | Float |
     * | | AlphaOffset | Float |
     * @param {HSTRING} propertyName The property to associate the animation with.
     * @param {CompositionAnimation} animation The animation to associate with the specified property.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionobject.startanimation
     */
    StartAnimation(propertyName, animation) {
        if (!this.HasProp("__ICompositionObject")) {
            if ((queryResult := this.QueryInterface(ICompositionObject.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionObject := ICompositionObject(outPtr)
        }

        return this.__ICompositionObject.StartAnimation(propertyName, animation)
    }

    /**
     * Disconnects an animation from the specified property and stops the animation.
     * @param {HSTRING} propertyName The name of the property to disconnect the animation from.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionobject.stopanimation
     */
    StopAnimation(propertyName) {
        if (!this.HasProp("__ICompositionObject")) {
            if ((queryResult := this.QueryInterface(ICompositionObject.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionObject := ICompositionObject(outPtr)
        }

        return this.__ICompositionObject.StopAnimation(propertyName)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Comment() {
        if (!this.HasProp("__ICompositionObject2")) {
            if ((queryResult := this.QueryInterface(ICompositionObject2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionObject2 := ICompositionObject2(outPtr)
        }

        return this.__ICompositionObject2.get_Comment()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Comment(value) {
        if (!this.HasProp("__ICompositionObject2")) {
            if ((queryResult := this.QueryInterface(ICompositionObject2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionObject2 := ICompositionObject2(outPtr)
        }

        return this.__ICompositionObject2.put_Comment(value)
    }

    /**
     * 
     * @returns {ImplicitAnimationCollection} 
     */
    get_ImplicitAnimations() {
        if (!this.HasProp("__ICompositionObject2")) {
            if ((queryResult := this.QueryInterface(ICompositionObject2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionObject2 := ICompositionObject2(outPtr)
        }

        return this.__ICompositionObject2.get_ImplicitAnimations()
    }

    /**
     * 
     * @param {ImplicitAnimationCollection} value 
     * @returns {HRESULT} 
     */
    put_ImplicitAnimations(value) {
        if (!this.HasProp("__ICompositionObject2")) {
            if ((queryResult := this.QueryInterface(ICompositionObject2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionObject2 := ICompositionObject2(outPtr)
        }

        return this.__ICompositionObject2.put_ImplicitAnimations(value)
    }

    /**
     * Starts an animation group.
     * 
     * The StartAnimationGroup method on [CompositionObject](compositionobject.md) lets you start [CompositionAnimationGroup](compositionanimationgroup.md). All the animations in the group will be started at the same time on the object.
     * @remarks
     * StartAnimationGroup takes [CompositionAnimationGroup](compositionanimationgroup.md) as a parameter to start all the animations in the group at the same time on the object. [CompositionAnimation](compositionanimation.md) in the group should have a value assigned to the [Target](compositionanimation_target.md) property.
     * 
     * To get [Completed](compositionscopedbatch_completed.md) events for all the animations, StartAnimationGroup should be called from a [CompositionScopedBatch](compositionscopedbatch.md) with a registered [Completed](compositionscopedbatch_completed.md) event.
     * @param {ICompositionAnimationBase} value The animation group to start.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionobject.startanimationgroup
     */
    StartAnimationGroup(value) {
        if (!this.HasProp("__ICompositionObject2")) {
            if ((queryResult := this.QueryInterface(ICompositionObject2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionObject2 := ICompositionObject2(outPtr)
        }

        return this.__ICompositionObject2.StartAnimationGroup(value)
    }

    /**
     * Stops an animation group.
     * @param {ICompositionAnimationBase} value The animation group to stop.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionobject.stopanimationgroup
     */
    StopAnimationGroup(value) {
        if (!this.HasProp("__ICompositionObject2")) {
            if ((queryResult := this.QueryInterface(ICompositionObject2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionObject2 := ICompositionObject2(outPtr)
        }

        return this.__ICompositionObject2.StopAnimationGroup(value)
    }

    /**
     * 
     * @returns {DispatcherQueue} 
     */
    get_DispatcherQueue() {
        if (!this.HasProp("__ICompositionObject3")) {
            if ((queryResult := this.QueryInterface(ICompositionObject3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionObject3 := ICompositionObject3(outPtr)
        }

        return this.__ICompositionObject3.get_DispatcherQueue()
    }

    /**
     * Returns an AnimationController for the animation running on the specified property.
     * @param {HSTRING} propertyName The property being animated.
     * @returns {AnimationController} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionobject.trygetanimationcontroller
     */
    TryGetAnimationController(propertyName) {
        if (!this.HasProp("__ICompositionObject4")) {
            if ((queryResult := this.QueryInterface(ICompositionObject4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionObject4 := ICompositionObject4(outPtr)
        }

        return this.__ICompositionObject4.TryGetAnimationController(propertyName)
    }

    /**
     * Connects an animation with the specified property of the object and starts the animation.
     * @remarks
     * The `animationController` parameter lets you bind multiple animations to a single controller's [Progress](animationcontroller_progress.md) property, which requires fewer ExpressionAnimation objects than binding multiple animator's `Progress` properties to a CompositionObject property.
     * @param {HSTRING} propertyName The property to associate the animation with.
     * @param {CompositionAnimation} animation The animation to associate with the specified property.
     * @param {AnimationController} animationController_ The animation controller to associate with the animation.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionobject.startanimation
     */
    StartAnimationWithController(propertyName, animation, animationController_) {
        if (!this.HasProp("__ICompositionObject5")) {
            if ((queryResult := this.QueryInterface(ICompositionObject5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionObject5 := ICompositionObject5(outPtr)
        }

        return this.__ICompositionObject5.StartAnimationWithController(propertyName, animation, animationController_)
    }

    /**
     * Closes the CompositionObject and releases system resources.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionobject.close
     */
    Close() {
        if (!this.HasProp("__IClosable")) {
            if ((queryResult := this.QueryInterface(IClosable.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClosable := IClosable(outPtr)
        }

        return this.__IClosable.Close()
    }

    /**
     * Defines a property that can be animated.
     * @param {HSTRING} propertyName The property that can be animated.
     * @param {AnimationPropertyInfo} propertyInfo Information about the property to be animated.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.compositionobject.populatepropertyinfo
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
