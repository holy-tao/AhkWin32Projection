#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ID2D1RenderInfo.ahk" { ID2D1RenderInfo }
#Import ".\ID2D1ResourceTexture.ahk" { ID2D1ResourceTexture }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Enables specification of information for a compute-shader rendering pass.
 * @remarks
 * The transform changes the state on this render information to specify the compute shader and its dependent resources.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1effectauthor/nn-d2d1effectauthor-id2d1computeinfo
 * @namespace Windows.Win32.Graphics.Direct2D
 */
export default struct ID2D1ComputeInfo extends ID2D1RenderInfo {
    /**
     * The interface identifier for ID2D1ComputeInfo
     * @type {Guid}
     */
    static IID := Guid("{5598b14b-9fd7-48b7-9bdb-8f0964eb38bc}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID2D1ComputeInfo interfaces
    */
    struct Vtbl extends ID2D1RenderInfo.Vtbl {
        SetComputeShaderConstantBuffer : IntPtr
        SetComputeShader               : IntPtr
        SetResourceTexture             : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID2D1ComputeInfo.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Establishes or changes the constant buffer data for this transform.
     * @param {Pointer<Integer>} _buffer Type: <b>const BYTE*</b>
     * 
     * The data applied to the constant buffer.
     * @param {Integer} bufferCount Type: <b>UINT32</b>
     * 
     * The number of bytes of data in the constant buffer.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/d2d1effectauthor/nf-d2d1effectauthor-id2d1computeinfo-setcomputeshaderconstantbuffer
     */
    SetComputeShaderConstantBuffer(_buffer, bufferCount) {
        _bufferMarshal := _buffer is VarRef ? "char*" : "ptr"

        result := ComCall(7, this, _bufferMarshal, _buffer, "uint", bufferCount, "HRESULT")
        return result
    }

    /**
     * Sets the compute shader to the given shader resource. The resource must be loaded before this call is made.
     * @param {Pointer<Guid>} shaderId Type: <b>REFGUID</b>
     * 
     * The GUID of the shader.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>HRESULT</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>S_OK</td>
     * <td>No error occurred.</td>
     * </tr>
     * <tr>
     * <td>E_OUTOFMEMORY</td>
     * <td>Direct2D could not allocate sufficient memory to complete the call.</td>
     * </tr>
     * <tr>
     * <td>E_INVALIDARG</td>
     * <td>An invalid parameter was passed to the returning function.</td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/d2d1effectauthor/nf-d2d1effectauthor-id2d1computeinfo-setcomputeshader
     */
    SetComputeShader(shaderId) {
        result := ComCall(8, this, Guid.Ptr, shaderId, "HRESULT")
        return result
    }

    /**
     * Sets the resource texture corresponding to the given shader texture index to the given texture resource.
     * @param {Integer} textureIndex Type: <b>UINT32</b>
     * 
     * The index to set the resource texture on.
     * @param {ID2D1ResourceTexture} resourceTexture Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d2d1effectauthor/nn-d2d1effectauthor-id2d1resourcetexture">ID2D1ResourceTexture</a>*</b>
     * 
     * The resource texture object to set on the shader texture index.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>HRESULT</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>S_OK</td>
     * <td>No error occurred.</td>
     * </tr>
     * <tr>
     * <td>E_OUTOFMEMORY</td>
     * <td>Direct2D could not allocate sufficient memory to complete the call.</td>
     * </tr>
     * <tr>
     * <td>E_INVALIDARG</td>
     * <td>An invalid parameter was passed to the returning function.</td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/d2d1effectauthor/nf-d2d1effectauthor-id2d1computeinfo-setresourcetexture
     */
    SetResourceTexture(textureIndex, resourceTexture) {
        result := ComCall(9, this, "uint", textureIndex, "ptr", resourceTexture, "HRESULT")
        return result
    }

    Query(iid) {
        if (ID2D1ComputeInfo.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetComputeShaderConstantBuffer := CallbackCreate(GetMethod(implObj, "SetComputeShaderConstantBuffer"), flags, 3)
        this.vtbl.SetComputeShader := CallbackCreate(GetMethod(implObj, "SetComputeShader"), flags, 2)
        this.vtbl.SetResourceTexture := CallbackCreate(GetMethod(implObj, "SetResourceTexture"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetComputeShaderConstantBuffer)
        CallbackFree(this.vtbl.SetComputeShader)
        CallbackFree(this.vtbl.SetResourceTexture)
    }
}
