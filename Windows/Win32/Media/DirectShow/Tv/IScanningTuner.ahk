#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ITuner.ahk" { ITuner }

/**
 * The IScanningTuner interface is implemented on the BDA Network Provider filter.
 * @remarks
 * Currently the DVB-C and DVB-S Network Provider filters do not implement this interface. The interface is implemented for DVB-T.
 * 
 * <b>OCUR Devices: </b>This interface supports OpenCable Unidirectional Cable Receiver (OCUR) devices. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mstv/ocur-devices">OCUR Devices</a>.
 * 
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IScanningTuner)</c>.
 * @see https://learn.microsoft.com/windows/win32/api/tuner/nn-tuner-iscanningtuner
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct IScanningTuner extends ITuner {
    /**
     * The interface identifier for IScanningTuner
     * @type {Guid}
     */
    static IID := Guid("{1dfd0a5c-0284-11d3-9d8e-00c04f72d980}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IScanningTuner interfaces
    */
    struct Vtbl extends ITuner.Vtbl {
        SeekUp      : IntPtr
        SeekDown    : IntPtr
        ScanUp      : IntPtr
        ScanDown    : IntPtr
        AutoProgram : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IScanningTuner.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The SeekUp method changes the channel to the next higher channel with valid programming.
     * @remarks
     * This method returns immediately, and the seek continues in the background. The seek can be canceled by calling any other tuning operation.
     * 
     * Currently the DVB-C and DVB-S Network Provider filters do not implement this method, and return E_NOTIMPL. The method is implemented for DVB-T.
     * @returns {HRESULT} When the method succeeds, it returns S_OK. Otherwise it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-iscanningtuner-seekup
     */
    SeekUp() {
        result := ComCall(13, this, "HRESULT")
        return result
    }

    /**
     * The SeekDown method changes the channel to the next lower channel with valid programming.
     * @remarks
     * This method returns immediately, and the seek continues in the background. The seek can be canceled by calling any other tuning operation.
     * 
     * Currently the DVB-C and DVB-S Network Provider filters do not implement this method, and return E_NOTIMPL. The method is implemented for DVB-T.
     * @returns {HRESULT} When the method succeeds, it returns S_OK. Otherwise it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-iscanningtuner-seekdown
     */
    SeekDown() {
        result := ComCall(14, this, "HRESULT")
        return result
    }

    /**
     * The ScanUp method changes the channel to the next higher channel with valid programming, pauses for the specified number of milliseconds, then repeats until canceled.
     * @remarks
     * The call returns immediately, while the scan continues in the background. The scan can be canceled by calling any other tuning operation.
     * 
     * Currently the DVB-C and DVB-S Network Provider filters do not implement this method, and return E_NOTIMPL. The method is implemented for DVB-T.
     * @param {Integer} MillisecondsPause The number of milliseconds to pause.
     * @returns {HRESULT} When the method succeeds, it returns S_OK. Otherwise it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-iscanningtuner-scanup
     */
    ScanUp(MillisecondsPause) {
        result := ComCall(15, this, "int", MillisecondsPause, "HRESULT")
        return result
    }

    /**
     * The ScanDown method changes the channel to the next lower channel with valid programming, pauses for the specified number of milliseconds, then repeats until canceled.
     * @remarks
     * The call returns immediately, while the scan continues in the background. The scan can be canceled by calling any other tuning operation.
     * 
     * Currently the DVB-C and DVB-S Network Provider filters do not implement this method, and return E_NOTIMPL. The method is implemented for DVB-T.
     * @param {Integer} MillisecondsPause The number of milliseconds to pause.
     * @returns {HRESULT} When the method succeeds, it returns S_OK. Otherwise it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-iscanningtuner-scandown
     */
    ScanDown(MillisecondsPause) {
        result := ComCall(16, this, "int", MillisecondsPause, "HRESULT")
        return result
    }

    /**
     * The AutoProgram method scans for all channels with valid programming.
     * @remarks
     * This method returns immediately, and the scan continues in the background. If the device allows it, the scan can be canceled by calling any other tuning operation. Otherwise, the scan will complete once all channels have been visited once. Internal devices will likely have a software implementation of this feature, and will collect fine-tuning information resulting from the scan. External devices will likely implement this feature, so this is just a means to trigger the process.
     * 
     * Currently the DVB-C and DVB-S Network Provider filters do not implement this method, and return E_NOTIMPL. The method is implemented for DVB-T.
     * @returns {HRESULT} When the method succeeds, it returns S_OK. Otherwise it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-iscanningtuner-autoprogram
     */
    AutoProgram() {
        result := ComCall(17, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IScanningTuner.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SeekUp := CallbackCreate(GetMethod(implObj, "SeekUp"), flags, 1)
        this.vtbl.SeekDown := CallbackCreate(GetMethod(implObj, "SeekDown"), flags, 1)
        this.vtbl.ScanUp := CallbackCreate(GetMethod(implObj, "ScanUp"), flags, 2)
        this.vtbl.ScanDown := CallbackCreate(GetMethod(implObj, "ScanDown"), flags, 2)
        this.vtbl.AutoProgram := CallbackCreate(GetMethod(implObj, "AutoProgram"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SeekUp)
        CallbackFree(this.vtbl.SeekDown)
        CallbackFree(this.vtbl.ScanUp)
        CallbackFree(this.vtbl.ScanDown)
        CallbackFree(this.vtbl.AutoProgram)
    }
}
