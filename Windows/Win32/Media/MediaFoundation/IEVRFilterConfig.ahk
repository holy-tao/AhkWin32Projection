#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Sets the number of input pins on the DirectShow Enhanced Video Renderer (EVR) filter.
 * @remarks
 * The DirectShow EVR filter starts with one input pin, which corresponds to the reference stream. To create additional pins for video substreams, call <a href="https://docs.microsoft.com/windows/desktop/api/evr/nf-evr-ievrfilterconfig-setnumberofstreams">SetNumberOfStreams</a>.
 * 
 * The EVR media sink for Media Foundation does not support this interface. To add new streams to the EVR media sink, call <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfmediasink-addstreamsink">IMFMediaSink::AddStreamSink</a>.
 * @see https://learn.microsoft.com/windows/win32/api/evr/nn-evr-ievrfilterconfig
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IEVRFilterConfig extends IUnknown {
    /**
     * The interface identifier for IEVRFilterConfig
     * @type {Guid}
     */
    static IID := Guid("{83e91e85-82c1-4ea7-801d-85dc50b75086}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IEVRFilterConfig interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetNumberOfStreams : IntPtr
        GetNumberOfStreams : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IEVRFilterConfig.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Sets the number of input pins on the EVR filter.
     * @remarks
     * After this method has been called, it cannot be called a second time on the same instance of the EVR filter. Also, the method fails if any input pins are connected.
     * @param {Integer} dwMaxStreams Specifies the total number of input pins on the EVR filter. This value includes the input pin for the reference stream, which is created by default. For example, to mix one substream plus the reference stream, set this parameter to 2.
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
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid number of streams. The minimum is one, and the maximum is 16.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VFW_E_WRONG_STATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This method has already been called, or at least one pin is already connected.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/evr/nf-evr-ievrfilterconfig-setnumberofstreams
     */
    SetNumberOfStreams(dwMaxStreams) {
        result := ComCall(3, this, "uint", dwMaxStreams, "HRESULT")
        return result
    }

    /**
     * Retrieves the number of input pins on the EVR filter. The EVR filter always has at least one input pin, which corresponds to the reference stream.
     * @returns {Integer} Receives the number of streams.
     * @see https://learn.microsoft.com/windows/win32/api/evr/nf-evr-ievrfilterconfig-getnumberofstreams
     */
    GetNumberOfStreams() {
        result := ComCall(4, this, "uint*", &pdwMaxStreams := 0, "HRESULT")
        return pdwMaxStreams
    }

    Query(iid) {
        if (IEVRFilterConfig.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetNumberOfStreams := CallbackCreate(GetMethod(implObj, "SetNumberOfStreams"), flags, 2)
        this.vtbl.GetNumberOfStreams := CallbackCreate(GetMethod(implObj, "GetNumberOfStreams"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetNumberOfStreams)
        CallbackFree(this.vtbl.GetNumberOfStreams)
    }
}
