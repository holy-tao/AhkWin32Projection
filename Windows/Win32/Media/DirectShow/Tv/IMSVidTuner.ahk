#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\ITuneRequest.ahk
#Include .\ITuningSpace.ahk
#Include .\IMSVidVideoInputDevice.ahk

/**
 * The IMSVidTuner interface manages tuning devices.
 * @remarks
 * 
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IMSVidTuner)</c>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//segment/nn-segment-imsvidtuner
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IMSVidTuner extends IMSVidVideoInputDevice{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMSVidTuner
     * @type {Guid}
     */
    static IID => Guid("{1c15d47d-911d-11d2-b632-00c04f79498e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 18

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Tune", "put_Tune", "get_TuningSpace", "put_TuningSpace"]

    /**
     * @type {ITuneRequest} 
     */
    Tune {
        get => this.get_Tune()
        set => this.put_Tune(value)
    }

    /**
     * @type {ITuningSpace} 
     */
    TuningSpace {
        get => this.get_TuningSpace()
        set => this.put_TuningSpace(value)
    }

    /**
     * The get_Tune method retrieves the current tune request.
     * @returns {ITuneRequest} Pointer to a variable that receives an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tuner/nn-tuner-itunerequest">ITuneRequest</a> interface pointer.
     * @see https://docs.microsoft.com/windows/win32/api//segment/nf-segment-imsvidtuner-get_tune
     */
    get_Tune() {
        result := ComCall(18, this, "ptr*", &ppTR := 0, "HRESULT")
        return ITuneRequest(ppTR)
    }

    /**
     * The put_Tune method specifies the tune request.
     * @param {ITuneRequest} pTR Specifies a pointer to the tune request's <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tuner/nn-tuner-itunerequest">ITuneRequest</a> interface.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://docs.microsoft.com/windows/win32/api//segment/nf-segment-imsvidtuner-put_tune
     */
    put_Tune(pTR) {
        result := ComCall(19, this, "ptr", pTR, "HRESULT")
        return result
    }

    /**
     * The get_TuningSpace method retrieves the current tuning space.
     * @returns {ITuningSpace} Pointer to a variable that receives an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tuner/nn-tuner-ituningspace">ITuningSpace</a> interface pointer.
     * @see https://docs.microsoft.com/windows/win32/api//segment/nf-segment-imsvidtuner-get_tuningspace
     */
    get_TuningSpace() {
        result := ComCall(20, this, "ptr*", &plTS := 0, "HRESULT")
        return ITuningSpace(plTS)
    }

    /**
     * The put_TuningSpace method specifies the tuning space.
     * @param {ITuningSpace} plTS Specifies a pointer to the tuning space's <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tuner/nn-tuner-ituningspace">ITuningSpace</a> interface.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://docs.microsoft.com/windows/win32/api//segment/nf-segment-imsvidtuner-put_tuningspace
     */
    put_TuningSpace(plTS) {
        result := ComCall(21, this, "ptr", plTS, "HRESULT")
        return result
    }
}
