#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * This interface is implemented on the MPEG-2 Demultiplexer filter (Demux) and is used in both program stream mode and transport stream mode.
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-impeg2demultiplexer
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IMpeg2Demultiplexer extends IUnknown{
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
     * 
     * @param {Pointer<AM_MEDIA_TYPE>} pMediaType 
     * @param {PWSTR} pszPinName 
     * @param {Pointer<IPin>} ppIPin 
     * @returns {HRESULT} 
     */
    CreateOutputPin(pMediaType, pszPinName, ppIPin) {
        pszPinName := pszPinName is String ? StrPtr(pszPinName) : pszPinName

        result := ComCall(3, this, "ptr", pMediaType, "ptr", pszPinName, "ptr", ppIPin, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pszPinName 
     * @param {Pointer<AM_MEDIA_TYPE>} pMediaType 
     * @returns {HRESULT} 
     */
    SetOutputPinMediaType(pszPinName, pMediaType) {
        pszPinName := pszPinName is String ? StrPtr(pszPinName) : pszPinName

        result := ComCall(4, this, "ptr", pszPinName, "ptr", pMediaType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pszPinName 
     * @returns {HRESULT} 
     */
    DeleteOutputPin(pszPinName) {
        pszPinName := pszPinName is String ? StrPtr(pszPinName) : pszPinName

        result := ComCall(5, this, "ptr", pszPinName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
