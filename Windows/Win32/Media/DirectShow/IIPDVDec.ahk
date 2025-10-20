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
     * 
     * @param {Pointer<Int32>} displayPix 
     * @returns {HRESULT} 
     */
    get_IPDisplay(displayPix) {
        result := ComCall(3, this, "int*", displayPix, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} displayPix 
     * @returns {HRESULT} 
     */
    put_IPDisplay(displayPix) {
        result := ComCall(4, this, "int", displayPix, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
