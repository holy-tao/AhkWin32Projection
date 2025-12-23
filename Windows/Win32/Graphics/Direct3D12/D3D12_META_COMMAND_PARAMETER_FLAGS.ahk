#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify the flags for a parameter to a meta command. Values can be bitwise OR'd together.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_meta_command_parameter_flags
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_META_COMMAND_PARAMETER_FLAGS extends Win32BitflagEnum{

    /**
     * Specifies that the parameter is an input resource.
     * @type {Integer (Int32)}
     */
    static D3D12_META_COMMAND_PARAMETER_FLAG_INPUT => 1

    /**
     * Specifies that the parameter is an output resource.
     * @type {Integer (Int32)}
     */
    static D3D12_META_COMMAND_PARAMETER_FLAG_OUTPUT => 2
}
