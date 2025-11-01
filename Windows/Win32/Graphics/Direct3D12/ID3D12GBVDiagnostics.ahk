#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class ID3D12GBVDiagnostics extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetGBVEntireSubresourceStatesData", "GetGBVSubresourceState", "GetGBVResourceUniformState", "GetGBVResourceInfo", "GBVReserved0", "GBVReserved1"]

    /**
     * 
     * @param {ID3D12Resource} pResource 
     * @param {Pointer} pData 
     * @param {Integer} DataSize 
     * @returns {HRESULT} 
     */
    GetGBVEntireSubresourceStatesData(pResource, pData, DataSize) {
        result := ComCall(3, this, "ptr", pResource, "ptr", pData, "uint", DataSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ID3D12Resource} pResource 
     * @param {Integer} Subresource 
     * @param {Pointer<Integer>} pData 
     * @returns {HRESULT} 
     */
    GetGBVSubresourceState(pResource, Subresource, pData) {
        pDataMarshal := pData is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, "ptr", pResource, "uint", Subresource, pDataMarshal, pData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ID3D12Resource} pResource 
     * @param {Pointer<Integer>} pData 
     * @returns {HRESULT} 
     */
    GetGBVResourceUniformState(pResource, pData) {
        pDataMarshal := pData is VarRef ? "int*" : "ptr"

        result := ComCall(5, this, "ptr", pResource, pDataMarshal, pData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ID3D12Resource} pResource 
     * @param {Pointer<D3D12_RESOURCE_DESC>} pResourceDesc 
     * @param {Pointer<Integer>} pResourceHash 
     * @param {Pointer<Integer>} pSubresourceStatesByteOffset 
     * @returns {HRESULT} 
     */
    GetGBVResourceInfo(pResource, pResourceDesc, pResourceHash, pSubresourceStatesByteOffset) {
        pResourceHashMarshal := pResourceHash is VarRef ? "uint*" : "ptr"
        pSubresourceStatesByteOffsetMarshal := pSubresourceStatesByteOffset is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, "ptr", pResource, "ptr", pResourceDesc, pResourceHashMarshal, pResourceHash, pSubresourceStatesByteOffsetMarshal, pSubresourceStatesByteOffset, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    GBVReserved0() {
        ComCall(7, this)
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    GBVReserved1() {
        ComCall(8, this)
    }
}
