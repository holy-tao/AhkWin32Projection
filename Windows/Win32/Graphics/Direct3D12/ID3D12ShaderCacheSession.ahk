#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D12DeviceChild.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/nn-d3d12-id3d12shadercachesession
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class ID3D12ShaderCacheSession extends ID3D12DeviceChild{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D12ShaderCacheSession
     * @type {Guid}
     */
    static IID => Guid("{28e2495d-0f64-4ae4-a6ec-129255dc49a8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 8

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["FindValue", "StoreValue", "SetDeleteOnDestroy", "GetDesc"]

    /**
     * 
     * @param {Pointer} pKey 
     * @param {Integer} KeySize 
     * @param {Pointer} pValue 
     * @param {Pointer<Integer>} pValueSize 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12shadercachesession-findvalue
     */
    FindValue(pKey, KeySize, pValue, pValueSize) {
        pValueSizeMarshal := pValueSize is VarRef ? "uint*" : "ptr"

        result := ComCall(8, this, "ptr", pKey, "uint", KeySize, "ptr", pValue, pValueSizeMarshal, pValueSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} pKey 
     * @param {Integer} KeySize 
     * @param {Pointer} pValue 
     * @param {Integer} ValueSize 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12shadercachesession-storevalue
     */
    StoreValue(pKey, KeySize, pValue, ValueSize) {
        result := ComCall(9, this, "ptr", pKey, "uint", KeySize, "ptr", pValue, "uint", ValueSize, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12shadercachesession-setdeleteondestroy
     */
    SetDeleteOnDestroy() {
        ComCall(10, this)
    }

    /**
     * 
     * @returns {D3D12_SHADER_CACHE_SESSION_DESC} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12shadercachesession-getdesc
     */
    GetDesc() {
        result := ComCall(11, this, "ptr")
        return result
    }
}
