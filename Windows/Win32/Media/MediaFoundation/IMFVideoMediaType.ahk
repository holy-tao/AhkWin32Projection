#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMFMediaType.ahk

/**
 * Represents a description of a video format.
 * @remarks
 * If the major type of a media type is MFMediaType_Video, you can query the media type object for the <b>IMFVideoMediaType</b> interface.
 * 
 * Applications should avoid using this interface except when a method or function requires an <b>IMFVideoMediaType</b> pointer as a parameter. You can get all of the format information from a video media type through the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfattributes">IMFAttributes</a> interface, which <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediatype">IMFMediaType</a> inherits.
 * @see https://learn.microsoft.com/windows/win32/api//content/mfobjects/nn-mfobjects-imfvideomediatype
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFVideoMediaType extends IMFMediaType{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFVideoMediaType
     * @type {Guid}
     */
    static IID => Guid("{b99f381f-a8f9-47a2-a5af-ca3a225a3890}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 38

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetVideoFormat", "GetVideoRepresentation"]

    /**
     * GetVideoFormat is no longer available for use as of Windows 7.
     * @remarks
     * If you need to convert the media type into an <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/ns-mfobjects-mfvideoformat">MFVIDEOFORMAT</a> structure, call <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfcreatemfvideoformatfrommfmediatype">MFCreateMFVideoFormatFromMFMediaType</a>.
     * 
     * There are no guarantees about how long the returned pointer is valid.
     * @returns {Pointer<MFVIDEOFORMAT>} This method returns a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/ns-mfobjects-mfvideoformat">MFVIDEOFORMAT</a> structure.
     * @see https://learn.microsoft.com/windows/win32/api//content/mfobjects/nf-mfobjects-imfvideomediatype-getvideoformat
     */
    GetVideoFormat() {
        result := ComCall(38, this, "ptr")
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
     * @see https://learn.microsoft.com/windows/win32/api//content/mfobjects/nf-mfobjects-imfvideomediatype-getvideorepresentation
     */
    GetVideoRepresentation(guidRepresentation, lStride) {
        result := ComCall(39, this, "ptr", guidRepresentation, "ptr*", &ppvRepresentation := 0, "int", lStride, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppvRepresentation
    }
}
