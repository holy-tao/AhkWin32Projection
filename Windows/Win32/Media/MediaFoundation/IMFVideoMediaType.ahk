#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\MFVIDEOFORMAT.ahk" { MFVIDEOFORMAT }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IMFMediaType.ahk" { IMFMediaType }

/**
 * Represents a description of a video format.
 * @remarks
 * If the major type of a media type is MFMediaType_Video, you can query the media type object for the <b>IMFVideoMediaType</b> interface.
 * 
 * Applications should avoid using this interface except when a method or function requires an <b>IMFVideoMediaType</b> pointer as a parameter. You can get all of the format information from a video media type through the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfattributes">IMFAttributes</a> interface, which <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediatype">IMFMediaType</a> inherits.
 * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nn-mfobjects-imfvideomediatype
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFVideoMediaType extends IMFMediaType {
    /**
     * The interface identifier for IMFVideoMediaType
     * @type {Guid}
     */
    static IID := Guid("{b99f381f-a8f9-47a2-a5af-ca3a225a3890}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFVideoMediaType interfaces
    */
    struct Vtbl extends IMFMediaType.Vtbl {
        GetVideoFormat         : IntPtr
        GetVideoRepresentation : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFVideoMediaType.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * GetVideoFormat is no longer available for use as of Windows 7.
     * @remarks
     * If you need to convert the media type into an <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/ns-mfobjects-mfvideoformat">MFVIDEOFORMAT</a> structure, call <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfcreatemfvideoformatfrommfmediatype">MFCreateMFVideoFormatFromMFMediaType</a>.
     * 
     * There are no guarantees about how long the returned pointer is valid.
     * @returns {Pointer<MFVIDEOFORMAT>} This method returns a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/ns-mfobjects-mfvideoformat">MFVIDEOFORMAT</a> structure.
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfvideomediatype-getvideoformat
     */
    GetVideoFormat() {
        result := ComCall(38, this, MFVIDEOFORMAT.Ptr)
        return result
    }

    /**
     * Retrieves an alternative representation of the media type.
     * @remarks
     * This method is equivalent to <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfmediatype-getrepresentation">IMFMediaType::GetRepresentation</a> but includes the <i>lStride</i> parameter.
     * 
     * Instead of calling this method, applications should set the <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-mt-default-stride-attribute">MF_MT_DEFAULT_STRIDE</a> attribute on the media type to specify the surface stride and then call <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfmediatype-getrepresentation">IMFMediaType::GetRepresentation</a>.
     * @param {Guid} guidRepresentation GUID that specifies the representation to retrieve. For a list of values, see <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfmediatype-getrepresentation">IMFMediaType::GetRepresentation</a>.
     * @param {Integer} lStride Stride of the video surface, in bytes. If the stride is unknown, set this value to 0. If the value is 0, the method computes the stride from the image width and assumes that there is no padding.
     * @returns {Pointer<Void>} Receives a pointer to a structure that contains the representation. The method allocates the memory for the structure. The caller must release the memory by calling <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfmediatype-freerepresentation">IMFMediaType::FreeRepresentation</a>.
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfvideomediatype-getvideorepresentation
     */
    GetVideoRepresentation(guidRepresentation, lStride) {
        result := ComCall(39, this, Guid, guidRepresentation, "ptr*", &ppvRepresentation := 0, "int", lStride, "HRESULT")
        return ppvRepresentation
    }

    Query(iid) {
        if (IMFVideoMediaType.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetVideoFormat := CallbackCreate(GetMethod(implObj, "GetVideoFormat"), flags, 1)
        this.vtbl.GetVideoRepresentation := CallbackCreate(GetMethod(implObj, "GetVideoRepresentation"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetVideoFormat)
        CallbackFree(this.vtbl.GetVideoRepresentation)
    }
}
