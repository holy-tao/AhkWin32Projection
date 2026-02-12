#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IHolographicFrameScanoutMonitor.ahk
#Include ..\..\Foundation\IClosable.ahk
#Include ..\..\..\Guid.ahk

/**
 * Allows Mixed Reality applications to obtain a stream of [HolographicFrameScanoutReport](holographicframescanoutreport.md) objects.
 * @remarks
 * This class allows Windows Mixed Reality applications to monitor detailed performance and timing information about the platform in real time. This information can be used by applications to adapt their rendering or simulation based on workload cost to ensure maximum frame rate while still achieving the best image fidelity possible. This API replaces [HolographicFramePresentationMonitor](holographicframepresentationmonitor.md) which offered similar functionality.
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.holographic.holographicframescanoutmonitor
 * @namespace Windows.Graphics.Holographic
 * @version WindowsRuntime 1.4
 */
class HolographicFrameScanoutMonitor extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IHolographicFrameScanoutMonitor

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IHolographicFrameScanoutMonitor.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        this.Close()

        super.__Delete()
    }

    /**
     * Returns a list of [HolographicFrameScanoutReport](holographicframescanoutreport.md) objects where each report corresponds to a single scanout to the holographic display which has occurred since the last time the method was called. Note that each [HolographicFrame](holographicframe.md) may be scanned out multiple times.
     * @remarks
     * The maximum number of [HolographicFrameScanoutReport](holographicframescanoutreport.md) objects that will be buffered by the system at any one time is set when the [HolographicFrameScanoutMonitor](holographicframescanoutmonitor.md) is created with a call to [HolographicSpace.CreateFrameScanoutMonitor](holographicspace_createframescanoutmonitor_928342556.md). The caller is responsible for calling **ReadReports** method at a high enough frequency to dequeue the reports before this maximum limit is reached.  If the limit is reached, the platform will discard reports until the queue is no longer full.  It is recommended that **ReadReports** be called once every frame.
     * @returns {IVector<HolographicFrameScanoutReport>} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.holographic.holographicframescanoutmonitor.readreports
     */
    ReadReports() {
        if (!this.HasProp("__IHolographicFrameScanoutMonitor")) {
            if ((queryResult := this.QueryInterface(IHolographicFrameScanoutMonitor.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHolographicFrameScanoutMonitor := IHolographicFrameScanoutMonitor(outPtr)
        }

        return this.__IHolographicFrameScanoutMonitor.ReadReports()
    }

    /**
     * Closes the [HolographicFrameScanoutMonitor](holographicframescanoutmonitor.md) and releases associated resources.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.holographic.holographicframescanoutmonitor.close
     */
    Close() {
        if (!this.HasProp("__IClosable")) {
            if ((queryResult := this.QueryInterface(IClosable.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClosable := IClosable(outPtr)
        }

        return this.__IClosable.Close()
    }

;@endregion Instance Methods
}
