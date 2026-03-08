#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\WICDdsParameters.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Enables writing DDS format specific information to an encoder.
 * @remarks
 * This interface is implemented by the WIC DDS codec. To obtain this interface, create an <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicbitmapencoder">IWICBitmapEncoder</a> using the DDS codec and QueryInterface for <b>IWICDdsEncoder</b>.
 * @see https://learn.microsoft.com/windows/win32/api/wincodec/nn-wincodec-iwicddsencoder
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
     * Sets DDS-specific data.
     * @remarks
     * You cannot call this method after you have started to write frame data, for example by calling <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nf-wincodec-iwicddsencoder-createnewframe">IWICDdsEncoder::CreateNewFrame</a>.
     * 
     * 
     * 
     * Setting DDS parameters using this method provides the DDS encoder with information about the expected number of frames and the dimensions and other parameters of each frame. The DDS encoder will fail if you do not set frame data that matches these expectations. For example, if you set <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ns-wincodec-wicddsparameters">WICDdsParameters::Width</a> and <b>Height</b> to 32, and <b>MipLevels</b> to 6, the DDS encoder will expect 6 frames with the following dimensions:
     * 
     * <ul>
     * <li>32x32 pixels.</li>
     * <li>16x16 pixels.</li>
     * <li>8x8 pixels.</li>
     * <li>4x4 pixels.</li>
     * <li>2x2 pixels.</li>
     * <li>1x1 pixels.</li>
     * </ul>
     * @param {Pointer<WICDdsParameters>} pParameters Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ns-wincodec-wicddsparameters">WICDdsParameters</a>*</b>
     * 
     * Points to the structure where the information is described.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicddsencoder-setparameters
     */
    SetParameters(pParameters) {
        result := ComCall(3, this, "ptr", pParameters, "HRESULT")
        return result
    }

    /**
     * Gets DDS-specific data. (IWICDdsEncoder.GetParameters)
     * @remarks
     * An application can call <b>GetParameters</b> to obtain the default DDS parameters, modify some or all of them, and then call <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nf-wincodec-iwicddsencoder-setparameters">SetParameters</a>.
     * @returns {WICDdsParameters} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ns-wincodec-wicddsparameters">WICDdsParameters</a>*</b>
     * 
     * Points to the structure where the information is returned.
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicddsencoder-getparameters
     */
    GetParameters() {
        pParameters := WICDdsParameters()
        result := ComCall(4, this, "ptr", pParameters, "HRESULT")
        return pParameters
    }

    /**
     * Creates a new frame to encode.
     * @remarks
     * This is equivalent to <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nf-wincodec-iwicbitmapencoder-createnewframe">IWICBitmapEncoder::CreateNewFrame</a>, but returns additional information about the array index, mip level and slice of the newly created frame. In contrast to <b>IWICBitmapEncoder::CreateNewFrame</b>, there is no <a href="https://docs.microsoft.com/windows/desktop/wic/-wic-codec-ipropertybag2-write-proxy">IPropertyBag2</a>* parameter because individual DDS frames do not have separate properties.
     * @param {Pointer<IWICBitmapFrameEncode>} ppIFrameEncode A pointer to the newly created frame object.
     * @param {Pointer<Integer>} pArrayIndex Points to the location where the array index is returned.
     * @param {Pointer<Integer>} pMipLevel Points to the location where the mip level index is returned.
     * @param {Pointer<Integer>} pSliceIndex Points to the location where the slice index is returned.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
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
