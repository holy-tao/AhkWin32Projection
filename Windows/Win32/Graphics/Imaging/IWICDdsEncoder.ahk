#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Enables writing DDS format specific information to an encoder.
 * @remarks
 * 
  * This interface is implemented by the WIC DDS codec. To obtain this interface, create an <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicbitmapencoder">IWICBitmapEncoder</a> using the DDS codec and QueryInterface for <b>IWICDdsEncoder</b>.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//wincodec/nn-wincodec-iwicddsencoder
 * @namespace Windows.Win32.Graphics.Imaging
 * @version v4.0.30319
 */
class IWICDdsEncoder extends IUnknown{
    /**
     * The interface identifier for IWICDdsEncoder
     * @type {Guid}
     */
    static IID => Guid("{5cacdb4c-407e-41b3-b936-d0f010cd6732}")

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
    SetParameters(pParameters) {
        result := ComCall(3, this, "ptr", pParameters, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<WICDdsParameters>} pParameters 
     * @returns {HRESULT} 
     */
    GetParameters(pParameters) {
        result := ComCall(4, this, "ptr", pParameters, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IWICBitmapFrameEncode>} ppIFrameEncode 
     * @param {Pointer<UInt32>} pArrayIndex 
     * @param {Pointer<UInt32>} pMipLevel 
     * @param {Pointer<UInt32>} pSliceIndex 
     * @returns {HRESULT} 
     */
    CreateNewFrame(ppIFrameEncode, pArrayIndex, pMipLevel, pSliceIndex) {
        result := ComCall(5, this, "ptr", ppIFrameEncode, "uint*", pArrayIndex, "uint*", pMipLevel, "uint*", pSliceIndex, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
