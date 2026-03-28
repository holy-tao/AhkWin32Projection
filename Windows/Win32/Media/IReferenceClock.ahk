#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\System\Com\IUnknown.ahk

/**
 * The IReferenceClock interface provides access to an external clock. This interface is provided to enable all rendering routines to be synchronized to the same clock.This interface can be obtained from a reader object.
 * @remarks
 * The **IReferenceClock** interface inherits from the [**IUnknown**](/windows/desktop/api/unknwn/nn-unknwn-iunknown) interface. **IReferenceClock** also has these types of members:
 * 
 * -   [Methods](#methods)
 * 
 * 
 * For information on other interfaces that can be obtained by using the QueryInterface method of this interface, see Reader Object.
 * @see https://learn.microsoft.com/windows/win32/wmformat/ireferenceclock
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
     * @see https://learn.microsoft.com/windows/win32/wmformat/ireferenceclock-gettime
     */
    GetTime() {
        result := ComCall(3, this, "int64*", &pTime := 0, "HRESULT")
        return pTime
    }

    /**
     * The AdviseTime method requests an asynchronous notification that a time has elapsed.
     * @param {Integer} baseTime 
     * @param {Integer} streamTime 
     * @param {HANDLE} hEvent Handle to an event, created by the caller. This event will be signaled when the time specified elapses.
     * @returns {Pointer} Pointer to a variable that receives an identifier for the request. This is used to identify this call to **AdviseTime** in the future for example, to cancel the request.
     * @see https://learn.microsoft.com/windows/win32/wmformat/ireferenceclock-advisetime
     */
    AdviseTime(baseTime, streamTime, hEvent) {
        hEvent := hEvent is Win32Handle ? NumGet(hEvent, "ptr") : hEvent

        result := ComCall(4, this, "int64", baseTime, "int64", streamTime, "ptr", hEvent, "ptr*", &pdwAdviseCookie := 0, "HRESULT")
        return pdwAdviseCookie
    }

    /**
     * This method is not implemented.
     * @param {Integer} startTime 
     * @param {Integer} periodTime 
     * @param {HANDLE} _hSemaphore 
     * @returns {Pointer} 
     * @see https://learn.microsoft.com/windows/win32/wmformat/ireferenceclock-adviseperiodic
     */
    AdvisePeriodic(startTime, periodTime, _hSemaphore) {
        _hSemaphore := _hSemaphore is Win32Handle ? NumGet(_hSemaphore, "ptr") : _hSemaphore

        result := ComCall(5, this, "int64", startTime, "int64", periodTime, "ptr", _hSemaphore, "ptr*", &pdwAdviseCookie := 0, "HRESULT")
        return pdwAdviseCookie
    }

    /**
     * The Unadvise method cancels a notification request.
     * @param {Pointer} dwAdviseCookie Identifier of the request to remove. Use the value returned by AdviseTime in the pdwAdviseCookie parameter.
     * @returns {HRESULT} The method returns an **HRESULT**. Possible values include, but are not limited to, those in the following table.
     * 
     * 
     * 
     * | Return code                                                                             | Description                                         |
     * |-----------------------------------------------------------------------------------------|-----------------------------------------------------|
     * | <dl> <dt>**S\_OK**</dt> </dl>    | The method succeeded.<br/>                    |
     * | <dl> <dt>**S\_FALSE**</dt> </dl> | The identifier passed in does not exist.<br/> |
     * @see https://learn.microsoft.com/windows/win32/wmformat/ireferenceclock-unadvise
     */
    Unadvise(dwAdviseCookie) {
        result := ComCall(6, this, "ptr", dwAdviseCookie, "HRESULT")
        return result
    }
}
