#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IDVEnc interface sets and retrieves properties on the DV Video Encoder filter.
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-idvenc
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IDVEnc extends IUnknown{
    /**
     * The interface identifier for IDVEnc
     * @type {Guid}
     */
    static IID => Guid("{d18e17a0-aacb-11d0-afb0-00aa00b67a42}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<Int32>} VideoFormat 
     * @param {Pointer<Int32>} DVFormat 
     * @param {Pointer<Int32>} Resolution 
     * @param {Integer} fDVInfo 
     * @param {Pointer<DVINFO>} sDVInfo 
     * @returns {HRESULT} 
     */
    get_IFormatResolution(VideoFormat, DVFormat, Resolution, fDVInfo, sDVInfo) {
        result := ComCall(3, this, "int*", VideoFormat, "int*", DVFormat, "int*", Resolution, "char", fDVInfo, "ptr", sDVInfo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} VideoFormat 
     * @param {Integer} DVFormat 
     * @param {Integer} Resolution 
     * @param {Integer} fDVInfo 
     * @param {Pointer<DVINFO>} sDVInfo 
     * @returns {HRESULT} 
     */
    put_IFormatResolution(VideoFormat, DVFormat, Resolution, fDVInfo, sDVInfo) {
        result := ComCall(4, this, "int", VideoFormat, "int", DVFormat, "int", Resolution, "char", fDVInfo, "ptr", sDVInfo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
