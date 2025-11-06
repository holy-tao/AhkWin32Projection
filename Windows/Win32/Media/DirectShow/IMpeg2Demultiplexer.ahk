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
     * 
     * @param {Pointer<AM_MEDIA_TYPE>} pMediaType 
     * @param {PWSTR} pszPinName 
     * @returns {IPin} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-impeg2demultiplexer-createoutputpin
     */
    CreateOutputPin(pMediaType, pszPinName) {
        pszPinName := pszPinName is String ? StrPtr(pszPinName) : pszPinName

        result := ComCall(3, this, "ptr", pMediaType, "ptr", pszPinName, "ptr*", &ppIPin := 0, "HRESULT")
        return IPin(ppIPin)
    }

    /**
     * 
     * @param {PWSTR} pszPinName 
     * @param {Pointer<AM_MEDIA_TYPE>} pMediaType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-impeg2demultiplexer-setoutputpinmediatype
     */
    SetOutputPinMediaType(pszPinName, pMediaType) {
        pszPinName := pszPinName is String ? StrPtr(pszPinName) : pszPinName

        result := ComCall(4, this, "ptr", pszPinName, "ptr", pMediaType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszPinName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-impeg2demultiplexer-deleteoutputpin
     */
    DeleteOutputPin(pszPinName) {
        pszPinName := pszPinName is String ? StrPtr(pszPinName) : pszPinName

        result := ComCall(5, this, "ptr", pszPinName, "HRESULT")
        return result
    }
}
