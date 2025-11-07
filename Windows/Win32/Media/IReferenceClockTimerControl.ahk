#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\System\Com\IUnknown.ahk

/**
 * The IReferenceClockTimerControl interface changes the timer period used by a reference clock. This interface is exposed by the DirectShow System Reference Clock.
 * @remarks
 * 
 * By default, the system reference clock in DirectShow sets the timer period to the minimum value allowed by the timer. Typically, this value is 1 millisecond.
 * 
 * The timer period is a global settings in Windows. A higher resolution can improve the accuracy of time-out intervals in wait functions. However, it can also reduce overall system performance, because the thread scheduler switches tasks more often. High resolutions can also prevent the CPU power management system from entering power-saving modes. Setting a higher resolution does not improve the accuracy of the high-resolution performance counter.
 * 
 * The main purpose of this interface is to override the reference clock's default timer setting. To do so, call <b>SetDefaultTimerResolution</b> with the value zero. This can result in a lower timer resolution, which might enable the user's computer to enter a power saving mode. (The actual behavior depends on many other factors, such as what other processes are running.) The <a href="https://docs.microsoft.com/windows/desktop/DirectShow/dvd-navigator-filter">DVD Navigator</a> filter uses this interface as described here.
 * 
 * If a DirectShow filter requires a higher timer resolution, it should call <a href="https://docs.microsoft.com/windows/desktop/api/timeapi/nf-timeapi-timebeginperiod">timeBeginPeriod</a>. Typically this requirement would apply only to renderer filters.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-ireferenceclocktimercontrol
 * @namespace Windows.Win32.Media
 * @version v4.0.30319
 */
class IReferenceClockTimerControl extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IReferenceClockTimerControl
     * @type {Guid}
     */
    static IID => Guid("{ebec459c-2eca-4d42-a8af-30df557614b8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetDefaultTimerResolution", "GetDefaultTimerResolution"]

    /**
     * 
     * @param {Integer} timerResolution 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ireferenceclocktimercontrol-setdefaulttimerresolution
     */
    SetDefaultTimerResolution(timerResolution) {
        result := ComCall(3, this, "int64", timerResolution, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ireferenceclocktimercontrol-getdefaulttimerresolution
     */
    GetDefaultTimerResolution() {
        result := ComCall(4, this, "int64*", &pTimerResolution := 0, "HRESULT")
        return pTimerResolution
    }
}
