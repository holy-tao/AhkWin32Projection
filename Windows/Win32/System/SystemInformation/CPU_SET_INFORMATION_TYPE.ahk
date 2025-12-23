#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Represents the type of information in the SYSTEM\_CPU\_SET\_INFORMATION structure.
 * @see https://learn.microsoft.com/windows/win32/ProcThread/cpu-set-information-type
 * @namespace Windows.Win32.System.SystemInformation
 * @version v4.0.30319
 */
class CPU_SET_INFORMATION_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static CpuSetInformation => 0
}
