#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ID3D10ShaderResourceView.ahk" { ID3D10ShaderResourceView }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ID3D10EffectVariable.ahk" { ID3D10EffectVariable }
#Import ".\ID3D10Buffer.ahk" { ID3D10Buffer }

/**
 * A constant-buffer interface accesses constant buffers or texture buffers.
 * @remarks
 * Use constant buffers to store many effect constants; grouping constants into buffers based on their frequency of update. This allows you to minimize the number of state changes as well as make the fewest API calls to change state. Both of these factors lead to better performance.
 * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nn-d3d10effect-id3d10effectconstantbuffer
 * @namespace Windows.Win32.Graphics.Direct3D10
 */
export default struct ID3D10EffectConstantBuffer extends ID3D10EffectVariable {
    /**
     * The interface identifier for ID3D10EffectConstantBuffer
     * @type {Guid}
     */
    static IID := Guid("{56648f4d-cc8b-4444-a5ad-b5a3d76e91b3}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D10EffectConstantBuffer interfaces
    */
    struct Vtbl extends ID3D10EffectVariable.Vtbl {
        SetConstantBuffer : IntPtr
        GetConstantBuffer : IntPtr
        SetTextureBuffer  : IntPtr
        GetTextureBuffer  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D10EffectConstantBuffer.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Set a constant-buffer.
     * @param {ID3D10Buffer} pConstantBuffer Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10buffer">ID3D10Buffer</a>*</b>
     * 
     * A pointer to a constant-buffer interface. See <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nn-d3d10-id3d10buffer">ID3D10Buffer Interface</a>.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * Returns one of the following <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-reference-returnvalues">Direct3D 10 Return Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effectconstantbuffer-setconstantbuffer
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
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effectconstantbuffer-getconstantbuffer
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
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * Returns one of the following <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-reference-returnvalues">Direct3D 10 Return Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effectconstantbuffer-settexturebuffer
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
     * @see https://learn.microsoft.com/windows/win32/api/d3d10effect/nf-d3d10effect-id3d10effectconstantbuffer-gettexturebuffer
     */
    GetTextureBuffer() {
        result := ComCall(28, this, "ptr*", &ppTextureBuffer := 0, "HRESULT")
        return ID3D10ShaderResourceView(ppTextureBuffer)
    }

    Query(iid) {
        if (ID3D10EffectConstantBuffer.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetConstantBuffer := CallbackCreate(GetMethod(implObj, "SetConstantBuffer"), flags, 2)
        this.vtbl.GetConstantBuffer := CallbackCreate(GetMethod(implObj, "GetConstantBuffer"), flags, 2)
        this.vtbl.SetTextureBuffer := CallbackCreate(GetMethod(implObj, "SetTextureBuffer"), flags, 2)
        this.vtbl.GetTextureBuffer := CallbackCreate(GetMethod(implObj, "GetTextureBuffer"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetConstantBuffer)
        CallbackFree(this.vtbl.GetConstantBuffer)
        CallbackFree(this.vtbl.SetTextureBuffer)
        CallbackFree(this.vtbl.GetTextureBuffer)
    }
}
