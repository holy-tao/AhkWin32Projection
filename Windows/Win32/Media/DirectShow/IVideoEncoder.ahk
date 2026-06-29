#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IEncoderAPI.ahk" { IEncoderAPI }

/**
 * The IVideoEncoder interface is optionally exposed by video encoder filters.
 * @remarks
 * The original purpose of this interface was to enable application to determine whether a filter was a video decoder, by calling <b>QueryInterface</b> for the <b>IVideoEncoder</b> interface. The application could then use the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-iencoderapi">IEncoderAPI</a> interface (which <b>IVideoEncoder</b> inherits) to set properties on the encoder. However, <b>IEncoderAPI</b> is deprecated. Encoder filters should expose <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-icodecapi">ICodecAPI</a> instead, and applications should use <b>ICodecAPI</b> to configure encoders.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/nn-strmif-ivideoencoder
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct IVideoEncoder extends IEncoderAPI {
    /**
     * The interface identifier for IVideoEncoder
     * @type {Guid}
     */
    static IID := Guid("{02997c3b-8e1b-460e-9270-545e0de9563e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IVideoEncoder interfaces
    */
    struct Vtbl extends IEncoderAPI.Vtbl {
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IVideoEncoder.Vtbl()
        }
        super.__New(implObj, flags)
    }

    Query(iid) {
        if (IVideoEncoder.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
    }
}
