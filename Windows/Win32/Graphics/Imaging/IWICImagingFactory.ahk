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
     * 
     * @param {PWSTR} wzFilename 
     * @param {Pointer<Guid>} pguidVendor 
     * @param {Integer} dwDesiredAccess 
     * @param {Integer} metadataOptions 
     * @returns {IWICBitmapDecoder} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicimagingfactory-createdecoderfromfilename
     */
    CreateDecoderFromFilename(wzFilename, pguidVendor, dwDesiredAccess, metadataOptions) {
        wzFilename := wzFilename is String ? StrPtr(wzFilename) : wzFilename

        result := ComCall(3, this, "ptr", wzFilename, "ptr", pguidVendor, "uint", dwDesiredAccess, "int", metadataOptions, "ptr*", &ppIDecoder := 0, "HRESULT")
        return IWICBitmapDecoder(ppIDecoder)
    }

    /**
     * 
     * @param {IStream} pIStream 
     * @param {Pointer<Guid>} pguidVendor 
     * @param {Integer} metadataOptions 
     * @returns {IWICBitmapDecoder} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicimagingfactory-createdecoderfromstream
     */
    CreateDecoderFromStream(pIStream, pguidVendor, metadataOptions) {
        result := ComCall(4, this, "ptr", pIStream, "ptr", pguidVendor, "int", metadataOptions, "ptr*", &ppIDecoder := 0, "HRESULT")
        return IWICBitmapDecoder(ppIDecoder)
    }

    /**
     * 
     * @param {Pointer} hFile 
     * @param {Pointer<Guid>} pguidVendor 
     * @param {Integer} metadataOptions 
     * @returns {IWICBitmapDecoder} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicimagingfactory-createdecoderfromfilehandle
     */
    CreateDecoderFromFileHandle(hFile, pguidVendor, metadataOptions) {
        result := ComCall(5, this, "ptr", hFile, "ptr", pguidVendor, "int", metadataOptions, "ptr*", &ppIDecoder := 0, "HRESULT")
        return IWICBitmapDecoder(ppIDecoder)
    }

    /**
     * 
     * @param {Pointer<Guid>} clsidComponent 
     * @returns {IWICComponentInfo} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicimagingfactory-createcomponentinfo
     */
    CreateComponentInfo(clsidComponent) {
        result := ComCall(6, this, "ptr", clsidComponent, "ptr*", &ppIInfo := 0, "HRESULT")
        return IWICComponentInfo(ppIInfo)
    }

    /**
     * 
     * @param {Pointer<Guid>} guidContainerFormat 
     * @param {Pointer<Guid>} pguidVendor 
     * @returns {IWICBitmapDecoder} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicimagingfactory-createdecoder
     */
    CreateDecoder(guidContainerFormat, pguidVendor) {
        result := ComCall(7, this, "ptr", guidContainerFormat, "ptr", pguidVendor, "ptr*", &ppIDecoder := 0, "HRESULT")
        return IWICBitmapDecoder(ppIDecoder)
    }

    /**
     * 
     * @param {Pointer<Guid>} guidContainerFormat 
     * @param {Pointer<Guid>} pguidVendor 
     * @returns {IWICBitmapEncoder} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicimagingfactory-createencoder
     */
    CreateEncoder(guidContainerFormat, pguidVendor) {
        result := ComCall(8, this, "ptr", guidContainerFormat, "ptr", pguidVendor, "ptr*", &ppIEncoder := 0, "HRESULT")
        return IWICBitmapEncoder(ppIEncoder)
    }

    /**
     * The CreatePalette function creates a logical palette.
     * @returns {IWICPalette} 
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-createpalette
     */
    CreatePalette() {
        result := ComCall(9, this, "ptr*", &ppIPalette := 0, "HRESULT")
        return IWICPalette(ppIPalette)
    }

    /**
     * 
     * @returns {IWICFormatConverter} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicimagingfactory-createformatconverter
     */
    CreateFormatConverter() {
        result := ComCall(10, this, "ptr*", &ppIFormatConverter := 0, "HRESULT")
        return IWICFormatConverter(ppIFormatConverter)
    }

    /**
     * 
     * @returns {IWICBitmapScaler} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicimagingfactory-createbitmapscaler
     */
    CreateBitmapScaler() {
        result := ComCall(11, this, "ptr*", &ppIBitmapScaler := 0, "HRESULT")
        return IWICBitmapScaler(ppIBitmapScaler)
    }

    /**
     * 
     * @returns {IWICBitmapClipper} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicimagingfactory-createbitmapclipper
     */
    CreateBitmapClipper() {
        result := ComCall(12, this, "ptr*", &ppIBitmapClipper := 0, "HRESULT")
        return IWICBitmapClipper(ppIBitmapClipper)
    }

    /**
     * 
     * @returns {IWICBitmapFlipRotator} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicimagingfactory-createbitmapfliprotator
     */
    CreateBitmapFlipRotator() {
        result := ComCall(13, this, "ptr*", &ppIBitmapFlipRotator := 0, "HRESULT")
        return IWICBitmapFlipRotator(ppIBitmapFlipRotator)
    }

    /**
     * 
     * @returns {IWICStream} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicimagingfactory-createstream
     */
    CreateStream() {
        result := ComCall(14, this, "ptr*", &ppIWICStream := 0, "HRESULT")
        return IWICStream(ppIWICStream)
    }

    /**
     * 
     * @returns {IWICColorContext} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicimagingfactory-createcolorcontext
     */
    CreateColorContext() {
        result := ComCall(15, this, "ptr*", &ppIWICColorContext := 0, "HRESULT")
        return IWICColorContext(ppIWICColorContext)
    }

    /**
     * 
     * @returns {IWICColorTransform} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicimagingfactory-createcolortransformer
     */
    CreateColorTransformer() {
        result := ComCall(16, this, "ptr*", &ppIWICColorTransform := 0, "HRESULT")
        return IWICColorTransform(ppIWICColorTransform)
    }

    /**
     * The CreateBitmap function creates a bitmap with the specified width, height, and color format (color planes and bits-per-pixel).
     * @param {Integer} uiWidth 
     * @param {Integer} uiHeight 
     * @param {Pointer<Guid>} pixelFormat 
     * @param {Integer} option 
     * @returns {IWICBitmap} 
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-createbitmap
     */
    CreateBitmap(uiWidth, uiHeight, pixelFormat, option) {
        result := ComCall(17, this, "uint", uiWidth, "uint", uiHeight, "ptr", pixelFormat, "int", option, "ptr*", &ppIBitmap := 0, "HRESULT")
        return IWICBitmap(ppIBitmap)
    }

    /**
     * 
     * @param {IWICBitmapSource} pIBitmapSource 
     * @param {Integer} option 
     * @returns {IWICBitmap} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicimagingfactory-createbitmapfromsource
     */
    CreateBitmapFromSource(pIBitmapSource, option) {
        result := ComCall(18, this, "ptr", pIBitmapSource, "int", option, "ptr*", &ppIBitmap := 0, "HRESULT")
        return IWICBitmap(ppIBitmap)
    }

    /**
     * 
     * @param {IWICBitmapSource} pIBitmapSource 
     * @param {Integer} x 
     * @param {Integer} y 
     * @param {Integer} width 
     * @param {Integer} height 
     * @returns {IWICBitmap} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicimagingfactory-createbitmapfromsourcerect
     */
    CreateBitmapFromSourceRect(pIBitmapSource, x, y, width, height) {
        result := ComCall(19, this, "ptr", pIBitmapSource, "uint", x, "uint", y, "uint", width, "uint", height, "ptr*", &ppIBitmap := 0, "HRESULT")
        return IWICBitmap(ppIBitmap)
    }

    /**
     * 
     * @param {Integer} uiWidth 
     * @param {Integer} uiHeight 
     * @param {Pointer<Guid>} pixelFormat 
     * @param {Integer} cbStride 
     * @param {Integer} cbBufferSize 
     * @param {Pointer<Integer>} pbBuffer 
     * @returns {IWICBitmap} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicimagingfactory-createbitmapfrommemory
     */
    CreateBitmapFromMemory(uiWidth, uiHeight, pixelFormat, cbStride, cbBufferSize, pbBuffer) {
        pbBufferMarshal := pbBuffer is VarRef ? "char*" : "ptr"

        result := ComCall(20, this, "uint", uiWidth, "uint", uiHeight, "ptr", pixelFormat, "uint", cbStride, "uint", cbBufferSize, pbBufferMarshal, pbBuffer, "ptr*", &ppIBitmap := 0, "HRESULT")
        return IWICBitmap(ppIBitmap)
    }

    /**
     * 
     * @param {HBITMAP} hBitmap 
     * @param {HPALETTE} hPalette 
     * @param {Integer} options 
     * @returns {IWICBitmap} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicimagingfactory-createbitmapfromhbitmap
     */
    CreateBitmapFromHBITMAP(hBitmap, hPalette, options) {
        hBitmap := hBitmap is Win32Handle ? NumGet(hBitmap, "ptr") : hBitmap
        hPalette := hPalette is Win32Handle ? NumGet(hPalette, "ptr") : hPalette

        result := ComCall(21, this, "ptr", hBitmap, "ptr", hPalette, "int", options, "ptr*", &ppIBitmap := 0, "HRESULT")
        return IWICBitmap(ppIBitmap)
    }

    /**
     * 
     * @param {HICON} hIcon 
     * @returns {IWICBitmap} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicimagingfactory-createbitmapfromhicon
     */
    CreateBitmapFromHICON(hIcon) {
        hIcon := hIcon is Win32Handle ? NumGet(hIcon, "ptr") : hIcon

        result := ComCall(22, this, "ptr", hIcon, "ptr*", &ppIBitmap := 0, "HRESULT")
        return IWICBitmap(ppIBitmap)
    }

    /**
     * 
     * @param {Integer} componentTypes 
     * @param {Integer} options 
     * @returns {IEnumUnknown} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicimagingfactory-createcomponentenumerator
     */
    CreateComponentEnumerator(componentTypes, options) {
        result := ComCall(23, this, "uint", componentTypes, "uint", options, "ptr*", &ppIEnumUnknown := 0, "HRESULT")
        return IEnumUnknown(ppIEnumUnknown)
    }

    /**
     * 
     * @param {IWICBitmapDecoder} pIDecoder 
     * @returns {IWICFastMetadataEncoder} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicimagingfactory-createfastmetadataencoderfromdecoder
     */
    CreateFastMetadataEncoderFromDecoder(pIDecoder) {
        result := ComCall(24, this, "ptr", pIDecoder, "ptr*", &ppIFastEncoder := 0, "HRESULT")
        return IWICFastMetadataEncoder(ppIFastEncoder)
    }

    /**
     * 
     * @param {IWICBitmapFrameDecode} pIFrameDecoder 
     * @returns {IWICFastMetadataEncoder} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicimagingfactory-createfastmetadataencoderfromframedecode
     */
    CreateFastMetadataEncoderFromFrameDecode(pIFrameDecoder) {
        result := ComCall(25, this, "ptr", pIFrameDecoder, "ptr*", &ppIFastEncoder := 0, "HRESULT")
        return IWICFastMetadataEncoder(ppIFastEncoder)
    }

    /**
     * 
     * @param {Pointer<Guid>} guidMetadataFormat 
     * @param {Pointer<Guid>} pguidVendor 
     * @returns {IWICMetadataQueryWriter} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicimagingfactory-createquerywriter
     */
    CreateQueryWriter(guidMetadataFormat, pguidVendor) {
        result := ComCall(26, this, "ptr", guidMetadataFormat, "ptr", pguidVendor, "ptr*", &ppIQueryWriter := 0, "HRESULT")
        return IWICMetadataQueryWriter(ppIQueryWriter)
    }

    /**
     * 
     * @param {IWICMetadataQueryReader} pIQueryReader 
     * @param {Pointer<Guid>} pguidVendor 
     * @returns {IWICMetadataQueryWriter} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicimagingfactory-createquerywriterfromreader
     */
    CreateQueryWriterFromReader(pIQueryReader, pguidVendor) {
        result := ComCall(27, this, "ptr", pIQueryReader, "ptr", pguidVendor, "ptr*", &ppIQueryWriter := 0, "HRESULT")
        return IWICMetadataQueryWriter(ppIQueryWriter)
    }
}
