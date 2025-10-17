#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 * @version v4.0.30319
 */
class MIB_ROUTESTATE extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * @type {BOOL}
     */
    bRoutesSetToStack {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }
}
