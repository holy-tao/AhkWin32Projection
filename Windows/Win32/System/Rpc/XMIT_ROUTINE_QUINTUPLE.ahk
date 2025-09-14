#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.Rpc
 * @version v4.0.30319
 */
class XMIT_ROUTINE_QUINTUPLE extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {Pointer<XMIT_HELPER_ROUTINE>}
     */
    pfnTranslateToXmit {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Pointer<XMIT_HELPER_ROUTINE>}
     */
    pfnTranslateFromXmit {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<XMIT_HELPER_ROUTINE>}
     */
    pfnFreeXmit {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Pointer<XMIT_HELPER_ROUTINE>}
     */
    pfnFreeInst {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }
}
