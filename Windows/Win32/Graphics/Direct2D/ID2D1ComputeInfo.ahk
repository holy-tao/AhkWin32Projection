#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID2D1RenderInfo.ahk

/**
 * Enables specification of information for a compute-shader rendering pass.
 * @remarks
 * 
 * The transform changes the state on this render information to specify the compute shader and its dependent resources.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d2d1effectauthor/nn-d2d1effectauthor-id2d1computeinfo
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class ID2D1ComputeInfo extends ID2D1RenderInfo{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID2D1ComputeInfo
     * @type {Guid}
     */
    static IID => Guid("{5598b14b-9fd7-48b7-9bdb-8f0964eb38bc}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetComputeShaderConstantBuffer", "SetComputeShader", "SetResourceTexture"]

    /**
     * Establishes or changes the constant buffer data for this transform.
     * @param {Pointer<Integer>} buffer Type: <b>const BYTE*</b>
     * 
     * The data applied to the constant buffer.
     * @param {Integer} bufferCount Type: <b>UINT32</b>
     * 
     * The number of bytes of data in the constant buffer.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//d2d1effectauthor/nf-d2d1effectauthor-id2d1computeinfo-setcomputeshaderconstantbuffer
     */
    SetComputeShaderConstantBuffer(buffer, bufferCount) {
        bufferMarshal := buffer is VarRef ? "char*" : "ptr"

        result := ComCall(7, this, bufferMarshal, buffer, "uint", bufferCount, "HRESULT")
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
     * @see https://docs.microsoft.com/windows/win32/api//d2d1effectauthor/nf-d2d1effectauthor-id2d1computeinfo-setcomputeshader
     */
    SetComputeShader(shaderId) {
        result := ComCall(8, this, "ptr", shaderId, "HRESULT")
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
     * @see https://docs.microsoft.com/windows/win32/api//d2d1effectauthor/nf-d2d1effectauthor-id2d1computeinfo-setresourcetexture
     */
    SetResourceTexture(textureIndex, resourceTexture) {
        result := ComCall(9, this, "uint", textureIndex, "ptr", resourceTexture, "HRESULT")
        return result
    }
}
