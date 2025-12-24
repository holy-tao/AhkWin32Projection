#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWICFormatConverter.ahk
#Include .\IWICComponentInfo.ahk

/**
 * Exposes methods that provide information about a pixel format converter.
 * @see https://docs.microsoft.com/windows/win32/api//wincodec/nn-wincodec-iwicformatconverterinfo
 * @namespace Windows.Win32.Graphics.Imaging
 * @version v4.0.30319
 */
class IWICFormatConverterInfo extends IWICComponentInfo{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWICFormatConverterInfo
     * @type {Guid}
     */
    static IID => Guid("{9f34fb65-13f4-4f15-bc57-3726b5e53d9f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 11

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetPixelFormats", "CreateInstance"]

    /**
     * Retrieves a list of GUIDs that signify which pixel formats the converter supports.
     * @param {Integer} cFormats Type: <b>UINT</b>
     * 
     * The size of the <i>pPixelFormatGUIDs</i> array.
     * @param {Pointer<Guid>} pPixelFormatGUIDs Type: <b>WICPixelFormatGUID*</b>
     * 
     * Pointer to a GUID array that receives the pixel formats the converter supports.
     * @returns {Integer} Type: <b>UINT*</b>
     * 
     * The actual array size needed to retrieve all pixel formats supported by the converter.
     * @see https://docs.microsoft.com/windows/win32/api//wincodec/nf-wincodec-iwicformatconverterinfo-getpixelformats
     */
    GetPixelFormats(cFormats, pPixelFormatGUIDs) {
        result := ComCall(11, this, "uint", cFormats, "ptr", pPixelFormatGUIDs, "uint*", &pcActual := 0, "HRESULT")
        return pcActual
    }

    /**
     * Creates a new IWICFormatConverter instance.
     * @returns {IWICFormatConverter} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicformatconverter">IWICFormatConverter</a>**</b>
     * 
     * A pointer that receives a new <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicformatconverter">IWICFormatConverter</a> instance.
     * @see https://docs.microsoft.com/windows/win32/api//wincodec/nf-wincodec-iwicformatconverterinfo-createinstance
     */
    CreateInstance() {
        result := ComCall(12, this, "ptr*", &ppIConverter := 0, "HRESULT")
        return IWICFormatConverter(ppIConverter)
    }
}
