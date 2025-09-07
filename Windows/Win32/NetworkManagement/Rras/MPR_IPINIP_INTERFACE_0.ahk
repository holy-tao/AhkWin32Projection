#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.Rras
 * @version v4.0.30319
 */
class MPR_IPINIP_INTERFACE_0 extends Win32Struct
{
    static sizeof => 528

    static packingSize => 8

    /**
     * @type {String}
     */
    wszFriendlyName {
        get => StrGet(this.ptr + 0, 256, "UTF-16")
        set => StrPut(value, this.ptr + 0, 256, "UTF-16")
    }

    /**
     * @type {Pointer<Guid>}
     */
    Guid {
        get => NumGet(this, 520, "ptr")
        set => NumPut("ptr", value, this, 520)
    }
}
