#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Indicates the current state of the execution of a diagnostics troubleshooting package.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.system.diagnostics.diagnosticactionstate
 * @namespace Windows.System.Diagnostics
 * @version WindowsRuntime 1.4
 */
class DiagnosticActionState extends Win32Enum{

    /**
     * The diagnostics run is initializing.
     * @type {Integer (Int32)}
     */
    static Initializing => 0

    /**
     * The diagnostics run is downloading the troubleshooting package.
     * @type {Integer (Int32)}
     */
    static Downloading => 1

    /**
     * The diagnostics run is verifying trust of the downloaded troubleshooting package.
     * @type {Integer (Int32)}
     */
    static VerifyingTrust => 2

    /**
     * The diagnostics run is detecting.
     * @type {Integer (Int32)}
     */
    static Detecting => 3

    /**
     * The diagnostics run is resolving.
     * @type {Integer (Int32)}
     */
    static Resolving => 4

    /**
     * The diagnostics run is verifying resolution.
     * @type {Integer (Int32)}
     */
    static VerifyingResolution => 5

    /**
     * The diagnostics run is executing.
     * @type {Integer (Int32)}
     */
    static Executing => 6
}
