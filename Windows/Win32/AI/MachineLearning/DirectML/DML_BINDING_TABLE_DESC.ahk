#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Graphics\Direct3D12\D3D12_CPU_DESCRIPTOR_HANDLE.ahk" { D3D12_CPU_DESCRIPTOR_HANDLE }
#Import ".\IDMLDispatchable.ahk" { IDMLDispatchable }
#Import "..\..\..\Graphics\Direct3D12\D3D12_GPU_DESCRIPTOR_HANDLE.ahk" { D3D12_GPU_DESCRIPTOR_HANDLE }

/**
 * Specifies parameters to IDMLDevice::CreateBindingTable and IDMLBindingTable::Reset.
 * @see https://learn.microsoft.com/windows/win32/api/directml/ns-directml-dml_binding_table_desc
 * @namespace Windows.Win32.AI.MachineLearning.DirectML
 */
export default struct DML_BINDING_TABLE_DESC {
    #StructPack 8

    /**
     * Type: <b>[IDMLDispatchable](/windows/win32/api/directml/nn-directml-idmldispatchable)*</b>
     * 
     * A pointer to an [IDMLDispatchable](/windows/win32/api/directml/nn-directml-idmldispatchable) interface representing the dispatchable object (an operator initializer, or a compiled operator) for which this binding table will represent the bindings—either an
     *         [IDMLCompiledOperator](/windows/win32/api/directml/nn-directml-idmlcompiledoperator) or an [IDMLOperatorInitializer](/windows/win32/api/directml/nn-directml-idmloperatorinitializer). The binding table maintains a strong reference to this
     *         interface pointer. This value may not be null.
     */
    Dispatchable : IDMLDispatchable

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_cpu_descriptor_handle">D3D12_CPU_DESCRIPTOR_HANDLE</a></b>
     * 
     * A valid CPU descriptor handle representing the start of a range into a constant buffer view (CBV)/shader resource view (SRV)/ unordered access view (UAV) descriptor heap into which
     *         DirectML may write descriptors.
     */
    CPUDescriptorHandle : D3D12_CPU_DESCRIPTOR_HANDLE

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_gpu_descriptor_handle">D3D12_GPU_DESCRIPTOR_HANDLE</a></b>
     * 
     * A valid GPU descriptor handle representing the start of a range into a constant buffer view (CBV)/shader resource view (SRV)/ unordered access view (UAV) descriptor heap that DirectML may use to bind resources to the pipeline.
     */
    GPUDescriptorHandle : D3D12_GPU_DESCRIPTOR_HANDLE

    /**
     * Type: [**UINT**](/windows/desktop/winprog/windows-data-types)
     * 
     * The size of the binding table, in descriptors. This is the maximum number of descriptors that DirectML is
     *         permitted to write, from the start of both the supplied CPU and GPU descriptor handles. Call
     *         [IDMLDispatchable::GetBindingProperties](/windows/win32/api/directml/nf-directml-idmldispatchable-getbindingproperties) to determine the number of descriptors required to execute a
     *         dispatchable object.
     */
    SizeInDescriptors : UInt32

}
