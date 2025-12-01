#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify the data type of a parameter to a meta command.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_meta_command_parameter_type
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_META_COMMAND_PARAMETER_TYPE extends Win32Enum{

    /**
     * Specifies that the parameter is of type <a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">FLOAT</a>.
     * @type {Integer (Int32)}
     */
    static D3D12_META_COMMAND_PARAMETER_TYPE_FLOAT => 0

    /**
     * Specifies that the parameter is of type <a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT64</a>.
     * @type {Integer (Int32)}
     */
    static D3D12_META_COMMAND_PARAMETER_TYPE_UINT64 => 1

    /**
     * Specifies that the parameter is a GPU virtual address.
     * @type {Integer (Int32)}
     */
    static D3D12_META_COMMAND_PARAMETER_TYPE_GPU_VIRTUAL_ADDRESS => 2

    /**
     * Specifies that the parameter is a CPU descriptor handle to a heap containing either constant buffer views, shader resource views, or unordered access views.
     * @type {Integer (Int32)}
     */
    static D3D12_META_COMMAND_PARAMETER_TYPE_CPU_DESCRIPTOR_HANDLE_HEAP_TYPE_CBV_SRV_UAV => 3

    /**
     * Specifies that the parameter is a GPU descriptor handle to a heap containing either constant buffer views, shader resource views, or unordered access views.
     * @type {Integer (Int32)}
     */
    static D3D12_META_COMMAND_PARAMETER_TYPE_GPU_DESCRIPTOR_HANDLE_HEAP_TYPE_CBV_SRV_UAV => 4
}
