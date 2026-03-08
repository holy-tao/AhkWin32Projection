#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\WICDdsParameters.ahk
#Include .\IWICBitmapFrameDecode.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides information and functionality specific to the DDS image format.
 * @remarks
 * This interface is implemented by the WIC DDS codec. To obtain this interface, create an <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicbitmapdecoder">IWICBitmapDecoder</a> using the DDS codec and QueryInterface for <b>IWICDdsDecoder</b>.
 * @see https://learn.microsoft.com/windows/win32/api/wincodec/nn-wincodec-iwicddsdecoder
 * @namespace Windows.Win32.Graphics.Imaging
 * @version v4.0.30319
 */
class IWICDdsDecoder extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWICDdsDecoder
     * @type {Guid}
     */
    static IID => Guid("{409cd537-8532-40cb-9774-e2feb2df4e9c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetParameters", "GetFrame"]

    /**
     * Gets DDS-specific data. (IWICDdsDecoder.GetParameters)
     * @returns {WICDdsParameters} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ns-wincodec-wicddsparameters">WICDdsParameters</a>*</b>
     * 
     * A pointer to the structure where the information is returned.
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicddsdecoder-getparameters
     */
    GetParameters() {
        pParameters := WICDdsParameters()
        result := ComCall(3, this, "ptr", pParameters, "HRESULT")
        return pParameters
    }

    /**
     * Retrieves the specified frame of the DDS image.
     * @remarks
     * A DDS file can contain multiple images that are organized into a three level hierarchy. First, DDS file may contain multiple textures in a texture array. Second, each texture can have multiple mip levels. Finally, the texture may be a 3D (volume) texture and have multiple slices, each of which is a 2D texture. See the <a href="https://docs.microsoft.com/windows/desktop/direct3ddds/dx-graphics-dds">DDS documentation</a> for more information.
     * 
     * WIC maps this three level hierarchy into a linear array of <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicbitmapframedecode">IWICBitmapFrameDecode</a>, accessible via <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nf-wincodec-iwicbitmapdecoder-getframe">IWICBitmapDecoder::GetFrame</a>. However, determining which frame corresponds to a triad of <i>arrayIndex</i>, <i>mipLevel</i>, and <i>sliceIndex</i> value is not trivial because each mip level of a 3D texture has a different depth (number of slices). This method provides additional convenience over <b>IWICBitmapDecoder::GetFrame</b> for DDS images by calculating the correct frame given the three indices.
     * @param {Integer} arrayIndex Type: <b>UINT</b>
     * 
     * The requested index within the texture array.
     * @param {Integer} mipLevel Type: <b>UINT</b>
     * 
     * The requested mip level.
     * @param {Integer} sliceIndex Type: <b>UINT</b>
     * 
     * The requested slice within the 3D texture.
     * @returns {IWICBitmapFrameDecode} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicbitmapframedecode">IWICBitmapFrameDecode</a>**</b>
     * 
     * A pointer to a  <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicbitmapframedecode">IWICBitmapFrameDecode</a> object.
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicddsdecoder-getframe
     */
    GetFrame(arrayIndex, mipLevel, sliceIndex) {
        result := ComCall(4, this, "uint", arrayIndex, "uint", mipLevel, "uint", sliceIndex, "ptr*", &ppIBitmapFrame := 0, "HRESULT")
        return IWICBitmapFrameDecode(ppIBitmapFrame)
    }
}
