#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\System\Com\IUnknown.ahk

/**
 * The IReferenceClock interface provides the reference time for the filter graph.Filters that can act as a reference clock can expose this interface.
 * @see https://learn.microsoft.com/windows/win32/api//content/strmif/nn-strmif-ireferenceclock
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
     * @see https://learn.microsoft.com/windows/win32/api//content/strmif/nf-strmif-ireferenceclock-gettime
     */
    GetTime() {
        result := ComCall(3, this, "int64*", &pTime := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pTime
    }

    /**
     * The AdviseTime method creates a one-shot advise request.
     * @remarks
     * This method creates a one-shot advise request for the reference time <i>rtBaseTime</i> + <i>rtStreamTime</i>. The sum must be greater than zero and less than MAX_TIME, or the method returns E_INVALIDARG. At the requested time, the clock signals the event specified in the <i>hEvent</i> parameter.
     * 
     * To cancel the notification before the time is reached, call the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-ireferenceclock-unadvise">Unadvise</a> method and pass the <i>pdwAdviseToken</i> value returned from this call. After the notification has occurred, the clock automatically clears it, so it is not necessary to call <b>Unadvise</b>. However, it is not an error to do so.
     * @param {Integer} baseTime Base reference time, in 100-nanosecond units. See Remarks.
     * @param {Integer} streamTime Stream offset time, in 100-nanosecond units. See Remarks.
     * @param {HANDLE} hEvent Handle to an event, created by the caller.
     * @returns {Pointer} Pointer to a variable that receives an identifier for the advise request.
     * @see https://learn.microsoft.com/windows/win32/api//content/strmif/nf-strmif-ireferenceclock-advisetime
     */
    AdviseTime(baseTime, streamTime, hEvent) {
        hEvent := hEvent is Win32Handle ? NumGet(hEvent, "ptr") : hEvent

        result := ComCall(4, this, "int64", baseTime, "int64", streamTime, "ptr", hEvent, "ptr*", &pdwAdviseCookie := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pdwAdviseCookie
    }

    /**
     * The AdvisePeriodic method creates a periodic advise request.
     * @remarks
     * At each notification time, the clock releases the semaphore specified in the <i>hSemaphore</i> parameter. When no further notifications are required, call <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-ireferenceclock-unadvise">IReferenceClock::Unadvise</a> and pass the <i>pdwAdviseToken</i> value returned from this call.
     * 
     * The following code example creates an advise request that signals five seconds from the time it is created, and again every second thereafter:
     * 
     * <div class="code"><span><table>
     * <tr>
     * <th>C++</th>
     * </tr>
     * <tr>
     * <td>
     * <pre>
     * IReferenceClock *pRefClock = NULL;
     * // Get an IReferenceClock pointer (not shown).
     * 
     * DWORD          dwAdviseToken;
     * HANDLE         hSemaphore = CreateSemaphore(NULL, 0, 0x7FFFFFFF, NULL);
     * REFERENCE_TIME rtPeriodTime = 10000000; // A one-second interval
     * REFERENCE_TIME rtNow;
     * 
     * pRefClock-&gt;GetTime(&amp;rtNow);
     * pRefClock-&gt;AdvisePeriodic(rtNow + (5 * rtPeriodTime),
     *                           rtPeriodTime, 
     *                           hSemaphore, 
     *                           &amp;dwAdviseToken);
     * ...
     * 
     * pRefClock-&gt;Unadvise(dwAdviseToken);
     * </pre>
     * </td>
     * </tr>
     * </table></span></div>
     * @param {Integer} startTime Time of the first notification, in 100-nanosecond units. Must be greater than zero and less than MAX_TIME.
     * @param {Integer} periodTime Time between notifications, in 100-nanosecond units. Must be greater than zero.
     * @param {HANDLE} hSemaphore_ Handle to a semaphore, created by the caller.
     * @returns {Pointer} Pointer to a variable that receives an identifier for the advise request.
     * @see https://learn.microsoft.com/windows/win32/api//content/strmif/nf-strmif-ireferenceclock-adviseperiodic
     */
    AdvisePeriodic(startTime, periodTime, hSemaphore_) {
        hSemaphore_ := hSemaphore_ is Win32Handle ? NumGet(hSemaphore_, "ptr") : hSemaphore_

        result := ComCall(5, this, "int64", startTime, "int64", periodTime, "ptr", hSemaphore_, "ptr*", &pdwAdviseCookie := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @see https://learn.microsoft.com/windows/win32/api//content/strmif/nf-strmif-ireferenceclock-unadvise
     */
    Unadvise(dwAdviseCookie) {
        result := ComCall(6, this, "ptr", dwAdviseCookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
