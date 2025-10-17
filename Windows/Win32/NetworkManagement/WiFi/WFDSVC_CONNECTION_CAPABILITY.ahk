#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class WFDSVC_CONNECTION_CAPABILITY extends Win32Struct
{
    static sizeof => 3

    static packingSize => 1

    /**
     * @type {BOOLEAN}
     */
    bNew {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * @type {BOOLEAN}
     */
    bClient {
        get => NumGet(this, 1, "char")
        set => NumPut("char", value, this, 1)
    }

    /**
     * @type {BOOLEAN}
     */
    bGO {
        get => NumGet(this, 2, "char")
        set => NumPut("char", value, this, 2)
    }
}
