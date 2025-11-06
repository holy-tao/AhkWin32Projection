#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\D3D12_META_COMMAND_DESC.ahk
#Include .\ID3D12Device4.ahk

/**
 * Represents a virtual adapter. This interface extends [ID3D12Device4](../d3d12/nn-d3d12-id3d12device4.md).
 * @see https://docs.microsoft.com/windows/win32/api//d3d12/nn-d3d12-id3d12device5
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class ID3D12Device5 extends ID3D12Device4{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D12Device5
     * @type {Guid}
     */
    static IID => Guid("{8b4f173b-2fea-4b80-8f58-4307191ab95d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 57

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateLifetimeTracker", "RemoveDevice", "EnumerateMetaCommands", "EnumerateMetaCommandParameters", "CreateMetaCommand", "CreateStateObject", "GetRaytracingAccelerationStructurePrebuildInfo", "CheckDriverMatchingIdentifier"]

    /**
     * 
     * @param {ID3D12LifetimeOwner} pOwner 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12device5-createlifetimetracker
     */
    CreateLifetimeTracker(pOwner, riid) {
        result := ComCall(57, this, "ptr", pOwner, "ptr", riid, "ptr*", &ppvTracker := 0, "HRESULT")
        return ppvTracker
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12device5-removedevice
     */
    RemoveDevice() {
        ComCall(58, this)
    }

    /**
     * 
     * @param {Pointer<Integer>} pNumMetaCommands 
     * @returns {D3D12_META_COMMAND_DESC} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12device5-enumeratemetacommands
     */
    EnumerateMetaCommands(pNumMetaCommands) {
        pNumMetaCommandsMarshal := pNumMetaCommands is VarRef ? "uint*" : "ptr"

        pDescs := D3D12_META_COMMAND_DESC()
        result := ComCall(59, this, pNumMetaCommandsMarshal, pNumMetaCommands, "ptr", pDescs, "HRESULT")
        return pDescs
    }

    /**
     * 
     * @param {Pointer<Guid>} CommandId 
     * @param {Integer} Stage 
     * @param {Pointer<Integer>} pTotalStructureSizeInBytes 
     * @param {Pointer<Integer>} pParameterCount 
     * @param {Pointer<D3D12_META_COMMAND_PARAMETER_DESC>} pParameterDescs 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12device5-enumeratemetacommandparameters
     */
    EnumerateMetaCommandParameters(CommandId, Stage, pTotalStructureSizeInBytes, pParameterCount, pParameterDescs) {
        pTotalStructureSizeInBytesMarshal := pTotalStructureSizeInBytes is VarRef ? "uint*" : "ptr"
        pParameterCountMarshal := pParameterCount is VarRef ? "uint*" : "ptr"

        result := ComCall(60, this, "ptr", CommandId, "int", Stage, pTotalStructureSizeInBytesMarshal, pTotalStructureSizeInBytes, pParameterCountMarshal, pParameterCount, "ptr", pParameterDescs, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} CommandId 
     * @param {Integer} NodeMask 
     * @param {Pointer} pCreationParametersData 
     * @param {Pointer} CreationParametersDataSizeInBytes 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12device5-createmetacommand
     */
    CreateMetaCommand(CommandId, NodeMask, pCreationParametersData, CreationParametersDataSizeInBytes, riid) {
        result := ComCall(61, this, "ptr", CommandId, "uint", NodeMask, "ptr", pCreationParametersData, "ptr", CreationParametersDataSizeInBytes, "ptr", riid, "ptr*", &ppMetaCommand := 0, "HRESULT")
        return ppMetaCommand
    }

    /**
     * 
     * @param {Pointer<D3D12_STATE_OBJECT_DESC>} pDesc 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12device5-createstateobject
     */
    CreateStateObject(pDesc, riid) {
        result := ComCall(62, this, "ptr", pDesc, "ptr", riid, "ptr*", &ppStateObject := 0, "HRESULT")
        return ppStateObject
    }

    /**
     * 
     * @param {Pointer<D3D12_BUILD_RAYTRACING_ACCELERATION_STRUCTURE_INPUTS>} pDesc 
     * @param {Pointer<D3D12_RAYTRACING_ACCELERATION_STRUCTURE_PREBUILD_INFO>} pInfo 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12device5-getraytracingaccelerationstructureprebuildinfo
     */
    GetRaytracingAccelerationStructurePrebuildInfo(pDesc, pInfo) {
        ComCall(63, this, "ptr", pDesc, "ptr", pInfo)
    }

    /**
     * 
     * @param {Integer} SerializedDataType 
     * @param {Pointer<D3D12_SERIALIZED_DATA_DRIVER_MATCHING_IDENTIFIER>} pIdentifierToCheck 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12device5-checkdrivermatchingidentifier
     */
    CheckDriverMatchingIdentifier(SerializedDataType, pIdentifierToCheck) {
        result := ComCall(64, this, "int", SerializedDataType, "ptr", pIdentifierToCheck, "int")
        return result
    }
}
