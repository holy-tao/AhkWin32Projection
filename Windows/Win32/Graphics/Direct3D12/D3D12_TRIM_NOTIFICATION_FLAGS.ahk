#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
class D3D12_TRIM_NOTIFICATION_FLAGS extends Win32BitflagEnum {

    /**
     * Native name: D3D12_TRIM_NOTIFICATION_FLAG_NONE
     * @type {Integer (Int32)}
     */
    static FLAG_NONE => 0

    /**
     * Native name: D3D12_TRIM_NOTIFICATION_FLAG_PERIODIC_TRIM
     * @type {Integer (Int32)}
     */
    static FLAG_PERIODIC_TRIM => 1

    /**
     * Native name: D3D12_TRIM_NOTIFICATION_FLAG_RESTART_PERIODIC_TRIM
     * @type {Integer (Int32)}
     */
    static FLAG_RESTART_PERIODIC_TRIM => 2

    /**
     * Native name: D3D12_TRIM_NOTIFICATION_FLAG_TRIM_TO_BUDGET
     * @type {Integer (Int32)}
     */
    static FLAG_TRIM_TO_BUDGET => 4
}
