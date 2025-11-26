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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SeekUp", "SeekDown", "ScanUp", "ScanDown", "AutoProgram"]

    /**
     * The SeekUp method changes the channel to the next higher channel with valid programming.
     * @returns {HRESULT} When the method succeeds, it returns S_OK. Otherwise it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-iscanningtuner-seekup
     */
    SeekUp() {
        result := ComCall(13, this, "HRESULT")
        return result
    }

    /**
     * The SeekDown method changes the channel to the next lower channel with valid programming.
     * @returns {HRESULT} When the method succeeds, it returns S_OK. Otherwise it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-iscanningtuner-seekdown
     */
    SeekDown() {
        result := ComCall(14, this, "HRESULT")
        return result
    }

    /**
     * The ScanUp method changes the channel to the next higher channel with valid programming, pauses for the specified number of milliseconds, then repeats until canceled.
     * @param {Integer} MillisecondsPause The number of milliseconds to pause.
     * @returns {HRESULT} When the method succeeds, it returns S_OK. Otherwise it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-iscanningtuner-scanup
     */
    ScanUp(MillisecondsPause) {
        result := ComCall(15, this, "int", MillisecondsPause, "HRESULT")
        return result
    }

    /**
     * The ScanDown method changes the channel to the next lower channel with valid programming, pauses for the specified number of milliseconds, then repeats until canceled.
     * @param {Integer} MillisecondsPause The number of milliseconds to pause.
     * @returns {HRESULT} When the method succeeds, it returns S_OK. Otherwise it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-iscanningtuner-scandown
     */
    ScanDown(MillisecondsPause) {
        result := ComCall(16, this, "int", MillisecondsPause, "HRESULT")
        return result
    }

    /**
     * The AutoProgram method scans for all channels with valid programming.
     * @returns {HRESULT} When the method succeeds, it returns S_OK. Otherwise it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//tuner/nf-tuner-iscanningtuner-autoprogram
     */
    AutoProgram() {
        result := ComCall(17, this, "HRESULT")
        return result
    }
}
