#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IWICBitmapFrameDecode.ahk" { IWICBitmapFrameDecode }
#Import ".\IWICBitmapDecoderInfo.ahk" { IWICBitmapDecoderInfo }
#Import ".\WICDecodeOptions.ahk" { WICDecodeOptions }
#Import ".\IWICMetadataQueryReader.ahk" { IWICMetadataQueryReader }
#Import ".\IWICBitmapSource.ahk" { IWICBitmapSource }
#Import "..\..\System\Com\IStream.ahk" { IStream }
#Import ".\IWICPalette.ahk" { IWICPalette }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\IWICColorContext.ahk" { IWICColorContext }

/**
 * Exposes methods that represent a decoder.
 * @remarks
 * There are a number of concrete implementations of this interface representing each of the standard decoders provided by the platform including bitmap (BMP), Portable Network Graphics (PNG), icon (ICO), Joint Photographic Experts Group (JPEG), Graphics Interchange Format (GIF), Tagged Image File Format (TIFF), and Microsoft Windows Digital Photo (WDP). The following table includes the class identifier (CLSID) for each native decoder.
 *             
 * 
 * <table class="clsStd">
 * <tr>
 * <th>CLSID Name</th>
 * <th>CLSID</th>
 * </tr>
 * <tr>
 * <td>CLSID_WICBmpDecoder</td>
 * <td>0x6b462062, 0x7cbf, 0x400d, 0x9f, 0xdb, 0x81, 0x3d, 0xd1, 0xf, 0x27, 0x78</td>
 * </tr>
 * <tr>
 * <td>CLSID_WICGifDecoder</td>
 * <td>0x381dda3c, 0x9ce9, 0x4834, 0xa2, 0x3e, 0x1f, 0x98, 0xf8, 0xfc, 0x52, 0xbe</td>
 * </tr>
 * <tr>
 * <td>CLSID_WICHeifDecoder</td>
 * <td>0xe9a4a80a, 0x44fe, 0x4de4, 0x89, 0x71, 0x71, 0x50, 0xb1, 0x0a, 0x51, 0x99</td>
 * </tr>
 * <tr>
 * <td>CLSID_WICIcoDecoder</td>
 * <td>0xc61bfcdf, 0x2e0f, 0x4aad, 0xa8, 0xd7, 0xe0, 0x6b, 0xaf, 0xeb, 0xcd, 0xfe</td>
 * </tr>
 * <tr>
 * <td>CLSID_WICJpegDecoder</td>
 * <td>0x9456a480, 0xe88b, 0x43ea, 0x9e, 0x73, 0xb, 0x2d, 0x9b, 0x71, 0xb1, 0xca</td>
 * </tr>
 * <tr>
 * <td>CLSID_WICPngDecoder</td>
 * <td>0x389ea17b, 0x5078, 0x4cde, 0xb6, 0xef, 0x25, 0xc1, 0x51, 0x75, 0xc7, 0x51</td>
 * </tr>
 * <tr>
 * <td>CLSID_WICTiffDecoder</td>
 * <td>0xb54e85d9, 0xfe23, 0x499f, 0x8b, 0x88, 0x6a, 0xce, 0xa7, 0x13, 0x75, 0x2b</td>
 * </tr>
 * <tr>
 * <td>CLSID_WICWebpDecoder</td>
 * <td>0x7693e886, 0x51c9, 0x4070, 0x84, 0x19, 0x9f, 0x70, 0X73, 0X8e, 0Xc8, 0Xfa</td>
 * </tr>
 * <tr>
 * <td>CLSID_WICWmpDecoder</td>
 * <td>0xa26cec36, 0x234c, 0x4950, 0xae, 0x16, 0xe3, 0x4a, 0xac, 0xe7, 0x1d, 0x0d</td>
 * </tr>
 * </table>
 *  
 * 
 * This interface may be sub-classed to provide support for third party codecs as part of the extensibility model. See the <a href="https://docs.microsoft.com/previous-versions/ms771770(v=vs.100)">AITCodec Sample CODEC</a>.
 * 
 * Codecs written as TIFF container formats that are not register will decode as a TIFF image. Client applications should check for a zero frame count to determine if the codec is valid.
 * 
 * CLSID_WICHeifDecoder operates on HEIF (High Efficiency Image Format) images.
 * @see https://learn.microsoft.com/windows/win32/api/wincodec/nn-wincodec-iwicbitmapdecoder
 * @namespace Windows.Win32.Graphics.Imaging
 */
export default struct IWICBitmapDecoder extends IUnknown {
    /**
     * The interface identifier for IWICBitmapDecoder
     * @type {Guid}
     */
    static IID := Guid("{9edde9e7-8dee-47ea-99df-e6faf2ed44bf}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWICBitmapDecoder interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        QueryCapability        : IntPtr
        Initialize             : IntPtr
        GetContainerFormat     : IntPtr
        GetDecoderInfo         : IntPtr
        CopyPalette            : IntPtr
        GetMetadataQueryReader : IntPtr
        GetPreview             : IntPtr
        GetColorContexts       : IntPtr
        GetThumbnail           : IntPtr
        GetFrameCount          : IntPtr
        GetFrame               : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWICBitmapDecoder.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves the capabilities of the decoder based on the specified stream.
     * @remarks
     * Custom decoder implementations should save the current position of the specified <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a>, read whatever information is necessary in order to determine which capabilities it can provide for the supplied stream, and restore the stream position.
     * @param {IStream} pIStream Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a>*</b>
     * 
     * The stream to retrieve the decoder capabilities from.
     * @returns {Integer} Type: <b>DWORD*</b>
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ne-wincodec-wicbitmapdecodercapabilities">WICBitmapDecoderCapabilities</a> of the decoder.
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicbitmapdecoder-querycapability
     */
    QueryCapability(pIStream) {
        result := ComCall(3, this, "ptr", pIStream, "uint*", &pdwCapability := 0, "HRESULT")
        return pdwCapability
    }

    /**
     * Initializes the decoder with the provided stream.
     * @param {IStream} pIStream Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a>*</b>
     * 
     * The stream to use for initialization.
     * 
     * The stream contains the encoded pixels which are decoded each time the <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nf-wincodec-iwicbitmapsource-copypixels">CopyPixels</a> method on the <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicbitmapframedecode">IWICBitmapFrameDecode</a> interface (see <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nf-wincodec-iwicbitmapdecoder-getframe">GetFrame</a>) is invoked.
     * @param {WICDecodeOptions} cacheOptions Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ne-wincodec-wicdecodeoptions">WICDecodeOptions</a></b>
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ne-wincodec-wicdecodeoptions">WICDecodeOptions</a> to use for initialization.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicbitmapdecoder-initialize
     */
    Initialize(pIStream, cacheOptions) {
        result := ComCall(4, this, "ptr", pIStream, WICDecodeOptions, cacheOptions, "HRESULT")
        return result
    }

    /**
     * Retrieves the image's container format.
     * @returns {Guid} Type: <b>GUID*</b>
     * 
     * A pointer that receives the image's container format GUID.
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicbitmapdecoder-getcontainerformat
     */
    GetContainerFormat() {
        pguidContainerFormat := Guid()
        result := ComCall(5, this, Guid.Ptr, pguidContainerFormat, "HRESULT")
        return pguidContainerFormat
    }

    /**
     * Retrieves an IWICBitmapDecoderInfo for the image.
     * @returns {IWICBitmapDecoderInfo} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicbitmapdecoderinfo">IWICBitmapDecoderInfo</a>**</b>
     * 
     * A pointer that receives a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicbitmapdecoderinfo">IWICBitmapDecoderInfo</a>.
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicbitmapdecoder-getdecoderinfo
     */
    GetDecoderInfo() {
        result := ComCall(6, this, "ptr*", &ppIDecoderInfo := 0, "HRESULT")
        return IWICBitmapDecoderInfo(ppIDecoderInfo)
    }

    /**
     * Copies the decoder's IWICPalette .
     * @remarks
     * <b>CopyPalette</b> returns a global palette (a palette that applies to all the frames in the image) if there is one; otherwise, it returns WINCODEC_ERR_PALETTEUNAVAILABLE. If an image doesn't have a global palette, it may still have a frame-level palette, which can be retrieved using <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nf-wincodec-iwicbitmapsource-copypalette">IWICBitmapFrameDecode::CopyPalette</a>.
     * @param {IWICPalette} pIPalette Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicpalette">IWICPalette</a>*</b>
     * 
     * An<a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicpalette">IWICPalette</a> to which the decoder's global palette is to be copied. Use <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nf-wincodec-iwicimagingfactory-createpalette">CreatePalette</a> to create the destination palette before calling <b>CopyPalette</b>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicbitmapdecoder-copypalette
     */
    CopyPalette(pIPalette) {
        result := ComCall(7, this, "ptr", pIPalette, "HRESULT")
        return result
    }

    /**
     * Retrieves the metadata query reader from the decoder.
     * @remarks
     * If an image format does not support container-level metadata, this will return <a href="https://docs.microsoft.com/windows/desktop/wic/-wic-codec-error-codes">WINCODEC_ERR_UNSUPPORTEDOPERATION</a>. The only Windows provided image format that supports container-level metadata is GIF. Instead, use <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nf-wincodec-iwicbitmapframedecode-getmetadataqueryreader">IWICBitmapFrameDecode::GetMetadataQueryReader</a>.
     * @returns {IWICMetadataQueryReader} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicmetadataqueryreader">IWICMetadataQueryReader</a>**</b>
     * 
     * Receives a pointer to the decoder's <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicmetadataqueryreader">IWICMetadataQueryReader</a>.
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicbitmapdecoder-getmetadataqueryreader
     */
    GetMetadataQueryReader() {
        result := ComCall(8, this, "ptr*", &ppIMetadataQueryReader := 0, "HRESULT")
        return IWICMetadataQueryReader(ppIMetadataQueryReader)
    }

    /**
     * Retrieves a preview image, if supported.
     * @remarks
     * Not all formats support previews. Only the native Microsoft Windows Digital Photo (WDP) codec support previews.
     * @returns {IWICBitmapSource} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicbitmapsource">IWICBitmapSource</a>**</b>
     * 
     * Receives a pointer to the preview bitmap if supported.
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicbitmapdecoder-getpreview
     */
    GetPreview() {
        result := ComCall(9, this, "ptr*", &ppIBitmapSource := 0, "HRESULT")
        return IWICBitmapSource(ppIBitmapSource)
    }

    /**
     * Retrieves the IWICColorContext objects of the image.
     * @param {Integer} cCount Type: <b>UINT</b>
     * 
     * The number of color contexts to retrieve.
     * 
     * This value must be the size of, or smaller than, the size available to <i>ppIColorContexts</i>.
     * @param {Pointer<IWICColorContext>} ppIColorContexts Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwiccolorcontext">IWICColorContext</a>**</b>
     * 
     * A pointer that receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwiccolorcontext">IWICColorContext</a>.
     * @returns {Integer} Type: <b>UINT*</b>
     * 
     * A pointer that receives the number of color contexts contained in the image.
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicbitmapdecoder-getcolorcontexts
     */
    GetColorContexts(cCount, ppIColorContexts) {
        result := ComCall(10, this, "uint", cCount, IWICColorContext.Ptr, ppIColorContexts, "uint*", &pcActualCount := 0, "HRESULT")
        return pcActualCount
    }

    /**
     * Retrieves a bitmap thumbnail of the image, if one exists
     * @remarks
     * The returned thumbnail can be of any size, so the caller should scale the thumbnail to the desired size. The only Windows provided image formats that support thumbnails are JPEG, TIFF, and JPEG-XR. If the thumbnail is not available, this will return <a href="https://docs.microsoft.com/windows/desktop/wic/-wic-codec-error-codes">WINCODEC_ERR_CODECNOTHUMBNAIL</a>.
     * @returns {IWICBitmapSource} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicbitmapsource">IWICBitmapSource</a>**</b>
     * 
     * Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicbitmapsource">IWICBitmapSource</a> of the thumbnail.
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicbitmapdecoder-getthumbnail
     */
    GetThumbnail() {
        result := ComCall(11, this, "ptr*", &ppIThumbnail := 0, "HRESULT")
        return IWICBitmapSource(ppIThumbnail)
    }

    /**
     * Retrieves the total number of frames in the image.
     * @returns {Integer} Type: <b>UINT*</b>
     * 
     * A pointer that receives the total number of frames in the image.
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicbitmapdecoder-getframecount
     */
    GetFrameCount() {
        result := ComCall(12, this, "uint*", &pCount := 0, "HRESULT")
        return pCount
    }

    /**
     * Retrieves the specified frame of the image.
     * @param {Integer} index Type: <b>UINT</b>
     * 
     * The particular frame to retrieve.
     * @returns {IWICBitmapFrameDecode} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicbitmapframedecode">IWICBitmapFrameDecode</a>**</b>
     * 
     * A pointer that receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicbitmapframedecode">IWICBitmapFrameDecode</a>.
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicbitmapdecoder-getframe
     */
    GetFrame(index) {
        result := ComCall(13, this, "uint", index, "ptr*", &ppIBitmapFrame := 0, "HRESULT")
        return IWICBitmapFrameDecode(ppIBitmapFrame)
    }

    Query(iid) {
        if (IWICBitmapDecoder.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.QueryCapability := CallbackCreate(GetMethod(implObj, "QueryCapability"), flags, 3)
        this.vtbl.Initialize := CallbackCreate(GetMethod(implObj, "Initialize"), flags, 3)
        this.vtbl.GetContainerFormat := CallbackCreate(GetMethod(implObj, "GetContainerFormat"), flags, 2)
        this.vtbl.GetDecoderInfo := CallbackCreate(GetMethod(implObj, "GetDecoderInfo"), flags, 2)
        this.vtbl.CopyPalette := CallbackCreate(GetMethod(implObj, "CopyPalette"), flags, 2)
        this.vtbl.GetMetadataQueryReader := CallbackCreate(GetMethod(implObj, "GetMetadataQueryReader"), flags, 2)
        this.vtbl.GetPreview := CallbackCreate(GetMethod(implObj, "GetPreview"), flags, 2)
        this.vtbl.GetColorContexts := CallbackCreate(GetMethod(implObj, "GetColorContexts"), flags, 4)
        this.vtbl.GetThumbnail := CallbackCreate(GetMethod(implObj, "GetThumbnail"), flags, 2)
        this.vtbl.GetFrameCount := CallbackCreate(GetMethod(implObj, "GetFrameCount"), flags, 2)
        this.vtbl.GetFrame := CallbackCreate(GetMethod(implObj, "GetFrame"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.QueryCapability)
        CallbackFree(this.vtbl.Initialize)
        CallbackFree(this.vtbl.GetContainerFormat)
        CallbackFree(this.vtbl.GetDecoderInfo)
        CallbackFree(this.vtbl.CopyPalette)
        CallbackFree(this.vtbl.GetMetadataQueryReader)
        CallbackFree(this.vtbl.GetPreview)
        CallbackFree(this.vtbl.GetColorContexts)
        CallbackFree(this.vtbl.GetThumbnail)
        CallbackFree(this.vtbl.GetFrameCount)
        CallbackFree(this.vtbl.GetFrame)
    }
}
