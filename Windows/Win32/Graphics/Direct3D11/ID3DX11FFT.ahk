#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Encapsulates forward and inverse FFTs.
 * @see https://docs.microsoft.com/windows/win32/api//d3dcsx/nn-d3dcsx-id3dx11fft
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class ID3DX11FFT extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3DX11FFT
     * @type {Guid}
     */
    static IID => Guid("{b3f7a938-4c93-4310-a675-b30d6de50553}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetForwardScale", "GetForwardScale", "SetInverseScale", "GetInverseScale", "AttachBuffersAndPrecompute", "ForwardTransform", "InverseTransform"]

    /**
     * Sets the scale used for forward transforms.
     * @param {Float} ForwardScale Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">FLOAT</a></b>
     * 
     * The scale to use for forward transforms.  Setting <i>ForwardScale</i> to 0 causes the default values of 1 to be used.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * Returns one of the return codes described in the topic <a href="/windows/desktop/direct3d11/d3d11-graphics-reference-returnvalues">Direct3D 11 Return Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3dcsx/nf-d3dcsx-id3dx11fft-setforwardscale
     */
    SetForwardScale(ForwardScale) {
        result := ComCall(3, this, "float", ForwardScale, "HRESULT")
        return result
    }

    /**
     * Gets the scale for forward transforms.
     * @returns {Float} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">FLOAT</a></b>
     * 
     * Scale for forward transforms.
     * @see https://docs.microsoft.com/windows/win32/api//d3dcsx/nf-d3dcsx-id3dx11fft-getforwardscale
     */
    GetForwardScale() {
        result := ComCall(4, this, "float")
        return result
    }

    /**
     * Sets the scale used for inverse transforms.
     * @param {Float} InverseScale Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">FLOAT</a></b>
     * 
     * Scale used for inverse transforms.  Setting <i>InverseScale</i> to 0 causes the default value of 1/N to be used, 
     *           where N is the product of the transformed dimension lengths.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * Returns one of the return codes described in the topic <a href="/windows/desktop/direct3d11/d3d11-graphics-reference-returnvalues">Direct3D 11 Return Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3dcsx/nf-d3dcsx-id3dx11fft-setinversescale
     */
    SetInverseScale(InverseScale) {
        result := ComCall(5, this, "float", InverseScale, "HRESULT")
        return result
    }

    /**
     * Get the scale for inverse transforms.
     * @returns {Float} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">FLOAT</a></b>
     * 
     * Scale for inverse transforms.
     * @see https://docs.microsoft.com/windows/win32/api//d3dcsx/nf-d3dcsx-id3dx11fft-getinversescale
     */
    GetInverseScale() {
        result := ComCall(6, this, "float")
        return result
    }

    /**
     * Attaches buffers to an FFT context and performs any required precomputations.
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
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * Returns one of the return codes described in the topic <a href="/windows/desktop/direct3d11/d3d11-graphics-reference-returnvalues">Direct3D 11 Return Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3dcsx/nf-d3dcsx-id3dx11fft-attachbuffersandprecompute
     */
    AttachBuffersAndPrecompute(NumTempBuffers, ppTempBuffers, NumPrecomputeBuffers, ppPrecomputeBufferSizes) {
        result := ComCall(7, this, "uint", NumTempBuffers, "ptr*", ppTempBuffers, "uint", NumPrecomputeBuffers, "ptr*", ppPrecomputeBufferSizes, "HRESULT")
        return result
    }

    /**
     * Performs a forward FFT.
     * @param {ID3D11UnorderedAccessView} pInputBuffer Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11unorderedaccessview">ID3D11UnorderedAccessView</a>*</b>
     * 
     * Pointer to <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11unorderedaccessview">ID3D11UnorderedAccessView</a> onto the input buffer.
     * @param {Pointer<ID3D11UnorderedAccessView>} ppOutputBuffer Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11unorderedaccessview">ID3D11UnorderedAccessView</a>**</b>
     * 
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11unorderedaccessview">ID3D11UnorderedAccessView</a> pointer.  If *<i>ppOutputBuffer</i> is <b>NULL</b>, the computation will switch
     *           between temp buffers; in addition, the last buffer written to is stored at *<i>ppOutputBuffer</i>.
     *           Otherwise, *<i>ppOutputBuffer</i> is used as the output buffer (which might incur an extra copy).
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * Returns one of the return codes described in the topic <a href="/windows/desktop/direct3d11/d3d11-graphics-reference-returnvalues">Direct3D 11 Return Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3dcsx/nf-d3dcsx-id3dx11fft-forwardtransform
     */
    ForwardTransform(pInputBuffer, ppOutputBuffer) {
        result := ComCall(8, this, "ptr", pInputBuffer, "ptr*", ppOutputBuffer, "HRESULT")
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
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * Returns one of the return codes described in the topic <a href="/windows/desktop/direct3d11/d3d11-graphics-reference-returnvalues">Direct3D 11 Return Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3dcsx/nf-d3dcsx-id3dx11fft-inversetransform
     */
    InverseTransform(pInputBuffer, ppOutputBuffer) {
        result := ComCall(9, this, "ptr", pInputBuffer, "ptr*", ppOutputBuffer, "HRESULT")
        return result
    }
}
