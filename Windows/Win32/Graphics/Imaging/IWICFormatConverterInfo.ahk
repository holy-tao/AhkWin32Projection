#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * 
     * @param {Integer} cFormats 
     * @param {Pointer<Guid>} pPixelFormatGUIDs 
     * @param {Pointer<Integer>} pcActual 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicformatconverterinfo-getpixelformats
     */
    GetPixelFormats(cFormats, pPixelFormatGUIDs, pcActual) {
        result := ComCall(11, this, "uint", cFormats, "ptr", pPixelFormatGUIDs, "uint*", pcActual, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IWICFormatConverter>} ppIConverter 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicformatconverterinfo-createinstance
     */
    CreateInstance(ppIConverter) {
        result := ComCall(12, this, "ptr*", ppIConverter, "HRESULT")
        return result
    }
}
