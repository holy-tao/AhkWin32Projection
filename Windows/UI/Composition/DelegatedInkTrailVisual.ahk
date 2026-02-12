#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\Visual.ahk
#Include .\IDelegatedInkTrailVisual.ahk
#Include .\IDelegatedInkTrailVisualStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a "wet" ink stroke rendered by the system while the application processes the "dry" ink rendering pass.
 * @remarks
 * Enables a more responsive inking experience by reducing latency when rendering "wet" ink to "dry".
 * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.delegatedinktrailvisual
 * @namespace Windows.UI.Composition
 * @version WindowsRuntime 1.4
 */
class DelegatedInkTrailVisual extends Visual {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IDelegatedInkTrailVisual

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IDelegatedInkTrailVisual.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates the [DelegatedInkTrailVisual](delegatedinktrailvisual.md) for rendering "wet" ink to the [visual layer](/windows/uwp/composition/visual-layer).
     * @param {Compositor} compositor_ A factory that creates a variety of types in the Windows.UI.Composition namespace, including visuals, the effects system, and the animation system.
     * @returns {DelegatedInkTrailVisual} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.delegatedinktrailvisual.create
     */
    static Create(compositor_) {
        if (!DelegatedInkTrailVisual.HasProp("__IDelegatedInkTrailVisualStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Composition.DelegatedInkTrailVisual")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDelegatedInkTrailVisualStatics.IID)
            DelegatedInkTrailVisual.__IDelegatedInkTrailVisualStatics := IDelegatedInkTrailVisualStatics(factoryPtr)
        }

        return DelegatedInkTrailVisual.__IDelegatedInkTrailVisualStatics.Create(compositor_)
    }

    /**
     * Creates the [DelegatedInkTrailVisual](delegatedinktrailvisual.md) for rendering "wet" ink to a swap chain.
     * @param {Compositor} compositor_ A factory that creates a variety of types in the Windows.UI.Composition namespace, including visuals, the effects system, and the animation system.
     * @param {ICompositionSurface} swapChain The hosting surface for the "wet" ink object.
     * @returns {DelegatedInkTrailVisual} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.delegatedinktrailvisual.createforswapchain
     */
    static CreateForSwapChain(compositor_, swapChain) {
        if (!DelegatedInkTrailVisual.HasProp("__IDelegatedInkTrailVisualStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Composition.DelegatedInkTrailVisual")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDelegatedInkTrailVisualStatics.IID)
            DelegatedInkTrailVisual.__IDelegatedInkTrailVisualStatics := IDelegatedInkTrailVisualStatics(factoryPtr)
        }

        return DelegatedInkTrailVisual.__IDelegatedInkTrailVisualStatics.CreateForSwapChain(compositor_, swapChain)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Adds the specified "wet" ink points to the [DelegatedInkTrailVisual](delegatedinktrailvisual.md).
     * @param {Integer} inkPoints_length 
     * @param {Pointer<InkTrailPoint>} inkPoints The "wet" ink points.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.delegatedinktrailvisual.addtrailpoints
     */
    AddTrailPoints(inkPoints_length, inkPoints) {
        if (!this.HasProp("__IDelegatedInkTrailVisual")) {
            if ((queryResult := this.QueryInterface(IDelegatedInkTrailVisual.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDelegatedInkTrailVisual := IDelegatedInkTrailVisual(outPtr)
        }

        return this.__IDelegatedInkTrailVisual.AddTrailPoints(inkPoints_length, inkPoints)
    }

    /**
     * Adds both actual and predicted "wet" ink points to the [DelegatedInkTrailVisual](delegatedinktrailvisual.md).
     * @remarks
     * Predicted points act like actual points and are appended to the end of the ink trail after any actual points.
     * 
     * Subsequent calls to AddTrailPoints (or AddTrailPointsWithPrediction) will remove all predicted points before adding new points.
     * 
     * The predicted points are provided by the app to reduce ink latency. They are overwritten by the actual positions when received by the app and added to the [DelegatedInkTrailVisual](delegatedinktrailvisual.md).
     * @param {Integer} inkPoints_length 
     * @param {Pointer<InkTrailPoint>} inkPoints The actual "wet" ink points.
     * @param {Integer} predictedInkPoints_length 
     * @param {Pointer<InkTrailPoint>} predictedInkPoints The predicted "wet" ink points.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.delegatedinktrailvisual.addtrailpointswithprediction
     */
    AddTrailPointsWithPrediction(inkPoints_length, inkPoints, predictedInkPoints_length, predictedInkPoints) {
        if (!this.HasProp("__IDelegatedInkTrailVisual")) {
            if ((queryResult := this.QueryInterface(IDelegatedInkTrailVisual.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDelegatedInkTrailVisual := IDelegatedInkTrailVisual(outPtr)
        }

        return this.__IDelegatedInkTrailVisual.AddTrailPointsWithPrediction(inkPoints_length, inkPoints, predictedInkPoints_length, predictedInkPoints)
    }

    /**
     * Removes the [InkTrailPoints](inktrailpoint.md) as the app sends its rendered ink to the system.
     * @remarks
     * The app can still receive new input points on its input thread while the "dry" ink is being rendered. These points are immediately sent to [AddTrailPoints(Windows.UI.Composition.InkTrailPoint[])](/uwp/api/windows.ui.composition.delegatedinktrailvisual.addtrailpoints) for rendering the "wet" ink stroke.
     * @param {Integer} generationId The ID assigned by [AddTrailPoints(Windows.UI.Composition.InkTrailPoint[])](/uwp/api/windows.ui.composition.delegatedinktrailvisual.addtrailpoints) or [AddTrailPointsWithPrediction(Windows.UI.Composition.InkTrailPoint[],Windows.UI.Composition.InkTrailPoint[])](/uwp/api/windows.ui.composition.delegatedinktrailvisual.addtrailpointswithprediction).
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.delegatedinktrailvisual.removetrailpoints
     */
    RemoveTrailPoints(generationId) {
        if (!this.HasProp("__IDelegatedInkTrailVisual")) {
            if ((queryResult := this.QueryInterface(IDelegatedInkTrailVisual.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDelegatedInkTrailVisual := IDelegatedInkTrailVisual(outPtr)
        }

        return this.__IDelegatedInkTrailVisual.RemoveTrailPoints(generationId)
    }

    /**
     * Specifies that a new "wet" ink stroke should be started and [AddTrailPoints(Windows.UI.Composition.InkTrailPoint[])](/uwp/api/windows.ui.composition.delegatedinktrailvisual.addtrailpointswithprediction) should be called.
     * @remarks
     * After a trail has been started and trail points added, calling StartNewTrail again will reset the state of the ink trail. All existing points are removed, and any subsequent points will be rendered using the new color.
     * @param {Color} color_ The color of the ink stroke.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.delegatedinktrailvisual.startnewtrail
     */
    StartNewTrail(color_) {
        if (!this.HasProp("__IDelegatedInkTrailVisual")) {
            if ((queryResult := this.QueryInterface(IDelegatedInkTrailVisual.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDelegatedInkTrailVisual := IDelegatedInkTrailVisual(outPtr)
        }

        return this.__IDelegatedInkTrailVisual.StartNewTrail(color_)
    }

;@endregion Instance Methods
}
