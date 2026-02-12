#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IHolographicFrameScanoutReport.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides performance and timing information about a single scanout to a holographic display.
 * @remarks
 * "Scanout" in this context roughly corresponds to sending a new image to the display hardware. A single [HolographicFrame](holographicframe.md) may be scanned out multiple times if there is not a new frame available with its GPU work finished at the next scanout opportunity. There will be an individual **HolographicFrameScanoutReport** produced for each of these repetitions in this case.
 * 
 * Each **HolographicFrameScanoutReport** also contains a reference to a corresponding [HolographicFrameRenderingReport](holographicframerenderingreport.md), accessed with the [RenderingReport](holographicframescanoutreport_renderingreport.md) property, which contains information about the work the application did leading up to the frame being scanned out by the system for the first time. This work only happens once when the frame is first presented, and the result is re-used on each subsequent scanout of the same frame.
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.holographic.holographicframescanoutreport
 * @namespace Windows.Graphics.Holographic
 * @version WindowsRuntime 1.4
 */
class HolographicFrameScanoutReport extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IHolographicFrameScanoutReport

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IHolographicFrameScanoutReport.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets rendering timing information about the [HolographicFrame](holographicframe.md) that was scanned out.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.holographic.holographicframescanoutreport.renderingreport
     * @type {HolographicFrameRenderingReport} 
     */
    RenderingReport {
        get => this.get_RenderingReport()
    }

    /**
     * Gets the number of scanout opportunities that were missed since the last scanout.
     * @remarks
     * Scanout opportunities are missed if reprojection fails to complete in time for the deadline to begin scanout. This will cause a visible glitch as no new image will be presented to the display. These events should be rare as the platform will adjust scheduling to minimize the likelihood of failure.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.holographic.holographicframescanoutreport.missedscanoutcount
     * @type {Integer} 
     */
    MissedScanoutCount {
        get => this.get_MissedScanoutCount()
    }

    /**
     * Gets the time that the final decision on which [HolographicFrame](holographicframe.md) will be scanned out is made and reprojection begins, if applicable.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.holographic.holographicframescanoutreport.systemrelativelatchtime
     * @type {TimeSpan} 
     */
    SystemRelativeLatchTime {
        get => this.get_SystemRelativeLatchTime()
    }

    /**
     * Gets the time that the image began scanning out to the display hardware.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.holographic.holographicframescanoutreport.systemrelativescanoutstarttime
     * @type {TimeSpan} 
     */
    SystemRelativeScanoutStartTime {
        get => this.get_SystemRelativeScanoutStartTime()
    }

    /**
     * Gets the time that the light from the display hardware for the current scanout is expected to be emitted.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.holographic.holographicframescanoutreport.systemrelativephotontime
     * @type {TimeSpan} 
     */
    SystemRelativePhotonTime {
        get => this.get_SystemRelativePhotonTime()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {HolographicFrameRenderingReport} 
     */
    get_RenderingReport() {
        if (!this.HasProp("__IHolographicFrameScanoutReport")) {
            if ((queryResult := this.QueryInterface(IHolographicFrameScanoutReport.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHolographicFrameScanoutReport := IHolographicFrameScanoutReport(outPtr)
        }

        return this.__IHolographicFrameScanoutReport.get_RenderingReport()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MissedScanoutCount() {
        if (!this.HasProp("__IHolographicFrameScanoutReport")) {
            if ((queryResult := this.QueryInterface(IHolographicFrameScanoutReport.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHolographicFrameScanoutReport := IHolographicFrameScanoutReport(outPtr)
        }

        return this.__IHolographicFrameScanoutReport.get_MissedScanoutCount()
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_SystemRelativeLatchTime() {
        if (!this.HasProp("__IHolographicFrameScanoutReport")) {
            if ((queryResult := this.QueryInterface(IHolographicFrameScanoutReport.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHolographicFrameScanoutReport := IHolographicFrameScanoutReport(outPtr)
        }

        return this.__IHolographicFrameScanoutReport.get_SystemRelativeLatchTime()
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_SystemRelativeScanoutStartTime() {
        if (!this.HasProp("__IHolographicFrameScanoutReport")) {
            if ((queryResult := this.QueryInterface(IHolographicFrameScanoutReport.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHolographicFrameScanoutReport := IHolographicFrameScanoutReport(outPtr)
        }

        return this.__IHolographicFrameScanoutReport.get_SystemRelativeScanoutStartTime()
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_SystemRelativePhotonTime() {
        if (!this.HasProp("__IHolographicFrameScanoutReport")) {
            if ((queryResult := this.QueryInterface(IHolographicFrameScanoutReport.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHolographicFrameScanoutReport := IHolographicFrameScanoutReport(outPtr)
        }

        return this.__IHolographicFrameScanoutReport.get_SystemRelativePhotonTime()
    }

;@endregion Instance Methods
}
