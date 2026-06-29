#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\D3D12_RESOURCE_DESC.ahk" { D3D12_RESOURCE_DESC }
#Import ".\ID3D12Resource.ahk" { ID3D12Resource }

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct ID3D12GBVDiagnostics extends IUnknown {
    /**
     * The interface identifier for ID3D12GBVDiagnostics
     * @type {Guid}
     */
    static IID := Guid("{597985ab-9b75-4dbb-be23-0761195bebee}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D12GBVDiagnostics interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetGBVEntireSubresourceStatesData : IntPtr
        GetGBVSubresourceState            : IntPtr
        GetGBVResourceUniformState        : IntPtr
        GetGBVResourceInfo                : IntPtr
        GBVReserved0                      : IntPtr
        GBVReserved1                      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D12GBVDiagnostics.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {ID3D12Resource} pResource 
     * @param {Integer} pData 
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
     * @returns {Integer} 
     */
    GetGBVSubresourceState(pResource, Subresource) {
        result := ComCall(4, this, "ptr", pResource, "uint", Subresource, "int*", &pData := 0, "HRESULT")
        return pData
    }

    /**
     * 
     * @param {ID3D12Resource} pResource 
     * @returns {Integer} 
     */
    GetGBVResourceUniformState(pResource) {
        result := ComCall(5, this, "ptr", pResource, "int*", &pData := 0, "HRESULT")
        return pData
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

        result := ComCall(6, this, "ptr", pResource, D3D12_RESOURCE_DESC.Ptr, pResourceDesc, pResourceHashMarshal, pResourceHash, pSubresourceStatesByteOffsetMarshal, pSubresourceStatesByteOffset, "HRESULT")
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

    Query(iid) {
        if (ID3D12GBVDiagnostics.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetGBVEntireSubresourceStatesData := CallbackCreate(GetMethod(implObj, "GetGBVEntireSubresourceStatesData"), flags, 4)
        this.vtbl.GetGBVSubresourceState := CallbackCreate(GetMethod(implObj, "GetGBVSubresourceState"), flags, 4)
        this.vtbl.GetGBVResourceUniformState := CallbackCreate(GetMethod(implObj, "GetGBVResourceUniformState"), flags, 3)
        this.vtbl.GetGBVResourceInfo := CallbackCreate(GetMethod(implObj, "GetGBVResourceInfo"), flags, 5)
        this.vtbl.GBVReserved0 := CallbackCreate(GetMethod(implObj, "GBVReserved0"), flags, 1)
        this.vtbl.GBVReserved1 := CallbackCreate(GetMethod(implObj, "GBVReserved1"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetGBVEntireSubresourceStatesData)
        CallbackFree(this.vtbl.GetGBVSubresourceState)
        CallbackFree(this.vtbl.GetGBVResourceUniformState)
        CallbackFree(this.vtbl.GetGBVResourceInfo)
        CallbackFree(this.vtbl.GBVReserved0)
        CallbackFree(this.vtbl.GBVReserved1)
    }
}
