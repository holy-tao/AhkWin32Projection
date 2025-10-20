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
     * 
     * @param {Float} ForwardScale 
     * @returns {HRESULT} 
     */
    SetForwardScale(ForwardScale) {
        result := ComCall(3, this, "float", ForwardScale, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    GetForwardScale() {
        result := ComCall(4, this, "float")
        return result
    }

    /**
     * 
     * @param {Float} InverseScale 
     * @returns {HRESULT} 
     */
    SetInverseScale(InverseScale) {
        result := ComCall(5, this, "float", InverseScale, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {Float} 
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
     */
    AttachBuffersAndPrecompute(NumTempBuffers, ppTempBuffers, NumPrecomputeBuffers, ppPrecomputeBufferSizes) {
        result := ComCall(7, this, "uint", NumTempBuffers, "ptr", ppTempBuffers, "uint", NumPrecomputeBuffers, "ptr", ppPrecomputeBufferSizes, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ID3D11UnorderedAccessView>} pInputBuffer 
     * @param {Pointer<ID3D11UnorderedAccessView>} ppOutputBuffer 
     * @returns {HRESULT} 
     */
    ForwardTransform(pInputBuffer, ppOutputBuffer) {
        result := ComCall(8, this, "ptr", pInputBuffer, "ptr", ppOutputBuffer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ID3D11UnorderedAccessView>} pInputBuffer 
     * @param {Pointer<ID3D11UnorderedAccessView>} ppOutputBuffer 
     * @returns {HRESULT} 
     */
    InverseTransform(pInputBuffer, ppOutputBuffer) {
        result := ComCall(9, this, "ptr", pInputBuffer, "ptr", ppOutputBuffer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
