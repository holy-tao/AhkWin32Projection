#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMFPresentationClock.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Implemented by an app in order to get access to the IMFPresentationClock.
 * @remarks
 * 
  * The media pipeline checks for the presence of this interface by calling <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a>. Components can use the presentation clock supplied through this interface to determine how much buffering there is in the pipeline after the component. You can do  this in the <a href="https://docs.microsoft.com/windows/desktop/api/mftransform/nf-mftransform-imftransform-processinput">IMFTransform::ProcessInput</a> method by calculating the difference between the value returned by <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfpresentationclock-gettime">IMFPresentationClock::GetTime</a> and the value returned by <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfsample-getsampletime">IMFSample::GetSampleTime</a>. This difference represents the amount of buffered data after the MFT in the pipeline.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//mfidl/nn-mfidl-imfclockconsumer
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFClockConsumer extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFClockConsumer
     * @type {Guid}
     */
    static IID => Guid("{6ef2a662-47c0-4666-b13d-cbb717f2fa2c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetPresentationClock", "GetPresentationClock"]

    /**
     * 
     * @param {IMFPresentationClock} pPresentationClock 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfclockconsumer-setpresentationclock
     */
    SetPresentationClock(pPresentationClock) {
        result := ComCall(3, this, "ptr", pPresentationClock, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IMFPresentationClock} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfclockconsumer-getpresentationclock
     */
    GetPresentationClock() {
        result := ComCall(4, this, "ptr*", &ppPresentationClock := 0, "HRESULT")
        return IMFPresentationClock(ppPresentationClock)
    }
}
