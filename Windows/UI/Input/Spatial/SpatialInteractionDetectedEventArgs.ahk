#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISpatialInteractionDetectedEventArgs.ahk
#Include .\ISpatialInteractionDetectedEventArgs2.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides data for the SpatialInteractionManager.InteractionDetected event.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.input.spatial.spatialinteractiondetectedeventargs
 * @namespace Windows.UI.Input.Spatial
 * @version WindowsRuntime 1.4
 */
class SpatialInteractionDetectedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISpatialInteractionDetectedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISpatialInteractionDetectedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the kind of source associated with the detected interaction.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.spatial.spatialinteractiondetectedeventargs.interactionsourcekind
     * @type {Integer} 
     */
    InteractionSourceKind {
        get => this.get_InteractionSourceKind()
    }

    /**
     * Gets the detected interaction, for routing to a [SpatialGestureRecognizer](spatialgesturerecognizer.md).
     * @remarks
     * Pass this SpatialInteraction object to the SpatialGestureRecognizer.CaptureInteraction method to route this interaction to that gesture recognizer.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.spatial.spatialinteractiondetectedeventargs.interaction
     * @type {SpatialInteraction} 
     */
    Interaction {
        get => this.get_Interaction()
    }

    /**
     * Gets the specific source associated with the detected interaction.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.spatial.spatialinteractiondetectedeventargs.interactionsource
     * @type {SpatialInteractionSource} 
     */
    InteractionSource {
        get => this.get_InteractionSource()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_InteractionSourceKind() {
        if (!this.HasProp("__ISpatialInteractionDetectedEventArgs")) {
            if ((queryResult := this.QueryInterface(ISpatialInteractionDetectedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialInteractionDetectedEventArgs := ISpatialInteractionDetectedEventArgs(outPtr)
        }

        return this.__ISpatialInteractionDetectedEventArgs.get_InteractionSourceKind()
    }

    /**
     * Gets the available pointer poses, such as the user's head gaze and each motion controller's pointer pose, for use in routing this interaction to a SpatialGestureRecognizer.
     * @remarks
     * When targeting a spatial interaction, such as a hand gesture, motion controller press or voice interaction, apps should choose a pointing ray available from the interaction's SpatialPointerPose, based on the nature of the interaction's [SpatialInteractionSource](spatialinteractionsource.md):
     * * If the interaction source does not support pointing ([IsPointingSupported](spatialinteractionsource_ispointingsupported.md) is false), the app should target based on the user's gaze, available through the [Head](spatialpointerpose_head.md) property.
     * * If the interaction source does support pointing ([IsPointingSupported](spatialinteractionsource_ispointingsupported.md) is true), the app may instead target based on the source's pointer pose, available through the [TryGetInteractionSourcePose](spatialpointerpose_trygetinteractionsourcepose_1162732260.md) method.
     * 
     * The app should then intersect the chosen pointing ray with its own holograms or with the spatial mapping mesh to render cursors and determine what the user is intending to interact with.
     * 
     * Once an interaction has started, relative motions of the hand or controller may be used to control the gesture, as with the [Manipulation](spatialgesturerecognizer_gesturesettings.md) or [Navigation](spatialgesturerecognizer_gesturesettings.md) gesture.
     * 
     * This method will return null if the specified coordinate system cannot be located at the moment.
     * @param {SpatialCoordinateSystem} coordinateSystem The coordinate system in which to express the pointer poses.
     * @returns {SpatialPointerPose} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.spatial.spatialinteractiondetectedeventargs.trygetpointerpose
     */
    TryGetPointerPose(coordinateSystem) {
        if (!this.HasProp("__ISpatialInteractionDetectedEventArgs")) {
            if ((queryResult := this.QueryInterface(ISpatialInteractionDetectedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialInteractionDetectedEventArgs := ISpatialInteractionDetectedEventArgs(outPtr)
        }

        return this.__ISpatialInteractionDetectedEventArgs.TryGetPointerPose(coordinateSystem)
    }

    /**
     * 
     * @returns {SpatialInteraction} 
     */
    get_Interaction() {
        if (!this.HasProp("__ISpatialInteractionDetectedEventArgs")) {
            if ((queryResult := this.QueryInterface(ISpatialInteractionDetectedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialInteractionDetectedEventArgs := ISpatialInteractionDetectedEventArgs(outPtr)
        }

        return this.__ISpatialInteractionDetectedEventArgs.get_Interaction()
    }

    /**
     * 
     * @returns {SpatialInteractionSource} 
     */
    get_InteractionSource() {
        if (!this.HasProp("__ISpatialInteractionDetectedEventArgs2")) {
            if ((queryResult := this.QueryInterface(ISpatialInteractionDetectedEventArgs2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialInteractionDetectedEventArgs2 := ISpatialInteractionDetectedEventArgs2(outPtr)
        }

        return this.__ISpatialInteractionDetectedEventArgs2.get_InteractionSource()
    }

;@endregion Instance Methods
}
