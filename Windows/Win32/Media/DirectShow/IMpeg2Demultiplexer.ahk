#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\MediaFoundation\AM_MEDIA_TYPE.ahk" { AM_MEDIA_TYPE }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IPin.ahk" { IPin }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * This interface is implemented on the MPEG-2 Demultiplexer filter (Demux) and is used in both program stream mode and transport stream mode.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/nn-strmif-impeg2demultiplexer
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct IMpeg2Demultiplexer extends IUnknown {
    /**
     * The interface identifier for IMpeg2Demultiplexer
     * @type {Guid}
     */
    static IID := Guid("{436eee9c-264f-4242-90e1-4e330c107512}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMpeg2Demultiplexer interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        CreateOutputPin       : IntPtr
        SetOutputPinMediaType : IntPtr
        DeleteOutputPin       : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMpeg2Demultiplexer.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The CreateOutputPin method creates a new output pin on the Demux.
     * @remarks
     * Duplicate pin names are not allowed. To configure the pin, query the returned <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-ipin">IPin</a> interface for the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-impeg2streamidmap">IMPEG2StreamIdMap</a> interface (for program streams) or for the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/bdaiface/nn-bdaiface-impeg2pidmap">IMPEG2PIDMap</a> interface (for transport streams). Depending on which interface is queried for on the first output pin, the Demux configures itself for either transport or program stream mode. Once the Demux is configured, any calls to <b>QueryInterface</b> to retrieve the other interface will fail.
     * @param {Pointer<AM_MEDIA_TYPE>} pMediaType Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ns-strmif-am_media_type">AM_MEDIA_TYPE</a> structure that specifies the media type information for the new pin.
     * @param {PWSTR} pszPinName Pointer to a wide character string that specifies a name for the new pin. The maximum length is 128 characters, including the <b>NULL</b> terminator.
     * @returns {IPin} Address of a variable that receives a pointer to the pin's <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-ipin">IPin</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-impeg2demultiplexer-createoutputpin
     */
    CreateOutputPin(pMediaType, pszPinName) {
        pszPinName := pszPinName is String ? StrPtr(pszPinName) : pszPinName

        result := ComCall(3, this, AM_MEDIA_TYPE.Ptr, pMediaType, "ptr", pszPinName, "ptr*", &ppIPin := 0, "HRESULT")
        return IPin(ppIPin)
    }

    /**
     * The SetOutputPinMediaType method updates the media type of the specified output pin. (DirectX 9.0 and later.).
     * @remarks
     * Pins can be reconfigured at any time with a new media type. If no connection exists, the media type is simply updated. If the pin is connected, the success or failure of the call will depend on the downstream input pin's acceptance or rejection of the specified media type.
     * 
     * The media type is not interpreted in any way by the Demultiplexer filter. It is used only during connection negotiation by the output pin. It has no effect on the content of the media samples. Media sample content is defined when a PID is mapped via the MEDIA_SAMPLE_CONTENT parameter in the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/bdaiface/nf-bdaiface-impeg2pidmap-mappid">IMPEG2PIDMap::MapPID</a> method, or via the defined values in an <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-impeg2streamidmap-mapstreamid">IMPEG2StreamIdMap::MapStreamId</a> call.
     * @param {PWSTR} pszPinName The friendly name of the pin as specified when the pin was created in a call to <b>CreateOutputPin</b>.
     * @param {Pointer<AM_MEDIA_TYPE>} pMediaType Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ns-strmif-am_media_type">AM_MEDIA_TYPE</a> structure that specifies the new media type information for the pin.
     * @returns {HRESULT} Returns S_OK if successful. If the method fails, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-impeg2demultiplexer-setoutputpinmediatype
     */
    SetOutputPinMediaType(pszPinName, pMediaType) {
        pszPinName := pszPinName is String ? StrPtr(pszPinName) : pszPinName

        result := ComCall(4, this, "ptr", pszPinName, AM_MEDIA_TYPE.Ptr, pMediaType, "HRESULT")
        return result
    }

    /**
     * The DeleteOutputPin method deletes the specified output pin.
     * @remarks
     * Call this method only when you need to delete a pin while keeping the filter alive. When the filter is released, it will perform all necessary cleanup on the output pins.
     * @param {PWSTR} pszPinName The friendly name of the pin as specified when the pin was created in a call to <b>CreateOutputPin</b>.
     * @returns {HRESULT} Returns S_OK if successful. If the method fails, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-impeg2demultiplexer-deleteoutputpin
     */
    DeleteOutputPin(pszPinName) {
        pszPinName := pszPinName is String ? StrPtr(pszPinName) : pszPinName

        result := ComCall(5, this, "ptr", pszPinName, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMpeg2Demultiplexer.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateOutputPin := CallbackCreate(GetMethod(implObj, "CreateOutputPin"), flags, 4)
        this.vtbl.SetOutputPinMediaType := CallbackCreate(GetMethod(implObj, "SetOutputPinMediaType"), flags, 3)
        this.vtbl.DeleteOutputPin := CallbackCreate(GetMethod(implObj, "DeleteOutputPin"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreateOutputPin)
        CallbackFree(this.vtbl.SetOutputPinMediaType)
        CallbackFree(this.vtbl.DeleteOutputPin)
    }
}
