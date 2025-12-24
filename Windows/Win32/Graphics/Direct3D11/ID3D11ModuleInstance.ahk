#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * A module-instance interface is used for resource rebinding.
 * @remarks
 * 
 * To get a module-instance interface, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11shader/nf-d3d11shader-id3d11module-createinstance">ID3D11Module::CreateInstance</a> or <a href="https://docs.microsoft.com/windows/desktop/api/d3d11shader/nf-d3d11shader-id3d11functionlinkinggraph-createmoduleinstance">ID3D11FunctionLinkingGraph::CreateModuleInstance</a>.
 *       
 * 
 * <div class="alert"><b>Note</b>  <b>ID3D11ModuleInstance</b> requires the D3dcompiler_47.dll or a later version of the DLL.
 *       </div>
 * <div> </div>
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d11shader/nn-d3d11shader-id3d11moduleinstance
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class ID3D11ModuleInstance extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D11ModuleInstance
     * @type {Guid}
     */
    static IID => Guid("{469e07f7-045a-48d5-aa12-68a478cdf75d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["BindConstantBuffer", "BindConstantBufferByName", "BindResource", "BindResourceByName", "BindSampler", "BindSamplerByName", "BindUnorderedAccessView", "BindUnorderedAccessViewByName", "BindResourceAsUnorderedAccessView", "BindResourceAsUnorderedAccessViewByName"]

    /**
     * Rebinds a constant buffer from a source slot to a destination slot.
     * @param {Integer} uSrcSlot Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The source slot number for rebinding.
     * @param {Integer} uDstSlot Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The destination slot number for rebinding.
     * @param {Integer} cbDstOffset Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The offset in bytes of the destination slot for rebinding. The offset must have 16-byte alignment.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * Returns:
     * 
     * <ul>
     * <li><b>S_OK</b> for a valid rebinding
     *               </li>
     * <li><b>S_FALSE</b> for rebinding a nonexistent slot; that is, for which the shader reflection doesn’t have any data
     *               </li>
     * <li><b>E_FAIL</b> for an invalid rebinding, for example, the rebinding is out-of-bounds
     *               </li>
     * <li>Possibly one of the other <a href="/windows/desktop/direct3d11/d3d11-graphics-reference-returnvalues">Direct3D 11 Return Codes</a>
     * </li>
     * </ul>
     * @see https://docs.microsoft.com/windows/win32/api//d3d11shader/nf-d3d11shader-id3d11moduleinstance-bindconstantbuffer
     */
    BindConstantBuffer(uSrcSlot, uDstSlot, cbDstOffset) {
        result := ComCall(3, this, "uint", uSrcSlot, "uint", uDstSlot, "uint", cbDstOffset, "HRESULT")
        return result
    }

    /**
     * Rebinds a constant buffer by name to a destination slot.
     * @param {PSTR} pName Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCSTR</a></b>
     * 
     * The name of the constant buffer for rebinding.
     * @param {Integer} uDstSlot Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The destination slot number for rebinding.
     * @param {Integer} cbDstOffset Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The offset in bytes of the destination slot for rebinding. The offset must have 16-byte alignment.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * Returns:
     * 
     * <ul>
     * <li><b>S_OK</b> for a valid rebinding
     *               </li>
     * <li><b>S_FALSE</b> for rebinding a nonexistent slot; that is, for which the shader reflection doesn’t have any data
     *               </li>
     * <li><b>E_FAIL</b> for an invalid rebinding, for example, the rebinding is out-of-bounds
     *               </li>
     * <li>Possibly one of the other <a href="/windows/desktop/direct3d11/d3d11-graphics-reference-returnvalues">Direct3D 11 Return Codes</a>
     * </li>
     * </ul>
     * @see https://docs.microsoft.com/windows/win32/api//d3d11shader/nf-d3d11shader-id3d11moduleinstance-bindconstantbufferbyname
     */
    BindConstantBufferByName(pName, uDstSlot, cbDstOffset) {
        pName := pName is String ? StrPtr(pName) : pName

        result := ComCall(4, this, "ptr", pName, "uint", uDstSlot, "uint", cbDstOffset, "HRESULT")
        return result
    }

    /**
     * Rebinds a texture or buffer from source slot to destination slot.
     * @param {Integer} uSrcSlot Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The first source slot number for rebinding.
     * @param {Integer} uDstSlot Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The first destination slot number for rebinding.
     * @param {Integer} uCount Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The number of slots for rebinding.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * Returns:
     * 
     * <ul>
     * <li><b>S_OK</b> for a valid rebinding</li>
     * <li><b>S_FALSE</b> for rebinding a nonexistent slot; that is, for which the shader reflection doesn’t have any data</li>
     * <li><b>E_FAIL</b> for an invalid rebinding, for example, the rebinding is out-of-bounds</li>
     * <li>Possibly one of the other <a href="/windows/desktop/direct3d11/d3d11-graphics-reference-returnvalues">Direct3D 11 Return Codes</a>
     * </li>
     * </ul>
     * @see https://docs.microsoft.com/windows/win32/api//d3d11shader/nf-d3d11shader-id3d11moduleinstance-bindresource
     */
    BindResource(uSrcSlot, uDstSlot, uCount) {
        result := ComCall(5, this, "uint", uSrcSlot, "uint", uDstSlot, "uint", uCount, "HRESULT")
        return result
    }

    /**
     * Rebinds a texture or buffer by name to destination slots.
     * @param {PSTR} pName Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCSTR</a></b>
     * 
     * The name of the texture or buffer for rebinding.
     * @param {Integer} uDstSlot Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The first destination slot number for rebinding.
     * @param {Integer} uCount Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The number of slots for rebinding.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * Returns:
     * 
     * <ul>
     * <li><b>S_OK</b> for a valid rebinding</li>
     * <li><b>S_FALSE</b> for rebinding a nonexistent slot; that is, for which the shader reflection doesn’t have any data</li>
     * <li><b>E_FAIL</b> for an invalid rebinding, for example, the rebinding is out-of-bounds</li>
     * <li>Possibly one of the other <a href="/windows/desktop/direct3d11/d3d11-graphics-reference-returnvalues">Direct3D 11 Return Codes</a>
     * </li>
     * </ul>
     * @see https://docs.microsoft.com/windows/win32/api//d3d11shader/nf-d3d11shader-id3d11moduleinstance-bindresourcebyname
     */
    BindResourceByName(pName, uDstSlot, uCount) {
        pName := pName is String ? StrPtr(pName) : pName

        result := ComCall(6, this, "ptr", pName, "uint", uDstSlot, "uint", uCount, "HRESULT")
        return result
    }

    /**
     * Rebinds a sampler from source slot to destination slot.
     * @param {Integer} uSrcSlot Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The first source slot number for rebinding.
     * @param {Integer} uDstSlot Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The first destination slot number for rebinding.
     * @param {Integer} uCount Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The number of slots for rebinding.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * Returns:
     * 
     * <ul>
     * <li><b>S_OK</b> for a valid rebinding</li>
     * <li><b>S_FALSE</b> for rebinding a nonexistent slot; that is, for which the shader reflection doesn’t have any data</li>
     * <li><b>E_FAIL</b> for an invalid rebinding, for example, the rebinding is out-of-bounds</li>
     * <li>Possibly one of the other <a href="/windows/desktop/direct3d11/d3d11-graphics-reference-returnvalues">Direct3D 11 Return Codes</a>
     * </li>
     * </ul>
     * @see https://docs.microsoft.com/windows/win32/api//d3d11shader/nf-d3d11shader-id3d11moduleinstance-bindsampler
     */
    BindSampler(uSrcSlot, uDstSlot, uCount) {
        result := ComCall(7, this, "uint", uSrcSlot, "uint", uDstSlot, "uint", uCount, "HRESULT")
        return result
    }

    /**
     * Rebinds a sampler by name to destination slots.
     * @param {PSTR} pName Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCSTR</a></b>
     * 
     * The name of the sampler for rebinding.
     * @param {Integer} uDstSlot Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The first destination slot number for rebinding.
     * @param {Integer} uCount Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The number of slots for rebinding.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * Returns:
     * 
     * <ul>
     * <li><b>S_OK</b> for a valid rebinding</li>
     * <li><b>S_FALSE</b> for rebinding a nonexistent slot; that is, for which the shader reflection doesn’t have any data</li>
     * <li><b>E_FAIL</b> for an invalid rebinding, for example, the rebinding is out-of-bounds</li>
     * <li>Possibly one of the other <a href="/windows/desktop/direct3d11/d3d11-graphics-reference-returnvalues">Direct3D 11 Return Codes</a>
     * </li>
     * </ul>
     * @see https://docs.microsoft.com/windows/win32/api//d3d11shader/nf-d3d11shader-id3d11moduleinstance-bindsamplerbyname
     */
    BindSamplerByName(pName, uDstSlot, uCount) {
        pName := pName is String ? StrPtr(pName) : pName

        result := ComCall(8, this, "ptr", pName, "uint", uDstSlot, "uint", uCount, "HRESULT")
        return result
    }

    /**
     * Rebinds an unordered access view (UAV) from source slot to destination slot.
     * @param {Integer} uSrcSlot Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The first source slot number for rebinding.
     * @param {Integer} uDstSlot Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The first destination slot number for rebinding.
     * @param {Integer} uCount Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The number of slots for rebinding.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * Returns:
     * 
     * <ul>
     * <li><b>S_OK</b> for a valid rebinding</li>
     * <li><b>S_FALSE</b> for rebinding a nonexistent slot; that is, for which the shader reflection doesn’t have any data</li>
     * <li><b>E_FAIL</b> for an invalid rebinding, for example, the rebinding is out-of-bounds</li>
     * <li>Possibly one of the other <a href="/windows/desktop/direct3d11/d3d11-graphics-reference-returnvalues">Direct3D 11 Return Codes</a>
     * </li>
     * </ul>
     * @see https://docs.microsoft.com/windows/win32/api//d3d11shader/nf-d3d11shader-id3d11moduleinstance-bindunorderedaccessview
     */
    BindUnorderedAccessView(uSrcSlot, uDstSlot, uCount) {
        result := ComCall(9, this, "uint", uSrcSlot, "uint", uDstSlot, "uint", uCount, "HRESULT")
        return result
    }

    /**
     * Rebinds an unordered access view (UAV) by name to destination slots.
     * @param {PSTR} pName Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCSTR</a></b>
     * 
     * The name of the UAV for rebinding.
     * @param {Integer} uDstSlot Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The first destination slot number for rebinding.
     * @param {Integer} uCount Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The number of slots for rebinding.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * Returns:
     * 
     * <ul>
     * <li><b>S_OK</b> for a valid rebinding</li>
     * <li><b>S_FALSE</b> for rebinding a nonexistent slot; that is, for which the shader reflection doesn’t have any data</li>
     * <li><b>E_FAIL</b> for an invalid rebinding, for example, the rebinding is out-of-bounds</li>
     * <li>Possibly one of the other <a href="/windows/desktop/direct3d11/d3d11-graphics-reference-returnvalues">Direct3D 11 Return Codes</a>
     * </li>
     * </ul>
     * @see https://docs.microsoft.com/windows/win32/api//d3d11shader/nf-d3d11shader-id3d11moduleinstance-bindunorderedaccessviewbyname
     */
    BindUnorderedAccessViewByName(pName, uDstSlot, uCount) {
        pName := pName is String ? StrPtr(pName) : pName

        result := ComCall(10, this, "ptr", pName, "uint", uDstSlot, "uint", uCount, "HRESULT")
        return result
    }

    /**
     * Rebinds a resource as an unordered access view (UAV) from source slot to destination slot.
     * @param {Integer} uSrcSrvSlot Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The first source slot number for rebinding.
     * @param {Integer} uDstUavSlot Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The first destination slot number for rebinding.
     * @param {Integer} uCount Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The number of slots for rebinding.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * Returns:
     * 
     * <ul>
     * <li><b>S_OK</b> for a valid rebinding</li>
     * <li><b>S_FALSE</b> for rebinding a nonexistent slot; that is, for which the shader reflection doesn’t have any data</li>
     * <li><b>E_FAIL</b> for an invalid rebinding, for example, the rebinding is out-of-bounds</li>
     * <li>Possibly one of the other <a href="/windows/desktop/direct3d11/d3d11-graphics-reference-returnvalues">Direct3D 11 Return Codes</a>
     * </li>
     * </ul>
     * @see https://docs.microsoft.com/windows/win32/api//d3d11shader/nf-d3d11shader-id3d11moduleinstance-bindresourceasunorderedaccessview
     */
    BindResourceAsUnorderedAccessView(uSrcSrvSlot, uDstUavSlot, uCount) {
        result := ComCall(11, this, "uint", uSrcSrvSlot, "uint", uDstUavSlot, "uint", uCount, "HRESULT")
        return result
    }

    /**
     * Rebinds a resource by name as an unordered access view (UAV) to destination slots.
     * @param {PSTR} pSrvName Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCSTR</a></b>
     * 
     * The name of the resource for rebinding.
     * @param {Integer} uDstUavSlot Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The first destination slot number for rebinding.
     * @param {Integer} uCount Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The number of slots for rebinding.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * Returns:
     * 
     * <ul>
     * <li><b>S_OK</b> for a valid rebinding</li>
     * <li><b>S_FALSE</b> for rebinding a nonexistent slot; that is, for which the shader reflection doesn’t have any data</li>
     * <li><b>E_FAIL</b> for an invalid rebinding, for example, the rebinding is out-of-bounds</li>
     * <li>Possibly one of the other <a href="/windows/desktop/direct3d11/d3d11-graphics-reference-returnvalues">Direct3D 11 Return Codes</a>
     * </li>
     * </ul>
     * @see https://docs.microsoft.com/windows/win32/api//d3d11shader/nf-d3d11shader-id3d11moduleinstance-bindresourceasunorderedaccessviewbyname
     */
    BindResourceAsUnorderedAccessViewByName(pSrvName, uDstUavSlot, uCount) {
        pSrvName := pSrvName is String ? StrPtr(pSrvName) : pSrvName

        result := ComCall(12, this, "ptr", pSrvName, "uint", uDstUavSlot, "uint", uCount, "HRESULT")
        return result
    }
}
