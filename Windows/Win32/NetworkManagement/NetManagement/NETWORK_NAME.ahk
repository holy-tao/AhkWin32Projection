#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\FLAT_STRING.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class NETWORK_NAME extends Win32Struct
{
    static sizeof => 6

    static packingSize => 2

    /**
     * @type {FLAT_STRING}
     */
    Name{
        get {
            if(!this.HasProp("__Name"))
                this.__Name := FLAT_STRING(0, this)
            return this.__Name
        }
    }
}
