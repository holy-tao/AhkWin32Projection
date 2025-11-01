#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * 
     * @param {PWSTR} wzFilename 
     * @param {Pointer<Guid>} pguidVendor 
     * @param {Integer} dwDesiredAccess 
     * @param {Integer} metadataOptions 
     * @param {Pointer<IWICBitmapDecoder>} ppIDecoder 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicimagingfactory-createdecoderfromfilename
     */
    CreateDecoderFromFilename(wzFilename, pguidVendor, dwDesiredAccess, metadataOptions, ppIDecoder) {
        wzFilename := wzFilename is String ? StrPtr(wzFilename) : wzFilename

        result := ComCall(3, this, "ptr", wzFilename, "ptr", pguidVendor, "uint", dwDesiredAccess, "int", metadataOptions, "ptr*", ppIDecoder, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IStream} pIStream 
     * @param {Pointer<Guid>} pguidVendor 
     * @param {Integer} metadataOptions 
     * @param {Pointer<IWICBitmapDecoder>} ppIDecoder 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicimagingfactory-createdecoderfromstream
     */
    CreateDecoderFromStream(pIStream, pguidVendor, metadataOptions, ppIDecoder) {
        result := ComCall(4, this, "ptr", pIStream, "ptr", pguidVendor, "int", metadataOptions, "ptr*", ppIDecoder, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} hFile 
     * @param {Pointer<Guid>} pguidVendor 
     * @param {Integer} metadataOptions 
     * @param {Pointer<IWICBitmapDecoder>} ppIDecoder 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicimagingfactory-createdecoderfromfilehandle
     */
    CreateDecoderFromFileHandle(hFile, pguidVendor, metadataOptions, ppIDecoder) {
        result := ComCall(5, this, "ptr", hFile, "ptr", pguidVendor, "int", metadataOptions, "ptr*", ppIDecoder, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} clsidComponent 
     * @param {Pointer<IWICComponentInfo>} ppIInfo 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicimagingfactory-createcomponentinfo
     */
    CreateComponentInfo(clsidComponent, ppIInfo) {
        result := ComCall(6, this, "ptr", clsidComponent, "ptr*", ppIInfo, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} guidContainerFormat 
     * @param {Pointer<Guid>} pguidVendor 
     * @param {Pointer<IWICBitmapDecoder>} ppIDecoder 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicimagingfactory-createdecoder
     */
    CreateDecoder(guidContainerFormat, pguidVendor, ppIDecoder) {
        result := ComCall(7, this, "ptr", guidContainerFormat, "ptr", pguidVendor, "ptr*", ppIDecoder, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} guidContainerFormat 
     * @param {Pointer<Guid>} pguidVendor 
     * @param {Pointer<IWICBitmapEncoder>} ppIEncoder 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicimagingfactory-createencoder
     */
    CreateEncoder(guidContainerFormat, pguidVendor, ppIEncoder) {
        result := ComCall(8, this, "ptr", guidContainerFormat, "ptr", pguidVendor, "ptr*", ppIEncoder, "HRESULT")
        return result
    }

    /**
     * The CreatePalette function creates a logical palette.
     * @param {Pointer<IWICPalette>} ppIPalette 
     * @returns {HRESULT} If the function succeeds, the return value is a handle to a logical palette.
     * 
     * If the function fails, the return value is <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-createpalette
     */
    CreatePalette(ppIPalette) {
        result := ComCall(9, this, "ptr*", ppIPalette, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IWICFormatConverter>} ppIFormatConverter 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicimagingfactory-createformatconverter
     */
    CreateFormatConverter(ppIFormatConverter) {
        result := ComCall(10, this, "ptr*", ppIFormatConverter, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IWICBitmapScaler>} ppIBitmapScaler 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicimagingfactory-createbitmapscaler
     */
    CreateBitmapScaler(ppIBitmapScaler) {
        result := ComCall(11, this, "ptr*", ppIBitmapScaler, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IWICBitmapClipper>} ppIBitmapClipper 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicimagingfactory-createbitmapclipper
     */
    CreateBitmapClipper(ppIBitmapClipper) {
        result := ComCall(12, this, "ptr*", ppIBitmapClipper, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IWICBitmapFlipRotator>} ppIBitmapFlipRotator 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicimagingfactory-createbitmapfliprotator
     */
    CreateBitmapFlipRotator(ppIBitmapFlipRotator) {
        result := ComCall(13, this, "ptr*", ppIBitmapFlipRotator, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IWICStream>} ppIWICStream 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicimagingfactory-createstream
     */
    CreateStream(ppIWICStream) {
        result := ComCall(14, this, "ptr*", ppIWICStream, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IWICColorContext>} ppIWICColorContext 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicimagingfactory-createcolorcontext
     */
    CreateColorContext(ppIWICColorContext) {
        result := ComCall(15, this, "ptr*", ppIWICColorContext, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IWICColorTransform>} ppIWICColorTransform 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicimagingfactory-createcolortransformer
     */
    CreateColorTransformer(ppIWICColorTransform) {
        result := ComCall(16, this, "ptr*", ppIWICColorTransform, "HRESULT")
        return result
    }

    /**
     * The CreateBitmap function creates a bitmap with the specified width, height, and color format (color planes and bits-per-pixel).
     * @param {Integer} uiWidth 
     * @param {Integer} uiHeight 
     * @param {Pointer<Guid>} pixelFormat 
     * @param {Integer} option 
     * @param {Pointer<IWICBitmap>} ppIBitmap 
     * @returns {HRESULT} If the function succeeds, the return value is a handle to a bitmap.
     * 
     * If the function fails, the return value is <b>NULL</b>.
     * 
     * This function can return the following value.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_BITMAP</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The calculated size of the bitmap is less than zero.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-createbitmap
     */
    CreateBitmap(uiWidth, uiHeight, pixelFormat, option, ppIBitmap) {
        result := ComCall(17, this, "uint", uiWidth, "uint", uiHeight, "ptr", pixelFormat, "int", option, "ptr*", ppIBitmap, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IWICBitmapSource} pIBitmapSource 
     * @param {Integer} option 
     * @param {Pointer<IWICBitmap>} ppIBitmap 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicimagingfactory-createbitmapfromsource
     */
    CreateBitmapFromSource(pIBitmapSource, option, ppIBitmap) {
        result := ComCall(18, this, "ptr", pIBitmapSource, "int", option, "ptr*", ppIBitmap, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IWICBitmapSource} pIBitmapSource 
     * @param {Integer} x 
     * @param {Integer} y 
     * @param {Integer} width 
     * @param {Integer} height 
     * @param {Pointer<IWICBitmap>} ppIBitmap 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicimagingfactory-createbitmapfromsourcerect
     */
    CreateBitmapFromSourceRect(pIBitmapSource, x, y, width, height, ppIBitmap) {
        result := ComCall(19, this, "ptr", pIBitmapSource, "uint", x, "uint", y, "uint", width, "uint", height, "ptr*", ppIBitmap, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} uiWidth 
     * @param {Integer} uiHeight 
     * @param {Pointer<Guid>} pixelFormat 
     * @param {Integer} cbStride 
     * @param {Integer} cbBufferSize 
     * @param {Pointer<Integer>} pbBuffer 
     * @param {Pointer<IWICBitmap>} ppIBitmap 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicimagingfactory-createbitmapfrommemory
     */
    CreateBitmapFromMemory(uiWidth, uiHeight, pixelFormat, cbStride, cbBufferSize, pbBuffer, ppIBitmap) {
        result := ComCall(20, this, "uint", uiWidth, "uint", uiHeight, "ptr", pixelFormat, "uint", cbStride, "uint", cbBufferSize, "char*", pbBuffer, "ptr*", ppIBitmap, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HBITMAP} hBitmap 
     * @param {HPALETTE} hPalette 
     * @param {Integer} options 
     * @param {Pointer<IWICBitmap>} ppIBitmap 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicimagingfactory-createbitmapfromhbitmap
     */
    CreateBitmapFromHBITMAP(hBitmap, hPalette, options, ppIBitmap) {
        hBitmap := hBitmap is Win32Handle ? NumGet(hBitmap, "ptr") : hBitmap
        hPalette := hPalette is Win32Handle ? NumGet(hPalette, "ptr") : hPalette

        result := ComCall(21, this, "ptr", hBitmap, "ptr", hPalette, "int", options, "ptr*", ppIBitmap, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HICON} hIcon 
     * @param {Pointer<IWICBitmap>} ppIBitmap 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicimagingfactory-createbitmapfromhicon
     */
    CreateBitmapFromHICON(hIcon, ppIBitmap) {
        hIcon := hIcon is Win32Handle ? NumGet(hIcon, "ptr") : hIcon

        result := ComCall(22, this, "ptr", hIcon, "ptr*", ppIBitmap, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} componentTypes 
     * @param {Integer} options 
     * @param {Pointer<IEnumUnknown>} ppIEnumUnknown 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicimagingfactory-createcomponentenumerator
     */
    CreateComponentEnumerator(componentTypes, options, ppIEnumUnknown) {
        result := ComCall(23, this, "uint", componentTypes, "uint", options, "ptr*", ppIEnumUnknown, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IWICBitmapDecoder} pIDecoder 
     * @param {Pointer<IWICFastMetadataEncoder>} ppIFastEncoder 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicimagingfactory-createfastmetadataencoderfromdecoder
     */
    CreateFastMetadataEncoderFromDecoder(pIDecoder, ppIFastEncoder) {
        result := ComCall(24, this, "ptr", pIDecoder, "ptr*", ppIFastEncoder, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IWICBitmapFrameDecode} pIFrameDecoder 
     * @param {Pointer<IWICFastMetadataEncoder>} ppIFastEncoder 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicimagingfactory-createfastmetadataencoderfromframedecode
     */
    CreateFastMetadataEncoderFromFrameDecode(pIFrameDecoder, ppIFastEncoder) {
        result := ComCall(25, this, "ptr", pIFrameDecoder, "ptr*", ppIFastEncoder, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} guidMetadataFormat 
     * @param {Pointer<Guid>} pguidVendor 
     * @param {Pointer<IWICMetadataQueryWriter>} ppIQueryWriter 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicimagingfactory-createquerywriter
     */
    CreateQueryWriter(guidMetadataFormat, pguidVendor, ppIQueryWriter) {
        result := ComCall(26, this, "ptr", guidMetadataFormat, "ptr", pguidVendor, "ptr*", ppIQueryWriter, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IWICMetadataQueryReader} pIQueryReader 
     * @param {Pointer<Guid>} pguidVendor 
     * @param {Pointer<IWICMetadataQueryWriter>} ppIQueryWriter 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicimagingfactory-createquerywriterfromreader
     */
    CreateQueryWriterFromReader(pIQueryReader, pguidVendor, ppIQueryWriter) {
        result := ComCall(27, this, "ptr", pIQueryReader, "ptr", pguidVendor, "ptr*", ppIQueryWriter, "HRESULT")
        return result
    }
}
