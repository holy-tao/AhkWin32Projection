#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IWICBitmapFrameEncode.ahk" { IWICBitmapFrameEncode }
#Import ".\WICDdsParameters.ahk" { WICDdsParameters }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Enables writing DDS format specific information to an encoder.
 * @remarks
 * This interface is implemented by the WIC DDS codec. To obtain this interface, create an <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicbitmapencoder">IWICBitmapEncoder</a> using the DDS codec and QueryInterface for <b>IWICDdsEncoder</b>.
 * @see https://learn.microsoft.com/windows/win32/api/wincodec/nn-wincodec-iwicddsencoder
 * @namespace Windows.Win32.Graphics.Imaging
 */
export default struct IWICDdsEncoder extends IUnknown {
    /**
     * The interface identifier for IWICDdsEncoder
     * @type {Guid}
     */
    static IID := Guid("{5cacdb4c-407e-41b3-b936-d0f010cd6732}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWICDdsEncoder interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetParameters  : IntPtr
        GetParameters  : IntPtr
        CreateNewFrame : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWICDdsEncoder.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
        result := ComCall(3, this, WICDdsParameters.Ptr, pParameters, "HRESULT")
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
        result := ComCall(4, this, WICDdsParameters.Ptr, pParameters, "HRESULT")
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

        result := ComCall(5, this, IWICBitmapFrameEncode.Ptr, ppIFrameEncode, pArrayIndexMarshal, pArrayIndex, pMipLevelMarshal, pMipLevel, pSliceIndexMarshal, pSliceIndex, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWICDdsEncoder.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetParameters := CallbackCreate(GetMethod(implObj, "SetParameters"), flags, 2)
        this.vtbl.GetParameters := CallbackCreate(GetMethod(implObj, "GetParameters"), flags, 2)
        this.vtbl.CreateNewFrame := CallbackCreate(GetMethod(implObj, "CreateNewFrame"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetParameters)
        CallbackFree(this.vtbl.GetParameters)
        CallbackFree(this.vtbl.CreateNewFrame)
    }
}
