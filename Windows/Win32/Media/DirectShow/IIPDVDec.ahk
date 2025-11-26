#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IIPDVDec interface provides methods for setting and retrieving properties on the DV Video Decoder filter.
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-iipdvdec
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IIPDVDec extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IIPDVDec
     * @type {Guid}
     */
    static IID => Guid("{b8e8bd60-0bfe-11d0-af91-00aa00b67a42}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IPDisplay", "put_IPDisplay"]

    /**
     * @type {Integer} 
     */
    IPDisplay {
        get => this.get_IPDisplay()
        set => this.put_IPDisplay(value)
    }

    /**
     * The get_IPDisplay method gets the decoding resolution.
     * @returns {Integer} Receives a member of the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ne-strmif-_dvresolution">DVDECODERRESOLUTION</a> enumerated type, specifying the decoding resolution.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iipdvdec-get_ipdisplay
     */
    get_IPDisplay() {
        result := ComCall(3, this, "int*", &displayPix := 0, "HRESULT")
        return displayPix
    }

    /**
     * The put_IPDisplay method sets the decoding resolution.
     * @param {Integer} displayPix Member of the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ne-strmif-_dvresolution">DVDECODERRESOLUTION</a> enumerated type, specifying the decoding resolution. The meaning of this value depends on whether the current format is NTSC or PAL. The filter determines at run time which format applies, based on the media type.
     * @returns {HRESULT} Returns S_OK if successful; otherwise, returns E_FAIL or another error code.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-iipdvdec-put_ipdisplay
     */
    put_IPDisplay(displayPix) {
        result := ComCall(4, this, "int", displayPix, "HRESULT")
        return result
    }
}
