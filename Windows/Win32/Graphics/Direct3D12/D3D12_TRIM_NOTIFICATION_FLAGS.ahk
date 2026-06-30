#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
class D3D12_TRIM_NOTIFICATION_FLAGS extends Win32BitflagEnum {

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_TRIM_NOTIFICATION_FLAG_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_TRIM_NOTIFICATION_FLAG_PERIODIC_TRIM => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_TRIM_NOTIFICATION_FLAG_RESTART_PERIODIC_TRIM => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3D12_TRIM_NOTIFICATION_FLAG_TRIM_TO_BUDGET => 4
}
