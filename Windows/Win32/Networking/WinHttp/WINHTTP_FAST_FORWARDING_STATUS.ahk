#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WINHTTP_FAST_FORWARDING_STATE.ahk

/**
 * @namespace Windows.Win32.Networking.WinHttp
 * @architecture X64, Arm64
 */
class WINHTTP_FAST_FORWARDING_STATUS extends Win32Struct {
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {WINHTTP_FAST_FORWARDING_STATE}
     */
    TransferState {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    NtStatus {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    dwError {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    ullBytesTransferred {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}
