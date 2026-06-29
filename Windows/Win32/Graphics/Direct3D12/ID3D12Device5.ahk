#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\D3D12_SERIALIZED_DATA_TYPE.ahk" { D3D12_SERIALIZED_DATA_TYPE }
#Import ".\ID3D12LifetimeOwner.ahk" { ID3D12LifetimeOwner }
#Import ".\D3D12_META_COMMAND_PARAMETER_STAGE.ahk" { D3D12_META_COMMAND_PARAMETER_STAGE }
#Import ".\D3D12_RAYTRACING_ACCELERATION_STRUCTURE_PREBUILD_INFO.ahk" { D3D12_RAYTRACING_ACCELERATION_STRUCTURE_PREBUILD_INFO }
#Import ".\D3D12_DRIVER_MATCHING_IDENTIFIER_STATUS.ahk" { D3D12_DRIVER_MATCHING_IDENTIFIER_STATUS }
#Import ".\D3D12_STATE_OBJECT_DESC.ahk" { D3D12_STATE_OBJECT_DESC }
#Import ".\D3D12_META_COMMAND_DESC.ahk" { D3D12_META_COMMAND_DESC }
#Import ".\D3D12_BUILD_RAYTRACING_ACCELERATION_STRUCTURE_INPUTS.ahk" { D3D12_BUILD_RAYTRACING_ACCELERATION_STRUCTURE_INPUTS }
#Import ".\D3D12_META_COMMAND_PARAMETER_DESC.ahk" { D3D12_META_COMMAND_PARAMETER_DESC }
#Import ".\ID3D12Device4.ahk" { ID3D12Device4 }
#Import ".\D3D12_SERIALIZED_DATA_DRIVER_MATCHING_IDENTIFIER.ahk" { D3D12_SERIALIZED_DATA_DRIVER_MATCHING_IDENTIFIER }

/**
 * Represents a virtual adapter. This interface extends [ID3D12Device4](../d3d12/nn-d3d12-id3d12device4.md).
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/nn-d3d12-id3d12device5
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct ID3D12Device5 extends ID3D12Device4 {
    /**
     * The interface identifier for ID3D12Device5
     * @type {Guid}
     */
    static IID := Guid("{8b4f173b-2fea-4b80-8f58-4307191ab95d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D12Device5 interfaces
    */
    struct Vtbl extends ID3D12Device4.Vtbl {
        CreateLifetimeTracker                          : IntPtr
        RemoveDevice                                   : IntPtr
        EnumerateMetaCommands                          : IntPtr
        EnumerateMetaCommandParameters                 : IntPtr
        CreateMetaCommand                              : IntPtr
        CreateStateObject                              : IntPtr
        GetRaytracingAccelerationStructurePrebuildInfo : IntPtr
        CheckDriverMatchingIdentifier                  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D12Device5.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Creates a lifetime tracker associated with an application-defined callback; the callback receives notifications when the lifetime of a tracked object is changed.
     * @param {ID3D12LifetimeOwner} pOwner Type: **[ID3D12LifetimeOwner](./nn-d3d12-id3d12lifetimeowner.md)\***
     * 
     * A pointer to an **ID3D12LifetimeOwner** interface representing the application-defined callback.
     * @param {Pointer<Guid>} riid Type: **REFIID**
     * 
     * A reference to the interface identifier (IID) of the interface to return in *ppvTracker*.
     * @returns {Pointer<Void>} Type: **void\*\***
     * 
     * A pointer to a memory block that receives the requested interface pointer to the created object.
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12device5-createlifetimetracker
     */
    CreateLifetimeTracker(pOwner, riid) {
        result := ComCall(57, this, "ptr", pOwner, Guid.Ptr, riid, "ptr*", &ppvTracker := 0, "HRESULT")
        return ppvTracker
    }

    /**
     * You can call **RemoveDevice** to indicate to the Direct3D 12 runtime that the GPU device encountered a problem, and can no longer be used.
     * @remarks
     * Because device removal triggers all fences to be signaled to `UINT64_MAX`, you can create a callback for device removal using an event.
     * 
     * ```cpp
     * HANDLE deviceRemovedEvent = CreateEventW(NULL, FALSE, FALSE, NULL);
     * assert(deviceRemovedEvent != NULL);
     * _deviceFence->SetEventOnCompletion(UINT64_MAX, deviceRemoved);
     * 
     * HANDLE waitHandle;
     * RegisterWaitForSingleObject(
     *   &waitHandle,
     *   deviceRemovedEvent,
     *   OnDeviceRemoved,
     *   _device.Get(), // Pass the device as our context
     *   INFINITE, // No timeout
     *   0 // No flags
     * );
     * 
     * void OnDeviceRemoved(PVOID context, BOOLEAN)
     * {
     *   ID3D12Device* removedDevice = (ID3D12Device*)context;
     *   HRESULT removedReason = removedDevice->GetDeviceRemovedReason();
     *   // Perform app-specific device removed operation, such as logging or inspecting DRED output
     * }
     * ```
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
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12device5-enumeratemetacommands
     */
    EnumerateMetaCommands(pNumMetaCommands) {
        pNumMetaCommandsMarshal := pNumMetaCommands is VarRef ? "uint*" : "ptr"

        pDescs := D3D12_META_COMMAND_DESC()
        result := ComCall(59, this, pNumMetaCommandsMarshal, pNumMetaCommands, D3D12_META_COMMAND_DESC.Ptr, pDescs, "HRESULT")
        return pDescs
    }

    /**
     * Queries reflection metadata about the parameters of the specified meta command.
     * @param {Pointer<Guid>} CommandId Type: <b>REFIID</b>
     * 
     * A reference to the globally unique identifier (GUID) of the meta command whose parameters you wish to be returned in <i>pParameterDescs</i>.
     * @param {D3D12_META_COMMAND_PARAMETER_STAGE} Stage Type: <b>D3D12_META_COMMAND_PARAMETER_STAGE</b>
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
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12device5-enumeratemetacommandparameters
     */
    EnumerateMetaCommandParameters(CommandId, Stage, pTotalStructureSizeInBytes, pParameterCount, pParameterDescs) {
        pTotalStructureSizeInBytesMarshal := pTotalStructureSizeInBytes is VarRef ? "uint*" : "ptr"
        pParameterCountMarshal := pParameterCount is VarRef ? "uint*" : "ptr"

        result := ComCall(60, this, Guid.Ptr, CommandId, D3D12_META_COMMAND_PARAMETER_STAGE, Stage, pTotalStructureSizeInBytesMarshal, pTotalStructureSizeInBytes, pParameterCountMarshal, pParameterCount, D3D12_META_COMMAND_PARAMETER_DESC.Ptr, pParameterDescs, "HRESULT")
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
     * @param {Integer} pCreationParametersData Type: <b>const <a href="https://docs.microsoft.com/windows/win32/WinProg/windows-data-types">void</a>*</b>
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
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12device5-createmetacommand
     */
    CreateMetaCommand(CommandId, NodeMask, pCreationParametersData, CreationParametersDataSizeInBytes, riid) {
        result := ComCall(61, this, Guid.Ptr, CommandId, "uint", NodeMask, "ptr", pCreationParametersData, "ptr", CreationParametersDataSizeInBytes, Guid.Ptr, riid, "ptr*", &ppMetaCommand := 0, "HRESULT")
        return ppMetaCommand
    }

    /**
     * Creates an [ID3D12StateObject](/windows/win32/api/d3d12/nn-d3d12-id3d12stateobject).
     * @param {Pointer<D3D12_STATE_OBJECT_DESC>} pDesc The description of the state object to create.
     * @param {Pointer<Guid>} riid The GUID of the interface to create. Use <i>__uuidof(ID3D12StateObject)</i>.
     * @returns {Pointer<Void>} The returned state object.
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12device5-createstateobject
     */
    CreateStateObject(pDesc, riid) {
        result := ComCall(62, this, D3D12_STATE_OBJECT_DESC.Ptr, pDesc, Guid.Ptr, riid, "ptr*", &ppStateObject := 0, "HRESULT")
        return ppStateObject
    }

    /**
     * Query the driver for resource requirements to build an acceleration structure.
     * @remarks
     * The input acceleration structure description is the same as what goes into <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12graphicscommandlist4-buildraytracingaccelerationstructure">BuildRaytracingAccelerationStructure</a>. The result of this function lets the application provide the correct amount of output storage and scratch storage to <b>BuildRaytracingAccelerationStructure</b> given the same geometry.  
     * 
     * Builds can also be done with the same configuration passed to <b>GetAccelerationStructurePrebuildInfo</b> overall except equal or smaller counts for the number of geometries/instances or the  number of vertices/indices/AABBs in any given geometry.  In this case the storage requirements reported with the original sizes passed to <b>GetRaytracingAccelerationStructurePrebuildInfo</b> will be valid – the build may actually consume less space but not more.  This is handy for app scenarios where having conservatively large storage allocated for acceleration structures is fine. 
     * 
     * This method is on the device interface as opposed to command list on the assumption that drivers must be able to calculate resource requirements for an acceleration structure build from only looking at the CPU-visible portions of the call, without having to dereference any pointers to GPU memory containing actual vertex data, index data, etc.
     * @param {Pointer<D3D12_BUILD_RAYTRACING_ACCELERATION_STRUCTURE_INPUTS>} pDesc Description of the acceleration structure build. This structure is shared with <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12graphicscommandlist4-buildraytracingaccelerationstructure">BuildRaytracingAccelerationStructure</a>.  For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_build_raytracing_acceleration_structure_inputs">D3D12_BUILD_RAYTRACING_ACCELERATION_STRUCTURE_INPUTS</a>.
     * 
     * The implementation is allowed to look at all the CPU parameters in this struct and nested structs.  It may not inspect/dereference any GPU virtual addresses, other than to check to see if a pointer is NULL or not, such as the optional transform in <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_raytracing_geometry_triangles_desc">D3D12_RAYTRACING_GEOMETRY_TRIANGLES_DESC</a>, without dereferencing it. In other words, the calculation of resource requirements for the acceleration structure does not depend on the actual geometry data (such as vertex positions), rather it can only depend on overall properties, such as the number of triangles, number of instances etc.
     * @param {Pointer<D3D12_RAYTRACING_ACCELERATION_STRUCTURE_PREBUILD_INFO>} pInfo The result of the query.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12device5-getraytracingaccelerationstructureprebuildinfo
     */
    GetRaytracingAccelerationStructurePrebuildInfo(pDesc, pInfo) {
        ComCall(63, this, D3D12_BUILD_RAYTRACING_ACCELERATION_STRUCTURE_INPUTS.Ptr, pDesc, D3D12_RAYTRACING_ACCELERATION_STRUCTURE_PREBUILD_INFO.Ptr, pInfo)
    }

    /**
     * Reports the compatibility of serialized data, such as a serialized raytracing acceleration structure resulting from a call to CopyRaytracingAccelerationStructure with mode D3D12_RAYTRACING_ACCELERATION_STRUCTURE_COPY_MODE_SERIALIZE, with the current device/driver.
     * @param {D3D12_SERIALIZED_DATA_TYPE} SerializedDataType The type of the serialized data. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_serialized_data_type">D3D12_SERIALIZED_DATA_TYPE</a>.
     * @param {Pointer<D3D12_SERIALIZED_DATA_DRIVER_MATCHING_IDENTIFIER>} pIdentifierToCheck Identifier from the header of the serialized data to check with the driver. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_serialized_data_driver_matching_identifier">D3D12_SERIALIZED_DATA_DRIVER_MATCHING_IDENTIFIER</a>.
     * @returns {D3D12_DRIVER_MATCHING_IDENTIFIER_STATUS} The returned compatibility status. For more information, see <a href="../d3d12/ne-d3d12-d3d12_driver_matching_identifier_status.md">D3D12_DRIVER_MATCHING_IDENTIFIER_STATUS</a>.
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12device5-checkdrivermatchingidentifier
     */
    CheckDriverMatchingIdentifier(SerializedDataType, pIdentifierToCheck) {
        result := ComCall(64, this, D3D12_SERIALIZED_DATA_TYPE, SerializedDataType, D3D12_SERIALIZED_DATA_DRIVER_MATCHING_IDENTIFIER.Ptr, pIdentifierToCheck, D3D12_DRIVER_MATCHING_IDENTIFIER_STATUS)
        return result
    }

    Query(iid) {
        if (ID3D12Device5.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateLifetimeTracker := CallbackCreate(GetMethod(implObj, "CreateLifetimeTracker"), flags, 4)
        this.vtbl.RemoveDevice := CallbackCreate(GetMethod(implObj, "RemoveDevice"), flags, 1)
        this.vtbl.EnumerateMetaCommands := CallbackCreate(GetMethod(implObj, "EnumerateMetaCommands"), flags, 3)
        this.vtbl.EnumerateMetaCommandParameters := CallbackCreate(GetMethod(implObj, "EnumerateMetaCommandParameters"), flags, 6)
        this.vtbl.CreateMetaCommand := CallbackCreate(GetMethod(implObj, "CreateMetaCommand"), flags, 7)
        this.vtbl.CreateStateObject := CallbackCreate(GetMethod(implObj, "CreateStateObject"), flags, 4)
        this.vtbl.GetRaytracingAccelerationStructurePrebuildInfo := CallbackCreate(GetMethod(implObj, "GetRaytracingAccelerationStructurePrebuildInfo"), flags, 3)
        this.vtbl.CheckDriverMatchingIdentifier := CallbackCreate(GetMethod(implObj, "CheckDriverMatchingIdentifier"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreateLifetimeTracker)
        CallbackFree(this.vtbl.RemoveDevice)
        CallbackFree(this.vtbl.EnumerateMetaCommands)
        CallbackFree(this.vtbl.EnumerateMetaCommandParameters)
        CallbackFree(this.vtbl.CreateMetaCommand)
        CallbackFree(this.vtbl.CreateStateObject)
        CallbackFree(this.vtbl.GetRaytracingAccelerationStructurePrebuildInfo)
        CallbackFree(this.vtbl.CheckDriverMatchingIdentifier)
    }
}
