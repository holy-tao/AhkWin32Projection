#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Forces the encoder to encode the current frame as a key frame.
 * @see https://learn.microsoft.com/windows/win32/api/wmcodecdsp/nn-wmcodecdsp-iwmvideoforcekeyframe
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IWMVideoForceKeyFrame extends IUnknown {
    /**
     * The interface identifier for IWMVideoForceKeyFrame
     * @type {Guid}
     */
    static IID := Guid("{9f8496be-5b9a-41b9-a9e8-f21cd80596c2}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWMVideoForceKeyFrame interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetKeyFrame : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWMVideoForceKeyFrame.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Specifies that the current frame will be encoded as a key frame.
     * @remarks
     * To force the encoder to make the current frame a key frame, call this method before calling <b>IMediaObject::ProcessOutput</b> or <a href="https://docs.microsoft.com/windows/desktop/api/mftransform/nf-mftransform-imftransform-processoutput">IMFTransform::ProcessOutput</a>.
     * 
     * 
     * 
     * Each call to this method applies to a single frame. After processing this frame, the encoder resumes automatically assigning key frames (bounded by the maximum key frame distance).
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
     * @see https://learn.microsoft.com/windows/win32/api/wmcodecdsp/nf-wmcodecdsp-iwmvideoforcekeyframe-setkeyframe
     */
    SetKeyFrame() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWMVideoForceKeyFrame.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetKeyFrame := CallbackCreate(GetMethod(implObj, "SetKeyFrame"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetKeyFrame)
    }
}
