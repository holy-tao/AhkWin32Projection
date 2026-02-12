#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Management.Update.Cluster
 * @version WindowsRuntime 1.4
 */
class ClusterNativeUpdateLogLevel extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static Debug => 0

    /**
     * @type {Integer (Int32)}
     */
    static Verbose => 1

    /**
     * @type {Integer (Int32)}
     */
    static Info => 2

    /**
     * @type {Integer (Int32)}
     */
    static Warning => 3

    /**
     * @type {Integer (Int32)}
     */
    static Error => 4
}
