#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\D3D12_DEVICE_CONFIGURATION_DESC.ahk
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
     * GetDescendant (Database Engine)
     * @remarks
     * Returns one child node that is a descendant of the parent.
     * -   If parent is NULL, returns NULL.  
     * -   If parent is not NULL, and both child1 and child2 are NULL, returns a child of parent.  
     * -   If parent and child1 are not NULL, and child2 is NULL, returns a child of parent greater than child1.  
     * -   If parent and child2 are not NULL and child1 is NULL, returns a child of parent less than child2.  
     * -   If parent, child1, and child2 are not NULL, returns a child of parent greater than child1 and less than child2.  
     * -   If child1 is not NULL and not a child of parent, an exception is raised.  
     * -   If child2 is not NULL and not a child of parent, an exception is raised.  
     * -   If child1 >= child2, an exception is raised.  
     *   
     * GetDescendant is deterministic. Therefore, if GetDescendant is called with the same inputs, it will always produce the same output. However, the exact identity of the child produced can vary depending upon its relationship to the other nodes, as demonstrated in example C.
     * @returns {D3D12_DEVICE_CONFIGURATION_DESC} 
     * @see https://learn.microsoft.com/sql/ocs/docs/t-sql/data-types/getdescendant-database-engine
     */
    GetDesc() {
        result := ComCall(3, this, "ptr")
        return result
    }

    /**
     * 
     * @param {Integer} NumGuids 
     * @returns {Guid} 
     */
    GetEnabledExperimentalFeatures(NumGuids) {
        pGuids := Guid()
        result := ComCall(4, this, "ptr", pGuids, "uint", NumGuids, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pGuids
    }

    /**
     * 
     * @param {Pointer<D3D12_VERSIONED_ROOT_SIGNATURE_DESC>} pDesc 
     * @param {Pointer<Pointer<ID3DBlob>>} ppResult 
     * @param {Pointer<ID3DBlob>} ppError 
     * @returns {HRESULT} 
     */
    SerializeVersionedRootSignature(pDesc, ppResult, ppError) {
        result := ComCall(5, this, "ptr", pDesc, "ptr*", ppResult, "ptr*", ppError, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Pointer} pBlob 
     * @param {Pointer} Size_ 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Pointer<Void>>} 
     */
    CreateVersionedRootSignatureDeserializer(pBlob, Size_, riid) {
        result := ComCall(6, this, "ptr", pBlob, "ptr", Size_, "ptr", riid, "ptr*", &ppvDeserializer := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppvDeserializer
    }
}
