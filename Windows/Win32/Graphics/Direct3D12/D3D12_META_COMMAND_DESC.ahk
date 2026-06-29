#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\D3D12_GRAPHICS_STATES.ahk" { D3D12_GRAPHICS_STATES }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * Describes a meta command.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_meta_command_desc
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_META_COMMAND_DESC {
    #StructPack 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/api/guiddef/ns-guiddef-guid">GUID</a></b>
     * 
     * A <a href="https://docs.microsoft.com/windows/win32/api/guiddef/ns-guiddef-guid">GUID</a> uniquely identifying the meta command.
     */
    Id : Guid

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCWSTR</a></b>
     * 
     * The meta command name.
     */
    Name : PWSTR

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_graphics_states">D3D12_GRAPHICS_STATES</a></b>
     * 
     * Declares the command list states that are modified by the call to initialize the meta command. If all state bits are set, then that's equivalent to calling <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12graphicscommandlist-clearstate">ID3D12GraphicsCommandList::ClearState</a>.
     */
    InitializationDirtyState : D3D12_GRAPHICS_STATES

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_graphics_states">D3D12_GRAPHICS_STATES</a></b>
     * 
     * Declares the command list states that are modified by the call to execute the meta command. If all state bits are set, then that's equivalent to calling <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12graphicscommandlist-clearstate">ID3D12GraphicsCommandList::ClearState</a>.
     */
    ExecutionDirtyState : D3D12_GRAPHICS_STATES

}
