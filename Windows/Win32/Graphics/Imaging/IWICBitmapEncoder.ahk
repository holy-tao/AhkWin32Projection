#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IWICBitmapEncoderInfo.ahk" { IWICBitmapEncoderInfo }
#Import ".\IWICBitmapSource.ahk" { IWICBitmapSource }
#Import "..\..\System\Com\IStream.ahk" { IStream }
#Import ".\IWICBitmapFrameEncode.ahk" { IWICBitmapFrameEncode }
#Import ".\WICBitmapEncoderCacheOption.ahk" { WICBitmapEncoderCacheOption }
#Import ".\IWICPalette.ahk" { IWICPalette }
#Import "..\..\System\Com\StructuredStorage\IPropertyBag2.ahk" { IPropertyBag2 }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\IWICMetadataQueryWriter.ahk" { IWICMetadataQueryWriter }
#Import ".\IWICColorContext.ahk" { IWICColorContext }

/**
 * Defines methods for setting an encoder's properties such as thumbnails, frames, and palettes.
 * @remarks
 * There are a number of concrete implementations of this interface representing each of the standard encoders provided by the platform including bitmap (BMP), Portable Network Graphics (PNG), Joint Photographic Experts Group (JPEG), Graphics Interchange Format (GIF), Tagged Image File Format (TIFF), and Microsoft Windows Digital Photo (WDP). The following table includes the class identifier (CLSID) for each native encoder.
 *             
 * 
 * <table class="clsStd">
 * <tr>
 * <th>CLSID Name</th>
 * <th>CLSID</th>
 * </tr>
 * <tr>
 * <td>CLSID_WICBmpEncoder</td>
 * <td>0x69be8bb4, 0xd66d, 0x47c8, 0x86, 0x5a, 0xed, 0x15, 0x89, 0x43, 0x37, 0x82</td>
 * </tr>
 * <tr>
 * <td>CLSID_WICGifEncoder</td>
 * <td>0x114f5598, 0xb22, 0x40a0, 0x86, 0xa1, 0xc8, 0x3e, 0xa4, 0x95, 0xad, 0xbd</td>
 * </tr>
 * <tr>
 * <td>CLSID_WICHeifEncoder</td>
 * <td>0x0dbecec1, 0x9eb3, 0x4860, 0x9c, 0x6f, 0xdd, 0xbe, 0x86, 0x63, 0x45, 0x75</td>
 * </tr>
 * <tr>
 * <td>CLSID_WICJpegEncoder</td>
 * <td>0x1a34f5c1, 0x4a5a, 0x46dc, 0xb6, 0x44, 0x1f, 0x45, 0x67, 0xe7, 0xa6, 0x76</td>
 * </tr>
 * <tr>
 * <td>CLSID_WICPngEncoder</td>
 * <td>0x27949969, 0x876a, 0x41d7, 0x94, 0x47, 0x56, 0x8f, 0x6a, 0x35, 0xa4, 0xdc</td>
 * </tr>
 * <tr>
 * <td>CLSID_WICTiffEncoder</td>
 * <td>0x0131be10, 0x2001, 0x4c5f, 0xa9, 0xb0, 0xcc, 0x88, 0xfa, 0xb6, 0x4c, 0xe8</td>
 * </tr>
 * <tr>
 * <td>CLSID_WICWmpEncoder</td>
 * <td>0xac4ce3cb, 0xe1c1, 0x44cd, 0x82, 0x15, 0x5a, 0x16, 0x65, 0x50, 0x9e, 0xc2</td>
 * </tr>
 * </table>
 *  
 * 
 * Additionally this interface may be sub-classed to provide support for third party codecs as part of the extensibility model. See the <a href="https://docs.microsoft.com/previous-versions/ms771770(v=vs.100)">AITCodec Sample CODEC</a>.
 * 
 * CLSID_WICHeifDecoder operates on HEIF (High Efficiency Image Format) images.
 * @see https://learn.microsoft.com/windows/win32/api/wincodec/nn-wincodec-iwicbitmapencoder
 * @namespace Windows.Win32.Graphics.Imaging
 */
export default struct IWICBitmapEncoder extends IUnknown {
    /**
     * The interface identifier for IWICBitmapEncoder
     * @type {Guid}
     */
    static IID := Guid("{00000103-a8f2-4877-ba0a-fd2b6645fb94}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWICBitmapEncoder interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Initialize             : IntPtr
        GetContainerFormat     : IntPtr
        GetEncoderInfo         : IntPtr
        SetColorContexts       : IntPtr
        SetPalette             : IntPtr
        SetThumbnail           : IntPtr
        SetPreview             : IntPtr
        CreateNewFrame         : IntPtr
        Commit                 : IntPtr
        GetMetadataQueryWriter : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWICBitmapEncoder.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Initializes the encoder with an IStream which tells the encoder where to encode the bits.
     * @param {IStream} pIStream Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a>*</b>
     * 
     * The output stream.
     * @param {WICBitmapEncoderCacheOption} cacheOption Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ne-wincodec-wicbitmapencodercacheoption">WICBitmapEncoderCacheOption</a></b>
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ne-wincodec-wicbitmapencodercacheoption">WICBitmapEncoderCacheOption</a> used on initialization.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicbitmapencoder-initialize
     */
    Initialize(pIStream, cacheOption) {
        result := ComCall(3, this, "ptr", pIStream, WICBitmapEncoderCacheOption, cacheOption, "HRESULT")
        return result
    }

    /**
     * Retrieves the encoder's container format.
     * @returns {Guid} Type: <b>GUID*</b>
     * 
     * A pointer that receives the encoder's container format GUID.
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicbitmapencoder-getcontainerformat
     */
    GetContainerFormat() {
        pguidContainerFormat := Guid()
        result := ComCall(4, this, Guid.Ptr, pguidContainerFormat, "HRESULT")
        return pguidContainerFormat
    }

    /**
     * Retrieves an IWICBitmapEncoderInfo for the encoder.
     * @returns {IWICBitmapEncoderInfo} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicbitmapencoderinfo">IWICBitmapEncoderInfo</a>**</b>
     * 
     * A pointer that receives a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicbitmapencoderinfo">IWICBitmapEncoderInfo</a>.
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicbitmapencoder-getencoderinfo
     */
    GetEncoderInfo() {
        result := ComCall(5, this, "ptr*", &ppIEncoderInfo := 0, "HRESULT")
        return IWICBitmapEncoderInfo(ppIEncoderInfo)
    }

    /**
     * Sets the IWICColorContext objects for the encoder.
     * @param {Integer} cCount Type: <b>UINT</b>
     * 
     * The number of <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwiccolorcontext">IWICColorContext</a> to set.
     * @param {Pointer<IWICColorContext>} ppIColorContext Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwiccolorcontext">IWICColorContext</a>**</b>
     * 
     * A pointer an <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwiccolorcontext">IWICColorContext</a> pointer containing the color contexts to set for the encoder.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicbitmapencoder-setcolorcontexts
     */
    SetColorContexts(cCount, ppIColorContext) {
        result := ComCall(6, this, "uint", cCount, IWICColorContext.Ptr, ppIColorContext, "HRESULT")
        return result
    }

    /**
     * Sets the global palette for the image.
     * @remarks
     * Only GIF images support an optional global palette, and you must set the global palette before adding any frames to the image. You only need to set the palette for indexed pixel formats.
     * @param {IWICPalette} pIPalette Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicpalette">IWICPalette</a>*</b>
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicpalette">IWICPalette</a> to use as the global palette.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns S_OK if successful, or an error value otherwise.
     *             
     * 
     * Returns WINCODEC_ERR_UNSUPPORTEDOPERATION if the feature is not supported by the encoder.
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicbitmapencoder-setpalette
     */
    SetPalette(pIPalette) {
        result := ComCall(7, this, "ptr", pIPalette, "HRESULT")
        return result
    }

    /**
     * Sets the global thumbnail for the image.
     * @param {IWICBitmapSource} pIThumbnail Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicbitmapsource">IWICBitmapSource</a>*</b>
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicbitmapsource">IWICBitmapSource</a> to set as the global thumbnail.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns S_OK if successful, or an error value otherwise.
     *             
     * 
     * Returns WINCODEC_ERR_UNSUPPORTEDOPERATION if the feature is not supported by the encoder.
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicbitmapencoder-setthumbnail
     */
    SetThumbnail(pIThumbnail) {
        result := ComCall(8, this, "ptr", pIThumbnail, "HRESULT")
        return result
    }

    /**
     * Sets the global preview for the image.
     * @param {IWICBitmapSource} pIPreview Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicbitmapsource">IWICBitmapSource</a>*</b>
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicbitmapsource">IWICBitmapSource</a> to use as the global preview.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns S_OK if successful, or an error value otherwise.
     *             
     * 
     * Returns WINCODEC_ERR_UNSUPPORTEDOPERATION if the feature is not supported by the encoder.
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicbitmapencoder-setpreview
     */
    SetPreview(pIPreview) {
        result := ComCall(9, this, "ptr", pIPreview, "HRESULT")
        return result
    }

    /**
     * Creates a new IWICBitmapFrameEncode instance.
     * @remarks
     * The parameter <i>ppIEncoderOptions</i> can be used to receive an <a href="https://docs.microsoft.com/previous-versions/windows/internet-explorer/ie-developer/platform-apis/aa768192(v=vs.85)">IPropertyBag2</a> that can then be used to specify encoder options. This is done by passing a pointer to a <b>NULL</b> IPropertyBag2 pointer in <i>ppIEncoderOptions</i>. The returned IPropertyBag2 is initialized with all encoder options that are available for the given format, at their default values. To specify non-default encoding behavior, set the needed encoder options on the IPropertyBag2 and pass it to <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nf-wincodec-iwicbitmapframeencode-initialize">IWICBitmapFrameEncode::Initialize</a>.
     * 
     * <div class="alert"><b>Note</b>  Do not pass in a pointer to an initialized <a href="https://docs.microsoft.com/previous-versions/windows/internet-explorer/ie-developer/platform-apis/aa768192(v=vs.85)">IPropertyBag2</a>. The pointer will be overwritten, and the original IPropertyBag2 will not be freed.</div>
     * <div> </div>
     * Otherwise, you can pass <b>NULL</b> in <i>ppIEncoderOptions</i> if you do not intend to specify encoder options.
     * 
     * See <a href="https://docs.microsoft.com/windows/desktop/wic/-wic-creating-encoder">Encoding Overview</a> for an example of how to set encoder options.
     * 
     * For formats that support encoding multiple frames (for example, TIFF, JPEG-XR), you can work on only one frame at a time. This means that you must call <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nf-wincodec-iwicbitmapframeencode-commit">IWICBitmapFrameEncode::Commit</a> before you call <b>CreateNewFrame</b> again.
     * @param {Pointer<IPropertyBag2>} ppIEncoderOptions Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/internet-explorer/ie-developer/platform-apis/aa768192(v=vs.85)">IPropertyBag2</a>**</b>
     * 
     * Optional. Receives the named properties to use for subsequent frame initialization. See Remarks.
     * @returns {IWICBitmapFrameEncode} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicbitmapframeencode">IWICBitmapFrameEncode</a>**</b>
     * 
     * A pointer that receives a pointer to the new instance of an <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicbitmapframeencode">IWICBitmapFrameEncode</a>.
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicbitmapencoder-createnewframe
     */
    CreateNewFrame(ppIEncoderOptions) {
        result := ComCall(10, this, "ptr*", &ppIFrameEncode := 0, IPropertyBag2.Ptr, ppIEncoderOptions, "HRESULT")
        return IWICBitmapFrameEncode(ppIFrameEncode)
    }

    /**
     * Commits all changes for the image and closes the stream.
     * @remarks
     * To finalize an image, both the frame <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nf-wincodec-iwicbitmapframeencode-commit">Commit</a> and the encoder <b>Commit</b> must be called. However, only call the encoder  <b>Commit</b> method after all frames have been committed.
     * 
     * After the encoder has been committed, it can't be re-initialized or reused with another stream. A new encoder interface must be created, for example, with <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nf-wincodec-iwicimagingfactory-createencoder">IWICImagingFactory::CreateEncoder</a>.
     * 
     * 
     * For the encoder <b>Commit</b> to succeed, you must at a minimum call  <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nf-wincodec-iwicbitmapdecoder-initialize">IWICBitmapEncoder::Initialize</a> and either <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nf-wincodec-iwicbitmapframeencode-writesource">IWICBitmapFrameEncode::WriteSource</a> or <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nf-wincodec-iwicbitmapframeencode-writepixels">IWICBitmapFrameEncode::WritePixels</a>.
     * 
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nf-wincodec-iwicbitmapframeencode-writesource">IWICBitmapFrameEncode::WriteSource</a> specifies all parameters needed to encode the image data. <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nf-wincodec-iwicbitmapframeencode-writepixels">IWICBitmapFrameEncode::WritePixels</a> requires that you also call <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nf-wincodec-iwicbitmapframeencode-setsize">IWICBitmapFrameEncode::SetSize</a>, <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nf-wincodec-iwicbitmapframeencode-setpixelformat">IWICBitmapFrameEncode::SetPixelFormat</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nf-wincodec-iwicbitmapframeencode-setpalette">IWICBitmapFrameEncode::SetPalette</a> (if the pixel format is indexed).
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicbitmapencoder-commit
     */
    Commit() {
        result := ComCall(11, this, "HRESULT")
        return result
    }

    /**
     * Retrieves a metadata query writer for the encoder.
     * @returns {IWICMetadataQueryWriter} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicmetadataquerywriter">IWICMetadataQueryWriter</a>**</b>
     * 
     * When this method returns, contains a pointer to the encoder's metadata query writer.
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicbitmapencoder-getmetadataquerywriter
     */
    GetMetadataQueryWriter() {
        result := ComCall(12, this, "ptr*", &ppIMetadataQueryWriter := 0, "HRESULT")
        return IWICMetadataQueryWriter(ppIMetadataQueryWriter)
    }

    Query(iid) {
        if (IWICBitmapEncoder.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Initialize := CallbackCreate(GetMethod(implObj, "Initialize"), flags, 3)
        this.vtbl.GetContainerFormat := CallbackCreate(GetMethod(implObj, "GetContainerFormat"), flags, 2)
        this.vtbl.GetEncoderInfo := CallbackCreate(GetMethod(implObj, "GetEncoderInfo"), flags, 2)
        this.vtbl.SetColorContexts := CallbackCreate(GetMethod(implObj, "SetColorContexts"), flags, 3)
        this.vtbl.SetPalette := CallbackCreate(GetMethod(implObj, "SetPalette"), flags, 2)
        this.vtbl.SetThumbnail := CallbackCreate(GetMethod(implObj, "SetThumbnail"), flags, 2)
        this.vtbl.SetPreview := CallbackCreate(GetMethod(implObj, "SetPreview"), flags, 2)
        this.vtbl.CreateNewFrame := CallbackCreate(GetMethod(implObj, "CreateNewFrame"), flags, 3)
        this.vtbl.Commit := CallbackCreate(GetMethod(implObj, "Commit"), flags, 1)
        this.vtbl.GetMetadataQueryWriter := CallbackCreate(GetMethod(implObj, "GetMetadataQueryWriter"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Initialize)
        CallbackFree(this.vtbl.GetContainerFormat)
        CallbackFree(this.vtbl.GetEncoderInfo)
        CallbackFree(this.vtbl.SetColorContexts)
        CallbackFree(this.vtbl.SetPalette)
        CallbackFree(this.vtbl.SetThumbnail)
        CallbackFree(this.vtbl.SetPreview)
        CallbackFree(this.vtbl.CreateNewFrame)
        CallbackFree(this.vtbl.Commit)
        CallbackFree(this.vtbl.GetMetadataQueryWriter)
    }
}
