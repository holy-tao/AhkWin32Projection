#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Handle.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Ceip
 * @version v4.0.30319
 */
class Ceip {

;@region Constants
;@endregion Constants

;@region Methods
    /**
     * Checks whether the user has opted in for SQM data collection as part of the Customer Experience Improvement Program (CEIP).
     * @returns {BOOL} True if SQM data collection is opted in and the machine can send data. Otherwise, false.
     * @see https://learn.microsoft.com/windows/win32/api/windowsceip/nf-windowsceip-ceipisoptedin
     * @since windows8.1
     */
    static CeipIsOptedIn() {
        result := DllCall("KERNEL32.dll\CeipIsOptedIn", "int")
        return result
    }

;@endregion Methods
}
