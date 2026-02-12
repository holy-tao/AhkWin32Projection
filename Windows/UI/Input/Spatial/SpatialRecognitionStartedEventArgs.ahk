#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISpatialRecognitionStartedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides data for the SpatialGestureRecognizer.RecognitionStarted event.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.input.spatial.spatialrecognitionstartedeventargs
 * @namespace Windows.UI.Input.Spatial
 * @version WindowsRuntime 1.4
 */
class SpatialRecognitionStartedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISpatialRecognitionStartedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISpatialRecognitionStartedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the kind of interaction source associated with this gesture.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.spatial.spatialrecognitionstartedeventargs.interactionsourcekind
     * @type {Integer} 
     */
    InteractionSourceKind {
        get => this.get_InteractionSourceKind()
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
        if (!this.HasProp("__ISpatialRecognitionStartedEventArgs")) {
            if ((queryResult := this.QueryInterface(ISpatialRecognitionStartedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialRecognitionStartedEventArgs := ISpatialRecognitionStartedEventArgs(outPtr)
        }

        return this.__ISpatialRecognitionStartedEventArgs.get_InteractionSourceKind()
    }

    /**
     * Gets the available pointer poses, such as the user's head gaze and each motion controller's pointer pose, for use in targeting this gesture.
     * @remarks
     * This pose is from the timestamp of the initial SpatialInteraction routed to this recognizer to begin the active gesture.
     * 
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
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.spatial.spatialrecognitionstartedeventargs.trygetpointerpose
     */
    TryGetPointerPose(coordinateSystem) {
        if (!this.HasProp("__ISpatialRecognitionStartedEventArgs")) {
            if ((queryResult := this.QueryInterface(ISpatialRecognitionStartedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialRecognitionStartedEventArgs := ISpatialRecognitionStartedEventArgs(outPtr)
        }

        return this.__ISpatialRecognitionStartedEventArgs.TryGetPointerPose(coordinateSystem)
    }

    /**
     * Returns whether the specified gesture is possible, given the capabilities of the relevant interaction source. For example, Voice cannot be used for Manipulation gestures.
     * @param {Integer} gesture The specific single gesture to test for.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.spatial.spatialrecognitionstartedeventargs.isgesturepossible
     */
    IsGesturePossible(gesture) {
        if (!this.HasProp("__ISpatialRecognitionStartedEventArgs")) {
            if ((queryResult := this.QueryInterface(ISpatialRecognitionStartedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialRecognitionStartedEventArgs := ISpatialRecognitionStartedEventArgs(outPtr)
        }

        return this.__ISpatialRecognitionStartedEventArgs.IsGesturePossible(gesture)
    }

;@endregion Instance Methods
}
