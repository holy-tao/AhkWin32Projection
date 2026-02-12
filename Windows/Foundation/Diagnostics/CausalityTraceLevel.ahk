#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies a logging level that listeners can use for trace filtering.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.foundation.diagnostics.causalitytracelevel
 * @namespace Windows.Foundation.Diagnostics
 * @version WindowsRuntime 1.4
 */
class CausalityTraceLevel extends Win32Enum{

    /**
     * Indicates all operations that are necessary to construct a causality chain, including all operations for job creation and completion and work item creation and completion.
     * @type {Integer (Int32)}
     */
    static Required => 0

    /**
     * Tracks operations that are not necessary to construct a causality chain but are interesting for developers.
     * @type {Integer (Int32)}
     */
    static Important => 1

    /**
     * Indicates operations that influence causality but are likely to be less interesting for developers, including actions like registering progress delegates.
     * @type {Integer (Int32)}
     */
    static Verbose => 2
}
