#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit

#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.System.Diagnostics.Ceip
 */

;@region Functions
/**
 * Checks whether the user has opted in for SQM data collection as part of the Customer Experience Improvement Program (CEIP).
 * @returns {BOOL} True if SQM data collection is opted in and the machine can send data. Otherwise, false.
 * @see https://learn.microsoft.com/windows/win32/api/windowsceip/nf-windowsceip-ceipisoptedin
 * @since windows8.1
 */
export CeipIsOptedIn() {
    result := DllCall("KERNEL32.dll\CeipIsOptedIn", BOOL)
    return result
}

;@endregion Functions
