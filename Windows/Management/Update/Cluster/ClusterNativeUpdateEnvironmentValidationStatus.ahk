#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Management.Update.Cluster
 * @version WindowsRuntime 1.4
 */
class ClusterNativeUpdateEnvironmentValidationStatus extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static Approved => 0

    /**
     * @type {Integer (Int32)}
     */
    static ApprovedWithWarnings => 1

    /**
     * @type {Integer (Int32)}
     */
    static Rejected => 2
}
