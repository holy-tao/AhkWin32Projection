#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\CompositionObject.ahk
#Include .\IVisualInteractionSource.ahk
#Include .\IVisualInteractionSource2.ahk
#Include .\IVisualInteractionSource3.ahk
#Include .\IVisualInteractionSourceStatics.ahk
#Include .\IVisualInteractionSourceObjectFactory.ahk
#Include .\IVisualInteractionSourceStatics2.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Object for configuring input to the InteractionTracker relative to a visual.
  * 
  * The VisualInteractionSource is designed to be used only with [InteractionTracker](interactiontracker.md) and defines which input will be sent to the [InteractionTracker](interactiontracker.md) to drive its state and properties. This class contains both the visual to be used for hit-testing, as well as a variety of configuration properties for which gestures and types of input will be sent to the [InteractionTracker](interactiontracker.md).
 * @remarks
 * The VisualInteractionSource is used to define important properties about the types of interactions that should drive the InteractionTracker's state and properties. The source property is used both for hit-testing, as well as the coordinate space for gesture detection. As a result, it is important to use a Visual that is not going to be in motion during the manipulation. Multiple VisualInteractionSources can be associated with the same InteractionTracker if there are multiple hit-test regions, but the most common cases require only one VisualInteractionSource for a given InteractionTracker.
 * 
 * VisualInteractionSource is the class for configuring which types of gestures should be considered for driving the InteractionTracker. Position X and Y are associated with horizontal and vertical panning respectively. Scale is detected with a pinch gesture, often associated with zooming. These three source modes are all configurable for touch and Precision Touchpad input. Each of these source modes can be enabled with or without inertia:
 * 
 * * Enabling inertia indicates that position or scale will naturally interpolate from the release velocity to no velocity during the inertia state. 
 * 
 * * Disabling inertia indicates that position or scale velocity will immediately go to 0 upon completion of the interaction. When input that drives position or scale is routed to the InteractionTracker, the InteractionTracker property of the same name will be updated appropriately.
 * 
 * The rails configurations indicate how the gesture will be detected. Rails, by default, is on and indicates that the horizontal or vertical pan will lock to a particular axis when started primarily on that axis. This is explained in more detail on the railing property pages.
 * 
 * The chaining configuration indicates whether input that is processed by one VisualInteractionSource can flow to another entity when the InteractionTracker reaches the min or max in that direction. This configuration will allow input to chain to either another InteractionTracker via another VisualInteractionSource, or to a ScrollViewer if the VisualInteractionSource's source visual is a child of the ScrollViewer.
 * 
 * <!--
 *      <section><title>Compositor Hit-testing</title>
 *      
 *       <sectioncontents>
 *         <p>The hit-test result used for determining if the manipulation has hit-tested to the VisualInteractionSource's
 *         source visual will be based on the compositor's hit-testing.  Compositor hit-testing does not always have the same logic as XAML hit-testing,
 *         so there are cases where results could have a slight discrepancy.  This outlines they key differences that could impact developers.</p>
 *       </sectioncontents>
 *     </section>
 *     -->
 * 
 * <!--
 *      <section><title>Irregular Shapes</title>
 *       <sectioncontents><p>The compositor can only hit-test within a bounding box.  Irregular shapes will therefore not be hit-tested. 
 *       The impact of this should be minimal as long as there is a parent-child relationship because the compositor will have a larger
 *       hit-test region than the application.  At the point the app is choosing to call "TryRedirectForManipulation"
 *       they should have already determined that the desired behavior.  If visuals are siblings, then the scenario below presents a problem. 
 *       In the scenario below, the app would call TryRedirectForManipulation on a PointerPressed at P1.
 *       If V2 is a child of V1, then system manipulation would take over as expected. 
 *       If V1 and V2 are siblings, then the compositor would not take over the manipulation since
 *       it will only manipulate when V1 or a child is hit-tested.</p>
 *       </sectioncontents>
 *     </section>
 *     -->
 * 
 * <!--
 *      <section>
 *        <title>Visual Tree Structure Reliance</title>
 *        <sectioncontents>
 *          <p>In the scenario below, we show an InteractionTracker visually placed on top of a SwapChainPanel.  
 *          In this case, the two are siblings.  If the user touches down on the InteractionTracker, input will go to the UI thread.
 *          There is no way for this input to fall through to the SwapChainPanel.  </p>
 *        </sectioncontents>
 *     </section>
 *     -->
 * 
 * <!--
 *      <section><title>Additional Limitations</title>
 *       <sectioncontents>
 *         <p>In addition to the scenarios described about there are some other differences between XAML and Compositor hit-test logic.</p>
 *         <list>
 *           <item>IsHit-testVisible = false is not always propagated from XAML to compositor</item>
 *           <item>Compositor hit-tests the bounds of swapchain not only the image portion</item>
 *           <item>ContainerVisuals do not Hit-test – it is recommended not to use this type of visual when creating your InteractionSource</item>
 *           <item>SpriteVisual will hit test within the rectangular bounds with most brushes. In the case where a SurfaceBrush is applied, the system will Hit-test the surface and respect stretch and transform changes</item>
 *         </list>
 *     </sectioncontents>
 * </section>
 * -->
 * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.interactions.visualinteractionsource
 * @namespace Windows.UI.Composition.Interactions
 * @version WindowsRuntime 1.4
 */
class VisualInteractionSource extends CompositionObject {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IVisualInteractionSource

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IVisualInteractionSource.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates an instance of [VisualInteractionSource](visualinteractionsource.md).
     * @param {Visual} source The visual to use as the source of the interaction.
     * @returns {VisualInteractionSource} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.interactions.visualinteractionsource.create
     */
    static Create(source) {
        if (!VisualInteractionSource.HasProp("__IVisualInteractionSourceStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Composition.Interactions.VisualInteractionSource")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IVisualInteractionSourceStatics.IID)
            VisualInteractionSource.__IVisualInteractionSourceStatics := IVisualInteractionSourceStatics(factoryPtr)
        }

        return VisualInteractionSource.__IVisualInteractionSourceStatics.Create(source)
    }

    /**
     * Creates an instance of [VisualInteractionSource](visualinteractionsource.md) from an element that implements [IVisualElement](../windows.ui.composition/ivisualelement.md).
     * @param {IVisualElement} source The element to use as the source of the interaction, typically a XAML [UIElement](../windows.ui.xaml/uielement.md).
     * @returns {VisualInteractionSource} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.interactions.visualinteractionsource.createfromivisualelement
     */
    static CreateFromIVisualElement(source) {
        if (!VisualInteractionSource.HasProp("__IVisualInteractionSourceStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Composition.Interactions.VisualInteractionSource")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IVisualInteractionSourceStatics2.IID)
            VisualInteractionSource.__IVisualInteractionSourceStatics2 := IVisualInteractionSourceStatics2(factoryPtr)
        }

        return VisualInteractionSource.__IVisualInteractionSourceStatics2.CreateFromIVisualElement(source)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Indicates whether panning on the x-axis is railed.
     * 
     * The IsPositionXRailsEnabled property defines the railing configuration for when X-axis panning gets sent to the corresponding [InteractionTracker](interactiontracker.md). When enabled, if the initial part of the pan is angled within a particular range relative to the X-axis, the Y component of the pan is ignored and considered a perfect horizontal pan. This property is often enabled in situations where both an X and Y scrolling experience is enabled, but also requires reliable, perfect horizontal panning.
     * @remarks
     * When this property is enabled, the system provides more leniency in what is considered a “perfect” horizontal pan. Often times when a finger pans across the screen, it is very difficult for an end user to achieve a perfect pan in the X-direction. This property helps makes it more possible to have “perfect” horizontal panning in scenarios (such as multi-directional scrolling) where both X and Y panning is already enabled.
     * 
     * When enabled, pans within 22.5 degrees of the horizontal axis will get recognized as “perfect” horizontal pans – in other words, their Y components will be ignored. Note that the angle of the pan is determined within the first few millimeters of the interaction and will retain that angle until the finger is lifted. If outside the threshold of 22.5 degrees of the axis, then the Y component will then be recognized.
     * 
     * The diagram below shows this in a visual format:
     * 
     * <img src="images/rails.png" alt="Pans within 22.5 degrees of the horizontal axis will get recognized as perfect horizontal pans – in other words, their Y components will be ignored. If outside the threshold of 22.5 degrees of the axis, then the Y component will then be recognized." />
     * 
     * > [!NOTE]
     * > When rails are enabled, this has an impact to chaining. The system will only chain up to its nearest acenstor VisualInteractionSource when the pan is within 22.5 degrees of the axis.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.interactions.visualinteractionsource.ispositionxrailsenabled
     * @type {Boolean} 
     */
    IsPositionXRailsEnabled {
        get => this.get_IsPositionXRailsEnabled()
        set => this.put_IsPositionXRailsEnabled(value)
    }

    /**
     * Indicates whether panning on the y-axis is railed.
     * 
     * The IsPositionYRailsEnabled property defines the railing configuration for when Y-axis panning gets sent to the corresponding [InteractionTracker](interactiontracker.md). When enabled, if the initial part of the pan is angled within a particular range relative to the Y-axis, the X component of the pan is ignored and considered a perfect vertical pan. This property is often enabled in situations where both an X and Y scrolling experience is enabled, but also requires reliable, perfect vertical panning.
     * @remarks
     * When this property is enabled, the system provides more leniency in what is considered a “perfect” vertical pan. Often times when a finger pans across the screen, it is very difficult for an end user to achieve a perfect pan in the Y-direction. This property helps makes it more possible to have “perfect” vertical panning in scenarios (such as multi-directional scrolling) where both X and Y panning is already enabled.
     * 
     * When enabled, pans within 22.5 degrees of the vertical axis will get recognized as “perfect” vertical pans – in other words, their X components will be ignored. Note that the angle of the pan is determined within the first few millimeters of the interaction and will retain that angle until the finger is lifted. If outside the threshold of 22.5 degrees of the axis, then the X component will then be recognized.
     * 
     * The diagram below shows this in a visual format:
     * 
     * <img src="images/rails.png" alt="Pans within 22.5 degrees of the vertical axis will get recognized as perfect vertical pans – in other words, their X components will be ignored. If outside the threshold of 22.5 degrees of the axis, then the X component will then be recognized." />
     * 
     * > [!NOTE]
     * > When rails are enabled, this has an impact to chaining. The system will only chain up to its nearest acenstor VisualInteractionSource when the pan is within 22.5 degrees of the axis.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.interactions.visualinteractionsource.ispositionyrailsenabled
     * @type {Boolean} 
     */
    IsPositionYRailsEnabled {
        get => this.get_IsPositionYRailsEnabled()
        set => this.put_IsPositionYRailsEnabled(value)
    }

    /**
     * Indicates what input should be redirected to the InteractionTracker.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.interactions.visualinteractionsource.manipulationredirectionmode
     * @type {Integer} 
     */
    ManipulationRedirectionMode {
        get => this.get_ManipulationRedirectionMode()
        set => this.put_ManipulationRedirectionMode(value)
    }

    /**
     * The PositionXChainingMode property defines the chaining behavior for an InteractionSource in the X direction. There are three types of [InteractionChainingMode](interactionchainingmode.md) s: 
     *     **Auto**
     *   , 
     *     **Always**
     *   , 
     *     **Never**
     *   . When chaining in the X direction is enabled, input will flow to the nearest ancestor's [VisualInteractionSource](visualinteractionsource.md) whenever the interaction (such as panning) would otherwise take [InteractionTracker](interactiontracker.md) ’s position past its minimum or maximum X position.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.interactions.visualinteractionsource.positionxchainingmode
     * @type {Integer} 
     */
    PositionXChainingMode {
        get => this.get_PositionXChainingMode()
        set => this.put_PositionXChainingMode(value)
    }

    /**
     * Source mode for the X-axis.
     * 
     * The PositionXSourceMode property defines how interactions are processed for a [VisualInteractionSource](visualinteractionsource.md) on the X-axis. There are 3 types of [InteractionSourceMode](interactionsourcemode.md)s to choose from: Interactions are Disabled, EnabledWithInertia and EnabledWithoutInertia. This property must be enabled to allow the [VisualInteractionSource](visualinteractionsource.md) to send X-axis data to [InteractionTracker](interactiontracker.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.interactions.visualinteractionsource.positionxsourcemode
     * @type {Integer} 
     */
    PositionXSourceMode {
        get => this.get_PositionXSourceMode()
        set => this.put_PositionXSourceMode(value)
    }

    /**
     * The PositionYChainingMode property defines the chaining behavior for an InteractionSource in the Y direction. There are three types of [InteractionChainingMode](interactionchainingmode.md) s: 
     *     **Auto**
     *   , 
     *     **Always**
     *   , 
     *     **Never**
     *   . When chaining in the Y direction is enabled, input will flow to the nearest ancestor’s [VisualInteractionSource](visualinteractionsource.md) whenever the interaction (such as panning) would otherwise take [InteractionTracker](interactiontracker.md) ’s position past its minimum or maximum Y position.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.interactions.visualinteractionsource.positionychainingmode
     * @type {Integer} 
     */
    PositionYChainingMode {
        get => this.get_PositionYChainingMode()
        set => this.put_PositionYChainingMode(value)
    }

    /**
     * Source mode for the Y-axis.
     * 
     * The PositionYSourceMode property defines how interactions are processed for a [VisualInteractionSource](visualinteractionsource.md) on the Y-axis. There are 3 types of [InteractionSourceMode](interactionsourcemode.md)s to choose from: Interactions are Disabled, EnabledWithInertia and EnabledWithoutInertia. This property must be enabled to allow the [VisualInteractionSource](visualinteractionsource.md) to send Y-axis data to [InteractionTracker](interactiontracker.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.interactions.visualinteractionsource.positionysourcemode
     * @type {Integer} 
     */
    PositionYSourceMode {
        get => this.get_PositionYSourceMode()
        set => this.put_PositionYSourceMode(value)
    }

    /**
     * The ScaleChainingMode property defines the chaining behavior for an InteractionSource in the Scale direction. There are three types of [InteractionChainingMode](interactionchainingmode.md) s: Auto, Always, Never. When Scale chaining is enabled, input will flow to the nearest ancestor’s [VisualInteractionSource](visualinteractionsource.md) whenever the interaction (such as panning) would otherwise take [InteractionTracker](interactiontracker.md) ’s position past it’s minimum or maximum Scale position.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.interactions.visualinteractionsource.scalechainingmode
     * @type {Integer} 
     */
    ScaleChainingMode {
        get => this.get_ScaleChainingMode()
        set => this.put_ScaleChainingMode(value)
    }

    /**
     * Defines how interactions are processed for an [VisualInteractionSource](visualinteractionsource.md) on the scale axis. There are 3 types of [InteractionSourceMode](interactionsourcemode.md)s to choose from: Interactions are 
     *     **Disabled**
     *   , 
     *     **EnabledWithInertia**
     *    and 
     *     **EnabledWithoutInertia**
     *   . This property must be enabled to allow the [VisualInteractionSource](visualinteractionsource.md) to send scale data to [InteractionTracker](interactiontracker.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.interactions.visualinteractionsource.scalesourcemode
     * @type {Integer} 
     */
    ScaleSourceMode {
        get => this.get_ScaleSourceMode()
        set => this.put_ScaleSourceMode(value)
    }

    /**
     * The visual that is used for hit-testing and defines the co-ordinate space for gesture recognition.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.interactions.visualinteractionsource.source
     * @type {Visual} 
     */
    Source {
        get => this.get_Source()
    }

    /**
     * The amount of position change to be applied during the upcoming frame. Defaults to 0. Readable only via expression/animation.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.interactions.visualinteractionsource.deltaposition
     * @type {Vector3} 
     */
    DeltaPosition {
        get => this.get_DeltaPosition()
    }

    /**
     * The amount of scale change to be applied during the upcoming frame. Multiplicative. Defaults to 1. Readable only via expression/animation.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.interactions.visualinteractionsource.deltascale
     * @type {Float} 
     */
    DeltaScale {
        get => this.get_DeltaScale()
    }

    /**
     * The total amount of position change since the start of the interaction. Defaults to 0. Readable only via expression/animation.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.interactions.visualinteractionsource.position
     * @type {Vector3} 
     */
    Position {
        get => this.get_Position()
    }

    /**
     * The instantaneous rate of change of position in the interaction, in pixels per second. Defaults to 0. Readble only via expression/animation.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.interactions.visualinteractionsource.positionvelocity
     * @type {Vector3} 
     */
    PositionVelocity {
        get => this.get_PositionVelocity()
    }

    /**
     * The total percentage-difference in scale since the start of the interaction. Multiplicative. Defaults to 1. Readable only via expression/animation.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.interactions.visualinteractionsource.scale
     * @type {Float} 
     */
    Scale {
        get => this.get_Scale()
    }

    /**
     * The instantaneous rate of change of scale in the interaction, in percent per second. Additive. Defaults to 0. Readble only via expression/animation.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.interactions.visualinteractionsource.scalevelocity
     * @type {Float} 
     */
    ScaleVelocity {
        get => this.get_ScaleVelocity()
    }

    /**
     * Gets the configuration for pointer wheel input.
     * @remarks
     * By default, VisualInteractionSource uses the same configuration for all types of input. This property lets you provide a different configuration specifically for pointer wheel input.
     * 
     * For example, you might use touch and touchpad inputs to control panning (X, Y) and zoom, but use pointer wheel input only for zoom. In this case, you can override the configuration of [PositionXSourceMode](visualinteractionsource_positionxsourcemode.md) and [PositionYSourceMode](visualinteractionsource_positionysourcemode.md) to disable them for pointer wheel input only.
     * 
     * ```csharp
     * // Set the defaults for the VisualInteractionSource.
     * interactionSource.PositionXSourceMode = InteractionSourceMode.EnabledWithInertia;
     * interactionSource.PositionYSourceMode = InteractionSourceMode.EnabledWithInertia;
     * interactionSource.ScaleSourceMode = InteractionSourceMode.EnabledWithInertia;
     * 
     * // Modify the pointer wheel configuration to disable X and Y.
     * interactionSource.PointerWheelConfig.PositionXSourceMode =
     *     InteractionSourceRedirectionMode.Disabled;
     * interactionSource.PointerWheelConfig.PositionYSourceMode =
     *     InteractionSourceRedirectionMode.Disabled;
     * ```
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.interactions.visualinteractionsource.pointerwheelconfig
     * @type {InteractionSourceConfiguration} 
     */
    PointerWheelConfig {
        get => this.get_PointerWheelConfig()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsPositionXRailsEnabled() {
        if (!this.HasProp("__IVisualInteractionSource")) {
            if ((queryResult := this.QueryInterface(IVisualInteractionSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVisualInteractionSource := IVisualInteractionSource(outPtr)
        }

        return this.__IVisualInteractionSource.get_IsPositionXRailsEnabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsPositionXRailsEnabled(value) {
        if (!this.HasProp("__IVisualInteractionSource")) {
            if ((queryResult := this.QueryInterface(IVisualInteractionSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVisualInteractionSource := IVisualInteractionSource(outPtr)
        }

        return this.__IVisualInteractionSource.put_IsPositionXRailsEnabled(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsPositionYRailsEnabled() {
        if (!this.HasProp("__IVisualInteractionSource")) {
            if ((queryResult := this.QueryInterface(IVisualInteractionSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVisualInteractionSource := IVisualInteractionSource(outPtr)
        }

        return this.__IVisualInteractionSource.get_IsPositionYRailsEnabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsPositionYRailsEnabled(value) {
        if (!this.HasProp("__IVisualInteractionSource")) {
            if ((queryResult := this.QueryInterface(IVisualInteractionSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVisualInteractionSource := IVisualInteractionSource(outPtr)
        }

        return this.__IVisualInteractionSource.put_IsPositionYRailsEnabled(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ManipulationRedirectionMode() {
        if (!this.HasProp("__IVisualInteractionSource")) {
            if ((queryResult := this.QueryInterface(IVisualInteractionSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVisualInteractionSource := IVisualInteractionSource(outPtr)
        }

        return this.__IVisualInteractionSource.get_ManipulationRedirectionMode()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_ManipulationRedirectionMode(value) {
        if (!this.HasProp("__IVisualInteractionSource")) {
            if ((queryResult := this.QueryInterface(IVisualInteractionSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVisualInteractionSource := IVisualInteractionSource(outPtr)
        }

        return this.__IVisualInteractionSource.put_ManipulationRedirectionMode(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PositionXChainingMode() {
        if (!this.HasProp("__IVisualInteractionSource")) {
            if ((queryResult := this.QueryInterface(IVisualInteractionSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVisualInteractionSource := IVisualInteractionSource(outPtr)
        }

        return this.__IVisualInteractionSource.get_PositionXChainingMode()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_PositionXChainingMode(value) {
        if (!this.HasProp("__IVisualInteractionSource")) {
            if ((queryResult := this.QueryInterface(IVisualInteractionSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVisualInteractionSource := IVisualInteractionSource(outPtr)
        }

        return this.__IVisualInteractionSource.put_PositionXChainingMode(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PositionXSourceMode() {
        if (!this.HasProp("__IVisualInteractionSource")) {
            if ((queryResult := this.QueryInterface(IVisualInteractionSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVisualInteractionSource := IVisualInteractionSource(outPtr)
        }

        return this.__IVisualInteractionSource.get_PositionXSourceMode()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_PositionXSourceMode(value) {
        if (!this.HasProp("__IVisualInteractionSource")) {
            if ((queryResult := this.QueryInterface(IVisualInteractionSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVisualInteractionSource := IVisualInteractionSource(outPtr)
        }

        return this.__IVisualInteractionSource.put_PositionXSourceMode(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PositionYChainingMode() {
        if (!this.HasProp("__IVisualInteractionSource")) {
            if ((queryResult := this.QueryInterface(IVisualInteractionSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVisualInteractionSource := IVisualInteractionSource(outPtr)
        }

        return this.__IVisualInteractionSource.get_PositionYChainingMode()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_PositionYChainingMode(value) {
        if (!this.HasProp("__IVisualInteractionSource")) {
            if ((queryResult := this.QueryInterface(IVisualInteractionSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVisualInteractionSource := IVisualInteractionSource(outPtr)
        }

        return this.__IVisualInteractionSource.put_PositionYChainingMode(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PositionYSourceMode() {
        if (!this.HasProp("__IVisualInteractionSource")) {
            if ((queryResult := this.QueryInterface(IVisualInteractionSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVisualInteractionSource := IVisualInteractionSource(outPtr)
        }

        return this.__IVisualInteractionSource.get_PositionYSourceMode()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_PositionYSourceMode(value) {
        if (!this.HasProp("__IVisualInteractionSource")) {
            if ((queryResult := this.QueryInterface(IVisualInteractionSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVisualInteractionSource := IVisualInteractionSource(outPtr)
        }

        return this.__IVisualInteractionSource.put_PositionYSourceMode(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ScaleChainingMode() {
        if (!this.HasProp("__IVisualInteractionSource")) {
            if ((queryResult := this.QueryInterface(IVisualInteractionSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVisualInteractionSource := IVisualInteractionSource(outPtr)
        }

        return this.__IVisualInteractionSource.get_ScaleChainingMode()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_ScaleChainingMode(value) {
        if (!this.HasProp("__IVisualInteractionSource")) {
            if ((queryResult := this.QueryInterface(IVisualInteractionSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVisualInteractionSource := IVisualInteractionSource(outPtr)
        }

        return this.__IVisualInteractionSource.put_ScaleChainingMode(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ScaleSourceMode() {
        if (!this.HasProp("__IVisualInteractionSource")) {
            if ((queryResult := this.QueryInterface(IVisualInteractionSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVisualInteractionSource := IVisualInteractionSource(outPtr)
        }

        return this.__IVisualInteractionSource.get_ScaleSourceMode()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_ScaleSourceMode(value) {
        if (!this.HasProp("__IVisualInteractionSource")) {
            if ((queryResult := this.QueryInterface(IVisualInteractionSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVisualInteractionSource := IVisualInteractionSource(outPtr)
        }

        return this.__IVisualInteractionSource.put_ScaleSourceMode(value)
    }

    /**
     * 
     * @returns {Visual} 
     */
    get_Source() {
        if (!this.HasProp("__IVisualInteractionSource")) {
            if ((queryResult := this.QueryInterface(IVisualInteractionSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVisualInteractionSource := IVisualInteractionSource(outPtr)
        }

        return this.__IVisualInteractionSource.get_Source()
    }

    /**
     * Indicates that configured manipulations for the given pointer stream should be sent to the [InteractionTracker](interactiontracker.md), not the app's UI thread, starting at the given PointerPoint.
     * 
     * TryRedirectForManipulation enables the [VisualInteractionSource](visualinteractionsource.md) to redirect the Pointer stream to the [InteractionTracker](interactiontracker.md) if the gesture matches the configuration on the [VisualInteractionSource](visualinteractionsource.md). This method should only be called with Pointer input of the DeviceType Touch.
     * @remarks
     * This method enables the app to indicate that the system (Compositor) should take over any configured manipulations for a given [VisualInteractionSource](visualinteractionsource.md). When TryRedirectForManipulation is called, the frame from the passed in PointerPoint is used as the starting point for the [InteractionTracker](interactiontracker.md) ’s input handling. If the user’s gesture is hit-tested to the visual associated with the [VisualInteractionSource](visualinteractionsource.md) (or one of its children), and the user performs a configured gesture, then the system will manipulate. If the input is hit-tested to another visual or the user performs a non-configured gesture then the input will be sent to the CoreWindow and through XAML’s normal input routing.
     * 
     * If the [VisualInteractionSource](visualinteractionsource.md) reroutes the input stream to the [InteractionTracker](interactiontracker.md), the application will receive a PointerCaptureLost on the UIElement, or a PointerRoutedAway on the CoreWindow. These messages indicate that the input has been sent away from the application UI thread. This method will be most commonly called on PointerPressed.
     * 
     * PrecisionTouchpad input does not require this call and will be automatically routed to the [InteractionTracker](interactiontracker.md) for the appropriate gestures if the InputRedirectionMode has been set to include CapableTouchpad input.
     * @param {PointerPoint} pointerPoint_ Indicates that configured manipulations for the given pointer stream should be sent to the [InteractionTracker](interactiontracker.md), not the app's UI thread, starting at the given PointerPoint.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.interactions.visualinteractionsource.tryredirectformanipulation
     */
    TryRedirectForManipulation(pointerPoint_) {
        if (!this.HasProp("__IVisualInteractionSource")) {
            if ((queryResult := this.QueryInterface(IVisualInteractionSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVisualInteractionSource := IVisualInteractionSource(outPtr)
        }

        return this.__IVisualInteractionSource.TryRedirectForManipulation(pointerPoint_)
    }

    /**
     * 
     * @returns {Vector3} 
     */
    get_DeltaPosition() {
        if (!this.HasProp("__IVisualInteractionSource2")) {
            if ((queryResult := this.QueryInterface(IVisualInteractionSource2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVisualInteractionSource2 := IVisualInteractionSource2(outPtr)
        }

        return this.__IVisualInteractionSource2.get_DeltaPosition()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_DeltaScale() {
        if (!this.HasProp("__IVisualInteractionSource2")) {
            if ((queryResult := this.QueryInterface(IVisualInteractionSource2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVisualInteractionSource2 := IVisualInteractionSource2(outPtr)
        }

        return this.__IVisualInteractionSource2.get_DeltaScale()
    }

    /**
     * 
     * @returns {Vector3} 
     */
    get_Position() {
        if (!this.HasProp("__IVisualInteractionSource2")) {
            if ((queryResult := this.QueryInterface(IVisualInteractionSource2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVisualInteractionSource2 := IVisualInteractionSource2(outPtr)
        }

        return this.__IVisualInteractionSource2.get_Position()
    }

    /**
     * 
     * @returns {Vector3} 
     */
    get_PositionVelocity() {
        if (!this.HasProp("__IVisualInteractionSource2")) {
            if ((queryResult := this.QueryInterface(IVisualInteractionSource2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVisualInteractionSource2 := IVisualInteractionSource2(outPtr)
        }

        return this.__IVisualInteractionSource2.get_PositionVelocity()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_Scale() {
        if (!this.HasProp("__IVisualInteractionSource2")) {
            if ((queryResult := this.QueryInterface(IVisualInteractionSource2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVisualInteractionSource2 := IVisualInteractionSource2(outPtr)
        }

        return this.__IVisualInteractionSource2.get_Scale()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_ScaleVelocity() {
        if (!this.HasProp("__IVisualInteractionSource2")) {
            if ((queryResult := this.QueryInterface(IVisualInteractionSource2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVisualInteractionSource2 := IVisualInteractionSource2(outPtr)
        }

        return this.__IVisualInteractionSource2.get_ScaleVelocity()
    }

    /**
     * Takes an ordered list of CompositionConditionalValue. In a frame, the first CompositionConditionalValue to have its “.Condition” evaluate to true replaces the zoom CenterPointX value the VisualInteractionSource provides with its “.Value”. If none evaluate to true, the CenterPointX is not replaced that frame.
     * @param {IIterable<CompositionConditionalValue>} conditionalValues 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.interactions.visualinteractionsource.configurecenterpointxmodifiers
     */
    ConfigureCenterPointXModifiers(conditionalValues) {
        if (!this.HasProp("__IVisualInteractionSource2")) {
            if ((queryResult := this.QueryInterface(IVisualInteractionSource2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVisualInteractionSource2 := IVisualInteractionSource2(outPtr)
        }

        return this.__IVisualInteractionSource2.ConfigureCenterPointXModifiers(conditionalValues)
    }

    /**
     * Takes an ordered list of CompositionConditionalValue. In a frame, the first CompositionConditionalValue to have its “.Condition” evaluate to true replaces the zoom CenterPointY value the VisualInteractionSource provides with its “.Value”. If none evaluate to true, the CenterPointY is not replaced that frame.
     * @param {IIterable<CompositionConditionalValue>} conditionalValues 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.interactions.visualinteractionsource.configurecenterpointymodifiers
     */
    ConfigureCenterPointYModifiers(conditionalValues) {
        if (!this.HasProp("__IVisualInteractionSource2")) {
            if ((queryResult := this.QueryInterface(IVisualInteractionSource2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVisualInteractionSource2 := IVisualInteractionSource2(outPtr)
        }

        return this.__IVisualInteractionSource2.ConfigureCenterPointYModifiers(conditionalValues)
    }

    /**
     * Takes an ordered list of CompositionConditionalValue. In a frame, the first CompositionConditionalValue to have its “.Condition” evaluate to true replaces the DeltaPositionX value the VisualInteractionSource provides with its “.Value”. If none evaluate to true, the DeltaPositionX is not replaced that frame.
     * @param {IIterable<CompositionConditionalValue>} conditionalValues 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.interactions.visualinteractionsource.configuredeltapositionxmodifiers
     */
    ConfigureDeltaPositionXModifiers(conditionalValues) {
        if (!this.HasProp("__IVisualInteractionSource2")) {
            if ((queryResult := this.QueryInterface(IVisualInteractionSource2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVisualInteractionSource2 := IVisualInteractionSource2(outPtr)
        }

        return this.__IVisualInteractionSource2.ConfigureDeltaPositionXModifiers(conditionalValues)
    }

    /**
     * Takes an ordered list of CompositionConditionalValue. In a frame, the first CompositionConditionalValue to have its “.Condition” evaluate to true replaces the DeltaPositionY value the VisualInteractionSource provides with its “.Value”. If none evaluate to true, the DeltaPositionY is not replaced that frame.
     * @param {IIterable<CompositionConditionalValue>} conditionalValues 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.interactions.visualinteractionsource.configuredeltapositionymodifiers
     */
    ConfigureDeltaPositionYModifiers(conditionalValues) {
        if (!this.HasProp("__IVisualInteractionSource2")) {
            if ((queryResult := this.QueryInterface(IVisualInteractionSource2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVisualInteractionSource2 := IVisualInteractionSource2(outPtr)
        }

        return this.__IVisualInteractionSource2.ConfigureDeltaPositionYModifiers(conditionalValues)
    }

    /**
     * Takes an ordered list of CompositionConditionalValue. In a frame, the first CompositionConditionalValue to have its “.Condition” evaluate to true replaces the DeltaScale value the VisualInteractionSource provides with its “.Value”. If none evaluate to true, the DeltaScale is not replaced that frame.
     * @param {IIterable<CompositionConditionalValue>} conditionalValues 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.interactions.visualinteractionsource.configuredeltascalemodifiers
     */
    ConfigureDeltaScaleModifiers(conditionalValues) {
        if (!this.HasProp("__IVisualInteractionSource2")) {
            if ((queryResult := this.QueryInterface(IVisualInteractionSource2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVisualInteractionSource2 := IVisualInteractionSource2(outPtr)
        }

        return this.__IVisualInteractionSource2.ConfigureDeltaScaleModifiers(conditionalValues)
    }

    /**
     * 
     * @returns {InteractionSourceConfiguration} 
     */
    get_PointerWheelConfig() {
        if (!this.HasProp("__IVisualInteractionSource3")) {
            if ((queryResult := this.QueryInterface(IVisualInteractionSource3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVisualInteractionSource3 := IVisualInteractionSource3(outPtr)
        }

        return this.__IVisualInteractionSource3.get_PointerWheelConfig()
    }

;@endregion Instance Methods
}
