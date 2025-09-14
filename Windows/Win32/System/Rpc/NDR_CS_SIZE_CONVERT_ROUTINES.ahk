#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.Rpc
 * @version v4.0.30319
 */
class NDR_CS_SIZE_CONVERT_ROUTINES extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {Pointer<CS_TYPE_NET_SIZE_ROUTINE>}
     */
    pfnNetSize {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Pointer<CS_TYPE_TO_NETCS_ROUTINE>}
     */
    pfnToNetCs {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<CS_TYPE_LOCAL_SIZE_ROUTINE>}
     */
    pfnLocalSize {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Pointer<CS_TYPE_FROM_NETCS_ROUTINE>}
     */
    pfnFromNetCs {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }
}
