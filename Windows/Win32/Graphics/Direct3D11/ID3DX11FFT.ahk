#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\ID3D11UnorderedAccessView.ahk" { ID3D11UnorderedAccessView }

/**
 * Encapsulates forward and inverse FFTs.
 * @see https://learn.microsoft.com/windows/win32/api/d3dcsx/nn-d3dcsx-id3dx11fft
 * @namespace Windows.Win32.Graphics.Direct3D11
 */
export default struct ID3DX11FFT extends IUnknown {
    /**
     * The interface identifier for ID3DX11FFT
     * @type {Guid}
     */
    static IID := Guid("{b3f7a938-4c93-4310-a675-b30d6de50553}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3DX11FFT interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetForwardScale            : IntPtr
        GetForwardScale            : IntPtr
        SetInverseScale            : IntPtr
        GetInverseScale            : IntPtr
        AttachBuffersAndPrecompute : IntPtr
        ForwardTransform           : IntPtr
        InverseTransform           : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3DX11FFT.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Sets the scale used for forward transforms.
     * @remarks
     * <b>SetForwardScale</b> sets the scale used by <a href="https://docs.microsoft.com/windows/desktop/api/d3dcsx/nf-d3dcsx-id3dx11fft-forwardtransform">ID3DX11FFT::ForwardTransform</a>.
     * @param {Float} ForwardScale Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">FLOAT</a></b>
     * 
     * The scale to use for forward transforms.  Setting <i>ForwardScale</i> to 0 causes the default values of 1 to be used.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * Returns one of the return codes described in the topic <a href="https://docs.microsoft.com/windows/desktop/direct3d11/d3d11-graphics-reference-returnvalues">Direct3D 11 Return Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/d3dcsx/nf-d3dcsx-id3dx11fft-setforwardscale
     */
    SetForwardScale(ForwardScale) {
        result := ComCall(3, this, "float", ForwardScale, "HRESULT")
        return result
    }

    /**
     * Gets the scale for forward transforms.
     * @returns {Float} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">FLOAT</a></b>
     * 
     * Scale for forward transforms.
     * @see https://learn.microsoft.com/windows/win32/api/d3dcsx/nf-d3dcsx-id3dx11fft-getforwardscale
     */
    GetForwardScale() {
        result := ComCall(4, this, Float32)
        return result
    }

    /**
     * Sets the scale used for inverse transforms.
     * @remarks
     * <b>SetInverseScale</b> sets the scale used by <a href="https://docs.microsoft.com/windows/desktop/api/d3dcsx/nf-d3dcsx-id3dx11fft-inversetransform">ID3DX11FFT::InverseTransform</a>.
     * @param {Float} InverseScale Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">FLOAT</a></b>
     * 
     * Scale used for inverse transforms.  Setting <i>InverseScale</i> to 0 causes the default value of 1/N to be used, 
     *           where N is the product of the transformed dimension lengths.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * Returns one of the return codes described in the topic <a href="https://docs.microsoft.com/windows/desktop/direct3d11/d3d11-graphics-reference-returnvalues">Direct3D 11 Return Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/d3dcsx/nf-d3dcsx-id3dx11fft-setinversescale
     */
    SetInverseScale(InverseScale) {
        result := ComCall(5, this, "float", InverseScale, "HRESULT")
        return result
    }

    /**
     * Get the scale for inverse transforms.
     * @returns {Float} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">FLOAT</a></b>
     * 
     * Scale for inverse transforms.
     * @see https://learn.microsoft.com/windows/win32/api/d3dcsx/nf-d3dcsx-id3dx11fft-getinversescale
     */
    GetInverseScale() {
        result := ComCall(6, this, Float32)
        return result
    }

    /**
     * Attaches buffers to an FFT context and performs any required precomputations.
     * @remarks
     * The <a href="https://docs.microsoft.com/windows/desktop/api/d3dcsx/ns-d3dcsx-d3dx11_fft_buffer_info">D3DX11_FFT_BUFFER_INFO</a> structure is initialized by a call to one of the create-FFT functions 
     *       (for example, <a href="https://docs.microsoft.com/windows/desktop/api/d3dcsx/nf-d3dcsx-d3dx11createfft">D3DX11CreateFFT</a>). For more create-FFT functions, see <a href="https://docs.microsoft.com/windows/desktop/direct3d11/d3d11-graphics-reference-d3dcsx11-functions">D3DCSX 11 Functions</a>.
     * 
     * Use the info in <a href="https://docs.microsoft.com/windows/desktop/api/d3dcsx/ns-d3dcsx-d3dx11_fft_buffer_info">D3DX11_FFT_BUFFER_INFO</a> to allocate raw buffers of the specified (or larger) sizes and then call the <b>AttachBuffersAndPrecompute</b> to register the buffers with the FFT object.
     * 
     * Although you can share temporary buffers between multiple
     *       device contexts, we recommend not to concurrently execute multiple FFT objects that share temporary buffers.
     * 
     * Some FFT algorithms benefit from precomputing sin and cos. The FFT object might store precomputed data  in the user-supplied precompute buffers.
     * @param {Integer} NumTempBuffers Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Number of buffers in <i>ppTempBuffers</i>.
     * @param {Pointer<ID3D11UnorderedAccessView>} ppTempBuffers Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11unorderedaccessview">ID3D11UnorderedAccessView</a>*</b>
     * 
     * A pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11unorderedaccessview">ID3D11UnorderedAccessView</a> pointers for the temporary buffers to attach. The FFT object might use these temporary buffers for its algorithm.
     * @param {Integer} NumPrecomputeBuffers Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Number of buffers in <i>ppPrecomputeBuffers</i>.
     * @param {Pointer<ID3D11UnorderedAccessView>} ppPrecomputeBufferSizes Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11unorderedaccessview">ID3D11UnorderedAccessView</a>*</b>
     * 
     * A pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11unorderedaccessview">ID3D11UnorderedAccessView</a> pointers for the precompute buffers to attach. The FFT object might store precomputed data  in these buffers.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * Returns one of the return codes described in the topic <a href="https://docs.microsoft.com/windows/desktop/direct3d11/d3d11-graphics-reference-returnvalues">Direct3D 11 Return Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/d3dcsx/nf-d3dcsx-id3dx11fft-attachbuffersandprecompute
     */
    AttachBuffersAndPrecompute(NumTempBuffers, ppTempBuffers, NumPrecomputeBuffers, ppPrecomputeBufferSizes) {
        result := ComCall(7, this, "uint", NumTempBuffers, ID3D11UnorderedAccessView.Ptr, ppTempBuffers, "uint", NumPrecomputeBuffers, ID3D11UnorderedAccessView.Ptr, ppPrecomputeBufferSizes, "HRESULT")
        return result
    }

    /**
     * Performs a forward FFT.
     * @remarks
     * <b>ForwardTransform</b> can be called after buffers have been attached to the context using <a href="https://docs.microsoft.com/windows/desktop/api/d3dcsx/nf-d3dcsx-id3dx11fft-attachbuffersandprecompute">ID3DX11FFT::AttachBuffersAndPrecompute</a>. The combination of <i>pInputBuffer</i> and *<i>ppOutputBuffer</i> can be one of the temp buffers.
     * 
     * The format of complex data is interleaved components (for example, (Real0, Imag0), 
     *       (Real1, Imag1) ... , and so on). Data is stored in row major order.
     * @param {ID3D11UnorderedAccessView} pInputBuffer Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11unorderedaccessview">ID3D11UnorderedAccessView</a>*</b>
     * 
     * Pointer to <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11unorderedaccessview">ID3D11UnorderedAccessView</a> onto the input buffer.
     * @param {Pointer<ID3D11UnorderedAccessView>} ppOutputBuffer Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11unorderedaccessview">ID3D11UnorderedAccessView</a>**</b>
     * 
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11unorderedaccessview">ID3D11UnorderedAccessView</a> pointer.  If *<i>ppOutputBuffer</i> is <b>NULL</b>, the computation will switch
     *           between temp buffers; in addition, the last buffer written to is stored at *<i>ppOutputBuffer</i>.
     *           Otherwise, *<i>ppOutputBuffer</i> is used as the output buffer (which might incur an extra copy).
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * Returns one of the return codes described in the topic <a href="https://docs.microsoft.com/windows/desktop/direct3d11/d3d11-graphics-reference-returnvalues">Direct3D 11 Return Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/d3dcsx/nf-d3dcsx-id3dx11fft-forwardtransform
     */
    ForwardTransform(pInputBuffer, ppOutputBuffer) {
        result := ComCall(8, this, "ptr", pInputBuffer, ID3D11UnorderedAccessView.Ptr, ppOutputBuffer, "HRESULT")
        return result
    }

    /**
     * Performs an inverse FFT.
     * @param {ID3D11UnorderedAccessView} pInputBuffer Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11unorderedaccessview">ID3D11UnorderedAccessView</a>*</b>
     * 
     * Pointer to <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11unorderedaccessview">ID3D11UnorderedAccessView</a> onto the input buffer.
     * @param {Pointer<ID3D11UnorderedAccessView>} ppOutputBuffer Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11unorderedaccessview">ID3D11UnorderedAccessView</a>**</b>
     * 
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11unorderedaccessview">ID3D11UnorderedAccessView</a> pointer.  If *<i>ppOutput</i> is <b>NULL</b>, then the computation will switch
     *           between temp buffers; in addition, the last buffer written to is stored at *<i>ppOutput</i>.
     *           Otherwise, *<i>ppOutput</i> is used as the output buffer (which might incur an extra copy).
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * Returns one of the return codes described in the topic <a href="https://docs.microsoft.com/windows/desktop/direct3d11/d3d11-graphics-reference-returnvalues">Direct3D 11 Return Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/d3dcsx/nf-d3dcsx-id3dx11fft-inversetransform
     */
    InverseTransform(pInputBuffer, ppOutputBuffer) {
        result := ComCall(9, this, "ptr", pInputBuffer, ID3D11UnorderedAccessView.Ptr, ppOutputBuffer, "HRESULT")
        return result
    }

    Query(iid) {
        if (ID3DX11FFT.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetForwardScale := CallbackCreate(GetMethod(implObj, "SetForwardScale"), flags, 2)
        this.vtbl.GetForwardScale := CallbackCreate(GetMethod(implObj, "GetForwardScale"), flags, 1)
        this.vtbl.SetInverseScale := CallbackCreate(GetMethod(implObj, "SetInverseScale"), flags, 2)
        this.vtbl.GetInverseScale := CallbackCreate(GetMethod(implObj, "GetInverseScale"), flags, 1)
        this.vtbl.AttachBuffersAndPrecompute := CallbackCreate(GetMethod(implObj, "AttachBuffersAndPrecompute"), flags, 5)
        this.vtbl.ForwardTransform := CallbackCreate(GetMethod(implObj, "ForwardTransform"), flags, 3)
        this.vtbl.InverseTransform := CallbackCreate(GetMethod(implObj, "InverseTransform"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetForwardScale)
        CallbackFree(this.vtbl.GetForwardScale)
        CallbackFree(this.vtbl.SetInverseScale)
        CallbackFree(this.vtbl.GetInverseScale)
        CallbackFree(this.vtbl.AttachBuffersAndPrecompute)
        CallbackFree(this.vtbl.ForwardTransform)
        CallbackFree(this.vtbl.InverseTransform)
    }
}
