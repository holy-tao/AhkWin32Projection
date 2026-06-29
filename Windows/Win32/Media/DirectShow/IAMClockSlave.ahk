#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IAMClockSlave interface controls the tolerance of an audio renderer when it is matching rates with another clock.If the audio renderer is matching rates with another clock, it allows the audio to drift up to the amount of the specified tolerance.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/nn-strmif-iamclockslave
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct IAMClockSlave extends IUnknown {
    /**
     * The interface identifier for IAMClockSlave
     * @type {Guid}
     */
    static IID := Guid("{9fd52741-176d-4b36-8f51-ca8f933223be}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAMClockSlave interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetErrorTolerance : IntPtr
        GetErrorTolerance : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAMClockSlave.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The SetErrorTolerance method sets the audio renderer's rate-matching tolerance.
     * @remarks
     * Changing the tolerance has no effect unless the audio renderer is matching rates with a different clock. If the audio renderer is the reference clock, the audio is always synchronized to the clock (by definition).
     * 
     * This method fails if the filter graph is not stopped.
     * @param {Integer} dwTolerance Specifies the maximum tolerance, in milliseconds. The value must be from 1 to 1000, inclusive.
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
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Failure.
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
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VFW_E_NOT_STOPPED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The filter graph is not stopped.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamclockslave-seterrortolerance
     */
    SetErrorTolerance(dwTolerance) {
        result := ComCall(3, this, "uint", dwTolerance, "HRESULT")
        return result
    }

    /**
     * The GetErrorTolerance method retrieves the audio renderer's rate-matching tolerance.
     * @returns {Integer} Pointer to a variable that receives the maximum tolerance, in milliseconds.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iamclockslave-geterrortolerance
     */
    GetErrorTolerance() {
        result := ComCall(4, this, "uint*", &pdwTolerance := 0, "HRESULT")
        return pdwTolerance
    }

    Query(iid) {
        if (IAMClockSlave.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetErrorTolerance := CallbackCreate(GetMethod(implObj, "SetErrorTolerance"), flags, 2)
        this.vtbl.GetErrorTolerance := CallbackCreate(GetMethod(implObj, "GetErrorTolerance"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetErrorTolerance)
        CallbackFree(this.vtbl.GetErrorTolerance)
    }
}
