#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IHolographicFramePresentationReport.ahk
#Include ..\..\..\Guid.ahk

/**
 * A frame presentation report for a particular compositor frame.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.holographic.holographicframepresentationreport
 * @namespace Windows.Graphics.Holographic
 * @version WindowsRuntime 1.4
 */
class HolographicFramePresentationReport extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IHolographicFramePresentationReport

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IHolographicFramePresentationReport.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * The amount of GPU time which was not available for the app's use since it was consumed by the compositor.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.holographic.holographicframepresentationreport.compositorgpuduration
     * @type {TimeSpan} 
     */
    CompositorGpuDuration {
        get => this.get_CompositorGpuDuration()
    }

    /**
     * The amount of GPU time which was consumed by the app.
     * @remarks
     * Concretely, the difference between the app's first and last GPU command, minus any overlapping compositor GPU usage (i.e. due to pre-emption).
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.holographic.holographicframepresentationreport.appgpuduration
     * @type {TimeSpan} 
     */
    AppGpuDuration {
        get => this.get_AppGpuDuration()
    }

    /**
     * The amount of GPU time the app spent which went beyond its presentation target time.
     * @remarks
     * Will be negative when the app's GPU work finishes in time to be picked up for presentation at the expected time.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.holographic.holographicframepresentationreport.appgpuoverrun
     * @type {TimeSpan} 
     */
    AppGpuOverrun {
        get => this.get_AppGpuOverrun()
    }

    /**
     * The number of presentation opportunities which were missed before the app's frame was finished rendering.
     * @remarks
     * If this value is greater than zero, the compositor had to reproject and present your previous frame for the head position of later presentation opportunities.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.holographic.holographicframepresentationreport.missedpresentationopportunitycount
     * @type {Integer} 
     */
    MissedPresentationOpportunityCount {
        get => this.get_MissedPresentationOpportunityCount()
    }

    /**
     * The number of times the app's frame was presented by the compositor.
     * @remarks
     * Normally one, but may be zero if the frame was dropped, or greater than one if the frame was re-presented due to subsequent frames arriving late.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.holographic.holographicframepresentationreport.presentationcount
     * @type {Integer} 
     */
    PresentationCount {
        get => this.get_PresentationCount()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_CompositorGpuDuration() {
        if (!this.HasProp("__IHolographicFramePresentationReport")) {
            if ((queryResult := this.QueryInterface(IHolographicFramePresentationReport.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHolographicFramePresentationReport := IHolographicFramePresentationReport(outPtr)
        }

        return this.__IHolographicFramePresentationReport.get_CompositorGpuDuration()
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_AppGpuDuration() {
        if (!this.HasProp("__IHolographicFramePresentationReport")) {
            if ((queryResult := this.QueryInterface(IHolographicFramePresentationReport.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHolographicFramePresentationReport := IHolographicFramePresentationReport(outPtr)
        }

        return this.__IHolographicFramePresentationReport.get_AppGpuDuration()
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_AppGpuOverrun() {
        if (!this.HasProp("__IHolographicFramePresentationReport")) {
            if ((queryResult := this.QueryInterface(IHolographicFramePresentationReport.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHolographicFramePresentationReport := IHolographicFramePresentationReport(outPtr)
        }

        return this.__IHolographicFramePresentationReport.get_AppGpuOverrun()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MissedPresentationOpportunityCount() {
        if (!this.HasProp("__IHolographicFramePresentationReport")) {
            if ((queryResult := this.QueryInterface(IHolographicFramePresentationReport.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHolographicFramePresentationReport := IHolographicFramePresentationReport(outPtr)
        }

        return this.__IHolographicFramePresentationReport.get_MissedPresentationOpportunityCount()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PresentationCount() {
        if (!this.HasProp("__IHolographicFramePresentationReport")) {
            if ((queryResult := this.QueryInterface(IHolographicFramePresentationReport.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHolographicFramePresentationReport := IHolographicFramePresentationReport(outPtr)
        }

        return this.__IHolographicFramePresentationReport.get_PresentationCount()
    }

;@endregion Instance Methods
}
