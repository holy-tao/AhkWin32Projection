#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides information and functionality specific to the DDS image format.
 * @remarks
 * 
  * This interface is implemented by the WIC DDS codec. To obtain this interface, create an <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicbitmapdecoder">IWICBitmapDecoder</a> using the DDS codec and QueryInterface for <b>IWICDdsDecoder</b>.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//wincodec/nn-wincodec-iwicddsdecoder
 * @namespace Windows.Win32.Graphics.Imaging
 * @version v4.0.30319
 */
class IWICDdsDecoder extends IUnknown{
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
     * 
     * @param {Pointer<WICDdsParameters>} pParameters 
     * @returns {HRESULT} 
     */
    GetParameters(pParameters) {
        result := ComCall(3, this, "ptr", pParameters, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} arrayIndex 
     * @param {Integer} mipLevel 
     * @param {Integer} sliceIndex 
     * @param {Pointer<IWICBitmapFrameDecode>} ppIBitmapFrame 
     * @returns {HRESULT} 
     */
    GetFrame(arrayIndex, mipLevel, sliceIndex, ppIBitmapFrame) {
        result := ComCall(4, this, "uint", arrayIndex, "uint", mipLevel, "uint", sliceIndex, "ptr", ppIBitmapFrame, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
