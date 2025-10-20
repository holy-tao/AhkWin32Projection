#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D12DeviceChild.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class ID3D12ShaderCacheSession extends ID3D12DeviceChild{
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
     * 
     * @param {Pointer} pKey 
     * @param {Integer} KeySize 
     * @param {Pointer} pValue 
     * @param {Pointer<UInt32>} pValueSize 
     * @returns {HRESULT} 
     */
    FindValue(pKey, KeySize, pValue, pValueSize) {
        result := ComCall(8, this, "ptr", pKey, "uint", KeySize, "ptr", pValue, "uint*", pValueSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer} pKey 
     * @param {Integer} KeySize 
     * @param {Pointer} pValue 
     * @param {Integer} ValueSize 
     * @returns {HRESULT} 
     */
    StoreValue(pKey, KeySize, pValue, ValueSize) {
        result := ComCall(9, this, "ptr", pKey, "uint", KeySize, "ptr", pValue, "uint", ValueSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    SetDeleteOnDestroy() {
        ComCall(10, this)
        return result
    }

    /**
     * 
     * @returns {D3D12_SHADER_CACHE_SESSION_DESC} 
     */
    GetDesc() {
        result := ComCall(11, this, "ptr")
        return result
    }
}
