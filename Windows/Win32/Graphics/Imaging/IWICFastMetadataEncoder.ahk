#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods used for in-place metadata editing. A fast metadata encoder enables you to add and remove metadata to an image without having to fully re-encode the image.
 * @remarks
 * 
  * A decoder must be created using the <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ne-wincodec-wicdecodeoptions">WICDecodeOptions</a> value <b>WICDecodeMetadataCacheOnDemand</b> to perform in-place metadata updates. 
  *             Using the <b>WICDecodeMetadataCacheOnLoad</b> option causes the decoder to release the file stream necessary to perform the metadata updates. 
  *          
  * 
  * Not all metadata formats support fast metadata encoding. The native metadata handlers that support metadata are IFD, Exif, XMP, and GPS.
  *          
  * 
  * If a fast metadata encoder fails, the image will need to be fully re-encoded to add the metadata.
  *          
  * 
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//wincodec/nn-wincodec-iwicfastmetadataencoder
 * @namespace Windows.Win32.Graphics.Imaging
 * @version v4.0.30319
 */
class IWICFastMetadataEncoder extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWICFastMetadataEncoder
     * @type {Guid}
     */
    static IID => Guid("{b84e2c09-78c9-4ac4-8bd3-524ae1663a2f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Commit", "GetMetadataQueryWriter"]

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicfastmetadataencoder-commit
     */
    Commit() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IWICMetadataQueryWriter>} ppIMetadataQueryWriter 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicfastmetadataencoder-getmetadataquerywriter
     */
    GetMetadataQueryWriter(ppIMetadataQueryWriter) {
        result := ComCall(4, this, "ptr*", ppIMetadataQueryWriter, "HRESULT")
        return result
    }
}
