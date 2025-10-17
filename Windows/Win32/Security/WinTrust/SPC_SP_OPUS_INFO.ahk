#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Security.WinTrust
 * @version v4.0.30319
 */
class SPC_SP_OPUS_INFO extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {PWSTR}
     */
    pwszProgramName {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Pointer<SPC_LINK>}
     */
    pMoreInfo {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<SPC_LINK>}
     */
    pPublisherInfo {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}
