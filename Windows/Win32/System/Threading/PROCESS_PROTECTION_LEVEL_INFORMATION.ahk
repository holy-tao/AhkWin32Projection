#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PROCESS_PROTECTION_LEVEL.ahk" { PROCESS_PROTECTION_LEVEL }

/**
 * Specifies whether Protected Process Light (PPL) is enabled.
 * @see https://learn.microsoft.com/windows/win32/api/processthreadsapi/ns-processthreadsapi-process_protection_level_information
 * @namespace Windows.Win32.System.Threading
 */
export default struct PROCESS_PROTECTION_LEVEL_INFORMATION {
    #StructPack 4

    ProtectionLevel : PROCESS_PROTECTION_LEVEL

}
