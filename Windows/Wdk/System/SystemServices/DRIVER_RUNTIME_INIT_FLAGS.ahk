#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class DRIVER_RUNTIME_INIT_FLAGS extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static DrvRtPoolNxOptIn => 1

    /**
     * @type {Integer (Int32)}
     */
    static LastDrvRtFlag => 2
}
