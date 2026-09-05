#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
class D3D12_STATE_OBJECT_DATABASE_FLAGS extends Win32BitflagEnum {

    /**
     * Native name: D3D12_STATE_OBJECT_DATABASE_FLAG_NONE
     * @type {Integer (Int32)}
     */
    static FLAG_NONE => 0

    /**
     * Native name: D3D12_STATE_OBJECT_DATABASE_FLAG_READ_ONLY
     * @type {Integer (Int32)}
     */
    static FLAG_READ_ONLY => 1
}
