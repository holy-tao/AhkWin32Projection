#Requires AutoHotkey v2.0 64-bit

#Include ..\Win32\System\WinRT\Apis.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPerceptionTimestampHelperStatics.ahk
#Include .\IPerceptionTimestampHelperStatics2.ahk
#Include ..\..\Guid.ahk

/**
 * Static methods for working with PerceptionTimestamp objects.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.perception.perceptiontimestamphelper
 * @namespace Windows.Perception
 * @version WindowsRuntime 1.4
 */
class PerceptionTimestampHelper extends IInspectable {
;@region Static Methods
    /**
     * Gets a timestamp that targets the specified time in the past.
     * @remarks
     * If you are creating this timestamp to relate to other high-precision events on the system, you should instead use the [FromSystemRelativeTargetTime](perceptiontimestamphelper_fromsystemrelativetargettime_386334317.md) method, which operates in the QueryPerformanceCounter (QPC) time domain.
     * @param {DateTime} targetTime The moment in the past to target with the timestamp.
     * @returns {PerceptionTimestamp} 
     * @see https://learn.microsoft.com/uwp/api/windows.perception.perceptiontimestamphelper.fromhistoricaltargettime
     */
    static FromHistoricalTargetTime(targetTime) {
        if (!PerceptionTimestampHelper.HasProp("__IPerceptionTimestampHelperStatics")) {
            activatableClassId := HSTRING.Create("Windows.Perception.PerceptionTimestampHelper")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPerceptionTimestampHelperStatics.IID)
            PerceptionTimestampHelper.__IPerceptionTimestampHelperStatics := IPerceptionTimestampHelperStatics(factoryPtr)
        }

        return PerceptionTimestampHelper.__IPerceptionTimestampHelperStatics.FromHistoricalTargetTime(targetTime)
    }

    /**
     * Gets a timestamp that targets the specified system-relative time, represented in the system-relative QueryPerformanceCounter (QPC) time domain.
     * @remarks
     * The *targetTime* parameter uses 100ns interval QPC time. For more information on QPC time, see [Acquiring high-resolution time stamps](/windows/desktop/SysInfo/acquiring-high-resolution-time-stamps).
     * @param {TimeSpan} targetTime The system-relative moment in QPC time to target with the timestamp.
     * @returns {PerceptionTimestamp} 
     * @see https://learn.microsoft.com/uwp/api/windows.perception.perceptiontimestamphelper.fromsystemrelativetargettime
     */
    static FromSystemRelativeTargetTime(targetTime) {
        if (!PerceptionTimestampHelper.HasProp("__IPerceptionTimestampHelperStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Perception.PerceptionTimestampHelper")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPerceptionTimestampHelperStatics2.IID)
            PerceptionTimestampHelper.__IPerceptionTimestampHelperStatics2 := IPerceptionTimestampHelperStatics2(factoryPtr)
        }

        return PerceptionTimestampHelper.__IPerceptionTimestampHelperStatics2.FromSystemRelativeTargetTime(targetTime)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
