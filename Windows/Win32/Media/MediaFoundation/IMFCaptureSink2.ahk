#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IMFCaptureSink.ahk" { IMFCaptureSink }
#Import ".\IMFAttributes.ahk" { IMFAttributes }
#Import ".\IMFMediaType.ahk" { IMFMediaType }

/**
 * Extends the IMFCaptureSink interface to provide functionality for dynamically setting the output media type of the record sink or preview sink.
 * @see https://learn.microsoft.com/windows/win32/api/mfcaptureengine/nn-mfcaptureengine-imfcapturesink2
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFCaptureSink2 extends IMFCaptureSink {
    /**
     * The interface identifier for IMFCaptureSink2
     * @type {Guid}
     */
    static IID := Guid("{f9e4219e-6197-4b5e-b888-bee310ab2c59}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFCaptureSink2 interfaces
    */
    struct Vtbl extends IMFCaptureSink.Vtbl {
        SetOutputMediaType : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFCaptureSink2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Dynamically sets the output media type of the record sink or preview sink.
     * @remarks
     * This is an asynchronous call.  Listen to the <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-capture-engine-output-media-type-set">MF_CAPTURE_ENGINE_OUTPUT_MEDIA_TYPE_SET</a> event
     * to be notified when the output media type has been set.
     * @param {Integer} dwStreamIndex The stream index to change the output media type on.
     * @param {IMFMediaType} pMediaType The new output media type.
     * @param {IMFAttributes} pEncodingAttributes The new encoder attributes. This can be  <b>null</b>.
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
     * The method succeeded
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_INVALID_MEDIATYPE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The sink does not support the media type.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mfcaptureengine/nf-mfcaptureengine-imfcapturesink2-setoutputmediatype
     */
    SetOutputMediaType(dwStreamIndex, pMediaType, pEncodingAttributes) {
        result := ComCall(8, this, "uint", dwStreamIndex, "ptr", pMediaType, "ptr", pEncodingAttributes, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMFCaptureSink2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetOutputMediaType := CallbackCreate(GetMethod(implObj, "SetOutputMediaType"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetOutputMediaType)
    }
}
