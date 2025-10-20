#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class ID3D12GBVDiagnostics extends IUnknown{
    /**
     * The interface identifier for ID3D12GBVDiagnostics
     * @type {Guid}
     */
    static IID => Guid("{597985ab-9b75-4dbb-be23-0761195bebee}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<ID3D12Resource>} pResource 
     * @param {Pointer} pData 
     * @param {Integer} DataSize 
     * @returns {HRESULT} 
     */
    GetGBVEntireSubresourceStatesData(pResource, pData, DataSize) {
        result := ComCall(3, this, "ptr", pResource, "ptr", pData, "uint", DataSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ID3D12Resource>} pResource 
     * @param {Integer} Subresource 
     * @param {Pointer<Int32>} pData 
     * @returns {HRESULT} 
     */
    GetGBVSubresourceState(pResource, Subresource, pData) {
        result := ComCall(4, this, "ptr", pResource, "uint", Subresource, "int*", pData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ID3D12Resource>} pResource 
     * @param {Pointer<Int32>} pData 
     * @returns {HRESULT} 
     */
    GetGBVResourceUniformState(pResource, pData) {
        result := ComCall(5, this, "ptr", pResource, "int*", pData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ID3D12Resource>} pResource 
     * @param {Pointer<D3D12_RESOURCE_DESC>} pResourceDesc 
     * @param {Pointer<UInt32>} pResourceHash 
     * @param {Pointer<UInt32>} pSubresourceStatesByteOffset 
     * @returns {HRESULT} 
     */
    GetGBVResourceInfo(pResource, pResourceDesc, pResourceHash, pSubresourceStatesByteOffset) {
        result := ComCall(6, this, "ptr", pResource, "ptr", pResourceDesc, "uint*", pResourceHash, "uint*", pSubresourceStatesByteOffset, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    GBVReserved0() {
        ComCall(7, this)
        return result
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    GBVReserved1() {
        ComCall(8, this)
        return result
    }
}
