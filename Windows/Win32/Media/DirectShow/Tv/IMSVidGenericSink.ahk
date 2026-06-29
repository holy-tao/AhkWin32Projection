#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\MSVidSinkStreams.ahk" { MSVidSinkStreams }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IMSVidOutputDevice.ahk" { IMSVidOutputDevice }

/**
 * The IMSVidGenericSink interface represents a generic output device that supports streaming output. It is implemented by the MSVidGenericSink object.
 * @remarks
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IMSVidGenericSink)</c>.
 * @see https://learn.microsoft.com/windows/win32/api/segment/nn-segment-imsvidgenericsink
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct IMSVidGenericSink extends IMSVidOutputDevice {
    /**
     * The interface identifier for IMSVidGenericSink
     * @type {Guid}
     */
    static IID := Guid("{6c29b41d-455b-4c33-963a-0d28e5e555ea}")

    /**
     * The class identifier for MSVidGenericSink
     * @type {Guid}
     */
    static CLSID := Guid("{4a5869cf-929d-4040-ae03-fcafc5b9cd42}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMSVidGenericSink interfaces
    */
    struct Vtbl extends IMSVidOutputDevice.Vtbl {
        SetSinkFilter   : IntPtr
        get_SinkStreams : IntPtr
        put_SinkStreams : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMSVidGenericSink.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {MSVidSinkStreams} 
     */
    SinkStreams {
        get => this.get_SinkStreams()
        set => this.put_SinkStreams(value)
    }

    /**
     * The SetSinkFilter method sets the filter for the sink.
     * @param {BSTR} bstrName <b>BSTR</b> that contains the CLSID of the sink filter. The <b>BSTR</b> must use the following format: <c>{XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX}</c>.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. Possible values include the following.
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
     * Success.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidgenericsink-setsinkfilter
     */
    SetSinkFilter(bstrName) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName

        result := ComCall(16, this, BSTR, bstrName, "HRESULT")
        return result
    }

    /**
     * The get_SinkStreams method retrieves the streams that are required to be rendered down to the sink. Not implemented.
     * @returns {MSVidSinkStreams} Reserved.
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidgenericsink-get_sinkstreams
     */
    get_SinkStreams() {
        result := ComCall(17, this, "int*", &pStreams := 0, "HRESULT")
        return pStreams
    }

    /**
     * The put_SinkStreams method sets the streams that are required to be rendered down to the sink. Not implemented.
     * @param {MSVidSinkStreams} Streams Reserved.
     * @returns {HRESULT} Returns E_NOTIMPL.
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidgenericsink-put_sinkstreams
     */
    put_SinkStreams(Streams) {
        result := ComCall(18, this, MSVidSinkStreams, Streams, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMSVidGenericSink.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetSinkFilter := CallbackCreate(GetMethod(implObj, "SetSinkFilter"), flags, 2)
        this.vtbl.get_SinkStreams := CallbackCreate(GetMethod(implObj, "get_SinkStreams"), flags, 2)
        this.vtbl.put_SinkStreams := CallbackCreate(GetMethod(implObj, "put_SinkStreams"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetSinkFilter)
        CallbackFree(this.vtbl.get_SinkStreams)
        CallbackFree(this.vtbl.put_SinkStreams)
    }
}
