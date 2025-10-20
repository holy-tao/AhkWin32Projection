#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
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
     * 
     * @param {Pointer<ITuneRequest>} ppTR 
     * @returns {HRESULT} 
     */
    get_Tune(ppTR) {
        result := ComCall(18, this, "ptr", ppTR, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITuneRequest>} pTR 
     * @returns {HRESULT} 
     */
    put_Tune(pTR) {
        result := ComCall(19, this, "ptr", pTR, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITuningSpace>} plTS 
     * @returns {HRESULT} 
     */
    get_TuningSpace(plTS) {
        result := ComCall(20, this, "ptr", plTS, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITuningSpace>} plTS 
     * @returns {HRESULT} 
     */
    put_TuningSpace(plTS) {
        result := ComCall(21, this, "ptr", plTS, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
