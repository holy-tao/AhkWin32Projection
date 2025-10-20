#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * For a particular seek position, gets the two nearest key frames.
 * @remarks
 * 
  * A media source can implement this interface as an optional service. To get a pointer to the interface, call <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-mfgetservice">IMFGetService::GetService</a> with the service identifier <b>MF_SCRUBBING_SERVICE</b>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//mfidl/nn-mfidl-imfseekinfo
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFSeekInfo extends IUnknown{
    /**
     * The interface identifier for IMFSeekInfo
     * @type {Guid}
     */
    static IID => Guid("{26afea53-d9ed-42b5-ab80-e64f9ee34779}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<Guid>} pguidTimeFormat 
     * @param {Pointer<PROPVARIANT>} pvarStartPosition 
     * @param {Pointer<PROPVARIANT>} pvarPreviousKeyFrame 
     * @param {Pointer<PROPVARIANT>} pvarNextKeyFrame 
     * @returns {HRESULT} 
     */
    GetNearestKeyFrames(pguidTimeFormat, pvarStartPosition, pvarPreviousKeyFrame, pvarNextKeyFrame) {
        result := ComCall(3, this, "ptr", pguidTimeFormat, "ptr", pvarStartPosition, "ptr", pvarPreviousKeyFrame, "ptr", pvarNextKeyFrame, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
