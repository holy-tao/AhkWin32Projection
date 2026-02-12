#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISpatialInteractionSource.ahk
#Include .\ISpatialInteractionSource2.ahk
#Include .\ISpatialInteractionSource3.ahk
#Include .\ISpatialInteractionSource4.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents one detected instance of a hand, motion controller, or speech source that can cause interactions and gestures.
 * @remarks
 * For hands and controllers, each detected hand or motion controller will get its own ID. For as long as the system can track that a hand is the same hand that was previously detected, it will share an ID.
 * 
 * For speech, a single ID will be used for all speech input.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.input.spatial.spatialinteractionsource
 * @namespace Windows.UI.Input.Spatial
 * @version WindowsRuntime 1.4
 */
class SpatialInteractionSource extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISpatialInteractionSource

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISpatialInteractionSource.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the identifier for the hand, motion controller, or speech source.
     * @remarks
     * For hands and motion controllers, each detected hand or controller gets a unique ID. For as long as the system can track that a hand is the same hand that was previously detected, it will share an ID.
     * 
     * For speech, a single ID will be used for all speech input.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.spatial.spatialinteractionsource.id
     * @type {Integer} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * Gets the interaction source type.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.spatial.spatialinteractionsource.kind
     * @type {Integer} 
     */
    Kind {
        get => this.get_Kind()
    }

    /**
     * Gets whether the source can provide pointer poses.
     * @remarks
     * To get the source pointer pose, pass the source to [SpatialPointingPose.TryGetInteractionSourcePose](spatialpointerpose_trygetinteractionsourcepose_1162732260.md).  Note that a pointing-capable motion controller can still return a null pointer pose if the controller has lost positional tracking.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.spatial.spatialinteractionsource.ispointingsupported
     * @type {Boolean} 
     */
    IsPointingSupported {
        get => this.get_IsPointingSupported()
    }

    /**
     * Gets whether the source supports Menu presses.
     * @remarks
     * This will be true for most motion controllers and false for other interaction sources.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.spatial.spatialinteractionsource.ismenusupported
     * @type {Boolean} 
     */
    IsMenuSupported {
        get => this.get_IsMenuSupported()
    }

    /**
     * Gets whether the source supports grasps.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.spatial.spatialinteractionsource.isgraspsupported
     * @type {Boolean} 
     */
    IsGraspSupported {
        get => this.get_IsGraspSupported()
    }

    /**
     * Represents the specifics of a detected motion controller.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.spatial.spatialinteractionsource.controller
     * @type {SpatialInteractionController} 
     */
    Controller {
        get => this.get_Controller()
    }

    /**
     * Gets whether the interaction source represents the user's left hand or right hand.
     * @remarks
     * For controllers that have an inherent handedness, this will always return that handedness, regardless of which hand the controller is physically held in.
     * 
     * For controllers that do not support positional tracking and do not have an inherent handedness, such as the HoloLens clicker, this will always return Unspecified.
     * 
     * For controllers that can be held in either hand, the system might use a heuristic to determine the handedness, returning Unspecified until determined.  If such a controller changes handedness, the source is lost and  re-detected with the current handedness.
     * 
     * For hand and speech sources on HoloLens, this property always returns Unspecified.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.spatial.spatialinteractionsource.handedness
     * @type {Integer} 
     */
    Handedness {
        get => this.get_Handedness()
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
    get_Id() {
        if (!this.HasProp("__ISpatialInteractionSource")) {
            if ((queryResult := this.QueryInterface(ISpatialInteractionSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialInteractionSource := ISpatialInteractionSource(outPtr)
        }

        return this.__ISpatialInteractionSource.get_Id()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Kind() {
        if (!this.HasProp("__ISpatialInteractionSource")) {
            if ((queryResult := this.QueryInterface(ISpatialInteractionSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialInteractionSource := ISpatialInteractionSource(outPtr)
        }

        return this.__ISpatialInteractionSource.get_Kind()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsPointingSupported() {
        if (!this.HasProp("__ISpatialInteractionSource2")) {
            if ((queryResult := this.QueryInterface(ISpatialInteractionSource2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialInteractionSource2 := ISpatialInteractionSource2(outPtr)
        }

        return this.__ISpatialInteractionSource2.get_IsPointingSupported()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsMenuSupported() {
        if (!this.HasProp("__ISpatialInteractionSource2")) {
            if ((queryResult := this.QueryInterface(ISpatialInteractionSource2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialInteractionSource2 := ISpatialInteractionSource2(outPtr)
        }

        return this.__ISpatialInteractionSource2.get_IsMenuSupported()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsGraspSupported() {
        if (!this.HasProp("__ISpatialInteractionSource2")) {
            if ((queryResult := this.QueryInterface(ISpatialInteractionSource2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialInteractionSource2 := ISpatialInteractionSource2(outPtr)
        }

        return this.__ISpatialInteractionSource2.get_IsGraspSupported()
    }

    /**
     * 
     * @returns {SpatialInteractionController} 
     */
    get_Controller() {
        if (!this.HasProp("__ISpatialInteractionSource2")) {
            if ((queryResult := this.QueryInterface(ISpatialInteractionSource2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialInteractionSource2 := ISpatialInteractionSource2(outPtr)
        }

        return this.__ISpatialInteractionSource2.get_Controller()
    }

    /**
     * Get the state of this source as of the specified timestamp.
     * @param {PerceptionTimestamp} timestamp_ The time to query for the state of this interaction source.
     * @returns {SpatialInteractionSourceState} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.spatial.spatialinteractionsource.trygetstateattimestamp
     */
    TryGetStateAtTimestamp(timestamp_) {
        if (!this.HasProp("__ISpatialInteractionSource2")) {
            if ((queryResult := this.QueryInterface(ISpatialInteractionSource2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialInteractionSource2 := ISpatialInteractionSource2(outPtr)
        }

        return this.__ISpatialInteractionSource2.TryGetStateAtTimestamp(timestamp_)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Handedness() {
        if (!this.HasProp("__ISpatialInteractionSource3")) {
            if ((queryResult := this.QueryInterface(ISpatialInteractionSource3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialInteractionSource3 := ISpatialInteractionSource3(outPtr)
        }

        return this.__ISpatialInteractionSource3.get_Handedness()
    }

    /**
     * Synchronously requests a [HandMeshObserver](../windows.perception.people/handmeshobserver.md) to provide mesh updates for each frame that tracks the detected shape of a hand.
     * @remarks
     * It can take more than a frame to initialize the app's subscription to hand mesh updates.  
     * 
     * You should call this synchronous method only from a background thread. If you are calling from a UI thread, render thread or update thread, you should call the asynchronous [TryCreateHandMeshObserverAsync](spatialinteractionsource_trycreatehandmeshobserverasync_89275821.md) method instead.
     * @returns {HandMeshObserver} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.spatial.spatialinteractionsource.trycreatehandmeshobserver
     */
    TryCreateHandMeshObserver() {
        if (!this.HasProp("__ISpatialInteractionSource4")) {
            if ((queryResult := this.QueryInterface(ISpatialInteractionSource4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialInteractionSource4 := ISpatialInteractionSource4(outPtr)
        }

        return this.__ISpatialInteractionSource4.TryCreateHandMeshObserver()
    }

    /**
     * Requests a [HandMeshObserver](../windows.perception.people/handmeshobserver.md) to provide mesh updates for each frame that tracks the detected shape of a hand.
     * @remarks
     * It can take more than a frame to initialize the app's subscription to hand mesh updates.
     * @returns {IAsyncOperation<HandMeshObserver>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.spatial.spatialinteractionsource.trycreatehandmeshobserverasync
     */
    TryCreateHandMeshObserverAsync() {
        if (!this.HasProp("__ISpatialInteractionSource4")) {
            if ((queryResult := this.QueryInterface(ISpatialInteractionSource4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialInteractionSource4 := ISpatialInteractionSource4(outPtr)
        }

        return this.__ISpatialInteractionSource4.TryCreateHandMeshObserverAsync()
    }

;@endregion Instance Methods
}
