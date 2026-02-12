#Requires AutoHotkey v2.0 64-bit

#Include ..\Win32\System\WinRT\Apis.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPerceptionTimestamp.ahk
#Include .\IPerceptionTimestamp2.ahk
#Include ..\..\Guid.ahk

/**
 * Represents a particular prediction of the future, or a snapshot of the past.
  * 
  * Passing one PerceptionTimestamp instance to multiple API calls ensures that they all return results based on the same set of predicted data, even if Windows has improved predictions available. This ensures that you can correctly correlate the data you get back from these APIs.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.perception.perceptiontimestamp
 * @namespace Windows.Perception
 * @version WindowsRuntime 1.4
 */
class PerceptionTimestamp extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPerceptionTimestamp

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPerceptionTimestamp.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the specific time that is the subject of this timestamp.
     * @remarks
     * If you will be relating this timestamp to other high-precision events on the system, you should instead use the [SystemRelativeTargetTime](perceptiontimestamp_systemrelativetargettime.md) property, which operates in the QueryPerformanceCounter (QPC) time domain.
     * @see https://learn.microsoft.com/uwp/api/windows.perception.perceptiontimestamp.targettime
     * @type {DateTime} 
     */
    TargetTime {
        get => this.get_TargetTime()
    }

    /**
     * For timestamps about the future, gets the span of time between when the prediction was made and [TargetTime](perceptiontimestamp_targettime.md).
     * @remarks
     * When you get an improved prediction (for example, from a newer [HolographicFramePrediction](../windows.graphics.holographic/holographicframeprediction.md), TargetTime will stay the same and PredictionAmount will decrease.
     * 
     * For timestamps about the past, PredictionAmount is always 0, even if the data associated with this timestamp was interpolated between two readings.
     * @see https://learn.microsoft.com/uwp/api/windows.perception.perceptiontimestamp.predictionamount
     * @type {TimeSpan} 
     */
    PredictionAmount {
        get => this.get_PredictionAmount()
    }

    /**
     * Gets the specific time that is the subject of this timestamp, represented in the system-relative QueryPerformanceCounter (QPC) time domain.
     * @remarks
     * This value uses 100ns interval QPC time. For more information on QPC time, see [Acquiring high-resolution time stamps](/windows/desktop/SysInfo/acquiring-high-resolution-time-stamps).
     * @see https://learn.microsoft.com/uwp/api/windows.perception.perceptiontimestamp.systemrelativetargettime
     * @type {TimeSpan} 
     */
    SystemRelativeTargetTime {
        get => this.get_SystemRelativeTargetTime()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_TargetTime() {
        if (!this.HasProp("__IPerceptionTimestamp")) {
            if ((queryResult := this.QueryInterface(IPerceptionTimestamp.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPerceptionTimestamp := IPerceptionTimestamp(outPtr)
        }

        return this.__IPerceptionTimestamp.get_TargetTime()
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_PredictionAmount() {
        if (!this.HasProp("__IPerceptionTimestamp")) {
            if ((queryResult := this.QueryInterface(IPerceptionTimestamp.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPerceptionTimestamp := IPerceptionTimestamp(outPtr)
        }

        return this.__IPerceptionTimestamp.get_PredictionAmount()
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_SystemRelativeTargetTime() {
        if (!this.HasProp("__IPerceptionTimestamp2")) {
            if ((queryResult := this.QueryInterface(IPerceptionTimestamp2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPerceptionTimestamp2 := IPerceptionTimestamp2(outPtr)
        }

        return this.__IPerceptionTimestamp2.get_SystemRelativeTargetTime()
    }

;@endregion Instance Methods
}
