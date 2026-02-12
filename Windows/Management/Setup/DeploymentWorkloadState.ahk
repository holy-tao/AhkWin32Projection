#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Management.Setup
 * @version WindowsRuntime 1.4
 */
class DeploymentWorkloadState extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static NotStarted => 0

    /**
     * @type {Integer (Int32)}
     */
    static InProgress => 1

    /**
     * @type {Integer (Int32)}
     */
    static Completed => 2

    /**
     * @type {Integer (Int32)}
     */
    static Failed => 3

    /**
     * @type {Integer (Int32)}
     */
    static Canceled => 4

    /**
     * @type {Integer (Int32)}
     */
    static Skipped => 5

    /**
     * @type {Integer (Int32)}
     */
    static Uninstalled => 6

    /**
     * @type {Integer (Int32)}
     */
    static RebootRequired => 7
}
