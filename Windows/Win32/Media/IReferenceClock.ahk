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
     * The GetTime method retrieves the current reference time.
     * @returns {Integer} Pointer to a variable that receives the current time, in 100-nanosecond units.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-ireferenceclock-gettime
     */
    GetTime() {
        result := ComCall(3, this, "int64*", &pTime := 0, "HRESULT")
        return pTime
    }

    /**
     * The AdviseTime method creates a one-shot advise request.
     * @param {Integer} baseTime Base reference time, in 100-nanosecond units. See Remarks.
     * @param {Integer} streamTime Stream offset time, in 100-nanosecond units. See Remarks.
     * @param {HANDLE} hEvent Handle to an event, created by the caller.
     * @returns {Pointer} Pointer to a variable that receives an identifier for the advise request.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-ireferenceclock-advisetime
     */
    AdviseTime(baseTime, streamTime, hEvent) {
        hEvent := hEvent is Win32Handle ? NumGet(hEvent, "ptr") : hEvent

        result := ComCall(4, this, "int64", baseTime, "int64", streamTime, "ptr", hEvent, "ptr*", &pdwAdviseCookie := 0, "HRESULT")
        return pdwAdviseCookie
    }

    /**
     * The AdvisePeriodic method creates a periodic advise request.
     * @param {Integer} startTime Time of the first notification, in 100-nanosecond units. Must be greater than zero and less than MAX_TIME.
     * @param {Integer} periodTime Time between notifications, in 100-nanosecond units. Must be greater than zero.
     * @param {HANDLE} hSemaphore Handle to a semaphore, created by the caller.
     * @returns {Pointer} Pointer to a variable that receives an identifier for the advise request.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-ireferenceclock-adviseperiodic
     */
    AdvisePeriodic(startTime, periodTime, hSemaphore) {
        hSemaphore := hSemaphore is Win32Handle ? NumGet(hSemaphore, "ptr") : hSemaphore

        result := ComCall(5, this, "int64", startTime, "int64", periodTime, "ptr", hSemaphore, "ptr*", &pdwAdviseCookie := 0, "HRESULT")
        return pdwAdviseCookie
    }

    /**
     * The Unadvise method removes a pending advise request.
     * @param {Pointer} dwAdviseCookie Identifier of the request to remove. Use the value returned by <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-ireferenceclock-advisetime">IReferenceClock::AdviseTime</a> or <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-ireferenceclock-adviseperiodic">IReferenceClock::AdvisePeriodic</a> in the <i>pdwAdviseToken</i> parameter.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. Possible values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Not found.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-ireferenceclock-unadvise
     */
    Unadvise(dwAdviseCookie) {
        result := ComCall(6, this, "ptr", dwAdviseCookie, "HRESULT")
        return result
    }
}
