#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Enables the presenter for the enhanced video renderer (EVR) to request a specific frame from the video mixer.
 * @see https://learn.microsoft.com/windows/win32/api/evr/nn-evr-imfdesiredsample
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFDesiredSample extends IUnknown {
    /**
     * The interface identifier for IMFDesiredSample
     * @type {Guid}
     */
    static IID := Guid("{56c294d0-753e-4260-8d61-a3d8820b1d54}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFDesiredSample interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetDesiredSampleTimeAndDuration : IntPtr
        SetDesiredSampleTimeAndDuration : IntPtr
        Clear                           : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFDesiredSample.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Called by the mixer to get the time and duration of the sample requested by the presenter.
     * @param {Pointer<Integer>} phnsSampleTime Receives the desired sample time that should be mixed.
     * @param {Pointer<Integer>} phnsSampleDuration Receives the sample duration that should be mixed.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_NOT_AVAILABLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No time stamp was set for this sample. See <a href="https://docs.microsoft.com/windows/desktop/api/evr/nf-evr-imfdesiredsample-clear">IMFDesiredSample::Clear</a>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/evr/nf-evr-imfdesiredsample-getdesiredsampletimeandduration
     */
    GetDesiredSampleTimeAndDuration(phnsSampleTime, phnsSampleDuration) {
        phnsSampleTimeMarshal := phnsSampleTime is VarRef ? "int64*" : "ptr"
        phnsSampleDurationMarshal := phnsSampleDuration is VarRef ? "int64*" : "ptr"

        result := ComCall(3, this, phnsSampleTimeMarshal, phnsSampleTime, phnsSampleDurationMarshal, phnsSampleDuration, "HRESULT")
        return result
    }

    /**
     * Called by the presenter to set the time and duration of the sample that it requests from the mixer.
     * @remarks
     * This value should be set prior to passing the buffer to the mixer for a Mix operation. The mixer sets the actual start and duration times on the sample before sending it back.
     * @param {Integer} hnsSampleTime The time of the requested sample.
     * @param {Integer} hnsSampleDuration The duration of the requested sample.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/evr/nf-evr-imfdesiredsample-setdesiredsampletimeandduration
     */
    SetDesiredSampleTimeAndDuration(hnsSampleTime, hnsSampleDuration) {
        ComCall(4, this, "int64", hnsSampleTime, "int64", hnsSampleDuration)
    }

    /**
     * Clears the time stamps previously set by a call to IMFDesiredSample::SetDesiredSampleTimeAndDuration.
     * @remarks
     * After this method is called, the <a href="https://docs.microsoft.com/windows/desktop/api/evr/nf-evr-imfdesiredsample-getdesiredsampletimeandduration">IMFDesiredSample::GetDesiredSampleTimeAndDuration</a> method returns MF_E_NOT_AVAILABLE.
     * 
     * This method also clears the time stamp and duration and removes all attributes from the sample.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/evr/nf-evr-imfdesiredsample-clear
     */
    Clear() {
        ComCall(5, this)
    }

    Query(iid) {
        if (IMFDesiredSample.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetDesiredSampleTimeAndDuration := CallbackCreate(GetMethod(implObj, "GetDesiredSampleTimeAndDuration"), flags, 3)
        this.vtbl.SetDesiredSampleTimeAndDuration := CallbackCreate(GetMethod(implObj, "SetDesiredSampleTimeAndDuration"), flags, 3)
        this.vtbl.Clear := CallbackCreate(GetMethod(implObj, "Clear"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetDesiredSampleTimeAndDuration)
        CallbackFree(this.vtbl.SetDesiredSampleTimeAndDuration)
        CallbackFree(this.vtbl.Clear)
    }
}
