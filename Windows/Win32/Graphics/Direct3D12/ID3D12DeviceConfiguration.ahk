#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Direct3D\ID3DBlob.ahk" { ID3DBlob }
#Import ".\D3D12_DEVICE_CONFIGURATION_DESC.ahk" { D3D12_DEVICE_CONFIGURATION_DESC }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\D3D12_VERSIONED_ROOT_SIGNATURE_DESC.ahk" { D3D12_VERSIONED_ROOT_SIGNATURE_DESC }

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct ID3D12DeviceConfiguration extends IUnknown {
    /**
     * The interface identifier for ID3D12DeviceConfiguration
     * @type {Guid}
     */
    static IID := Guid("{78dbf87b-f766-422b-a61c-c8c446bdb9ad}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D12DeviceConfiguration interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetDesc                                  : IntPtr
        GetEnabledExperimentalFeatures           : IntPtr
        SerializeVersionedRootSignature          : IntPtr
        CreateVersionedRootSignatureDeserializer : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D12DeviceConfiguration.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {D3D12_DEVICE_CONFIGURATION_DESC} 
     */
    GetDesc() {
        result := ComCall(3, this, D3D12_DEVICE_CONFIGURATION_DESC)
        return result
    }

    /**
     * 
     * @param {Integer} NumGuids 
     * @returns {Guid} 
     */
    GetEnabledExperimentalFeatures(NumGuids) {
        pGuids := Guid()
        result := ComCall(4, this, Guid.Ptr, pGuids, "uint", NumGuids, "HRESULT")
        return pGuids
    }

    /**
     * 
     * @param {Pointer<D3D12_VERSIONED_ROOT_SIGNATURE_DESC>} pDesc 
     * @param {Pointer<ID3DBlob>} ppResult 
     * @param {Pointer<ID3DBlob>} ppError 
     * @returns {HRESULT} 
     */
    SerializeVersionedRootSignature(pDesc, ppResult, ppError) {
        result := ComCall(5, this, D3D12_VERSIONED_ROOT_SIGNATURE_DESC.Ptr, pDesc, ID3DBlob.Ptr, ppResult, ID3DBlob.Ptr, ppError, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} pBlob 
     * @param {Pointer} _Size 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     */
    CreateVersionedRootSignatureDeserializer(pBlob, _Size, riid) {
        result := ComCall(6, this, "ptr", pBlob, "ptr", _Size, Guid.Ptr, riid, "ptr*", &ppvDeserializer := 0, "HRESULT")
        return ppvDeserializer
    }

    Query(iid) {
        if (ID3D12DeviceConfiguration.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetDesc := CallbackCreate(GetMethod(implObj, "GetDesc"), flags, 1)
        this.vtbl.GetEnabledExperimentalFeatures := CallbackCreate(GetMethod(implObj, "GetEnabledExperimentalFeatures"), flags, 3)
        this.vtbl.SerializeVersionedRootSignature := CallbackCreate(GetMethod(implObj, "SerializeVersionedRootSignature"), flags, 4)
        this.vtbl.CreateVersionedRootSignatureDeserializer := CallbackCreate(GetMethod(implObj, "CreateVersionedRootSignatureDeserializer"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetDesc)
        CallbackFree(this.vtbl.GetEnabledExperimentalFeatures)
        CallbackFree(this.vtbl.SerializeVersionedRootSignature)
        CallbackFree(this.vtbl.CreateVersionedRootSignatureDeserializer)
    }
}
