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
     * 
     * @param {Pointer<Int64>} phnsSampleTime 
     * @param {Pointer<Int64>} phnsSampleDuration 
     * @returns {HRESULT} 
     */
    GetDesiredSampleTimeAndDuration(phnsSampleTime, phnsSampleDuration) {
        result := ComCall(3, this, "int64*", phnsSampleTime, "int64*", phnsSampleDuration, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} hnsSampleTime 
     * @param {Integer} hnsSampleDuration 
     * @returns {String} Nothing - always returns an empty string
     */
    SetDesiredSampleTimeAndDuration(hnsSampleTime, hnsSampleDuration) {
        ComCall(4, this, "int64", hnsSampleTime, "int64", hnsSampleDuration)
        return result
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    Clear() {
        ComCall(5, this)
        return result
    }
}
