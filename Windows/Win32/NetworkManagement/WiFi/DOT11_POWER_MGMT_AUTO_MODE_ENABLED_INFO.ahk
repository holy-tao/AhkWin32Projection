#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\Ndis\NDIS_OBJECT_HEADER.ahk
#Include ..\..\Foundation\BOOLEAN.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class DOT11_POWER_MGMT_AUTO_MODE_ENABLED_INFO extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * @type {NDIS_OBJECT_HEADER}
     */
    Header{
        get {
            if(!this.HasProp("__Header"))
                this.__Header := NDIS_OBJECT_HEADER(this.ptr + 0)
            return this.__Header
        }
    }

    /**
     * @type {BOOLEAN}
     */
    bEnabled{
        get {
            if(!this.HasProp("__bEnabled"))
                this.__bEnabled := BOOLEAN(this.ptr + 4)
            return this.__bEnabled
        }
    }
}
