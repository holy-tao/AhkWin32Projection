#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISpatialInteractionManager.ahk
#Include .\ISpatialInteractionManagerStatics.ahk
#Include .\ISpatialInteractionManagerStatics2.ahk
#Include ..\..\..\Foundation\TypedEventHandler.ahk
#Include .\SpatialInteractionManager.ahk
#Include .\SpatialInteractionSourceEventArgs.ahk
#Include .\SpatialInteractionDetectedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\..\WinRTEventHandler.ahk

/**
 * Provides access to user input from hands, motion controllers, and system voice commands.
 * @remarks
 * Spatial gestures are a key form of input for HoloLens. By routing the interactions from the SpatialInteractionManager to a hologram's [SpatialGestureRecognizer](spatialgesturerecognizer.md), apps can detect [Tap](spatialgesturesettings.md), [Hold](spatialgesturesettings.md), [Manipulation](spatialgesturesettings.md), and [Navigation](spatialgesturesettings.md) events uniformly across hand, speech and controller interactions.
 * 
 * > [!NOTE]
 * > Spatial interactions are not detected from gamepad, keyboard, or mouse input devices.
 * 
 * Interactions are mostly opaque, with an event triggering only at the beginning, so the gesture recognizer you route it to can capture the interaction in its entirety. Apps can instead choose to use the low-level Source events or poll using [GetDetectedSourcesAtTimestamp](spatialinteractionmanager_getdetectedsourcesattimestamp_338728324.md) to manually process the Presses, Updates, and Releases surfaced by a given hand or controller.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.input.spatial.spatialinteractionmanager
 * @namespace Windows.UI.Input.Spatial
 * @version WindowsRuntime 1.4
 */
class SpatialInteractionManager extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISpatialInteractionManager

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISpatialInteractionManager.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Get the [SpatialInteractionManager](spatialinteractionmanager.md) associated with the current [CoreWindow](../windows.ui.core/corewindow.md).
     * @returns {SpatialInteractionManager} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.spatial.spatialinteractionmanager.getforcurrentview
     */
    static GetForCurrentView() {
        if (!SpatialInteractionManager.HasProp("__ISpatialInteractionManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Input.Spatial.SpatialInteractionManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISpatialInteractionManagerStatics.IID)
            SpatialInteractionManager.__ISpatialInteractionManagerStatics := ISpatialInteractionManagerStatics(factoryPtr)
        }

        return SpatialInteractionManager.__ISpatialInteractionManagerStatics.GetForCurrentView()
    }

    /**
     * Gets whether the specified interaction source is supported on this device.
     * @param {Integer} kind The interaction source.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.spatial.spatialinteractionmanager.issourcekindsupported
     */
    static IsSourceKindSupported(kind) {
        if (!SpatialInteractionManager.HasProp("__ISpatialInteractionManagerStatics2")) {
            activatableClassId := HSTRING.Create("Windows.UI.Input.Spatial.SpatialInteractionManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISpatialInteractionManagerStatics2.IID)
            SpatialInteractionManager.__ISpatialInteractionManagerStatics2 := ISpatialInteractionManagerStatics2(factoryPtr)
        }

        return SpatialInteractionManager.__ISpatialInteractionManagerStatics2.IsSourceKindSupported(kind)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnSourceDetectedToken")) {
            this.remove_SourceDetected(this.__OnSourceDetectedToken)
            this.__OnSourceDetected.iface.Dispose()
        }

        if(this.HasProp("__OnSourceLostToken")) {
            this.remove_SourceLost(this.__OnSourceLostToken)
            this.__OnSourceLost.iface.Dispose()
        }

        if(this.HasProp("__OnSourceUpdatedToken")) {
            this.remove_SourceUpdated(this.__OnSourceUpdatedToken)
            this.__OnSourceUpdated.iface.Dispose()
        }

        if(this.HasProp("__OnSourcePressedToken")) {
            this.remove_SourcePressed(this.__OnSourcePressedToken)
            this.__OnSourcePressed.iface.Dispose()
        }

        if(this.HasProp("__OnSourceReleasedToken")) {
            this.remove_SourceReleased(this.__OnSourceReleasedToken)
            this.__OnSourceReleased.iface.Dispose()
        }

        if(this.HasProp("__OnInteractionDetectedToken")) {
            this.remove_InteractionDetected(this.__OnInteractionDetectedToken)
            this.__OnInteractionDetected.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @param {TypedEventHandler<SpatialInteractionManager, SpatialInteractionSourceEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_SourceDetected(handler) {
        if (!this.HasProp("__ISpatialInteractionManager")) {
            if ((queryResult := this.QueryInterface(ISpatialInteractionManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialInteractionManager := ISpatialInteractionManager(outPtr)
        }

        return this.__ISpatialInteractionManager.add_SourceDetected(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_SourceDetected(token) {
        if (!this.HasProp("__ISpatialInteractionManager")) {
            if ((queryResult := this.QueryInterface(ISpatialInteractionManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialInteractionManager := ISpatialInteractionManager(outPtr)
        }

        return this.__ISpatialInteractionManager.remove_SourceDetected(token)
    }

    /**
     * 
     * @param {TypedEventHandler<SpatialInteractionManager, SpatialInteractionSourceEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_SourceLost(handler) {
        if (!this.HasProp("__ISpatialInteractionManager")) {
            if ((queryResult := this.QueryInterface(ISpatialInteractionManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialInteractionManager := ISpatialInteractionManager(outPtr)
        }

        return this.__ISpatialInteractionManager.add_SourceLost(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_SourceLost(token) {
        if (!this.HasProp("__ISpatialInteractionManager")) {
            if ((queryResult := this.QueryInterface(ISpatialInteractionManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialInteractionManager := ISpatialInteractionManager(outPtr)
        }

        return this.__ISpatialInteractionManager.remove_SourceLost(token)
    }

    /**
     * 
     * @param {TypedEventHandler<SpatialInteractionManager, SpatialInteractionSourceEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_SourceUpdated(handler) {
        if (!this.HasProp("__ISpatialInteractionManager")) {
            if ((queryResult := this.QueryInterface(ISpatialInteractionManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialInteractionManager := ISpatialInteractionManager(outPtr)
        }

        return this.__ISpatialInteractionManager.add_SourceUpdated(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_SourceUpdated(token) {
        if (!this.HasProp("__ISpatialInteractionManager")) {
            if ((queryResult := this.QueryInterface(ISpatialInteractionManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialInteractionManager := ISpatialInteractionManager(outPtr)
        }

        return this.__ISpatialInteractionManager.remove_SourceUpdated(token)
    }

    /**
     * 
     * @param {TypedEventHandler<SpatialInteractionManager, SpatialInteractionSourceEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_SourcePressed(handler) {
        if (!this.HasProp("__ISpatialInteractionManager")) {
            if ((queryResult := this.QueryInterface(ISpatialInteractionManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialInteractionManager := ISpatialInteractionManager(outPtr)
        }

        return this.__ISpatialInteractionManager.add_SourcePressed(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_SourcePressed(token) {
        if (!this.HasProp("__ISpatialInteractionManager")) {
            if ((queryResult := this.QueryInterface(ISpatialInteractionManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialInteractionManager := ISpatialInteractionManager(outPtr)
        }

        return this.__ISpatialInteractionManager.remove_SourcePressed(token)
    }

    /**
     * 
     * @param {TypedEventHandler<SpatialInteractionManager, SpatialInteractionSourceEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_SourceReleased(handler) {
        if (!this.HasProp("__ISpatialInteractionManager")) {
            if ((queryResult := this.QueryInterface(ISpatialInteractionManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialInteractionManager := ISpatialInteractionManager(outPtr)
        }

        return this.__ISpatialInteractionManager.add_SourceReleased(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_SourceReleased(token) {
        if (!this.HasProp("__ISpatialInteractionManager")) {
            if ((queryResult := this.QueryInterface(ISpatialInteractionManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialInteractionManager := ISpatialInteractionManager(outPtr)
        }

        return this.__ISpatialInteractionManager.remove_SourceReleased(token)
    }

    /**
     * 
     * @param {TypedEventHandler<SpatialInteractionManager, SpatialInteractionDetectedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_InteractionDetected(handler) {
        if (!this.HasProp("__ISpatialInteractionManager")) {
            if ((queryResult := this.QueryInterface(ISpatialInteractionManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialInteractionManager := ISpatialInteractionManager(outPtr)
        }

        return this.__ISpatialInteractionManager.add_InteractionDetected(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_InteractionDetected(token) {
        if (!this.HasProp("__ISpatialInteractionManager")) {
            if ((queryResult := this.QueryInterface(ISpatialInteractionManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialInteractionManager := ISpatialInteractionManager(outPtr)
        }

        return this.__ISpatialInteractionManager.remove_InteractionDetected(token)
    }

    /**
     * Get the state of all interaction sources detected for the specified timestamp.
     * @param {PerceptionTimestamp} timeStamp_ The time to query the state of interaction sources.
     * @returns {IVectorView<SpatialInteractionSourceState>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.spatial.spatialinteractionmanager.getdetectedsourcesattimestamp
     */
    GetDetectedSourcesAtTimestamp(timeStamp_) {
        if (!this.HasProp("__ISpatialInteractionManager")) {
            if ((queryResult := this.QueryInterface(ISpatialInteractionManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialInteractionManager := ISpatialInteractionManager(outPtr)
        }

        return this.__ISpatialInteractionManager.GetDetectedSourcesAtTimestamp(timeStamp_)
    }

;@endregion Instance Methods
}
