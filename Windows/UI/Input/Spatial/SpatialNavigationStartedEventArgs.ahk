#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISpatialNavigationStartedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides data for the SpatialGestureRecognizer.NavigationStarted event.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.input.spatial.spatialnavigationstartedeventargs
 * @namespace Windows.UI.Input.Spatial
 * @version WindowsRuntime 1.4
 */
class SpatialNavigationStartedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISpatialNavigationStartedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISpatialNavigationStartedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the kind of interaction source associated with this gesture.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.spatial.spatialnavigationstartedeventargs.interactionsourcekind
     * @type {Integer} 
     */
    InteractionSourceKind {
        get => this.get_InteractionSourceKind()
    }

    /**
     * Gets whether the navigation gesture the user is performing involves motion on the horizontal axis.
     * @remarks
     * If the user has moved their hand or motion controller so as to snap to vertical rails, for example, this will return false.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.spatial.spatialnavigationstartedeventargs.isnavigatingx
     * @type {Boolean} 
     */
    IsNavigatingX {
        get => this.get_IsNavigatingX()
    }

    /**
     * Gets whether the navigation gesture the user is performing involves motion on the vertical axis.
     * @remarks
     * If the user has moved their hand or motion controller so as to snap to horizontal rails, for example, this will return false.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.spatial.spatialnavigationstartedeventargs.isnavigatingy
     * @type {Boolean} 
     */
    IsNavigatingY {
        get => this.get_IsNavigatingY()
    }

    /**
     * Gets whether the navigation gesture the user is performing involves motion on the depth axis.
     * @remarks
     * If the user has moved their hand or motion controller so as to snap to vertical rails, for example, this will return false.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.spatial.spatialnavigationstartedeventargs.isnavigatingz
     * @type {Boolean} 
     */
    IsNavigatingZ {
        get => this.get_IsNavigatingZ()
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
        if (!this.HasProp("__ISpatialNavigationStartedEventArgs")) {
            if ((queryResult := this.QueryInterface(ISpatialNavigationStartedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialNavigationStartedEventArgs := ISpatialNavigationStartedEventArgs(outPtr)
        }

        return this.__ISpatialNavigationStartedEventArgs.get_InteractionSourceKind()
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
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.spatial.spatialnavigationstartedeventargs.trygetpointerpose
     */
    TryGetPointerPose(coordinateSystem) {
        if (!this.HasProp("__ISpatialNavigationStartedEventArgs")) {
            if ((queryResult := this.QueryInterface(ISpatialNavigationStartedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialNavigationStartedEventArgs := ISpatialNavigationStartedEventArgs(outPtr)
        }

        return this.__ISpatialNavigationStartedEventArgs.TryGetPointerPose(coordinateSystem)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsNavigatingX() {
        if (!this.HasProp("__ISpatialNavigationStartedEventArgs")) {
            if ((queryResult := this.QueryInterface(ISpatialNavigationStartedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialNavigationStartedEventArgs := ISpatialNavigationStartedEventArgs(outPtr)
        }

        return this.__ISpatialNavigationStartedEventArgs.get_IsNavigatingX()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsNavigatingY() {
        if (!this.HasProp("__ISpatialNavigationStartedEventArgs")) {
            if ((queryResult := this.QueryInterface(ISpatialNavigationStartedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialNavigationStartedEventArgs := ISpatialNavigationStartedEventArgs(outPtr)
        }

        return this.__ISpatialNavigationStartedEventArgs.get_IsNavigatingY()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsNavigatingZ() {
        if (!this.HasProp("__ISpatialNavigationStartedEventArgs")) {
            if ((queryResult := this.QueryInterface(ISpatialNavigationStartedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialNavigationStartedEventArgs := ISpatialNavigationStartedEventArgs(outPtr)
        }

        return this.__ISpatialNavigationStartedEventArgs.get_IsNavigatingZ()
    }

;@endregion Instance Methods
}
