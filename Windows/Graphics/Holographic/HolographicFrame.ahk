#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IHolographicFrame.ahk
#Include .\IHolographicFrame2.ahk
#Include .\IHolographicFrame3.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a frame of holographic content that an app must render to all cameras.
 * @remarks
 * Each HolographicFrame tracks end-to-end latency from the CreateNextFrame call until the frame is presented. This determines the number of frames the system will look forward for the next frame's prediction.
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.holographic.holographicframe
 * @namespace Windows.Graphics.Holographic
 * @version WindowsRuntime 1.4
 */
class HolographicFrame extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IHolographicFrame

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IHolographicFrame.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the list of HolographicCamera objects that were added since last frame.
     * @remarks
     * Cameras only show up in this list after they surface in the CameraAdded event to //! let apps initialize any per-camera buffers on a background thread.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.holographic.holographicframe.addedcameras
     * @type {IVectorView<HolographicCamera>} 
     */
    AddedCameras {
        get => this.get_AddedCameras()
    }

    /**
     * Gets the list of HolographicCamera objects that were removed since last frame.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.holographic.holographicframe.removedcameras
     * @type {IVectorView<HolographicCamera>} 
     */
    RemovedCameras {
        get => this.get_RemovedCameras()
    }

    /**
     * Gets the duration of time that the frame will be on the screen.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.holographic.holographicframe.duration
     * @type {TimeSpan} 
     */
    Duration {
        get => this.get_Duration()
    }

    /**
     * Gets the most recent camera location prediction for the current HolographicFrame.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.holographic.holographicframe.currentprediction
     * @type {HolographicFramePrediction} 
     */
    CurrentPrediction {
        get => this.get_CurrentPrediction()
    }

    /**
     * Gets the unique identifier for the [HolographicFrame](holographicframe.md) within its parent [HolographicSpace](holographicspace.md).
     * @remarks
     * Identifier values within a **HolographicSpace** are guaranteed to be strictly increasing.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.holographic.holographicframe.id
     * @type {HolographicFrameId} 
     */
    Id {
        get => this.get_Id()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {IVectorView<HolographicCamera>} 
     */
    get_AddedCameras() {
        if (!this.HasProp("__IHolographicFrame")) {
            if ((queryResult := this.QueryInterface(IHolographicFrame.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHolographicFrame := IHolographicFrame(outPtr)
        }

        return this.__IHolographicFrame.get_AddedCameras()
    }

    /**
     * 
     * @returns {IVectorView<HolographicCamera>} 
     */
    get_RemovedCameras() {
        if (!this.HasProp("__IHolographicFrame")) {
            if ((queryResult := this.QueryInterface(IHolographicFrame.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHolographicFrame := IHolographicFrame(outPtr)
        }

        return this.__IHolographicFrame.get_RemovedCameras()
    }

    /**
     * Gets the parameters needed to render the current frame with the specified camera pose.
     * @param {HolographicCameraPose} cameraPose The camera pose.
     * @returns {HolographicCameraRenderingParameters} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.holographic.holographicframe.getrenderingparameters
     */
    GetRenderingParameters(cameraPose) {
        if (!this.HasProp("__IHolographicFrame")) {
            if ((queryResult := this.QueryInterface(IHolographicFrame.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHolographicFrame := IHolographicFrame(outPtr)
        }

        return this.__IHolographicFrame.GetRenderingParameters(cameraPose)
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_Duration() {
        if (!this.HasProp("__IHolographicFrame")) {
            if ((queryResult := this.QueryInterface(IHolographicFrame.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHolographicFrame := IHolographicFrame(outPtr)
        }

        return this.__IHolographicFrame.get_Duration()
    }

    /**
     * 
     * @returns {HolographicFramePrediction} 
     */
    get_CurrentPrediction() {
        if (!this.HasProp("__IHolographicFrame")) {
            if ((queryResult := this.QueryInterface(IHolographicFrame.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHolographicFrame := IHolographicFrame(outPtr)
        }

        return this.__IHolographicFrame.get_CurrentPrediction()
    }

    /**
     * Computes an updated prediction for the CurrentPrediction property.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.holographic.holographicframe.updatecurrentprediction
     */
    UpdateCurrentPrediction() {
        if (!this.HasProp("__IHolographicFrame")) {
            if ((queryResult := this.QueryInterface(IHolographicFrame.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHolographicFrame := IHolographicFrame(outPtr)
        }

        return this.__IHolographicFrame.UpdateCurrentPrediction()
    }

    /**
     * Presents the current frame for all cameras with the specified waiting behavior.
     * @remarks
     * Except for very simple apps, you should generally pass in a waitBehavior of DoNotWaitForFrameToFinish.  You can then call [HolographicSpace.WaitForNextFrameReady](holographicspace_waitfornextframeready_2104087308.md) or [HolographicSpace.WaitForNextFrameReadyWithHeadStart](holographicspace_waitfornextframereadywithheadstart_1475386923.md) manually, which allows your app's CPU and GPU work to overlap across consecutive frames.
     * 
     * This method will make use of the Direct3D device you provided to the HolographicSpace.  If you've specified the D3D11_CREATE_DEVICE_SINGLETHREADED flag on your device, be sure to call this method from your single Direct3D thread to avoid undefined behavior.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.holographic.holographicframe.presentusingcurrentprediction
     */
    PresentUsingCurrentPrediction() {
        if (!this.HasProp("__IHolographicFrame")) {
            if ((queryResult := this.QueryInterface(IHolographicFrame.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHolographicFrame := IHolographicFrame(outPtr)
        }

        return this.__IHolographicFrame.PresentUsingCurrentPrediction()
    }

    /**
     * Present the current frame for all cameras and then wait until the next frame.
     * @remarks
     * Except for very simple apps, you should generally call the two-parameter overload and pass in a waitBehavior of DoNotWaitForFrameToFinish.  You can then call [HolographicSpace.WaitForNextFrameReady](holographicspace_waitfornextframeready_2104087308.md) or [HolographicSpace.WaitForNextFrameReadyWithHeadStart](holographicspace_waitfornextframereadywithheadstart_1475386923.md) manually, which allows your app's CPU and GPU work to overlap across consecutive frames.
     * 
     * This method will make use of the Direct3D device you provided to the HolographicSpace.  If you've specified the D3D11_CREATE_DEVICE_SINGLETHREADED flag on your device, be sure to call this method from your single Direct3D thread to avoid undefined behavior.
     * @param {Integer} waitBehavior 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.holographic.holographicframe.presentusingcurrentprediction
     */
    PresentUsingCurrentPredictionWithBehavior(waitBehavior) {
        if (!this.HasProp("__IHolographicFrame")) {
            if ((queryResult := this.QueryInterface(IHolographicFrame.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHolographicFrame := IHolographicFrame(outPtr)
        }

        return this.__IHolographicFrame.PresentUsingCurrentPredictionWithBehavior(waitBehavior)
    }

    /**
     * Blocks the current thread until this frame has finished and is showing on the displays.
     * @remarks
     * Note that the default wait behavior of PresentUsingCurrentPrediction already waits for the frame to finish.
     * 
     * Except for very simple apps, you should generally use [HolographicSpace.WaitForNextFrameReady](holographicspace_waitfornextframeready_2104087308.md) or [HolographicSpace.WaitForNextFrameReadyWithHeadStart](holographicspace_waitfornextframereadywithheadstart_1475386923.md) instead, which allows your app's CPU and GPU work to overlap across consecutive frames.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.holographic.holographicframe.waitforframetofinish
     */
    WaitForFrameToFinish() {
        if (!this.HasProp("__IHolographicFrame")) {
            if ((queryResult := this.QueryInterface(IHolographicFrame.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHolographicFrame := IHolographicFrame(outPtr)
        }

        return this.__IHolographicFrame.WaitForFrameToFinish()
    }

    /**
     * Gets an update payload that lets an application configure a specific quad layer's parameters from this frame forward.
     * @remarks
     * To display quad layers, an application creates the necessary [HolographicQuadLayer](holographicquadlayer.md) instances and adds them to a [HolographicCamera](holographiccamera.md)'s mutable [QuadLayers](holographiccamera_quadlayers.md) list.  To synchronize a retained quad layer update with a given immediate-mode holographic frame, an application requests an [HolographicQuadLayerUpdateParameters](holographicquadlayerupdateparameters.md) instance from that frame by calling HolographicFrame.GetQuadLayerUpdateParameters.  Any updates requested on that **HolographicQuadLayerUpdateParameters** instance will apply starting in that frame.
     * 
     * > [!NOTE]
     * > The [AcquireBufferToUpdateContent](holographicquadlayerupdateparameters_acquirebuffertoupdatecontent_748006292.md) or [AcquireBufferToUpdateContentWithHardwareProtection](holographicquadlayerupdateparameters_acquirebuffertoupdatecontentwithhardwareprotection_809854092.md) method must be called when updating a **HolographicQuadLayer** object for the first time.
     * @param {HolographicQuadLayer} layer The quad layer to update.
     * @returns {HolographicQuadLayerUpdateParameters} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.holographic.holographicframe.getquadlayerupdateparameters
     */
    GetQuadLayerUpdateParameters(layer) {
        if (!this.HasProp("__IHolographicFrame2")) {
            if ((queryResult := this.QueryInterface(IHolographicFrame2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHolographicFrame2 := IHolographicFrame2(outPtr)
        }

        return this.__IHolographicFrame2.GetQuadLayerUpdateParameters(layer)
    }

    /**
     * 
     * @returns {HolographicFrameId} 
     */
    get_Id() {
        if (!this.HasProp("__IHolographicFrame3")) {
            if ((queryResult := this.QueryInterface(IHolographicFrame3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHolographicFrame3 := IHolographicFrame3(outPtr)
        }

        return this.__IHolographicFrame3.get_Id()
    }

;@endregion Instance Methods
}
