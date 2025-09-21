#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes a meta command.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_meta_command_desc
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_META_COMMAND_DESC extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/api/guiddef/ns-guiddef-guid">GUID</a></b>
     * 
     * A <a href="https://docs.microsoft.com/windows/win32/api/guiddef/ns-guiddef-guid">GUID</a> uniquely identifying the meta command.
     * @type {Pointer<Guid>}
     */
    Id {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCWSTR</a></b>
     * 
     * The meta command name.
     * @type {Pointer<Char>}
     */
    Name {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_graphics_states">D3D12_GRAPHICS_STATES</a></b>
     * 
     * Declares the command list states that are modified by the call to initialize the meta command. If all state bits are set, then that's equivalent to calling <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12graphicscommandlist-clearstate">ID3D12GraphicsCommandList::ClearState</a>.
     * @type {Integer}
     */
    InitializationDirtyState {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ne-d3d12-d3d12_graphics_states">D3D12_GRAPHICS_STATES</a></b>
     * 
     * Declares the command list states that are modified by the call to execute the meta command. If all state bits are set, then that's equivalent to calling <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12graphicscommandlist-clearstate">ID3D12GraphicsCommandList::ClearState</a>.
     * @type {Integer}
     */
    ExecutionDirtyState {
        get => NumGet(this, 20, "int")
        set => NumPut("int", value, this, 20)
    }
}
