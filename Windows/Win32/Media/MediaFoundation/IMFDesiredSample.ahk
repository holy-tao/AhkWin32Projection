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
     * 
     * @param {Pointer<Integer>} phnsSampleTime 
     * @param {Pointer<Integer>} phnsSampleDuration 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/evr/nf-evr-imfdesiredsample-getdesiredsampletimeandduration
     */
    GetDesiredSampleTimeAndDuration(phnsSampleTime, phnsSampleDuration) {
        result := ComCall(3, this, "int64*", phnsSampleTime, "int64*", phnsSampleDuration, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} hnsSampleTime 
     * @param {Integer} hnsSampleDuration 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/evr/nf-evr-imfdesiredsample-setdesiredsampletimeandduration
     */
    SetDesiredSampleTimeAndDuration(hnsSampleTime, hnsSampleDuration) {
        ComCall(4, this, "int64", hnsSampleTime, "int64", hnsSampleDuration)
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/evr/nf-evr-imfdesiredsample-clear
     */
    Clear() {
        ComCall(5, this)
    }
}
