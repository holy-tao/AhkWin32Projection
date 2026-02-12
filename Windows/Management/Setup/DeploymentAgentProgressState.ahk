#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Management.Setup
 * @version WindowsRuntime 1.4
 */
class DeploymentAgentProgressState extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static NotStarted => 0

    /**
     * @type {Integer (Int32)}
     */
    static Initializing => 1

    /**
     * @type {Integer (Int32)}
     */
    static InProgress => 2

    /**
     * @type {Integer (Int32)}
     */
    static Completed => 3

    /**
     * @type {Integer (Int32)}
     */
    static ErrorOccurred => 4

    /**
     * @type {Integer (Int32)}
     */
    static RebootRequired => 5

    /**
     * @type {Integer (Int32)}
     */
    static Canceled => 6
}
