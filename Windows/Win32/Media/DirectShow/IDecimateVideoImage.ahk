#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IDecimateVideoImage interface specifies decimation on a decoder filter.
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-idecimatevideoimage
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IDecimateVideoImage extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDecimateVideoImage
     * @type {Guid}
     */
    static IID => Guid("{2e5ea3e0-e924-11d2-b6da-00a0c995e8df}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetDecimationImageSize", "ResetDecimationImageSize"]

    /**
     * 
     * @param {Integer} lWidth 
     * @param {Integer} lHeight 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idecimatevideoimage-setdecimationimagesize
     */
    SetDecimationImageSize(lWidth, lHeight) {
        result := ComCall(3, this, "int", lWidth, "int", lHeight, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idecimatevideoimage-resetdecimationimagesize
     */
    ResetDecimationImageSize() {
        result := ComCall(4, this, "HRESULT")
        return result
    }
}
