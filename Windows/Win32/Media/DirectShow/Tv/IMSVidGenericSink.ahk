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
     * 
     * @param {BSTR} bstrName 
     * @returns {HRESULT} 
     */
    SetSinkFilter(bstrName) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName

        result := ComCall(16, this, "ptr", bstrName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pStreams 
     * @returns {HRESULT} 
     */
    get_SinkStreams(pStreams) {
        result := ComCall(17, this, "int*", pStreams, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Streams 
     * @returns {HRESULT} 
     */
    put_SinkStreams(Streams) {
        result := ComCall(18, this, "int", Streams, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
