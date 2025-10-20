#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D12Device4.ahk

/**
 * Represents a virtual adapter. This interface extends [ID3D12Device4](../d3d12/nn-d3d12-id3d12device4.md).
 * @see https://docs.microsoft.com/windows/win32/api//d3d12/nn-d3d12-id3d12device5
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class ID3D12Device5 extends ID3D12Device4{
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
     * 
     * @param {Pointer<ID3D12LifetimeOwner>} pOwner 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} ppvTracker 
     * @returns {HRESULT} 
     */
    CreateLifetimeTracker(pOwner, riid, ppvTracker) {
        result := ComCall(57, this, "ptr", pOwner, "ptr", riid, "ptr", ppvTracker, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    RemoveDevice() {
        ComCall(58, this)
        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pNumMetaCommands 
     * @param {Pointer<D3D12_META_COMMAND_DESC>} pDescs 
     * @returns {HRESULT} 
     */
    EnumerateMetaCommands(pNumMetaCommands, pDescs) {
        result := ComCall(59, this, "uint*", pNumMetaCommands, "ptr", pDescs, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} CommandId 
     * @param {Integer} Stage 
     * @param {Pointer<UInt32>} pTotalStructureSizeInBytes 
     * @param {Pointer<UInt32>} pParameterCount 
     * @param {Pointer<D3D12_META_COMMAND_PARAMETER_DESC>} pParameterDescs 
     * @returns {HRESULT} 
     */
    EnumerateMetaCommandParameters(CommandId, Stage, pTotalStructureSizeInBytes, pParameterCount, pParameterDescs) {
        result := ComCall(60, this, "ptr", CommandId, "int", Stage, "uint*", pTotalStructureSizeInBytes, "uint*", pParameterCount, "ptr", pParameterDescs, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} CommandId 
     * @param {Integer} NodeMask 
     * @param {Pointer} pCreationParametersData 
     * @param {Pointer} CreationParametersDataSizeInBytes 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} ppMetaCommand 
     * @returns {HRESULT} 
     */
    CreateMetaCommand(CommandId, NodeMask, pCreationParametersData, CreationParametersDataSizeInBytes, riid, ppMetaCommand) {
        result := ComCall(61, this, "ptr", CommandId, "uint", NodeMask, "ptr", pCreationParametersData, "ptr", CreationParametersDataSizeInBytes, "ptr", riid, "ptr", ppMetaCommand, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<D3D12_STATE_OBJECT_DESC>} pDesc 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} ppStateObject 
     * @returns {HRESULT} 
     */
    CreateStateObject(pDesc, riid, ppStateObject) {
        result := ComCall(62, this, "ptr", pDesc, "ptr", riid, "ptr", ppStateObject, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<D3D12_BUILD_RAYTRACING_ACCELERATION_STRUCTURE_INPUTS>} pDesc 
     * @param {Pointer<D3D12_RAYTRACING_ACCELERATION_STRUCTURE_PREBUILD_INFO>} pInfo 
     * @returns {String} Nothing - always returns an empty string
     */
    GetRaytracingAccelerationStructurePrebuildInfo(pDesc, pInfo) {
        ComCall(63, this, "ptr", pDesc, "ptr", pInfo)
        return result
    }

    /**
     * 
     * @param {Integer} SerializedDataType 
     * @param {Pointer<D3D12_SERIALIZED_DATA_DRIVER_MATCHING_IDENTIFIER>} pIdentifierToCheck 
     * @returns {Integer} 
     */
    CheckDriverMatchingIdentifier(SerializedDataType, pIdentifierToCheck) {
        result := ComCall(64, this, "int", SerializedDataType, "ptr", pIdentifierToCheck, "int")
        return result
    }
}
