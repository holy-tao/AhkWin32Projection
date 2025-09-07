#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines constants that specify the stage of a parameter to a meta command.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_meta_command_parameter_stage
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_META_COMMAND_PARAMETER_STAGE{

    /**
     * Specifies that the parameter is used at the meta command creation stage.
     * @type {Integer (Int32)}
     */
    static D3D12_META_COMMAND_PARAMETER_STAGE_CREATION => 0

    /**
     * Specifies that the parameter is used at the meta command initialization stage.
     * @type {Integer (Int32)}
     */
    static D3D12_META_COMMAND_PARAMETER_STAGE_INITIALIZATION => 1

    /**
     * Specifies that the parameter is used at the meta command execution stage.
     * @type {Integer (Int32)}
     */
    static D3D12_META_COMMAND_PARAMETER_STAGE_EXECUTION => 2
}
