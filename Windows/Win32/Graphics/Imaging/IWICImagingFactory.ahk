#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IStream.ahk" { IStream }
#Import "..\..\System\Com\IEnumUnknown.ahk" { IEnumUnknown }
#Import ".\IWICBitmapSource.ahk" { IWICBitmapSource }
#Import ".\IWICBitmapFlipRotator.ahk" { IWICBitmapFlipRotator }
#Import ".\IWICBitmapScaler.ahk" { IWICBitmapScaler }
#Import ".\IWICBitmapDecoder.ahk" { IWICBitmapDecoder }
#Import ".\IWICColorTransform.ahk" { IWICColorTransform }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\WICBitmapAlphaChannelOption.ahk" { WICBitmapAlphaChannelOption }
#Import ".\IWICPalette.ahk" { IWICPalette }
#Import ".\IWICBitmapEncoder.ahk" { IWICBitmapEncoder }
#Import "..\..\UI\WindowsAndMessaging\HICON.ahk" { HICON }
#Import ".\IWICMetadataQueryReader.ahk" { IWICMetadataQueryReader }
#Import ".\IWICFormatConverter.ahk" { IWICFormatConverter }
#Import ".\IWICStream.ahk" { IWICStream }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\WICBitmapCreateCacheOption.ahk" { WICBitmapCreateCacheOption }
#Import ".\IWICColorContext.ahk" { IWICColorContext }
#Import ".\IWICBitmap.ahk" { IWICBitmap }
#Import "..\..\Foundation\GENERIC_ACCESS_RIGHTS.ahk" { GENERIC_ACCESS_RIGHTS }
#Import ".\IWICMetadataQueryWriter.ahk" { IWICMetadataQueryWriter }
#Import ".\IWICBitmapClipper.ahk" { IWICBitmapClipper }
#Import "..\Gdi\HBITMAP.ahk" { HBITMAP }
#Import "..\Gdi\HPALETTE.ahk" { HPALETTE }
#Import ".\IWICBitmapFrameDecode.ahk" { IWICBitmapFrameDecode }
#Import ".\IWICComponentInfo.ahk" { IWICComponentInfo }
#Import ".\IWICFastMetadataEncoder.ahk" { IWICFastMetadataEncoder }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\WICDecodeOptions.ahk" { WICDecodeOptions }

/**
 * Exposes methods used to create components for the Windows Imaging Component (WIC) such as decoders, encoders and pixel format converters.
 * @see https://learn.microsoft.com/windows/win32/api/wincodec/nn-wincodec-iwicimagingfactory
 * @namespace Windows.Win32.Graphics.Imaging
 */
export default struct IWICImagingFactory extends IUnknown {
    /**
     * The interface identifier for IWICImagingFactory
     * @type {Guid}
     */
    static IID := Guid("{ec5ec8a9-c395-4314-9c77-54d7a935ff70}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWICImagingFactory interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        CreateDecoderFromFilename                : IntPtr
        CreateDecoderFromStream                  : IntPtr
        CreateDecoderFromFileHandle              : IntPtr
        CreateComponentInfo                      : IntPtr
        CreateDecoder                            : IntPtr
        CreateEncoder                            : IntPtr
        CreatePalette                            : IntPtr
        CreateFormatConverter                    : IntPtr
        CreateBitmapScaler                       : IntPtr
        CreateBitmapClipper                      : IntPtr
        CreateBitmapFlipRotator                  : IntPtr
        CreateStream                             : IntPtr
        CreateColorContext                       : IntPtr
        CreateColorTransformer                   : IntPtr
        CreateBitmap                             : IntPtr
        CreateBitmapFromSource                   : IntPtr
        CreateBitmapFromSourceRect               : IntPtr
        CreateBitmapFromMemory                   : IntPtr
        CreateBitmapFromHBITMAP                  : IntPtr
        CreateBitmapFromHICON                    : IntPtr
        CreateComponentEnumerator                : IntPtr
        CreateFastMetadataEncoderFromDecoder     : IntPtr
        CreateFastMetadataEncoderFromFrameDecode : IntPtr
        CreateQueryWriter                        : IntPtr
        CreateQueryWriterFromReader              : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWICImagingFactory.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Creates a new instance of the IWICBitmapDecoder class based on the given file.
     * @param {PWSTR} wzFilename Type: <b>LPCWSTR</b>
     * 
     * A pointer to a null-terminated string that specifies the name of an object to create or open.
     * @param {Pointer<Guid>} pguidVendor Type: <b>const GUID*</b>
     * 
     * The GUID for the preferred decoder vendor. Use <b>NULL</b> if no preferred vendor.
     * @param {GENERIC_ACCESS_RIGHTS} dwDesiredAccess Type: <b>DWORD</b>
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
     * @param {WICDecodeOptions} metadataOptions Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ne-wincodec-wicdecodeoptions">WICDecodeOptions</a></b>
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ne-wincodec-wicdecodeoptions">WICDecodeOptions</a> to use when creating the decoder.
     * @returns {IWICBitmapDecoder} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicbitmapdecoder">IWICBitmapDecoder</a>**</b>
     * 
     * A pointer that receives a pointer to the new <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicbitmapdecoder">IWICBitmapDecoder</a>.
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicimagingfactory-createdecoderfromfilename
     */
    CreateDecoderFromFilename(wzFilename, pguidVendor, dwDesiredAccess, metadataOptions) {
        wzFilename := wzFilename is String ? StrPtr(wzFilename) : wzFilename

        result := ComCall(3, this, "ptr", wzFilename, Guid.Ptr, pguidVendor, GENERIC_ACCESS_RIGHTS, dwDesiredAccess, WICDecodeOptions, metadataOptions, "ptr*", &ppIDecoder := 0, "HRESULT")
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
     * @param {WICDecodeOptions} metadataOptions Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ne-wincodec-wicdecodeoptions">WICDecodeOptions</a></b>
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ne-wincodec-wicdecodeoptions">WICDecodeOptions</a> to use when creating the decoder.
     * @returns {IWICBitmapDecoder} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicbitmapdecoder">IWICBitmapDecoder</a>**</b>
     * 
     * A pointer that receives a pointer to a new <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicbitmapdecoder">IWICBitmapDecoder</a>.
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicimagingfactory-createdecoderfromstream
     */
    CreateDecoderFromStream(pIStream, pguidVendor, metadataOptions) {
        result := ComCall(4, this, "ptr", pIStream, Guid.Ptr, pguidVendor, WICDecodeOptions, metadataOptions, "ptr*", &ppIDecoder := 0, "HRESULT")
        return IWICBitmapDecoder(ppIDecoder)
    }

    /**
     * Creates a new instance of the IWICBitmapDecoder based on the given file handle.
     * @remarks
     * When a decoder is created using this method, the file handle must remain alive during the lifetime of the decoder.
     * @param {Pointer} hFile Type: <b>ULONG_PTR</b>
     * 
     * The file handle to create the decoder from.
     * @param {Pointer<Guid>} pguidVendor Type: <b>const GUID*</b>
     * 
     * The GUID for the preferred decoder vendor. Use <b>NULL</b> if no preferred vendor.
     * @param {WICDecodeOptions} metadataOptions Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ne-wincodec-wicdecodeoptions">WICDecodeOptions</a></b>
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ne-wincodec-wicdecodeoptions">WICDecodeOptions</a> to use when creating the decoder.
     * @returns {IWICBitmapDecoder} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicbitmapdecoder">IWICBitmapDecoder</a>**</b>
     * 
     * A pointer that receives a pointer to a new <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicbitmapdecoder">IWICBitmapDecoder</a>.
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicimagingfactory-createdecoderfromfilehandle
     */
    CreateDecoderFromFileHandle(hFile, pguidVendor, metadataOptions) {
        result := ComCall(5, this, "ptr", hFile, Guid.Ptr, pguidVendor, WICDecodeOptions, metadataOptions, "ptr*", &ppIDecoder := 0, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicimagingfactory-createcomponentinfo
     */
    CreateComponentInfo(clsidComponent) {
        result := ComCall(6, this, Guid.Ptr, clsidComponent, "ptr*", &ppIInfo := 0, "HRESULT")
        return IWICComponentInfo(ppIInfo)
    }

    /**
     * Creates a new instance of IWICBitmapDecoder.
     * @remarks
     * Other values may be available for both <i>guidContainerFormat</i> and <i>pguidVendor</i> depending on the installed WIC-enabled encoders.
     *             The values listed are those that are natively supported by the operating system.
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
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicimagingfactory-createdecoder
     */
    CreateDecoder(guidContainerFormat, pguidVendor) {
        result := ComCall(7, this, Guid.Ptr, guidContainerFormat, Guid.Ptr, pguidVendor, "ptr*", &ppIDecoder := 0, "HRESULT")
        return IWICBitmapDecoder(ppIDecoder)
    }

    /**
     * Creates a new instance of the IWICBitmapEncoder class.
     * @remarks
     * Other values may be available for both <i>guidContainerFormat</i> and <i>pguidVendor</i> depending on the installed WIC-enabled encoders.
     *             The values listed are those that are natively supported by the operating system.
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
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicimagingfactory-createencoder
     */
    CreateEncoder(guidContainerFormat, pguidVendor) {
        result := ComCall(8, this, Guid.Ptr, guidContainerFormat, Guid.Ptr, pguidVendor, "ptr*", &ppIEncoder := 0, "HRESULT")
        return IWICBitmapEncoder(ppIEncoder)
    }

    /**
     * Creates a new instance of the IWICPalette class.
     * @returns {IWICPalette} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicpalette">IWICPalette</a>**</b>
     * 
     * A pointer that receives a pointer to a new <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicpalette">IWICPalette</a>.
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicimagingfactory-createpalette
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
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicimagingfactory-createformatconverter
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
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicimagingfactory-createbitmapscaler
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
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicimagingfactory-createbitmapclipper
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
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicimagingfactory-createbitmapfliprotator
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
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicimagingfactory-createstream
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
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicimagingfactory-createcolorcontext
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
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicimagingfactory-createcolortransformer
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
     * @param {WICBitmapCreateCacheOption} option Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ne-wincodec-wicbitmapcreatecacheoption">WICBitmapCreateCacheOption</a></b>
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
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicimagingfactory-createbitmap
     */
    CreateBitmap(uiWidth, uiHeight, pixelFormat, option) {
        result := ComCall(17, this, "uint", uiWidth, "uint", uiHeight, Guid.Ptr, pixelFormat, WICBitmapCreateCacheOption, option, "ptr*", &ppIBitmap := 0, "HRESULT")
        return IWICBitmap(ppIBitmap)
    }

    /**
     * Creates a IWICBitmap from a IWICBitmapSource.
     * @param {IWICBitmapSource} pIBitmapSource Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicbitmapsource">IWICBitmapSource</a>*</b>
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicbitmapsource">IWICBitmapSource</a> to create the bitmap from.
     * @param {WICBitmapCreateCacheOption} option Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ne-wincodec-wicbitmapcreatecacheoption">WICBitmapCreateCacheOption</a></b>
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
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicimagingfactory-createbitmapfromsource
     */
    CreateBitmapFromSource(pIBitmapSource, option) {
        result := ComCall(18, this, "ptr", pIBitmapSource, WICBitmapCreateCacheOption, option, "ptr*", &ppIBitmap := 0, "HRESULT")
        return IWICBitmap(ppIBitmap)
    }

    /**
     * Creates an IWICBitmap from a specified rectangle of an IWICBitmapSource.
     * @remarks
     * Providing a rectangle that is larger than the source will produce undefined results.
     * 
     * This method always creates a separate copy of the source image, similar to the cache option <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ne-wincodec-wicbitmapcreatecacheoption">WICBitmapCacheOnLoad</a>.
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
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicimagingfactory-createbitmapfromsourcerect
     */
    CreateBitmapFromSourceRect(pIBitmapSource, x, y, width, height) {
        result := ComCall(19, this, "ptr", pIBitmapSource, "uint", x, "uint", y, "uint", width, "uint", height, "ptr*", &ppIBitmap := 0, "HRESULT")
        return IWICBitmap(ppIBitmap)
    }

    /**
     * Creates an IWICBitmap from a memory block.
     * @remarks
     * The size of the <a href="https://docs.microsoft.com/windows/desktop/wic/-wic-imp-iwicbitmapdecoder">IWICBitmap</a> to be created must be smaller than or equal to the size of the image in <i>pbBuffer</i>.
     * 
     * The stride of the destination bitmap will equal the <i>stride</i> of the source data, regardless of the width and height specified.
     * 
     * The <i>pixelFormat</i> parameter defines the pixel format for both the input data and the output bitmap.
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
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicimagingfactory-createbitmapfrommemory
     */
    CreateBitmapFromMemory(uiWidth, uiHeight, pixelFormat, cbStride, cbBufferSize, pbBuffer) {
        pbBufferMarshal := pbBuffer is VarRef ? "char*" : "ptr"

        result := ComCall(20, this, "uint", uiWidth, "uint", uiHeight, Guid.Ptr, pixelFormat, "uint", cbStride, "uint", cbBufferSize, pbBufferMarshal, pbBuffer, "ptr*", &ppIBitmap := 0, "HRESULT")
        return IWICBitmap(ppIBitmap)
    }

    /**
     * Creates an IWICBitmap from a bitmap handle.
     * @remarks
     * For a non-palletized bitmap, set NULL for the <i>hPalette</i> parameter.
     * @param {HBITMAP} _hBitmap Type: <b>HBITMAP</b>
     * 
     * A bitmap handle to create the bitmap from.
     * @param {HPALETTE} _hPalette Type: <b>HPALETTE</b>
     * 
     * A palette handle used to create the bitmap.
     * @param {WICBitmapAlphaChannelOption} options Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ne-wincodec-wicbitmapalphachanneloption">WICBitmapAlphaChannelOption</a></b>
     * 
     * The alpha channel options to create the bitmap.
     * @returns {IWICBitmap} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicbitmap">IWICBitmap</a>**</b>
     * 
     * A pointer that receives a pointer to the new bitmap.
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicimagingfactory-createbitmapfromhbitmap
     */
    CreateBitmapFromHBITMAP(_hBitmap, _hPalette, options) {
        result := ComCall(21, this, HBITMAP, _hBitmap, HPALETTE, _hPalette, WICBitmapAlphaChannelOption, options, "ptr*", &ppIBitmap := 0, "HRESULT")
        return IWICBitmap(ppIBitmap)
    }

    /**
     * Creates an IWICBitmap from an icon handle.
     * @param {HICON} _hIcon Type: <b>HICON</b>
     * 
     * The icon handle to create the new bitmap from.
     * @returns {IWICBitmap} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicbitmap">IWICBitmap</a>**</b>
     * 
     * A pointer that receives a pointer to the new bitmap.
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicimagingfactory-createbitmapfromhicon
     */
    CreateBitmapFromHICON(_hIcon) {
        result := ComCall(22, this, HICON, _hIcon, "ptr*", &ppIBitmap := 0, "HRESULT")
        return IWICBitmap(ppIBitmap)
    }

    /**
     * Creates an IEnumUnknown object of the specified component types.
     * @remarks
     * Component types must be enumerated separately. Combinations of component types and <b>WICAllComponents</b> are unsupported.
     * @param {Integer} _componentTypes Type: <b>DWORD</b>
     * 
     * The types of <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ne-wincodec-wiccomponenttype">WICComponentType</a> to enumerate.
     * @param {Integer} options Type: <b>DWORD</b>
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ne-wincodec-wiccomponentenumerateoptions">WICComponentEnumerateOptions</a> used to enumerate the given component types.
     * @returns {IEnumUnknown} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ienumunknown">IEnumUnknown</a>**</b>
     * 
     * A pointer that receives a pointer to a new component enumerator.
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicimagingfactory-createcomponentenumerator
     */
    CreateComponentEnumerator(_componentTypes, options) {
        result := ComCall(23, this, "uint", _componentTypes, "uint", options, "ptr*", &ppIEnumUnknown := 0, "HRESULT")
        return IEnumUnknown(ppIEnumUnknown)
    }

    /**
     * Creates a new instance of the fast metadata encoder based on the given IWICBitmapDecoder.
     * @remarks
     * The Windows provided codecs do not support fast metadata encoding at the decoder level, and only support fast metadata encoding at the frame level. To create a fast metadata encoder from a frame, see <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nf-wincodec-iwicimagingfactory-createfastmetadataencoderfromframedecode">CreateFastMetadataEncoderFromFrameDecode</a>.
     * @param {IWICBitmapDecoder} pIDecoder Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicbitmapdecoder">IWICBitmapDecoder</a>*</b>
     * 
     * The decoder to create the fast metadata encoder from.
     * @returns {IWICFastMetadataEncoder} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicfastmetadataencoder">IWICFastMetadataEncoder</a>**</b>
     * 
     * When this method returns, contains a pointer to the new <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicfastmetadataencoder">IWICFastMetadataEncoder</a>.
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicimagingfactory-createfastmetadataencoderfromdecoder
     */
    CreateFastMetadataEncoderFromDecoder(pIDecoder) {
        result := ComCall(24, this, "ptr", pIDecoder, "ptr*", &ppIFastEncoder := 0, "HRESULT")
        return IWICFastMetadataEncoder(ppIFastEncoder)
    }

    /**
     * Creates a new instance of the fast metadata encoder based on the given image frame.
     * @remarks
     * For a list of support metadata formats for fast metadata encoding, see <a href="https://docs.microsoft.com/windows/desktop/wic/-wic-about-metadata">WIC Metadata Overview</a>.
     * @param {IWICBitmapFrameDecode} pIFrameDecoder Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicbitmapframedecode">IWICBitmapFrameDecode</a>*</b>
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicbitmapframedecode">IWICBitmapFrameDecode</a> to create the <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicfastmetadataencoder">IWICFastMetadataEncoder</a> from.
     * @returns {IWICFastMetadataEncoder} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicfastmetadataencoder">IWICFastMetadataEncoder</a>**</b>
     * 
     * When this method returns, contains a pointer to a new fast metadata encoder.
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicimagingfactory-createfastmetadataencoderfromframedecode
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
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicimagingfactory-createquerywriter
     */
    CreateQueryWriter(guidMetadataFormat, pguidVendor) {
        result := ComCall(26, this, Guid.Ptr, guidMetadataFormat, Guid.Ptr, pguidVendor, "ptr*", &ppIQueryWriter := 0, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicimagingfactory-createquerywriterfromreader
     */
    CreateQueryWriterFromReader(pIQueryReader, pguidVendor) {
        result := ComCall(27, this, "ptr", pIQueryReader, Guid.Ptr, pguidVendor, "ptr*", &ppIQueryWriter := 0, "HRESULT")
        return IWICMetadataQueryWriter(ppIQueryWriter)
    }

    Query(iid) {
        if (IWICImagingFactory.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateDecoderFromFilename := CallbackCreate(GetMethod(implObj, "CreateDecoderFromFilename"), flags, 6)
        this.vtbl.CreateDecoderFromStream := CallbackCreate(GetMethod(implObj, "CreateDecoderFromStream"), flags, 5)
        this.vtbl.CreateDecoderFromFileHandle := CallbackCreate(GetMethod(implObj, "CreateDecoderFromFileHandle"), flags, 5)
        this.vtbl.CreateComponentInfo := CallbackCreate(GetMethod(implObj, "CreateComponentInfo"), flags, 3)
        this.vtbl.CreateDecoder := CallbackCreate(GetMethod(implObj, "CreateDecoder"), flags, 4)
        this.vtbl.CreateEncoder := CallbackCreate(GetMethod(implObj, "CreateEncoder"), flags, 4)
        this.vtbl.CreatePalette := CallbackCreate(GetMethod(implObj, "CreatePalette"), flags, 2)
        this.vtbl.CreateFormatConverter := CallbackCreate(GetMethod(implObj, "CreateFormatConverter"), flags, 2)
        this.vtbl.CreateBitmapScaler := CallbackCreate(GetMethod(implObj, "CreateBitmapScaler"), flags, 2)
        this.vtbl.CreateBitmapClipper := CallbackCreate(GetMethod(implObj, "CreateBitmapClipper"), flags, 2)
        this.vtbl.CreateBitmapFlipRotator := CallbackCreate(GetMethod(implObj, "CreateBitmapFlipRotator"), flags, 2)
        this.vtbl.CreateStream := CallbackCreate(GetMethod(implObj, "CreateStream"), flags, 2)
        this.vtbl.CreateColorContext := CallbackCreate(GetMethod(implObj, "CreateColorContext"), flags, 2)
        this.vtbl.CreateColorTransformer := CallbackCreate(GetMethod(implObj, "CreateColorTransformer"), flags, 2)
        this.vtbl.CreateBitmap := CallbackCreate(GetMethod(implObj, "CreateBitmap"), flags, 6)
        this.vtbl.CreateBitmapFromSource := CallbackCreate(GetMethod(implObj, "CreateBitmapFromSource"), flags, 4)
        this.vtbl.CreateBitmapFromSourceRect := CallbackCreate(GetMethod(implObj, "CreateBitmapFromSourceRect"), flags, 7)
        this.vtbl.CreateBitmapFromMemory := CallbackCreate(GetMethod(implObj, "CreateBitmapFromMemory"), flags, 8)
        this.vtbl.CreateBitmapFromHBITMAP := CallbackCreate(GetMethod(implObj, "CreateBitmapFromHBITMAP"), flags, 5)
        this.vtbl.CreateBitmapFromHICON := CallbackCreate(GetMethod(implObj, "CreateBitmapFromHICON"), flags, 3)
        this.vtbl.CreateComponentEnumerator := CallbackCreate(GetMethod(implObj, "CreateComponentEnumerator"), flags, 4)
        this.vtbl.CreateFastMetadataEncoderFromDecoder := CallbackCreate(GetMethod(implObj, "CreateFastMetadataEncoderFromDecoder"), flags, 3)
        this.vtbl.CreateFastMetadataEncoderFromFrameDecode := CallbackCreate(GetMethod(implObj, "CreateFastMetadataEncoderFromFrameDecode"), flags, 3)
        this.vtbl.CreateQueryWriter := CallbackCreate(GetMethod(implObj, "CreateQueryWriter"), flags, 4)
        this.vtbl.CreateQueryWriterFromReader := CallbackCreate(GetMethod(implObj, "CreateQueryWriterFromReader"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreateDecoderFromFilename)
        CallbackFree(this.vtbl.CreateDecoderFromStream)
        CallbackFree(this.vtbl.CreateDecoderFromFileHandle)
        CallbackFree(this.vtbl.CreateComponentInfo)
        CallbackFree(this.vtbl.CreateDecoder)
        CallbackFree(this.vtbl.CreateEncoder)
        CallbackFree(this.vtbl.CreatePalette)
        CallbackFree(this.vtbl.CreateFormatConverter)
        CallbackFree(this.vtbl.CreateBitmapScaler)
        CallbackFree(this.vtbl.CreateBitmapClipper)
        CallbackFree(this.vtbl.CreateBitmapFlipRotator)
        CallbackFree(this.vtbl.CreateStream)
        CallbackFree(this.vtbl.CreateColorContext)
        CallbackFree(this.vtbl.CreateColorTransformer)
        CallbackFree(this.vtbl.CreateBitmap)
        CallbackFree(this.vtbl.CreateBitmapFromSource)
        CallbackFree(this.vtbl.CreateBitmapFromSourceRect)
        CallbackFree(this.vtbl.CreateBitmapFromMemory)
        CallbackFree(this.vtbl.CreateBitmapFromHBITMAP)
        CallbackFree(this.vtbl.CreateBitmapFromHICON)
        CallbackFree(this.vtbl.CreateComponentEnumerator)
        CallbackFree(this.vtbl.CreateFastMetadataEncoderFromDecoder)
        CallbackFree(this.vtbl.CreateFastMetadataEncoderFromFrameDecode)
        CallbackFree(this.vtbl.CreateQueryWriter)
        CallbackFree(this.vtbl.CreateQueryWriterFromReader)
    }
}
