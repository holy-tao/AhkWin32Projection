#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The D3D12_COMMAND_LIST_FLAGS enumeration specifies flags to be used when creating a command list.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_command_list_flags
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_COMMAND_LIST_FLAGS extends Win32BitflagEnum{

    /**
     * No flags specified.
     * @type {Integer (Int32)}
     */
    static D3D12_COMMAND_LIST_FLAG_NONE => 0
}
