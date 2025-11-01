#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class ID3D12DeviceConfiguration extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D12DeviceConfiguration
     * @type {Guid}
     */
    static IID => Guid("{78dbf87b-f766-422b-a61c-c8c446bdb9ad}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDesc", "GetEnabledExperimentalFeatures", "SerializeVersionedRootSignature", "CreateVersionedRootSignatureDeserializer"]

    /**
     * 
     * @returns {D3D12_DEVICE_CONFIGURATION_DESC} 
     */
    GetDesc() {
        result := ComCall(3, this, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pGuids 
     * @param {Integer} NumGuids 
     * @returns {HRESULT} 
     */
    GetEnabledExperimentalFeatures(pGuids, NumGuids) {
        result := ComCall(4, this, "ptr", pGuids, "uint", NumGuids, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<D3D12_VERSIONED_ROOT_SIGNATURE_DESC>} pDesc 
     * @param {Pointer<ID3DBlob>} ppResult 
     * @param {Pointer<ID3DBlob>} ppError 
     * @returns {HRESULT} 
     */
    SerializeVersionedRootSignature(pDesc, ppResult, ppError) {
        result := ComCall(5, this, "ptr", pDesc, "ptr*", ppResult, "ptr*", ppError, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer} pBlob 
     * @param {Pointer} Size 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} ppvDeserializer 
     * @returns {HRESULT} 
     */
    CreateVersionedRootSignatureDeserializer(pBlob, Size, riid, ppvDeserializer) {
        result := ComCall(6, this, "ptr", pBlob, "ptr", Size, "ptr", riid, "ptr*", ppvDeserializer, "HRESULT")
        return result
    }
}
