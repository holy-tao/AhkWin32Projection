#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include .\IMSVidOutputDevice.ahk

/**
 * The IMSVidGenericSink interface represents a generic output device that supports streaming output. It is implemented by the MSVidGenericSink object.
 * @remarks
 * 
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IMSVidGenericSink)</c>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//segment/nn-segment-imsvidgenericsink
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IMSVidGenericSink extends IMSVidOutputDevice{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMSVidGenericSink
     * @type {Guid}
     */
    static IID => Guid("{6c29b41d-455b-4c33-963a-0d28e5e555ea}")

    /**
     * The class identifier for MSVidGenericSink
     * @type {Guid}
     */
    static CLSID => Guid("{4a5869cf-929d-4040-ae03-fcafc5b9cd42}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 16

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetSinkFilter", "get_SinkStreams", "put_SinkStreams"]

    /**
     * @type {Integer} 
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
     * @see https://docs.microsoft.com/windows/win32/api//segment/nf-segment-imsvidgenericsink-setsinkfilter
     */
    SetSinkFilter(bstrName) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName

        result := ComCall(16, this, "ptr", bstrName, "HRESULT")
        return result
    }

    /**
     * The get_SinkStreams method retrieves the streams that are required to be rendered down to the sink. Not implemented.
     * @returns {Integer} Reserved.
     * @see https://docs.microsoft.com/windows/win32/api//segment/nf-segment-imsvidgenericsink-get_sinkstreams
     */
    get_SinkStreams() {
        result := ComCall(17, this, "int*", &pStreams := 0, "HRESULT")
        return pStreams
    }

    /**
     * The put_SinkStreams method sets the streams that are required to be rendered down to the sink. Not implemented.
     * @param {Integer} Streams Reserved.
     * @returns {HRESULT} Returns E_NOTIMPL.
     * @see https://docs.microsoft.com/windows/win32/api//segment/nf-segment-imsvidgenericsink-put_sinkstreams
     */
    put_SinkStreams(Streams) {
        result := ComCall(18, this, "int", Streams, "HRESULT")
        return result
    }
}
