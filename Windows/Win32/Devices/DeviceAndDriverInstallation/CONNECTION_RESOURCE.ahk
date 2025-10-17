#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\CONNECTION_DES.ahk

/**
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 * @version v4.0.30319
 */
class CONNECTION_RESOURCE extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {CONNECTION_DES}
     */
    Connection_Header{
        get {
            if(!this.HasProp("__Connection_Header"))
                this.__Connection_Header := CONNECTION_DES(0, this)
            return this.__Connection_Header
        }
    }
}
