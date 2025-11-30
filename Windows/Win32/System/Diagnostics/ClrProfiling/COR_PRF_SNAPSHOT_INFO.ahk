#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.ClrProfiling
 * @version v4.0.30319
 */
class COR_PRF_SNAPSHOT_INFO extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static COR_PRF_SNAPSHOT_DEFAULT => 0

    /**
     * @type {Integer (Int32)}
     */
    static COR_PRF_SNAPSHOT_REGISTER_CONTEXT => 1

    /**
     * @type {Integer (Int32)}
     */
    static COR_PRF_SNAPSHOT_X86_OPTIMIZED => 2
}
