#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include .\SPC_LINK.ahk

/**
 * @namespace Windows.Win32.Security.WinTrust
 */
class SPC_SP_OPUS_INFO extends Win32Struct {
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
