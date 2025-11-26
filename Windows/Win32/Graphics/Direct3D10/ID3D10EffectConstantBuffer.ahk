#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D10Buffer.ahk
#Include .\ID3D10ShaderResourceView.ahk
#Include .\ID3D10EffectVariable.ahk

/**
 * A constant-buffer interface accesses constant buffers or texture buffers.
 * @remarks
 * 
 * Use constant buffers to store many effect constants; grouping constants into buffers based on their frequency of update. This allows you to minimize the number of state changes as well as make the fewest API calls to change state. Both of these factors lead to better performance.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d10effect/nn-d3d10effect-id3d10effectconstantbuffer
 * @namespace Windows.Win32.Graphics.Direct3D10
 * @version v4.0.30319
 */
class ID3D10EffectConstantBuffer extends ID3D10EffectVariable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D10EffectConstantBuffer
     * @type {Guid}
     */
    static IID => Guid("{56648f4d-cc8b-4444-a5ad-b5a3d76e91b3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 25

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetConstantBuffer", "GetConstantBuffer", "SetTextureBuffer", "GetTextureBuffer"]

    /**
     * Set a constant-buffer.
     * @param {ID3D10Buffer} pConstantBuffer Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10buffer">ID3D10Buffer</a>*</b>
     * 
     * A pointer to a constant-buffer interface. See <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10buffer">ID3D10Buffer Interface</a>.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * Returns one of the following <a href="/windows/desktop/direct3d10/d3d10-graphics-reference-returnvalues">Direct3D 10 Return Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3d10effect/nf-d3d10effect-id3d10effectconstantbuffer-setconstantbuffer
     */
    SetConstantBuffer(pConstantBuffer) {
        result := ComCall(25, this, "ptr", pConstantBuffer, "HRESULT")
        return result
    }

    /**
     * Get a constant-buffer.
     * @returns {ID3D10Buffer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10buffer">ID3D10Buffer</a>**</b>
     * 
     * The address of a pointer to a constant-buffer interface. See <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10buffer">ID3D10Buffer Interface</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3d10effect/nf-d3d10effect-id3d10effectconstantbuffer-getconstantbuffer
     */
    GetConstantBuffer() {
        result := ComCall(26, this, "ptr*", &ppConstantBuffer := 0, "HRESULT")
        return ID3D10Buffer(ppConstantBuffer)
    }

    /**
     * Set a texture-buffer.
     * @param {ID3D10ShaderResourceView} pTextureBuffer Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10shaderresourceview">ID3D10ShaderResourceView</a>*</b>
     * 
     * A pointer to a shader-resource-view interface for accessing a texture buffer.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * Returns one of the following <a href="/windows/desktop/direct3d10/d3d10-graphics-reference-returnvalues">Direct3D 10 Return Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3d10effect/nf-d3d10effect-id3d10effectconstantbuffer-settexturebuffer
     */
    SetTextureBuffer(pTextureBuffer) {
        result := ComCall(27, this, "ptr", pTextureBuffer, "HRESULT")
        return result
    }

    /**
     * Get a texture-buffer.
     * @returns {ID3D10ShaderResourceView} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10shaderresourceview">ID3D10ShaderResourceView</a>**</b>
     * 
     * The address of a pointer to a shader-resource-view interface for accessing a texture buffer. See <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10shaderresourceview">ID3D10ShaderResourceView Interface</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3d10effect/nf-d3d10effect-id3d10effectconstantbuffer-gettexturebuffer
     */
    GetTextureBuffer() {
        result := ComCall(28, this, "ptr*", &ppTextureBuffer := 0, "HRESULT")
        return ID3D10ShaderResourceView(ppTextureBuffer)
    }
}
