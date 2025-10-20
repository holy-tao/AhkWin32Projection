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
     * 
     * @param {Integer} lWidth 
     * @param {Integer} lHeight 
     * @returns {HRESULT} 
     */
    SetDecimationImageSize(lWidth, lHeight) {
        result := ComCall(3, this, "int", lWidth, "int", lHeight, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ResetDecimationImageSize() {
        result := ComCall(4, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
