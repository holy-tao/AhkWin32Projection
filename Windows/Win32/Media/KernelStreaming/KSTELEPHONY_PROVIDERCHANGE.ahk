#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\TELEPHONY_CALLTYPE.ahk
#Include .\TELEPHONY_PROVIDERCHANGEOP.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class KSTELEPHONY_PROVIDERCHANGE extends Win32Struct {
    static sizeof => 8

    static packingSize => 4

    /**
     * @type {TELEPHONY_CALLTYPE}
     */
    CallType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {TELEPHONY_PROVIDERCHANGEOP}
     */
    ProviderChangeOp {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }
}
