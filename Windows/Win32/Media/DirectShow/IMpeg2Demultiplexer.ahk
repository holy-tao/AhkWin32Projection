#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IPin.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * This interface is implemented on the MPEG-2 Demultiplexer filter (Demux) and is used in both program stream mode and transport stream mode.
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-impeg2demultiplexer
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IMpeg2Demultiplexer extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMpeg2Demultiplexer
     * @type {Guid}
     */
    static IID => Guid("{436eee9c-264f-4242-90e1-4e330c107512}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateOutputPin", "SetOutputPinMediaType", "DeleteOutputPin"]

    /**
     * The CreateOutputPin method creates a new output pin on the Demux.
     * @param {Pointer<AM_MEDIA_TYPE>} pMediaType Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ns-strmif-am_media_type">AM_MEDIA_TYPE</a> structure that specifies the media type information for the new pin.
     * @param {PWSTR} pszPinName Pointer to a wide character string that specifies a name for the new pin. The maximum length is 128 characters, including the <b>NULL</b> terminator.
     * @returns {IPin} Address of a variable that receives a pointer to the pin's <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-ipin">IPin</a> interface.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-impeg2demultiplexer-createoutputpin
     */
    CreateOutputPin(pMediaType, pszPinName) {
        pszPinName := pszPinName is String ? StrPtr(pszPinName) : pszPinName

        result := ComCall(3, this, "ptr", pMediaType, "ptr", pszPinName, "ptr*", &ppIPin := 0, "HRESULT")
        return IPin(ppIPin)
    }

    /**
     * The SetOutputPinMediaType method updates the media type of the specified output pin. (DirectX 9.0 and later.).
     * @param {PWSTR} pszPinName The friendly name of the pin as specified when the pin was created in a call to <b>CreateOutputPin</b>.
     * @param {Pointer<AM_MEDIA_TYPE>} pMediaType Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ns-strmif-am_media_type">AM_MEDIA_TYPE</a> structure that specifies the new media type information for the pin.
     * @returns {HRESULT} Returns S_OK if successful. If the method fails, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-impeg2demultiplexer-setoutputpinmediatype
     */
    SetOutputPinMediaType(pszPinName, pMediaType) {
        pszPinName := pszPinName is String ? StrPtr(pszPinName) : pszPinName

        result := ComCall(4, this, "ptr", pszPinName, "ptr", pMediaType, "HRESULT")
        return result
    }

    /**
     * The DeleteOutputPin method deletes the specified output pin.
     * @param {PWSTR} pszPinName The friendly name of the pin as specified when the pin was created in a call to <b>CreateOutputPin</b>.
     * @returns {HRESULT} Returns S_OK if successful. If the method fails, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-impeg2demultiplexer-deleteoutputpin
     */
    DeleteOutputPin(pszPinName) {
        pszPinName := pszPinName is String ? StrPtr(pszPinName) : pszPinName

        result := ComCall(5, this, "ptr", pszPinName, "HRESULT")
        return result
    }
}
