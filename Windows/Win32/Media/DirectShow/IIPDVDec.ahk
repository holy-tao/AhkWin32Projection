#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IIPDVDec interface provides methods for setting and retrieving properties on the DV Video Decoder filter.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/nn-strmif-iipdvdec
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct IIPDVDec extends IUnknown {
    /**
     * The interface identifier for IIPDVDec
     * @type {Guid}
     */
    static IID := Guid("{b8e8bd60-0bfe-11d0-af91-00aa00b67a42}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IIPDVDec interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        get_IPDisplay : IntPtr
        put_IPDisplay : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IIPDVDec.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iipdvdec-get_ipdisplay
     */
    get_IPDisplay() {
        result := ComCall(3, this, "int*", &displayPix := 0, "HRESULT")
        return displayPix
    }

    /**
     * The put_IPDisplay method sets the decoding resolution.
     * @remarks
     * This method will fail if the filter is already streaming media data.
     * @param {Integer} displayPix Member of the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ne-strmif-_dvresolution">DVDECODERRESOLUTION</a> enumerated type, specifying the decoding resolution. The meaning of this value depends on whether the current format is NTSC or PAL. The filter determines at run time which format applies, based on the media type.
     * @returns {HRESULT} Returns S_OK if successful; otherwise, returns E_FAIL or another error code.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-iipdvdec-put_ipdisplay
     */
    put_IPDisplay(displayPix) {
        result := ComCall(4, this, "int", displayPix, "HRESULT")
        return result
    }

    Query(iid) {
        if (IIPDVDec.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_IPDisplay := CallbackCreate(GetMethod(implObj, "get_IPDisplay"), flags, 2)
        this.vtbl.put_IPDisplay := CallbackCreate(GetMethod(implObj, "put_IPDisplay"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_IPDisplay)
        CallbackFree(this.vtbl.put_IPDisplay)
    }
}
