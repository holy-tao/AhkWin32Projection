#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\System\Com\IUnknown.ahk

/**
 * The IReferenceClock interface provides the reference time for the filter graph.Filters that can act as a reference clock can expose this interface.
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-ireferenceclock
 * @namespace Windows.Win32.Media
 * @version v4.0.30319
 */
class IReferenceClock extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IReferenceClock
     * @type {Guid}
     */
    static IID => Guid("{56a86897-0ad4-11ce-b03a-0020af0ba770}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetTime", "AdviseTime", "AdvisePeriodic", "Unadvise"]

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/wmformat/ireferenceclock-gettime
     */
    GetTime() {
        result := ComCall(3, this, "int64*", &pTime := 0, "HRESULT")
        return pTime
    }

    /**
     * 
     * @param {Integer} baseTime 
     * @param {Integer} streamTime 
     * @param {HANDLE} hEvent 
     * @returns {Pointer} 
     * @see https://learn.microsoft.com/windows/win32/wmformat/ireferenceclock-advisetime
     */
    AdviseTime(baseTime, streamTime, hEvent) {
        hEvent := hEvent is Win32Handle ? NumGet(hEvent, "ptr") : hEvent

        result := ComCall(4, this, "int64", baseTime, "int64", streamTime, "ptr", hEvent, "ptr*", &pdwAdviseCookie := 0, "HRESULT")
        return pdwAdviseCookie
    }

    /**
     * 
     * @param {Integer} startTime 
     * @param {Integer} periodTime 
     * @param {HANDLE} hSemaphore 
     * @returns {Pointer} 
     * @see https://learn.microsoft.com/windows/win32/wmformat/ireferenceclock-adviseperiodic
     */
    AdvisePeriodic(startTime, periodTime, hSemaphore) {
        hSemaphore := hSemaphore is Win32Handle ? NumGet(hSemaphore, "ptr") : hSemaphore

        result := ComCall(5, this, "int64", startTime, "int64", periodTime, "ptr", hSemaphore, "ptr*", &pdwAdviseCookie := 0, "HRESULT")
        return pdwAdviseCookie
    }

    /**
     * 
     * @param {Pointer} dwAdviseCookie 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/wmformat/ireferenceclock-unadvise
     */
    Unadvise(dwAdviseCookie) {
        result := ComCall(6, this, "ptr", dwAdviseCookie, "HRESULT")
        return result
    }
}
