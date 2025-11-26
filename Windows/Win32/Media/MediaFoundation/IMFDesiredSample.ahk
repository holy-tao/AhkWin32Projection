#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Enables the presenter for the enhanced video renderer (EVR) to request a specific frame from the video mixer.
 * @see https://docs.microsoft.com/windows/win32/api//evr/nn-evr-imfdesiredsample
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFDesiredSample extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFDesiredSample
     * @type {Guid}
     */
    static IID => Guid("{56c294d0-753e-4260-8d61-a3d8820b1d54}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDesiredSampleTimeAndDuration", "SetDesiredSampleTimeAndDuration", "Clear"]

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
     * No time stamp was set for this sample. See <a href="/windows/desktop/api/evr/nf-evr-imfdesiredsample-clear">IMFDesiredSample::Clear</a>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//evr/nf-evr-imfdesiredsample-getdesiredsampletimeandduration
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
     * 
     * This value should be set prior to passing the buffer to the mixer for a Mix operation. The mixer sets the actual start and duration times on the sample before sending it back.
     * 
     * 
     * @param {Integer} hnsSampleTime The time of the requested sample.
     * @param {Integer} hnsSampleDuration The duration of the requested sample.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//evr/nf-evr-imfdesiredsample-setdesiredsampletimeandduration
     */
    SetDesiredSampleTimeAndDuration(hnsSampleTime, hnsSampleDuration) {
        ComCall(4, this, "int64", hnsSampleTime, "int64", hnsSampleDuration)
    }

    /**
     * Clears the time stamps previously set by a call to IMFDesiredSample::SetDesiredSampleTimeAndDuration.
     * @remarks
     * 
     * After this method is called, the <a href="https://docs.microsoft.com/windows/desktop/api/evr/nf-evr-imfdesiredsample-getdesiredsampletimeandduration">IMFDesiredSample::GetDesiredSampleTimeAndDuration</a> method returns MF_E_NOT_AVAILABLE.
     * 
     * This method also clears the time stamp and duration and removes all attributes from the sample.
     * 
     * 
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//evr/nf-evr-imfdesiredsample-clear
     */
    Clear() {
        ComCall(5, this)
    }
}
