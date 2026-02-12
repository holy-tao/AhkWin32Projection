#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IHolographicSpace.ahk
#Include .\IHolographicSpace2.ahk
#Include .\IHolographicSpace3.ahk
#Include .\IHolographicSpaceStatics.ahk
#Include .\IHolographicSpaceStatics3.ahk
#Include .\IHolographicSpaceStatics2.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\HolographicSpace.ahk
#Include .\HolographicSpaceCameraAddedEventArgs.ahk
#Include .\HolographicSpaceCameraRemovedEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Represents a holographic scene, with one or more holographic cameras rendering its content.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.holographic.holographicspace
 * @namespace Windows.Graphics.Holographic
 * @version WindowsRuntime 1.4
 */
class HolographicSpace extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IHolographicSpace

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IHolographicSpace.IID

    /**
     * Gets whether the current system has been configured by the user for Mixed Reality headsets.
     * @remarks
     * On Desktop PCs running 64-bit Windows, this is initially false.  Once the user has set up Mixed Reality through the Mixed Reality Portal, this becomes true.  If this is false, but [IsSupported](holographicspace_issupported.md) is true, calling [CreateForCoreWindow](holographicspace_createforcorewindow_1849825339.md) anyway will guide the user through the setup flow.
     * 
     * On HoloLens, this is always true.
     * 
     * On any other system, including Desktop PCs running 32-bit Windows, this is false, as Mixed Reality headsets are not supported on those systems.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.holographic.holographicspace.isconfigured
     * @type {Boolean} 
     */
    static IsConfigured {
        get => HolographicSpace.get_IsConfigured()
    }

    /**
     * Gets whether the current system supports Mixed Reality headsets.
     * @remarks
     * On Desktop PCs running 64-bit Windows, this is always true.  If [IsAvailable](holographicspace_isavailable.md) is false because the user has not yet set up their Mixed Reality headset, calling [CreateForCoreWindow](holographicspace_createforcorewindow_1849825339.md) anyway will guide them through the setup flow.
     * 
     * On HoloLens, this is always true.
     * 
     * On any other system, including Desktop PCs running 32-bit Windows, this is false, as Mixed Reality headsets are not supported on those systems.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.holographic.holographicspace.issupported
     * @type {Boolean} 
     */
    static IsSupported {
        get => HolographicSpace.get_IsSupported()
    }

    /**
     * Gets whether a Mixed Reality headset is ready for holographic rendering.
     * @remarks
     * On Desktop PCs, this tells an app whether a Mixed Reality headset is attached to the PC, has been set up by the user, and is ready for holographic rendering.  When the headset is detached, this will become false.
     * 
     * On HoloLens, this is always true.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.holographic.holographicspace.isavailable
     * @type {Boolean} 
     */
    static IsAvailable {
        get => HolographicSpace.get_IsAvailable()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates a HolographicSpace that corresponds with the specified window's CoreApplicationView.
     * @remarks
     * Calling this method permanently assigns the CoreApplicationView to be holographic. You may no longer call IDXGIFactory2::CreateSwapChainForCoreWindow after calling this method, or vice versa.
     * @param {CoreWindow} window_ The window to create a HolographicSpace for.
     * @returns {HolographicSpace} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.holographic.holographicspace.createforcorewindow
     */
    static CreateForCoreWindow(window_) {
        if (!HolographicSpace.HasProp("__IHolographicSpaceStatics")) {
            activatableClassId := HSTRING.Create("Windows.Graphics.Holographic.HolographicSpace")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IHolographicSpaceStatics.IID)
            HolographicSpace.__IHolographicSpaceStatics := IHolographicSpaceStatics(factoryPtr)
        }

        return HolographicSpace.__IHolographicSpaceStatics.CreateForCoreWindow(window_)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    static get_IsConfigured() {
        if (!HolographicSpace.HasProp("__IHolographicSpaceStatics3")) {
            activatableClassId := HSTRING.Create("Windows.Graphics.Holographic.HolographicSpace")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IHolographicSpaceStatics3.IID)
            HolographicSpace.__IHolographicSpaceStatics3 := IHolographicSpaceStatics3(factoryPtr)
        }

        return HolographicSpace.__IHolographicSpaceStatics3.get_IsConfigured()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    static get_IsSupported() {
        if (!HolographicSpace.HasProp("__IHolographicSpaceStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Graphics.Holographic.HolographicSpace")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IHolographicSpaceStatics2.IID)
            HolographicSpace.__IHolographicSpaceStatics2 := IHolographicSpaceStatics2(factoryPtr)
        }

        return HolographicSpace.__IHolographicSpaceStatics2.get_IsSupported()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    static get_IsAvailable() {
        if (!HolographicSpace.HasProp("__IHolographicSpaceStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Graphics.Holographic.HolographicSpace")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IHolographicSpaceStatics2.IID)
            HolographicSpace.__IHolographicSpaceStatics2 := IHolographicSpaceStatics2(factoryPtr)
        }

        return HolographicSpace.__IHolographicSpaceStatics2.get_IsAvailable()
    }

    /**
     * 
     * @param {EventHandler<IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    static add_IsAvailableChanged(handler) {
        if (!HolographicSpace.HasProp("__IHolographicSpaceStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Graphics.Holographic.HolographicSpace")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IHolographicSpaceStatics2.IID)
            HolographicSpace.__IHolographicSpaceStatics2 := IHolographicSpaceStatics2(factoryPtr)
        }

        return HolographicSpace.__IHolographicSpaceStatics2.add_IsAvailableChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    static remove_IsAvailableChanged(token) {
        if (!HolographicSpace.HasProp("__IHolographicSpaceStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Graphics.Holographic.HolographicSpace")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IHolographicSpaceStatics2.IID)
            HolographicSpace.__IHolographicSpaceStatics2 := IHolographicSpaceStatics2(factoryPtr)
        }

        return HolographicSpace.__IHolographicSpaceStatics2.remove_IsAvailableChanged(token)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the identifier of the graphics adapter to be used when displaying holographic content to the default HolographicDisplay.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.holographic.holographicspace.primaryadapterid
     * @type {HolographicAdapterId} 
     */
    PrimaryAdapterId {
        get => this.get_PrimaryAdapterId()
    }

    /**
     * Describes whether the user is present within the headset to view and interact with this HolographicSpace.
     * @remarks
     * A HolographicSpace's user presence value is a combination of:
     * * Whether the user is wearing the headset.
     * * Whether this HolographicSpace is currently showing in the headset.
     * * Whether a modal dialog is intercepting input from this HolographicSpace.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.holographic.holographicspace.userpresence
     * @type {Integer} 
     */
    UserPresence {
        get => this.get_UserPresence()
    }

    /**
     * Occurs when a HolographicCamera is added to the current HolographicSpace.
     * @remarks
     * Apps can use this event to set up any per-camera resources they may need.
     * 
     * Unless the deferral is taken, once all event handlers are complete, the system will include this camera in the list of cameras that the app must render to each frame.
     * 
     * If you take a deferral and you've specified the D3D11_CREATE_DEVICE_SINGLETHREADED flag on your device, be sure to explicitly continue any work you spin off on your single Direct3D thread to avoid undefined behavior.
     * @type {TypedEventHandler<HolographicSpace, HolographicSpaceCameraAddedEventArgs>}
    */
    OnCameraAdded {
        get {
            if(!this.HasProp("__OnCameraAdded")){
                this.__OnCameraAdded := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{71d80b7c-1d27-5102-83d1-4f0efc7c9d6f}"),
                    HolographicSpace,
                    HolographicSpaceCameraAddedEventArgs
                )
                this.__OnCameraAddedToken := this.add_CameraAdded(this.__OnCameraAdded.iface)
            }
            return this.__OnCameraAdded
        }
    }

    /**
     * Occurs when a HolographicCamera is removed from the current HolographicSpace.
     * @remarks
     * Apps can use this event to tear down any per-camera resources they may have set up during CameraAdded.
     * 
     * The system will no longer require that the app render to this camera, starting in the next frame after this event.
     * 
     * If you take a deferral and you've specified the D3D11_CREATE_DEVICE_SINGLETHREADED flag on your device, be sure to explicitly continue any work you spin off on your single Direct3D thread to avoid undefined behavior.
     * @type {TypedEventHandler<HolographicSpace, HolographicSpaceCameraRemovedEventArgs>}
    */
    OnCameraRemoved {
        get {
            if(!this.HasProp("__OnCameraRemoved")){
                this.__OnCameraRemoved := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{db68cfc3-0874-502a-a3b9-2b1fe86c67be}"),
                    HolographicSpace,
                    HolographicSpaceCameraRemovedEventArgs
                )
                this.__OnCameraRemovedToken := this.add_CameraRemoved(this.__OnCameraRemoved.iface)
            }
            return this.__OnCameraRemoved
        }
    }

    /**
     * Occurs when the user's presence within the headset or ability to view and interact with this HolographicSpace changes.
     * @remarks
     * Note that a HolographicSpace's user presence can change when this HolographicSpace is activated or deactivated or when a modal popup appears or disappears, even while the user remains within the headset.
     * @type {TypedEventHandler<HolographicSpace, IInspectable>}
    */
    OnUserPresenceChanged {
        get {
            if(!this.HasProp("__OnUserPresenceChanged")){
                this.__OnUserPresenceChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{67aae2f2-42d8-5503-9131-deeb45a6ca03}"),
                    HolographicSpace,
                    IInspectable
                )
                this.__OnUserPresenceChangedToken := this.add_UserPresenceChanged(this.__OnUserPresenceChanged.iface)
            }
            return this.__OnUserPresenceChanged
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnCameraAddedToken")) {
            this.remove_CameraAdded(this.__OnCameraAddedToken)
            this.__OnCameraAdded.iface.Dispose()
        }

        if(this.HasProp("__OnCameraRemovedToken")) {
            this.remove_CameraRemoved(this.__OnCameraRemovedToken)
            this.__OnCameraRemoved.iface.Dispose()
        }

        if(this.HasProp("__OnUserPresenceChangedToken")) {
            this.remove_UserPresenceChanged(this.__OnUserPresenceChangedToken)
            this.__OnUserPresenceChanged.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {HolographicAdapterId} 
     */
    get_PrimaryAdapterId() {
        if (!this.HasProp("__IHolographicSpace")) {
            if ((queryResult := this.QueryInterface(IHolographicSpace.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHolographicSpace := IHolographicSpace(outPtr)
        }

        return this.__IHolographicSpace.get_PrimaryAdapterId()
    }

    /**
     * Assigns the IDirect3DDevice that will display holographic content. An error will occur if the app creates an inappropriate device.
     * @remarks
     * This method will make use of the Direct3D device you provide to set up holographic rendering.  If you've specified the D3D11_CREATE_DEVICE_SINGLETHREADED flag on your device, be sure to call this method from your single Direct3D thread to avoid undefined behavior.
     * 
     * This method should be called when providing the Direct3D device for the first time, and when the Direct3D device has changed.
     * @param {IDirect3DDevice} value The Direct3D device.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.holographic.holographicspace.setdirect3d11device
     */
    SetDirect3D11Device(value) {
        if (!this.HasProp("__IHolographicSpace")) {
            if ((queryResult := this.QueryInterface(IHolographicSpace.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHolographicSpace := IHolographicSpace(outPtr)
        }

        return this.__IHolographicSpace.SetDirect3D11Device(value)
    }

    /**
     * 
     * @param {TypedEventHandler<HolographicSpace, HolographicSpaceCameraAddedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_CameraAdded(handler) {
        if (!this.HasProp("__IHolographicSpace")) {
            if ((queryResult := this.QueryInterface(IHolographicSpace.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHolographicSpace := IHolographicSpace(outPtr)
        }

        return this.__IHolographicSpace.add_CameraAdded(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} cookie 
     * @returns {HRESULT} 
     */
    remove_CameraAdded(cookie) {
        if (!this.HasProp("__IHolographicSpace")) {
            if ((queryResult := this.QueryInterface(IHolographicSpace.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHolographicSpace := IHolographicSpace(outPtr)
        }

        return this.__IHolographicSpace.remove_CameraAdded(cookie)
    }

    /**
     * 
     * @param {TypedEventHandler<HolographicSpace, HolographicSpaceCameraRemovedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_CameraRemoved(handler) {
        if (!this.HasProp("__IHolographicSpace")) {
            if ((queryResult := this.QueryInterface(IHolographicSpace.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHolographicSpace := IHolographicSpace(outPtr)
        }

        return this.__IHolographicSpace.add_CameraRemoved(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} cookie 
     * @returns {HRESULT} 
     */
    remove_CameraRemoved(cookie) {
        if (!this.HasProp("__IHolographicSpace")) {
            if ((queryResult := this.QueryInterface(IHolographicSpace.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHolographicSpace := IHolographicSpace(outPtr)
        }

        return this.__IHolographicSpace.remove_CameraRemoved(cookie)
    }

    /**
     * Creates a HolographicFrame for the next frame to display.
     * @remarks
     * Apps use the HolographicFrame returned here to find out the predicted positions of each HolographicCamera at the time of frame display, render their views based on that prediction, and then call the PresentUsingCurrentPrediction method to send them to the displays.
     * 
     * The system tracks end-to-end latency from the CreateNextFrame call until the frame is presented. This determines the number of frames the system will look forward for the next frame's prediction.
     * 
     * This method will make use of the Direct3D device you provided to the HolographicSpace.  If you've specified the D3D11_CREATE_DEVICE_SINGLETHREADED flag on your device, be sure to call this method from your single Direct3D thread to avoid undefined behavior.
     * @returns {HolographicFrame} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.holographic.holographicspace.createnextframe
     */
    CreateNextFrame() {
        if (!this.HasProp("__IHolographicSpace")) {
            if ((queryResult := this.QueryInterface(IHolographicSpace.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHolographicSpace := IHolographicSpace(outPtr)
        }

        return this.__IHolographicSpace.CreateNextFrame()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_UserPresence() {
        if (!this.HasProp("__IHolographicSpace2")) {
            if ((queryResult := this.QueryInterface(IHolographicSpace2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHolographicSpace2 := IHolographicSpace2(outPtr)
        }

        return this.__IHolographicSpace2.get_UserPresence()
    }

    /**
     * 
     * @param {TypedEventHandler<HolographicSpace, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_UserPresenceChanged(handler) {
        if (!this.HasProp("__IHolographicSpace2")) {
            if ((queryResult := this.QueryInterface(IHolographicSpace2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHolographicSpace2 := IHolographicSpace2(outPtr)
        }

        return this.__IHolographicSpace2.add_UserPresenceChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_UserPresenceChanged(token) {
        if (!this.HasProp("__IHolographicSpace2")) {
            if ((queryResult := this.QueryInterface(IHolographicSpace2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHolographicSpace2 := IHolographicSpace2(outPtr)
        }

        return this.__IHolographicSpace2.remove_UserPresenceChanged(token)
    }

    /**
     * Blocks the current thread until the right time to begin rendering the next frame.
     * @remarks
     * This method will return one frame duration before the next frame is expected to be received by the compositor to reproject and scan out.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.holographic.holographicspace.waitfornextframeready
     */
    WaitForNextFrameReady() {
        if (!this.HasProp("__IHolographicSpace2")) {
            if ((queryResult := this.QueryInterface(IHolographicSpace2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHolographicSpace2 := IHolographicSpace2(outPtr)
        }

        return this.__IHolographicSpace2.WaitForNextFrameReady()
    }

    /**
     * Blocks the current thread until the right time to begin rendering the next frame, with the specified head start.
     * @remarks
     * This method will return approximately the head start plus one frame duration before the next frame is expected to be received by the compositor to reproject and scan out.
     * @param {TimeSpan} requestedHeadStartDuration The amount of extra head start time to wake up early.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.holographic.holographicspace.waitfornextframereadywithheadstart
     */
    WaitForNextFrameReadyWithHeadStart(requestedHeadStartDuration) {
        if (!this.HasProp("__IHolographicSpace2")) {
            if ((queryResult := this.QueryInterface(IHolographicSpace2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHolographicSpace2 := IHolographicSpace2(outPtr)
        }

        return this.__IHolographicSpace2.WaitForNextFrameReadyWithHeadStart(requestedHeadStartDuration)
    }

    /**
     * Creates an object to monitor an independent stream of frame presentation reports from this HolographicSpace.
     * @param {Integer} maxQueuedReports The maximum number of frame reports that can queue up without being read before reports are discarded.
     * @returns {HolographicFramePresentationMonitor} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.holographic.holographicspace.createframepresentationmonitor
     */
    CreateFramePresentationMonitor(maxQueuedReports) {
        if (!this.HasProp("__IHolographicSpace2")) {
            if ((queryResult := this.QueryInterface(IHolographicSpace2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHolographicSpace2 := IHolographicSpace2(outPtr)
        }

        return this.__IHolographicSpace2.CreateFramePresentationMonitor(maxQueuedReports)
    }

    /**
     * Creates a [HolographicFrameScanoutMonitor](holographicframescanoutmonitor.md) that allows Windows Mixed Reality applications to monitor detailed performance and timing information about the platform in real time.
     * @remarks
     * The caller is responsible for calling [ReadReports](holographicframescanoutmonitor_readreports_231406138.md) method at a high enough frequency to dequeue the reports before this maximum limit is reached.  If the limit is reached, the platform will discard reports until the queue is no longer full.  It is recommended that **ReadReports** be called once every frame.
     * @param {Integer} maxQueuedReports The maximum number of [HolographicFrameScanoutReport](holographicframescanoutreport.md) objects that will be buffered by the system at any one time.
     * @returns {HolographicFrameScanoutMonitor} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.holographic.holographicspace.createframescanoutmonitor
     */
    CreateFrameScanoutMonitor(maxQueuedReports) {
        if (!this.HasProp("__IHolographicSpace3")) {
            if ((queryResult := this.QueryInterface(IHolographicSpace3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHolographicSpace3 := IHolographicSpace3(outPtr)
        }

        return this.__IHolographicSpace3.CreateFrameScanoutMonitor(maxQueuedReports)
    }

;@endregion Instance Methods
}
