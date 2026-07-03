#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Gets the time stamp of the next video frame to be decoded.
 * @see https://learn.microsoft.com/windows/win32/api/wmcodecdsp/nn-wmcodecdsp-iwmcodecoutputtimestamp
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IWMCodecOutputTimestamp extends IUnknown {
    /**
     * The interface identifier for IWMCodecOutputTimestamp
     * @type {Guid}
     */
    static IID := Guid("{b72adf95-7adc-4a72-bc05-577d8ea6bf68}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWMCodecOutputTimestamp interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetNextOutputTime : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWMCodecOutputTimestamp.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Queries the decoder for the time stamp of the upcoming output sample. Use this method if you need to know the time of the sample before calling IMediaObject::ProcessOutput or IMFTransform::ProcessOutput to get the sample.
     * @remarks
     * This method is important when decoding video using frame interpolation, because the rendering application cannot predict the time stamps of interpolated frames.
     * @param {Pointer<Integer>} prtTime Address of a variable that receives the presentation time of the next sample.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
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
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/wmcodecdsp/nf-wmcodecdsp-iwmcodecoutputtimestamp-getnextoutputtime
     */
    GetNextOutputTime(prtTime) {
        prtTimeMarshal := prtTime is VarRef ? "int64*" : "ptr"

        result := ComCall(3, this, prtTimeMarshal, prtTime, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWMCodecOutputTimestamp.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetNextOutputTime := CallbackCreate(GetMethod(implObj, "GetNextOutputTime"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetNextOutputTime)
    }
}
