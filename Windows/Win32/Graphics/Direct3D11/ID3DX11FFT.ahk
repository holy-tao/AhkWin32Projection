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
     * 
     * @param {Float} ForwardScale 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3dcsx/nf-d3dcsx-id3dx11fft-setforwardscale
     */
    SetForwardScale(ForwardScale) {
        result := ComCall(3, this, "float", ForwardScale, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/d3dcsx/nf-d3dcsx-id3dx11fft-getforwardscale
     */
    GetForwardScale() {
        result := ComCall(4, this, "float")
        return result
    }

    /**
     * 
     * @param {Float} InverseScale 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3dcsx/nf-d3dcsx-id3dx11fft-setinversescale
     */
    SetInverseScale(InverseScale) {
        result := ComCall(5, this, "float", InverseScale, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/d3dcsx/nf-d3dcsx-id3dx11fft-getinversescale
     */
    GetInverseScale() {
        result := ComCall(6, this, "float")
        return result
    }

    /**
     * 
     * @param {Integer} NumTempBuffers 
     * @param {Pointer<ID3D11UnorderedAccessView>} ppTempBuffers 
     * @param {Integer} NumPrecomputeBuffers 
     * @param {Pointer<ID3D11UnorderedAccessView>} ppPrecomputeBufferSizes 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3dcsx/nf-d3dcsx-id3dx11fft-attachbuffersandprecompute
     */
    AttachBuffersAndPrecompute(NumTempBuffers, ppTempBuffers, NumPrecomputeBuffers, ppPrecomputeBufferSizes) {
        result := ComCall(7, this, "uint", NumTempBuffers, "ptr*", ppTempBuffers, "uint", NumPrecomputeBuffers, "ptr*", ppPrecomputeBufferSizes, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ID3D11UnorderedAccessView} pInputBuffer 
     * @param {Pointer<ID3D11UnorderedAccessView>} ppOutputBuffer 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3dcsx/nf-d3dcsx-id3dx11fft-forwardtransform
     */
    ForwardTransform(pInputBuffer, ppOutputBuffer) {
        result := ComCall(8, this, "ptr", pInputBuffer, "ptr*", ppOutputBuffer, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ID3D11UnorderedAccessView} pInputBuffer 
     * @param {Pointer<ID3D11UnorderedAccessView>} ppOutputBuffer 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3dcsx/nf-d3dcsx-id3dx11fft-inversetransform
     */
    InverseTransform(pInputBuffer, ppOutputBuffer) {
        result := ComCall(9, this, "ptr", pInputBuffer, "ptr*", ppOutputBuffer, "HRESULT")
        return result
    }
}
