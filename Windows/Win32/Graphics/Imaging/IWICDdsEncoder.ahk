#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\WICDdsParameters.ahk
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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetParameters", "GetParameters", "CreateNewFrame"]

    /**
     * 
     * @param {Pointer<WICDdsParameters>} pParameters 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicddsencoder-setparameters
     */
    SetParameters(pParameters) {
        result := ComCall(3, this, "ptr", pParameters, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {WICDdsParameters} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicddsencoder-getparameters
     */
    GetParameters() {
        pParameters := WICDdsParameters()
        result := ComCall(4, this, "ptr", pParameters, "HRESULT")
        return pParameters
    }

    /**
     * 
     * @param {Pointer<IWICBitmapFrameEncode>} ppIFrameEncode 
     * @param {Pointer<Integer>} pArrayIndex 
     * @param {Pointer<Integer>} pMipLevel 
     * @param {Pointer<Integer>} pSliceIndex 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicddsencoder-createnewframe
     */
    CreateNewFrame(ppIFrameEncode, pArrayIndex, pMipLevel, pSliceIndex) {
        pArrayIndexMarshal := pArrayIndex is VarRef ? "uint*" : "ptr"
        pMipLevelMarshal := pMipLevel is VarRef ? "uint*" : "ptr"
        pSliceIndexMarshal := pSliceIndex is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, "ptr*", ppIFrameEncode, pArrayIndexMarshal, pArrayIndex, pMipLevelMarshal, pMipLevel, pSliceIndexMarshal, pSliceIndex, "HRESULT")
        return result
    }
}
