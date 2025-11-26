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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IFormatResolution", "put_IFormatResolution"]

    /**
     * The get_IFormatResolution method retrieves the encoding resolution.
     * @param {Pointer<Integer>} VideoFormat Pointer to a variable that receives a member of the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ne-strmif-_dvencodervideoformat">DVENCODERVIDEOFORMAT</a> enumeration, specifying the video standard in use (NTSC or PAL).
     * @param {Pointer<Integer>} DVFormat Pointer to a variable that receives a member of the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ne-strmif-_dvencoderformat">DVENCODERFORMAT</a> enumeration, specifying the digital video (DV) format.
     * @param {Pointer<Integer>} Resolution Pointer to a variable that receives a member of the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ne-strmif-_dvencoderresolution">DVENCODERRESOLUTION</a> enumeration, specifying the video resolution.
     * @param {Integer} fDVInfo Boolean value specifying whether to retrieve the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ns-strmif-dvinfo">DVINFO</a> structure that specifies the stream format. If <b>TRUE</b>, the stream format is returned in the <i>sDVInfo</i> parameter.
     * @param {Pointer<DVINFO>} sDVInfo Pointer to a variable that receives a <b>DVINFO</b> structure containing the stream format. If <i>fDVInfo</i> is <b>FALSE</b>, this parameter is ignored.
     * @returns {HRESULT} Returns S_OK if successful. Otherwise, returns E_FAIL or another error code.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-idvenc-get_iformatresolution
     */
    get_IFormatResolution(VideoFormat, DVFormat, Resolution, fDVInfo, sDVInfo) {
        VideoFormatMarshal := VideoFormat is VarRef ? "int*" : "ptr"
        DVFormatMarshal := DVFormat is VarRef ? "int*" : "ptr"
        ResolutionMarshal := Resolution is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, VideoFormatMarshal, VideoFormat, DVFormatMarshal, DVFormat, ResolutionMarshal, Resolution, "char", fDVInfo, "ptr", sDVInfo, "HRESULT")
        return result
    }

    /**
     * The put_IFormatResolution method sets the encoding resolution.
     * @param {Integer} VideoFormat Member of the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ne-strmif-_dvencodervideoformat">DVENCODERVIDEOFORMAT</a> enumeration, specifying the video standard to use (NTSC or PAL).
     * @param {Integer} DVFormat Member of the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ne-strmif-_dvencoderformat">DVENCODERFORMAT</a> enumeration, specifying the DV format.
     * @param {Integer} Resolution Member of the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ne-strmif-_dvencoderresolution">DVENCODERRESOLUTION</a> enumeration, specifying the video resolution.
     * @param {Integer} fDVInfo Boolean value specifying whether the <i>sDVInfo</i> parameter contains a valid <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ns-strmif-dvinfo">DVINFO</a> structure. To set the stream format, set this parameter to <b>TRUE</b> and specify the format chunk with the <i>sDVInfo</i> parameter.
     * @param {Pointer<DVINFO>} sDVInfo If <i>fDVInfo</i> is <b>TRUE</b>, must point to a <b>DVINFO</b> structure that describes the stream format.
     * @returns {HRESULT} Returns S_OK if successful. Otherwise, returns E_FAIL or another error code.
     * @see https://docs.microsoft.com/windows/win32/api//strmif/nf-strmif-idvenc-put_iformatresolution
     */
    put_IFormatResolution(VideoFormat, DVFormat, Resolution, fDVInfo, sDVInfo) {
        result := ComCall(4, this, "int", VideoFormat, "int", DVFormat, "int", Resolution, "char", fDVInfo, "ptr", sDVInfo, "HRESULT")
        return result
    }
}
