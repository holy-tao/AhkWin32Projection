#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IMFPresentationClock.ahk" { IMFPresentationClock }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Implemented by an app in order to get access to the IMFPresentationClock.
 * @remarks
 * The media pipeline checks for the presence of this interface by calling <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a>. Components can use the presentation clock supplied through this interface to determine how much buffering there is in the pipeline after the component. You can do  this in the <a href="https://docs.microsoft.com/windows/desktop/api/mftransform/nf-mftransform-imftransform-processinput">IMFTransform::ProcessInput</a> method by calculating the difference between the value returned by <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfpresentationclock-gettime">IMFPresentationClock::GetTime</a> and the value returned by <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfsample-getsampletime">IMFSample::GetSampleTime</a>. This difference represents the amount of buffered data after the MFT in the pipeline.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/nn-mfidl-imfclockconsumer
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFClockConsumer extends IUnknown {
    /**
     * The interface identifier for IMFClockConsumer
     * @type {Guid}
     */
    static IID := Guid("{6ef2a662-47c0-4666-b13d-cbb717f2fa2c}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFClockConsumer interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetPresentationClock : IntPtr
        GetPresentationClock : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFClockConsumer.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Called by the media pipeline to provide the app with an instance of IMFPresentationClock.
     * @param {IMFPresentationClock} pPresentationClock An instance of <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfpresentationclock">IMFPresentationClock</a>.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     *           
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     *               
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfclockconsumer-setpresentationclock
     */
    SetPresentationClock(pPresentationClock) {
        result := ComCall(3, this, "ptr", pPresentationClock, "HRESULT")
        return result
    }

    /**
     * Called by the media pipeline to get an instance of IMFPresentationClock.
     * @returns {IMFPresentationClock} Pointer to an object that implements the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfpresentationclock">IMFPresentationClock</a> interface. This value can be null.
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfclockconsumer-getpresentationclock
     */
    GetPresentationClock() {
        result := ComCall(4, this, "ptr*", &ppPresentationClock := 0, "HRESULT")
        return IMFPresentationClock(ppPresentationClock)
    }

    Query(iid) {
        if (IMFClockConsumer.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetPresentationClock := CallbackCreate(GetMethod(implObj, "SetPresentationClock"), flags, 2)
        this.vtbl.GetPresentationClock := CallbackCreate(GetMethod(implObj, "GetPresentationClock"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetPresentationClock)
        CallbackFree(this.vtbl.GetPresentationClock)
    }
}
