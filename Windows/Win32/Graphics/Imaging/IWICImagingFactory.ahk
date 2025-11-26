#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWICBitmapDecoder.ahk
#Include .\IWICComponentInfo.ahk
#Include .\IWICBitmapEncoder.ahk
#Include .\IWICPalette.ahk
#Include .\IWICFormatConverter.ahk
#Include .\IWICBitmapScaler.ahk
#Include .\IWICBitmapClipper.ahk
#Include .\IWICBitmapFlipRotator.ahk
#Include .\IWICStream.ahk
#Include .\IWICColorContext.ahk
#Include .\IWICColorTransform.ahk
#Include .\IWICBitmap.ahk
#Include ..\..\System\Com\IEnumUnknown.ahk
#Include .\IWICFastMetadataEncoder.ahk
#Include .\IWICMetadataQueryWriter.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods used to create components for the Windows Imaging Component (WIC) such as decoders, encoders and pixel format converters.
 * @see https://docs.microsoft.com/windows/win32/api//wincodec/nn-wincodec-iwicimagingfactory
 * @namespace Windows.Win32.Graphics.Imaging
 * @version v4.0.30319
 */
class IWICImagingFactory extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWICImagingFactory
     * @type {Guid}
     */
    static IID => Guid("{ec5ec8a9-c395-4314-9c77-54d7a935ff70}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateDecoderFromFilename", "CreateDecoderFromStream", "CreateDecoderFromFileHandle", "CreateComponentInfo", "CreateDecoder", "CreateEncoder", "CreatePalette", "CreateFormatConverter", "CreateBitmapScaler", "CreateBitmapClipper", "CreateBitmapFlipRotator", "CreateStream", "CreateColorContext", "CreateColorTransformer", "CreateBitmap", "CreateBitmapFromSource", "CreateBitmapFromSourceRect", "CreateBitmapFromMemory", "CreateBitmapFromHBITMAP", "CreateBitmapFromHICON", "CreateComponentEnumerator", "CreateFastMetadataEncoderFromDecoder", "CreateFastMetadataEncoderFromFrameDecode", "CreateQueryWriter", "CreateQueryWriterFromReader"]

    /**
     * Creates a new instance of the IWICBitmapDecoder class based on the given file.
     * @param {PWSTR} wzFilename Type: <b>LPCWSTR</b>
     * 
     * A pointer to a null-terminated string that specifies the name of an object to create or open.
     * @param {Pointer<Guid>} pguidVendor Type: <b>const GUID*</b>
     * 
     * The GUID for the preferred decoder vendor. Use <b>NULL</b> if no preferred vendor.
     * @param {Integer} dwDesiredAccess Type: <b>DWORD</b>
     * 
     * The access to the object, which can be read, write, or both.
     *                
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>GENERIC_READ</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Read access.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>GENERIC_WRITE</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Write access.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * For more information, see <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/generic-access-rights">Generic Access Rights</a>.
     * @param {Integer} metadataOptions Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ne-wincodec-wicdecodeoptions">WICDecodeOptions</a></b>
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ne-wincodec-wicdecodeoptions">WICDecodeOptions</a> to use when creating the decoder.
     * @returns {IWICBitmapDecoder} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicbitmapdecoder">IWICBitmapDecoder</a>**</b>
     * 
     * A pointer that receives a pointer to the new <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicbitmapdecoder">IWICBitmapDecoder</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wincodec/nf-wincodec-iwicimagingfactory-createdecoderfromfilename
     */
    CreateDecoderFromFilename(wzFilename, pguidVendor, dwDesiredAccess, metadataOptions) {
        wzFilename := wzFilename is String ? StrPtr(wzFilename) : wzFilename

        result := ComCall(3, this, "ptr", wzFilename, "ptr", pguidVendor, "uint", dwDesiredAccess, "int", metadataOptions, "ptr*", &ppIDecoder := 0, "HRESULT")
        return IWICBitmapDecoder(ppIDecoder)
    }

    /**
     * Creates a new instance of the IWICBitmapDecoder class based on the given IStream.
     * @param {IStream} pIStream Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-istream">IStream</a>*</b>
     * 
     * The stream to create the decoder from.
     * @param {Pointer<Guid>} pguidVendor Type: <b>const GUID*</b>
     * 
     * The GUID for the preferred decoder vendor. Use <b>NULL</b> if no preferred vendor.
     * @param {Integer} metadataOptions Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ne-wincodec-wicdecodeoptions">WICDecodeOptions</a></b>
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ne-wincodec-wicdecodeoptions">WICDecodeOptions</a> to use when creating the decoder.
     * @returns {IWICBitmapDecoder} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicbitmapdecoder">IWICBitmapDecoder</a>**</b>
     * 
     * A pointer that receives a pointer to a new <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicbitmapdecoder">IWICBitmapDecoder</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wincodec/nf-wincodec-iwicimagingfactory-createdecoderfromstream
     */
    CreateDecoderFromStream(pIStream, pguidVendor, metadataOptions) {
        result := ComCall(4, this, "ptr", pIStream, "ptr", pguidVendor, "int", metadataOptions, "ptr*", &ppIDecoder := 0, "HRESULT")
        return IWICBitmapDecoder(ppIDecoder)
    }

    /**
     * Creates a new instance of the IWICBitmapDecoder based on the given file handle.
     * @param {Pointer} hFile Type: <b>ULONG_PTR</b>
     * 
     * The file handle to create the decoder from.
     * @param {Pointer<Guid>} pguidVendor Type: <b>const GUID*</b>
     * 
     * The GUID for the preferred decoder vendor. Use <b>NULL</b> if no preferred vendor.
     * @param {Integer} metadataOptions Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ne-wincodec-wicdecodeoptions">WICDecodeOptions</a></b>
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ne-wincodec-wicdecodeoptions">WICDecodeOptions</a> to use when creating the decoder.
     * @returns {IWICBitmapDecoder} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicbitmapdecoder">IWICBitmapDecoder</a>**</b>
     * 
     * A pointer that receives a pointer to a new <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicbitmapdecoder">IWICBitmapDecoder</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wincodec/nf-wincodec-iwicimagingfactory-createdecoderfromfilehandle
     */
    CreateDecoderFromFileHandle(hFile, pguidVendor, metadataOptions) {
        result := ComCall(5, this, "ptr", hFile, "ptr", pguidVendor, "int", metadataOptions, "ptr*", &ppIDecoder := 0, "HRESULT")
        return IWICBitmapDecoder(ppIDecoder)
    }

    /**
     * Creates a new instance of the IWICComponentInfo class for the given component class identifier (CLSID).
     * @param {Pointer<Guid>} clsidComponent Type: <b>REFCLSID</b>
     * 
     * The CLSID for the desired component.
     * @returns {IWICComponentInfo} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwiccomponentinfo">IWICComponentInfo</a>**</b>
     * 
     * A pointer that receives a pointer to a new <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwiccomponentinfo">IWICComponentInfo</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wincodec/nf-wincodec-iwicimagingfactory-createcomponentinfo
     */
    CreateComponentInfo(clsidComponent) {
        result := ComCall(6, this, "ptr", clsidComponent, "ptr*", &ppIInfo := 0, "HRESULT")
        return IWICComponentInfo(ppIInfo)
    }

    /**
     * Creates a new instance of IWICBitmapDecoder.
     * @param {Pointer<Guid>} guidContainerFormat Type: <b>REFGUID</b>
     * 
     * The GUID for the desired container format.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id=""></a><dl>
     * <dt><b></b></dt>
     * <dt>GUID_ContainerFormatBmp</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The BMP container format GUID.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id=""></a><dl>
     * <dt><b></b></dt>
     * <dt>GUID_ContainerFormatPng</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The PNG container format GUID.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id=""></a><dl>
     * <dt><b></b></dt>
     * <dt>GUID_ContainerFormatIco</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The ICO container format GUID.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id=""></a><dl>
     * <dt><b></b></dt>
     * <dt>GUID_ContainerFormatJpeg</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The JPEG container format GUID.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id=""></a><dl>
     * <dt><b></b></dt>
     * <dt>GUID_ContainerFormatTiff</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The TIFF container format GUID.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id=""></a><dl>
     * <dt><b></b></dt>
     * <dt>GUID_ContainerFormatGif</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The GIF container format GUID.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id=""></a><dl>
     * <dt><b></b></dt>
     * <dt>GUID_ContainerFormatWmp</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The HD Photo container format GUID.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<Guid>} pguidVendor Type: <b>const GUID*</b>
     * 
     * The GUID for the preferred encoder vendor. 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id=""></a><dl>
     * <dt><b></b></dt>
     * <dt>NULL</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No preferred codec vendor.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id=""></a><dl>
     * <dt><b></b></dt>
     * <dt>GUID_VendorMicrosoft</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Prefer to use Microsoft encoder.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id=""></a><dl>
     * <dt><b></b></dt>
     * <dt>GUID_VendorMicrosoftBuiltIn</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Prefer to use the native Microsoft encoder.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {IWICBitmapDecoder} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicbitmapdecoder">IWICBitmapDecoder</a>**</b>
     * 
     * A pointer that receives a pointer to a new <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicbitmapdecoder">IWICBitmapDecoder</a>. You must initialize this <b>IWICBitmapDecoder</b> on a stream using the <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nf-wincodec-iwicbitmapdecoder-initialize">Initialize</a> method later.
     * @see https://docs.microsoft.com/windows/win32/api//wincodec/nf-wincodec-iwicimagingfactory-createdecoder
     */
    CreateDecoder(guidContainerFormat, pguidVendor) {
        result := ComCall(7, this, "ptr", guidContainerFormat, "ptr", pguidVendor, "ptr*", &ppIDecoder := 0, "HRESULT")
        return IWICBitmapDecoder(ppIDecoder)
    }

    /**
     * Creates a new instance of the IWICBitmapEncoder class.
     * @param {Pointer<Guid>} guidContainerFormat Type: <b>REFGUID</b>
     * 
     * The GUID for the desired container format.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id=""></a><dl>
     * <dt><b></b></dt>
     * <dt>GUID_ContainerFormatBmp</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The BMP container format GUID.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id=""></a><dl>
     * <dt><b></b></dt>
     * <dt>GUID_ContainerFormatPng</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The PNG container format GUID.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id=""></a><dl>
     * <dt><b></b></dt>
     * <dt>GUID_ContainerFormatIco</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The ICO container format GUID.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id=""></a><dl>
     * <dt><b></b></dt>
     * <dt>GUID_ContainerFormatJpeg</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The JPEG container format GUID.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id=""></a><dl>
     * <dt><b></b></dt>
     * <dt>GUID_ContainerFormatTiff</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The TIFF container format GUID.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id=""></a><dl>
     * <dt><b></b></dt>
     * <dt>GUID_ContainerFormatGif</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The GIF container format GUID.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id=""></a><dl>
     * <dt><b></b></dt>
     * <dt>GUID_ContainerFormatWmp</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The HD Photo container format GUID.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<Guid>} pguidVendor Type: <b>const GUID*</b>
     * 
     * The GUID for the preferred encoder vendor. 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id=""></a><dl>
     * <dt><b></b></dt>
     * <dt>NULL</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No preferred codec vendor.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id=""></a><dl>
     * <dt><b></b></dt>
     * <dt>GUID_VendorMicrosoft</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Prefer to use Microsoft encoder.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id=""></a><dl>
     * <dt><b></b></dt>
     * <dt>GUID_VendorMicrosoftBuiltIn</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Prefer to use the native Microsoft encoder.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {IWICBitmapEncoder} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicbitmapencoder">IWICBitmapEncoder</a>**</b>
     * 
     * A pointer that receives a pointer to a new <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicbitmapencoder">IWICBitmapEncoder</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wincodec/nf-wincodec-iwicimagingfactory-createencoder
     */
    CreateEncoder(guidContainerFormat, pguidVendor) {
        result := ComCall(8, this, "ptr", guidContainerFormat, "ptr", pguidVendor, "ptr*", &ppIEncoder := 0, "HRESULT")
        return IWICBitmapEncoder(ppIEncoder)
    }

    /**
     * Creates a new instance of the IWICPalette class.
     * @returns {IWICPalette} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicpalette">IWICPalette</a>**</b>
     * 
     * A pointer that receives a pointer to a new <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicpalette">IWICPalette</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wincodec/nf-wincodec-iwicimagingfactory-createpalette
     */
    CreatePalette() {
        result := ComCall(9, this, "ptr*", &ppIPalette := 0, "HRESULT")
        return IWICPalette(ppIPalette)
    }

    /**
     * Creates a new instance of the IWICFormatConverter class.
     * @returns {IWICFormatConverter} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicformatconverter">IWICFormatConverter</a>**</b>
     * 
     * A pointer that receives a pointer to a new <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicformatconverter">IWICFormatConverter</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wincodec/nf-wincodec-iwicimagingfactory-createformatconverter
     */
    CreateFormatConverter() {
        result := ComCall(10, this, "ptr*", &ppIFormatConverter := 0, "HRESULT")
        return IWICFormatConverter(ppIFormatConverter)
    }

    /**
     * Creates a new instance of an IWICBitmapScaler.
     * @returns {IWICBitmapScaler} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicbitmapscaler">IWICBitmapScaler</a>**</b>
     * 
     * A pointer that receives a pointer to a new <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicbitmapscaler">IWICBitmapScaler</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wincodec/nf-wincodec-iwicimagingfactory-createbitmapscaler
     */
    CreateBitmapScaler() {
        result := ComCall(11, this, "ptr*", &ppIBitmapScaler := 0, "HRESULT")
        return IWICBitmapScaler(ppIBitmapScaler)
    }

    /**
     * Creates a new instance of an IWICBitmapClipper object.
     * @returns {IWICBitmapClipper} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicbitmapclipper">IWICBitmapClipper</a>**</b>
     * 
     * A pointer that receives a pointer to a new <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicbitmapclipper">IWICBitmapClipper</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wincodec/nf-wincodec-iwicimagingfactory-createbitmapclipper
     */
    CreateBitmapClipper() {
        result := ComCall(12, this, "ptr*", &ppIBitmapClipper := 0, "HRESULT")
        return IWICBitmapClipper(ppIBitmapClipper)
    }

    /**
     * Creates a new instance of an IWICBitmapFlipRotator object.
     * @returns {IWICBitmapFlipRotator} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicbitmapfliprotator">IWICBitmapFlipRotator</a>**</b>
     * 
     * A pointer that receives a pointer to a new <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicbitmapfliprotator">IWICBitmapFlipRotator</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wincodec/nf-wincodec-iwicimagingfactory-createbitmapfliprotator
     */
    CreateBitmapFlipRotator() {
        result := ComCall(13, this, "ptr*", &ppIBitmapFlipRotator := 0, "HRESULT")
        return IWICBitmapFlipRotator(ppIBitmapFlipRotator)
    }

    /**
     * Creates a new instance of the IWICStream class.
     * @returns {IWICStream} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicstream">IWICStream</a>**</b>
     * 
     * A pointer that receives a pointer to a new <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicstream">IWICStream</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wincodec/nf-wincodec-iwicimagingfactory-createstream
     */
    CreateStream() {
        result := ComCall(14, this, "ptr*", &ppIWICStream := 0, "HRESULT")
        return IWICStream(ppIWICStream)
    }

    /**
     * Creates a new instance of the IWICColorContext class.
     * @returns {IWICColorContext} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwiccolorcontext">IWICColorContext</a>**</b>
     * 
     * A pointer that receives a pointer to a new <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwiccolorcontext">IWICColorContext</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wincodec/nf-wincodec-iwicimagingfactory-createcolorcontext
     */
    CreateColorContext() {
        result := ComCall(15, this, "ptr*", &ppIWICColorContext := 0, "HRESULT")
        return IWICColorContext(ppIWICColorContext)
    }

    /**
     * Creates a new instance of the IWICColorTransform class.
     * @returns {IWICColorTransform} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwiccolortransform">IWICColorTransform</a>**</b>
     * 
     * A pointer that receives a pointer to a new <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwiccolortransform">IWICColorTransform</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wincodec/nf-wincodec-iwicimagingfactory-createcolortransformer
     */
    CreateColorTransformer() {
        result := ComCall(16, this, "ptr*", &ppIWICColorTransform := 0, "HRESULT")
        return IWICColorTransform(ppIWICColorTransform)
    }

    /**
     * Creates an IWICBitmap object.
     * @param {Integer} uiWidth Type: <b>UINT</b>
     * 
     * The width of the new bitmap .
     * @param {Integer} uiHeight Type: <b>UINT</b>
     * 
     * The height of the new bitmap.
     * @param {Pointer<Guid>} pixelFormat Type: <b>REFWICPixelFormatGUID</b>
     * 
     * The pixel format of the new bitmap.
     * @param {Integer} option Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ne-wincodec-wicbitmapcreatecacheoption">WICBitmapCreateCacheOption</a></b>
     * 
     * The cache creation options of the new bitmap. This can be one of the values in the <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ne-wincodec-wicbitmapcreatecacheoption">WICBitmapCreateCacheOption</a> enumeration.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WICBitmapCacheOnDemand"></a><a id="wicbitmapcacheondemand"></a><a id="WICBITMAPCACHEONDEMAND"></a><dl>
     * <dt><b>WICBitmapCacheOnDemand</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Allocates system memory for the bitmap at initialization.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WICBitmapCacheOnLoad"></a><a id="wicbitmapcacheonload"></a><a id="WICBITMAPCACHEONLOAD"></a><dl>
     * <dt><b>WICBitmapCacheOnLoad</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Allocates system memory for the bitmap when the bitmap is first used.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WICBitmapNoCache"></a><a id="wicbitmapnocache"></a><a id="WICBITMAPNOCACHE"></a><dl>
     * <dt><b>WICBitmapNoCache</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This option is not valid for this method and should not be used.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {IWICBitmap} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicbitmap">IWICBitmap</a>**</b>
     * 
     * A pointer that receives a pointer to the new bitmap.
     * @see https://docs.microsoft.com/windows/win32/api//wincodec/nf-wincodec-iwicimagingfactory-createbitmap
     */
    CreateBitmap(uiWidth, uiHeight, pixelFormat, option) {
        result := ComCall(17, this, "uint", uiWidth, "uint", uiHeight, "ptr", pixelFormat, "int", option, "ptr*", &ppIBitmap := 0, "HRESULT")
        return IWICBitmap(ppIBitmap)
    }

    /**
     * Creates a IWICBitmap from a IWICBitmapSource.
     * @param {IWICBitmapSource} pIBitmapSource Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicbitmapsource">IWICBitmapSource</a>*</b>
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicbitmapsource">IWICBitmapSource</a> to create the bitmap from.
     * @param {Integer} option Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ne-wincodec-wicbitmapcreatecacheoption">WICBitmapCreateCacheOption</a></b>
     * 
     * The cache options of the new bitmap.  This can be one of the values in the <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ne-wincodec-wicbitmapcreatecacheoption">WICBitmapCreateCacheOption</a> enumeration.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WICBitmapNoCache"></a><a id="wicbitmapnocache"></a><a id="WICBITMAPNOCACHE"></a><dl>
     * <dt><b>WICBitmapNoCache</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Do not create a system memory copy. Share the bitmap with the source.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WICBitmapCacheOnDemand"></a><a id="wicbitmapcacheondemand"></a><a id="WICBITMAPCACHEONDEMAND"></a><dl>
     * <dt><b>WICBitmapCacheOnDemand</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Create a system memory copy when the bitmap is first used.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="WICBitmapCacheOnLoad"></a><a id="wicbitmapcacheonload"></a><a id="WICBITMAPCACHEONLOAD"></a><dl>
     * <dt><b>WICBitmapCacheOnLoad</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Create a system memory copy when this method is called.
     * 
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {IWICBitmap} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicbitmap">IWICBitmap</a>**</b>
     * 
     * A pointer that receives a pointer to the new bitmap.
     * @see https://docs.microsoft.com/windows/win32/api//wincodec/nf-wincodec-iwicimagingfactory-createbitmapfromsource
     */
    CreateBitmapFromSource(pIBitmapSource, option) {
        result := ComCall(18, this, "ptr", pIBitmapSource, "int", option, "ptr*", &ppIBitmap := 0, "HRESULT")
        return IWICBitmap(ppIBitmap)
    }

    /**
     * Creates an IWICBitmap from a specified rectangle of an IWICBitmapSource.
     * @param {IWICBitmapSource} pIBitmapSource Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicbitmapsource">IWICBitmapSource</a>*</b>
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicbitmapsource">IWICBitmapSource</a> to create the bitmap from.
     * @param {Integer} x Type: <b>UINT</b>
     * 
     * The horizontal coordinate of the upper-left corner of the rectangle.
     * @param {Integer} y Type: <b>UINT</b>
     * 
     * The vertical coordinate of the upper-left corner of the rectangle.
     * @param {Integer} width Type: <b>UINT</b>
     * 
     * The width of the rectangle and the new bitmap.
     * @param {Integer} height Type: <b>UINT</b>
     * 
     * The height of the rectangle and the new bitmap.
     * @returns {IWICBitmap} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicbitmap">IWICBitmap</a>**</b>
     * 
     * A pointer that receives a pointer to the new bitmap.
     * @see https://docs.microsoft.com/windows/win32/api//wincodec/nf-wincodec-iwicimagingfactory-createbitmapfromsourcerect
     */
    CreateBitmapFromSourceRect(pIBitmapSource, x, y, width, height) {
        result := ComCall(19, this, "ptr", pIBitmapSource, "uint", x, "uint", y, "uint", width, "uint", height, "ptr*", &ppIBitmap := 0, "HRESULT")
        return IWICBitmap(ppIBitmap)
    }

    /**
     * Creates an IWICBitmap from a memory block.
     * @param {Integer} uiWidth Type: <b>UINT</b>
     * 
     * The width of the new bitmap.
     * @param {Integer} uiHeight Type: <b>UINT</b>
     * 
     * The height of the new bitmap.
     * @param {Pointer<Guid>} pixelFormat Type: <b>REFWICPixelFormatGUID</b>
     * 
     * The pixel format of the new bitmap.  For valid pixel formats, see <a href="https://docs.microsoft.com/windows/desktop/wic/-wic-codec-native-pixel-formats">Native Pixel Formats</a>.
     * @param {Integer} cbStride Type: <b>UINT</b>
     * 
     * The number of bytes between successive scanlines in <i>pbBuffer</i>.
     * @param {Integer} cbBufferSize Type: <b>UINT</b>
     * 
     * The size of <i>pbBuffer</i>.
     * @param {Pointer<Integer>} pbBuffer Type: <b>BYTE*</b>
     * 
     * The buffer used to create the bitmap.
     * @returns {IWICBitmap} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicbitmap">IWICBitmap</a>**</b>
     * 
     * A pointer that receives a pointer to the new bitmap.
     * @see https://docs.microsoft.com/windows/win32/api//wincodec/nf-wincodec-iwicimagingfactory-createbitmapfrommemory
     */
    CreateBitmapFromMemory(uiWidth, uiHeight, pixelFormat, cbStride, cbBufferSize, pbBuffer) {
        pbBufferMarshal := pbBuffer is VarRef ? "char*" : "ptr"

        result := ComCall(20, this, "uint", uiWidth, "uint", uiHeight, "ptr", pixelFormat, "uint", cbStride, "uint", cbBufferSize, pbBufferMarshal, pbBuffer, "ptr*", &ppIBitmap := 0, "HRESULT")
        return IWICBitmap(ppIBitmap)
    }

    /**
     * Creates an IWICBitmap from a bitmap handle.
     * @param {HBITMAP} hBitmap Type: <b>HBITMAP</b>
     * 
     * A bitmap handle to create the bitmap from.
     * @param {HPALETTE} hPalette Type: <b>HPALETTE</b>
     * 
     * A palette handle used to create the bitmap.
     * @param {Integer} options Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ne-wincodec-wicbitmapalphachanneloption">WICBitmapAlphaChannelOption</a></b>
     * 
     * The alpha channel options to create the bitmap.
     * @returns {IWICBitmap} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicbitmap">IWICBitmap</a>**</b>
     * 
     * A pointer that receives a pointer to the new bitmap.
     * @see https://docs.microsoft.com/windows/win32/api//wincodec/nf-wincodec-iwicimagingfactory-createbitmapfromhbitmap
     */
    CreateBitmapFromHBITMAP(hBitmap, hPalette, options) {
        hBitmap := hBitmap is Win32Handle ? NumGet(hBitmap, "ptr") : hBitmap
        hPalette := hPalette is Win32Handle ? NumGet(hPalette, "ptr") : hPalette

        result := ComCall(21, this, "ptr", hBitmap, "ptr", hPalette, "int", options, "ptr*", &ppIBitmap := 0, "HRESULT")
        return IWICBitmap(ppIBitmap)
    }

    /**
     * Creates an IWICBitmap from an icon handle.
     * @param {HICON} hIcon Type: <b>HICON</b>
     * 
     * The icon handle to create the new bitmap from.
     * @returns {IWICBitmap} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicbitmap">IWICBitmap</a>**</b>
     * 
     * A pointer that receives a pointer to the new bitmap.
     * @see https://docs.microsoft.com/windows/win32/api//wincodec/nf-wincodec-iwicimagingfactory-createbitmapfromhicon
     */
    CreateBitmapFromHICON(hIcon) {
        hIcon := hIcon is Win32Handle ? NumGet(hIcon, "ptr") : hIcon

        result := ComCall(22, this, "ptr", hIcon, "ptr*", &ppIBitmap := 0, "HRESULT")
        return IWICBitmap(ppIBitmap)
    }

    /**
     * Creates an IEnumUnknown object of the specified component types.
     * @param {Integer} componentTypes Type: <b>DWORD</b>
     * 
     * The types of <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ne-wincodec-wiccomponenttype">WICComponentType</a> to enumerate.
     * @param {Integer} options Type: <b>DWORD</b>
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ne-wincodec-wiccomponentenumerateoptions">WICComponentEnumerateOptions</a> used to enumerate the given component types.
     * @returns {IEnumUnknown} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ienumunknown">IEnumUnknown</a>**</b>
     * 
     * A pointer that receives a pointer to a new component enumerator.
     * @see https://docs.microsoft.com/windows/win32/api//wincodec/nf-wincodec-iwicimagingfactory-createcomponentenumerator
     */
    CreateComponentEnumerator(componentTypes, options) {
        result := ComCall(23, this, "uint", componentTypes, "uint", options, "ptr*", &ppIEnumUnknown := 0, "HRESULT")
        return IEnumUnknown(ppIEnumUnknown)
    }

    /**
     * Creates a new instance of the fast metadata encoder based on the given IWICBitmapDecoder.
     * @param {IWICBitmapDecoder} pIDecoder Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicbitmapdecoder">IWICBitmapDecoder</a>*</b>
     * 
     * The decoder to create the fast metadata encoder from.
     * @returns {IWICFastMetadataEncoder} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicfastmetadataencoder">IWICFastMetadataEncoder</a>**</b>
     * 
     * When this method returns, contains a pointer to the new <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicfastmetadataencoder">IWICFastMetadataEncoder</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wincodec/nf-wincodec-iwicimagingfactory-createfastmetadataencoderfromdecoder
     */
    CreateFastMetadataEncoderFromDecoder(pIDecoder) {
        result := ComCall(24, this, "ptr", pIDecoder, "ptr*", &ppIFastEncoder := 0, "HRESULT")
        return IWICFastMetadataEncoder(ppIFastEncoder)
    }

    /**
     * Creates a new instance of the fast metadata encoder based on the given image frame.
     * @param {IWICBitmapFrameDecode} pIFrameDecoder Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicbitmapframedecode">IWICBitmapFrameDecode</a>*</b>
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicbitmapframedecode">IWICBitmapFrameDecode</a> to create the <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicfastmetadataencoder">IWICFastMetadataEncoder</a> from.
     * @returns {IWICFastMetadataEncoder} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicfastmetadataencoder">IWICFastMetadataEncoder</a>**</b>
     * 
     * When this method returns, contains a pointer to a new fast metadata encoder.
     * @see https://docs.microsoft.com/windows/win32/api//wincodec/nf-wincodec-iwicimagingfactory-createfastmetadataencoderfromframedecode
     */
    CreateFastMetadataEncoderFromFrameDecode(pIFrameDecoder) {
        result := ComCall(25, this, "ptr", pIFrameDecoder, "ptr*", &ppIFastEncoder := 0, "HRESULT")
        return IWICFastMetadataEncoder(ppIFastEncoder)
    }

    /**
     * Creates a new instance of a query writer.
     * @param {Pointer<Guid>} guidMetadataFormat Type: <b>REFGUID</b>
     * 
     * The GUID for the desired metadata format.
     * @param {Pointer<Guid>} pguidVendor Type: <b>const GUID*</b>
     * 
     * The GUID for the preferred metadata writer vendor. Use <b>NULL</b> if no preferred vendor.
     * @returns {IWICMetadataQueryWriter} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicmetadataquerywriter">IWICMetadataQueryWriter</a>**</b>
     * 
     * When this method returns, contains a pointer to a new <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicmetadataquerywriter">IWICMetadataQueryWriter</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wincodec/nf-wincodec-iwicimagingfactory-createquerywriter
     */
    CreateQueryWriter(guidMetadataFormat, pguidVendor) {
        result := ComCall(26, this, "ptr", guidMetadataFormat, "ptr", pguidVendor, "ptr*", &ppIQueryWriter := 0, "HRESULT")
        return IWICMetadataQueryWriter(ppIQueryWriter)
    }

    /**
     * Creates a new instance of a query writer based on the given query reader. The query writer will be pre-populated with metadata from the query reader.
     * @param {IWICMetadataQueryReader} pIQueryReader Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicmetadataqueryreader">IWICMetadataQueryReader</a>*</b>
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicmetadataqueryreader">IWICMetadataQueryReader</a> to create the <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicmetadataquerywriter">IWICMetadataQueryWriter</a> from.
     * @param {Pointer<Guid>} pguidVendor Type: <b>const GUID*</b>
     * 
     * The GUID for the preferred metadata writer vendor. Use <b>NULL</b> if no preferred vendor.
     * @returns {IWICMetadataQueryWriter} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicmetadataquerywriter">IWICMetadataQueryWriter</a>**</b>
     * 
     * When this method returns, contains a pointer to a new metadata writer.
     * @see https://docs.microsoft.com/windows/win32/api//wincodec/nf-wincodec-iwicimagingfactory-createquerywriterfromreader
     */
    CreateQueryWriterFromReader(pIQueryReader, pguidVendor) {
        result := ComCall(27, this, "ptr", pIQueryReader, "ptr", pguidVendor, "ptr*", &ppIQueryWriter := 0, "HRESULT")
        return IWICMetadataQueryWriter(ppIQueryWriter)
    }
}
