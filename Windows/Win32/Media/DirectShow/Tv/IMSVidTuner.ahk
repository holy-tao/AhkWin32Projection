#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\ITuningSpace.ahk" { ITuningSpace }
#Import ".\IMSVidVideoInputDevice.ahk" { IMSVidVideoInputDevice }
#Import ".\ITuneRequest.ahk" { ITuneRequest }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * The IMSVidTuner interface manages tuning devices.
 * @remarks
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IMSVidTuner)</c>.
 * @see https://learn.microsoft.com/windows/win32/api/segment/nn-segment-imsvidtuner
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct IMSVidTuner extends IMSVidVideoInputDevice {
    /**
     * The interface identifier for IMSVidTuner
     * @type {Guid}
     */
    static IID := Guid("{1c15d47d-911d-11d2-b632-00c04f79498e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMSVidTuner interfaces
    */
    struct Vtbl extends IMSVidVideoInputDevice.Vtbl {
        get_Tune        : IntPtr
        put_Tune        : IntPtr
        get_TuningSpace : IntPtr
        put_TuningSpace : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMSVidTuner.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * @remarks
     * The returned <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tuner/nn-tuner-itunerequest">ITuneRequest</a> interface has an outstanding reference count. The caller must release the interface.
     * @returns {ITuneRequest} Pointer to a variable that receives an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tuner/nn-tuner-itunerequest">ITuneRequest</a> interface pointer.
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidtuner-get_tune
     */
    get_Tune() {
        result := ComCall(18, this, "ptr*", &ppTR := 0, "HRESULT")
        return ITuneRequest(ppTR)
    }

    /**
     * The put_Tune method specifies the tune request.
     * @param {ITuneRequest} pTR Specifies a pointer to the tune request's <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tuner/nn-tuner-itunerequest">ITuneRequest</a> interface.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidtuner-put_tune
     */
    put_Tune(pTR) {
        result := ComCall(19, this, "ptr", pTR, "HRESULT")
        return result
    }

    /**
     * The get_TuningSpace method retrieves the current tuning space.
     * @remarks
     * The returned <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tuner/nn-tuner-ituningspace">ITuningSpace</a> interface has an outstanding reference count. The caller must release the interface.
     * @returns {ITuningSpace} Pointer to a variable that receives an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tuner/nn-tuner-ituningspace">ITuningSpace</a> interface pointer.
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidtuner-get_tuningspace
     */
    get_TuningSpace() {
        result := ComCall(20, this, "ptr*", &plTS := 0, "HRESULT")
        return ITuningSpace(plTS)
    }

    /**
     * The put_TuningSpace method specifies the tuning space.
     * @param {ITuningSpace} plTS Specifies a pointer to the tuning space's <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/tuner/nn-tuner-ituningspace">ITuningSpace</a> interface.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidtuner-put_tuningspace
     */
    put_TuningSpace(plTS) {
        result := ComCall(21, this, "ptr", plTS, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMSVidTuner.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Tune := CallbackCreate(GetMethod(implObj, "get_Tune"), flags, 2)
        this.vtbl.put_Tune := CallbackCreate(GetMethod(implObj, "put_Tune"), flags, 2)
        this.vtbl.get_TuningSpace := CallbackCreate(GetMethod(implObj, "get_TuningSpace"), flags, 2)
        this.vtbl.put_TuningSpace := CallbackCreate(GetMethod(implObj, "put_TuningSpace"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Tune)
        CallbackFree(this.vtbl.put_Tune)
        CallbackFree(this.vtbl.get_TuningSpace)
        CallbackFree(this.vtbl.put_TuningSpace)
    }
}
