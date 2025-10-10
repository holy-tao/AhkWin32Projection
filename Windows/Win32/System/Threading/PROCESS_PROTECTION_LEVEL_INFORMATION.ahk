#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Specifies whether Protected Process Light (PPL) is enabled.
 * @see https://docs.microsoft.com/windows/win32/api//processthreadsapi/ns-processthreadsapi-process_protection_level_information
 * @namespace Windows.Win32.System.Threading
 * @version v4.0.30319
 */
class PROCESS_PROTECTION_LEVEL_INFORMATION extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * 
     * @type {Integer}
     */
    ProtectionLevel {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
