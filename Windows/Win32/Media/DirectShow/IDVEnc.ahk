#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\DVINFO.ahk" { DVINFO }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IDVEnc interface sets and retrieves properties on the DV Video Encoder filter.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/nn-strmif-idvenc
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct IDVEnc extends IUnknown {
    /**
     * The interface identifier for IDVEnc
     * @type {Guid}
     */
    static IID := Guid("{d18e17a0-aacb-11d0-afb0-00aa00b67a42}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDVEnc interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        get_IFormatResolution : IntPtr
        put_IFormatResolution : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDVEnc.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The get_IFormatResolution method retrieves the encoding resolution.
     * @param {Pointer<Integer>} VideoFormat Pointer to a variable that receives a member of the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ne-strmif-_dvencodervideoformat">DVENCODERVIDEOFORMAT</a> enumeration, specifying the video standard in use (NTSC or PAL).
     * @param {Pointer<Integer>} DVFormat Pointer to a variable that receives a member of the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ne-strmif-_dvencoderformat">DVENCODERFORMAT</a> enumeration, specifying the digital video (DV) format.
     * @param {Pointer<Integer>} Resolution Pointer to a variable that receives a member of the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ne-strmif-_dvencoderresolution">DVENCODERRESOLUTION</a> enumeration, specifying the video resolution.
     * @param {Integer} fDVInfo Boolean value specifying whether to retrieve the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ns-strmif-dvinfo">DVINFO</a> structure that specifies the stream format. If <b>TRUE</b>, the stream format is returned in the <i>sDVInfo</i> parameter.
     * @param {Pointer<DVINFO>} sDVInfo Pointer to a variable that receives a <b>DVINFO</b> structure containing the stream format. If <i>fDVInfo</i> is <b>FALSE</b>, this parameter is ignored.
     * @returns {HRESULT} Returns S_OK if successful. Otherwise, returns E_FAIL or another error code.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvenc-get_iformatresolution
     */
    get_IFormatResolution(VideoFormat, DVFormat, Resolution, fDVInfo, sDVInfo) {
        VideoFormatMarshal := VideoFormat is VarRef ? "int*" : "ptr"
        DVFormatMarshal := DVFormat is VarRef ? "int*" : "ptr"
        ResolutionMarshal := Resolution is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, VideoFormatMarshal, VideoFormat, DVFormatMarshal, DVFormat, ResolutionMarshal, Resolution, "char", fDVInfo, DVINFO.Ptr, sDVInfo, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvenc-put_iformatresolution
     */
    put_IFormatResolution(VideoFormat, DVFormat, Resolution, fDVInfo, sDVInfo) {
        result := ComCall(4, this, "int", VideoFormat, "int", DVFormat, "int", Resolution, "char", fDVInfo, DVINFO.Ptr, sDVInfo, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDVEnc.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_IFormatResolution := CallbackCreate(GetMethod(implObj, "get_IFormatResolution"), flags, 6)
        this.vtbl.put_IFormatResolution := CallbackCreate(GetMethod(implObj, "put_IFormatResolution"), flags, 6)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_IFormatResolution)
        CallbackFree(this.vtbl.put_IFormatResolution)
    }
}
