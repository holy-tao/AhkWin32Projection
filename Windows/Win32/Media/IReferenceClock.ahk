#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\Guid.ahk" { Guid }
#Import "..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\System\Com\IUnknown.ahk" { IUnknown }

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
 */
export default struct IReferenceClock extends IUnknown {
    /**
     * The interface identifier for IReferenceClock
     * @type {Guid}
     */
    static IID := Guid("{56a86897-0ad4-11ce-b03a-0020af0ba770}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IReferenceClock interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetTime        : IntPtr
        AdviseTime     : IntPtr
        AdvisePeriodic : IntPtr
        Unadvise       : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IReferenceClock.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
        result := ComCall(4, this, "int64", baseTime, "int64", streamTime, HANDLE, hEvent, "ptr*", &pdwAdviseCookie := 0, "HRESULT")
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
        result := ComCall(5, this, "int64", startTime, "int64", periodTime, HANDLE, _hSemaphore, "ptr*", &pdwAdviseCookie := 0, "HRESULT")
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

    Query(iid) {
        if (IReferenceClock.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetTime := CallbackCreate(GetMethod(implObj, "GetTime"), flags, 2)
        this.vtbl.AdviseTime := CallbackCreate(GetMethod(implObj, "AdviseTime"), flags, 5)
        this.vtbl.AdvisePeriodic := CallbackCreate(GetMethod(implObj, "AdvisePeriodic"), flags, 5)
        this.vtbl.Unadvise := CallbackCreate(GetMethod(implObj, "Unadvise"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetTime)
        CallbackFree(this.vtbl.AdviseTime)
        CallbackFree(this.vtbl.AdvisePeriodic)
        CallbackFree(this.vtbl.Unadvise)
    }
}
