#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\ITuner.ahk

/**
 * The IScanningTuner interface is implemented on the BDA Network Provider filter.
 * @remarks
 * 
  * Currently the DVB-C and DVB-S Network Provider filters do not implement this interface. The interface is implemented for DVB-T.
  * 
  * <b>OCUR Devices: </b>This interface supports OpenCable Unidirectional Cable Receiver (OCUR) devices. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mstv/ocur-devices">OCUR Devices</a>.
  * 
  * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IScanningTuner)</c>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//tuner/nn-tuner-iscanningtuner
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IScanningTuner extends ITuner{
    /**
     * The interface identifier for IScanningTuner
     * @type {Guid}
     */
    static IID => Guid("{1dfd0a5c-0284-11d3-9d8e-00c04f72d980}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 13

    /**
     * 
     * @returns {HRESULT} 
     */
    SeekUp() {
        result := ComCall(13, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    SeekDown() {
        result := ComCall(14, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} MillisecondsPause 
     * @returns {HRESULT} 
     */
    ScanUp(MillisecondsPause) {
        result := ComCall(15, this, "int", MillisecondsPause, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} MillisecondsPause 
     * @returns {HRESULT} 
     */
    ScanDown(MillisecondsPause) {
        result := ComCall(16, this, "int", MillisecondsPause, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    AutoProgram() {
        result := ComCall(17, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
