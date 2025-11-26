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
     * Queries reflection metadata about available meta commands.
     * @param {Pointer<Integer>} pNumMetaCommands Type: [in, out] <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a>*</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a> containing the number of meta commands to query for. This field determines the size of the <i>pDescs</i> array, unless <i>pDescs</i> is <b>nullptr</b>.
     * @returns {D3D12_META_COMMAND_DESC} Type: [out, optional] **[D3D12_META_COMMAND_DESC](./ns-d3d12-d3d12_meta_command_desc.md)\***
     * 
     * An optional pointer to an array of [D3D12_META_COMMAND_DESC](./ns-d3d12-d3d12_meta_command_desc.md) containing the descriptions of the available meta commands. Pass `nullptr` to have the number of available meta commands returned in <i>pNumMetaCommands</i>.
     * @see https://docs.microsoft.com/windows/win32/api//d3d12/nf-d3d12-id3d12device5-enumeratemetacommands
     */
    EnumerateMetaCommands(pNumMetaCommands) {
        pNumMetaCommandsMarshal := pNumMetaCommands is VarRef ? "uint*" : "ptr"

        pDescs := D3D12_META_COMMAND_DESC()
        result := ComCall(59, this, pNumMetaCommandsMarshal, pNumMetaCommands, "ptr", pDescs, "HRESULT")
        return pDescs
    }

    /**
     * Queries reflection metadata about the parameters of the specified meta command.
     * @param {Pointer<Guid>} CommandId Type: <b>REFIID</b>
     * 
     * A reference to the globally unique identifier (GUID) of the meta command whose parameters you wish to be returned in <i>pParameterDescs</i>.
     * @param {Integer} Stage Type: <b>D3D12_META_COMMAND_PARAMETER_STAGE</b>
     * 
     * A <a href="https://docs.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_meta_command_parameter_stage">D3D12_META_COMMAND_PARAMETER_STAGE</a> specifying the stage of the parameters that you wish to be included in the query.
     * @param {Pointer<Integer>} pTotalStructureSizeInBytes Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a>*</b>
     * 
     * An optional pointer to a <a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a> containing the size of the structure containing the parameter values, which you pass when creating/initializing/executing the meta command, as appropriate.
     * @param {Pointer<Integer>} pParameterCount Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a>*</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a> containing the number of parameters to query for. This field determines the size of the <i>pParameterDescs</i> array, unless <i>pParameterDescs</i> is <b>nullptr</b>.
     * @param {Pointer<D3D12_META_COMMAND_PARAMETER_DESC>} pParameterDescs Type: <b>D3D12_META_COMMAND_PARAMETER_DESC*</b>
     * 
     * An optional pointer to an array of  <a href="https://docs.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_meta_command_parameter_desc">D3D12_META_COMMAND_PARAMETER_DESC</a> containing the descriptions of the parameters. Pass <b>nullptr</b> to have the parameter count returned in <i>pParameterCount</i>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//d3d12/nf-d3d12-id3d12device5-enumeratemetacommandparameters
     */
    EnumerateMetaCommandParameters(CommandId, Stage, pTotalStructureSizeInBytes, pParameterCount, pParameterDescs) {
        pTotalStructureSizeInBytesMarshal := pTotalStructureSizeInBytes is VarRef ? "uint*" : "ptr"
        pParameterCountMarshal := pParameterCount is VarRef ? "uint*" : "ptr"

        result := ComCall(60, this, "ptr", CommandId, "int", Stage, pTotalStructureSizeInBytesMarshal, pTotalStructureSizeInBytes, pParameterCountMarshal, pParameterCount, "ptr", pParameterDescs, "HRESULT")
        return result
    }

    /**
     * Creates an instance of the specified meta command.
     * @param {Pointer<Guid>} CommandId Type: <b>REFIID</b>
     * 
     * A reference to the globally unique identifier (GUID) of the meta command that you wish to instantiate.
     * @param {Integer} NodeMask Type: <b><a href="https://docs.microsoft.com/windows/win32/WinProg/windows-data-types">UINT</a></b>
     * 
     * For single-adapter operation, set this to zero. If there are multiple adapter nodes, set a bit to identify the node (one of the device's physical adapters) to which the meta command applies. Each bit in the mask corresponds to a single node. Only one bit must be set. See <a href="https://docs.microsoft.com/windows/win32/direct3d12/multi-engine">Multi-adapter systems</a>.
     * @param {Pointer} pCreationParametersData Type: <b>const <a href="https://docs.microsoft.com/windows/win32/WinProg/windows-data-types">void</a>*</b>
     * 
     * An optional pointer to a constant structure containing the values of the parameters for creating the meta command.
     * @param {Pointer} CreationParametersDataSizeInBytes Type: <b><a href="https://docs.microsoft.com/windows/win32/WinProg/windows-data-types">SIZE_T</a></b>
     * 
     * A <a href="https://docs.microsoft.com/windows/win32/WinProg/windows-data-types">SIZE_T</a> containing the size of the structure pointed to by <i>pCreationParametersData</i>, if set, otherwise 0.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * A reference to the globally unique identifier (GUID) of the interface that you wish to be returned in <i>ppMetaCommand</i>. This is expected to be the GUID of <a href="https://docs.microsoft.com/windows/win32/api/d3d12/nn-d3d12-id3d12metacommand">ID3D12MetaCommand</a>.
     * @returns {Pointer<Void>} Type: <b>void**</b>
     * 
     * A pointer to a memory block that receives a pointer to the meta command. This is the address of a pointer to an <a href="https://docs.microsoft.com/windows/win32/api/d3d12/nn-d3d12-id3d12metacommand">ID3D12MetaCommand</a>, representing  the meta command created.
     * @see https://docs.microsoft.com/windows/win32/api//d3d12/nf-d3d12-id3d12device5-createmetacommand
     */
    CreateMetaCommand(CommandId, NodeMask, pCreationParametersData, CreationParametersDataSizeInBytes, riid) {
        result := ComCall(61, this, "ptr", CommandId, "uint", NodeMask, "ptr", pCreationParametersData, "ptr", CreationParametersDataSizeInBytes, "ptr", riid, "ptr*", &ppMetaCommand := 0, "HRESULT")
        return ppMetaCommand
    }

    /**
     * Creates an [ID3D12StateObject](/windows/win32/api/d3d12/nn-d3d12-id3d12stateobject).
     * @param {Pointer<D3D12_STATE_OBJECT_DESC>} pDesc The description of the state object to create.
     * @param {Pointer<Guid>} riid The GUID of the interface to create. Use <i>__uuidof(ID3D12StateObject)</i>.
     * @returns {Pointer<Void>} The returned state object.
     * @see https://docs.microsoft.com/windows/win32/api//d3d12/nf-d3d12-id3d12device5-createstateobject
     */
    CreateStateObject(pDesc, riid) {
        result := ComCall(62, this, "ptr", pDesc, "ptr", riid, "ptr*", &ppStateObject := 0, "HRESULT")
        return ppStateObject
    }

    /**
     * Query the driver for resource requirements to build an acceleration structure.
     * @remarks
     * 
     * The input acceleration structure description is the same as what goes into <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12graphicscommandlist4-buildraytracingaccelerationstructure">BuildRaytracingAccelerationStructure</a>. The result of this function lets the application provide the correct amount of output storage and scratch storage to <b>BuildRaytracingAccelerationStructure</b> given the same geometry.  
     * 
     * Builds can also be done with the same configuration passed to <b>GetAccelerationStructurePrebuildInfo</b> overall except equal or smaller counts for the number of geometries/instances or the  number of vertices/indices/AABBs in any given geometry.  In this case the storage requirements reported with the original sizes passed to <b>GetRaytracingAccelerationStructurePrebuildInfo</b> will be valid – the build may actually consume less space but not more.  This is handy for app scenarios where having conservatively large storage allocated for acceleration structures is fine. 
     * 
     * This method is on the device interface as opposed to command list on the assumption that drivers must be able to calculate resource requirements for an acceleration structure build from only looking at the CPU-visible portions of the call, without having to dereference any pointers to GPU memory containing actual vertex data, index data, etc.
     * 
     * 
     * @param {Pointer<D3D12_BUILD_RAYTRACING_ACCELERATION_STRUCTURE_INPUTS>} pDesc Description of the acceleration structure build. This structure is shared with <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12graphicscommandlist4-buildraytracingaccelerationstructure">BuildRaytracingAccelerationStructure</a>.  For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_build_raytracing_acceleration_structure_inputs">D3D12_BUILD_RAYTRACING_ACCELERATION_STRUCTURE_INPUTS</a>.
     * 
     * The implementation is allowed to look at all the CPU parameters in this struct and nested structs.  It may not inspect/dereference any GPU virtual addresses, other than to check to see if a pointer is NULL or not, such as the optional transform in <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_raytracing_geometry_triangles_desc">D3D12_RAYTRACING_GEOMETRY_TRIANGLES_DESC</a>, without dereferencing it. In other words, the calculation of resource requirements for the acceleration structure does not depend on the actual geometry data (such as vertex positions), rather it can only depend on overall properties, such as the number of triangles, number of instances etc.
     * @param {Pointer<D3D12_RAYTRACING_ACCELERATION_STRUCTURE_PREBUILD_INFO>} pInfo The result of the query.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//d3d12/nf-d3d12-id3d12device5-getraytracingaccelerationstructureprebuildinfo
     */
    GetRaytracingAccelerationStructurePrebuildInfo(pDesc, pInfo) {
        ComCall(63, this, "ptr", pDesc, "ptr", pInfo)
    }

    /**
     * Reports the compatibility of serialized data, such as a serialized raytracing acceleration structure resulting from a call to CopyRaytracingAccelerationStructure with mode D3D12_RAYTRACING_ACCELERATION_STRUCTURE_COPY_MODE_SERIALIZE, with the current device/driver.
     * @param {Integer} SerializedDataType The type of the serialized data. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_serialized_data_type">D3D12_SERIALIZED_DATA_TYPE</a>.
     * @param {Pointer<D3D12_SERIALIZED_DATA_DRIVER_MATCHING_IDENTIFIER>} pIdentifierToCheck Identifier from the header of the serialized data to check with the driver. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_serialized_data_driver_matching_identifier">D3D12_SERIALIZED_DATA_DRIVER_MATCHING_IDENTIFIER</a>.
     * @returns {Integer} The returned compatibility status. For more information, see <a href="../d3d12/ne-d3d12-d3d12_driver_matching_identifier_status.md">D3D12_DRIVER_MATCHING_IDENTIFIER_STATUS</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3d12/nf-d3d12-id3d12device5-checkdrivermatchingidentifier
     */
    CheckDriverMatchingIdentifier(SerializedDataType, pIdentifierToCheck) {
        result := ComCall(64, this, "int", SerializedDataType, "ptr", pIdentifierToCheck, "int")
        return result
    }
}
