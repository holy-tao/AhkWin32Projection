#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IHolographicFrameRenderingReport.ahk
#Include ..\..\..\Guid.ahk

/**
 * Contains timing information about the work the application did leading up to the frame being scanned out by the system for the first time.
 * @remarks
 * The work described in this report only happens once, when the frame is first presented. The result is re-used on each subsequent scanout of the same frame.
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.holographic.holographicframerenderingreport
 * @namespace Windows.Graphics.Holographic
 * @version WindowsRuntime 1.4
 */
class HolographicFrameRenderingReport extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IHolographicFrameRenderingReport

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IHolographicFrameRenderingReport.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the unique identifier for the [HolographicFrame](holographicframe.md) associated with the [HolographicFrameRenderingReport](holographicframerenderingreport.md).
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.holographic.holographicframerenderingreport.frameid
     * @type {HolographicFrameId} 
     */
    FrameId {
        get => this.get_FrameId()
    }

    /**
     * Gets the number of scanouts where a previous [HolographicFrame](holographicframe.md) had to be re-projected again due to the GPU work for the current **HolographicFrame** not finishing in time for the target scanout deadline.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.holographic.holographicframerenderingreport.missedlatchcount
     * @type {Integer} 
     */
    MissedLatchCount {
        get => this.get_MissedLatchCount()
    }

    /**
     * Gets the system-recommended time at which rendering for the [HolographicFrame](holographicframe.md) that is dependent on the head pose should have begun. This is the same time that [HolographicSpace.WaitForNextFrameReady](holographicspace_waitfornextframeready_2104087308.md) method is unblocked.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.holographic.holographicframerenderingreport.systemrelativeframereadytime
     * @type {TimeSpan} 
     */
    SystemRelativeFrameReadyTime {
        get => this.get_SystemRelativeFrameReadyTime()
    }

    /**
     * Gets the time at which all GPU work needed for reprojection is known to be finished. This includes any overlay work or other hologram compositor post-processing needed to prepare the final image.
     * @remarks
     * Note that this value is an upper bound because computing precise GPU timestamps may not be possible on all platforms. Therefore this value cannot be used to infer if this frame scanned out on schedule. Use [MissedLatchCount](holographicframerenderingreport_missedlatchcount.md) to determine this instead.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.holographic.holographicframerenderingreport.systemrelativeactualgpufinishtime
     * @type {TimeSpan} 
     */
    SystemRelativeActualGpuFinishTime {
        get => this.get_SystemRelativeActualGpuFinishTime()
    }

    /**
     * Gets an estimate of the time that the [HolographicFrame](holographicframe.md) needed to have all its GPU work, both application and compositor, finished in order to begin reprojection on schedule.
     * @remarks
     * If the [SystemRelativeActualGpuFinishTime](holographicframerenderingreport_systemrelativeactualgpufinishtime.md) exceeds this value, it is highly likely the **HolographicFrame** will fail to present on schedule, typically resulting in a previously submitted **HolographicFrame** being re-projected multiple times. Note that this value is an estimate, since the precision of reprojection scheduling may be variable, and therefore this value cannot be used to determine if if this frame scanned out on schedule. Use [MissedLatchCount](holographicframerenderingreport_missedlatchcount.md) to determine this instead.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.holographic.holographicframerenderingreport.systemrelativetargetlatchtime
     * @type {TimeSpan} 
     */
    SystemRelativeTargetLatchTime {
        get => this.get_SystemRelativeTargetLatchTime()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {HolographicFrameId} 
     */
    get_FrameId() {
        if (!this.HasProp("__IHolographicFrameRenderingReport")) {
            if ((queryResult := this.QueryInterface(IHolographicFrameRenderingReport.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHolographicFrameRenderingReport := IHolographicFrameRenderingReport(outPtr)
        }

        return this.__IHolographicFrameRenderingReport.get_FrameId()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MissedLatchCount() {
        if (!this.HasProp("__IHolographicFrameRenderingReport")) {
            if ((queryResult := this.QueryInterface(IHolographicFrameRenderingReport.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHolographicFrameRenderingReport := IHolographicFrameRenderingReport(outPtr)
        }

        return this.__IHolographicFrameRenderingReport.get_MissedLatchCount()
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_SystemRelativeFrameReadyTime() {
        if (!this.HasProp("__IHolographicFrameRenderingReport")) {
            if ((queryResult := this.QueryInterface(IHolographicFrameRenderingReport.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHolographicFrameRenderingReport := IHolographicFrameRenderingReport(outPtr)
        }

        return this.__IHolographicFrameRenderingReport.get_SystemRelativeFrameReadyTime()
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_SystemRelativeActualGpuFinishTime() {
        if (!this.HasProp("__IHolographicFrameRenderingReport")) {
            if ((queryResult := this.QueryInterface(IHolographicFrameRenderingReport.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHolographicFrameRenderingReport := IHolographicFrameRenderingReport(outPtr)
        }

        return this.__IHolographicFrameRenderingReport.get_SystemRelativeActualGpuFinishTime()
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_SystemRelativeTargetLatchTime() {
        if (!this.HasProp("__IHolographicFrameRenderingReport")) {
            if ((queryResult := this.QueryInterface(IHolographicFrameRenderingReport.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHolographicFrameRenderingReport := IHolographicFrameRenderingReport(outPtr)
        }

        return this.__IHolographicFrameRenderingReport.get_SystemRelativeTargetLatchTime()
    }

;@endregion Instance Methods
}
