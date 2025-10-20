#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMFMediaType.ahk

/**
 * Represents a description of a video format.
 * @remarks
 * 
  * If the major type of a media type is MFMediaType_Video, you can query the media type object for the <b>IMFVideoMediaType</b> interface.
  * 
  * Applications should avoid using this interface except when a method or function requires an <b>IMFVideoMediaType</b> pointer as a parameter. You can get all of the format information from a video media type through the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfattributes">IMFAttributes</a> interface, which <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediatype">IMFMediaType</a> inherits.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//mfobjects/nn-mfobjects-imfvideomediatype
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
     * 
     * @returns {Pointer<MFVIDEOFORMAT>} 
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfvideomediatype-getvideoformat
     */
    GetVideoFormat() {
        result := ComCall(38, this, "ptr")
        return result
    }

    /**
     * 
     * @param {Guid} guidRepresentation 
     * @param {Pointer<Pointer<Void>>} ppvRepresentation 
     * @param {Integer} lStride 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfobjects/nf-mfobjects-imfvideomediatype-getvideorepresentation
     */
    GetVideoRepresentation(guidRepresentation, ppvRepresentation, lStride) {
        result := ComCall(39, this, "ptr", guidRepresentation, "ptr*", ppvRepresentation, "int", lStride, "HRESULT")
        return result
    }
}
