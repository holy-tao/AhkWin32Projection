#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * The SdpQueryUuidUnion union contains the UUID on which to perform an SDP query. Used in conjunction with the SdpQueryUuid structure.
 * @see https://learn.microsoft.com/windows/win32/api/bthsdpdef/ns-bthsdpdef-sdpqueryuuidunion
 * @namespace Windows.Win32.Devices.Bluetooth
 */
class SdpQueryUuidUnion extends Win32Struct {
    static sizeof => 24

    static packingSize => 4

    /**
     * UUID in 128-bit format.
     * @type {Guid}
     */
    uuid128 {
        get {
            if(!this.HasProp("__uuid128"))
                this.__uuid128 := Guid(0, this)
            return this.__uuid128
        }
    }

    /**
     * UUID in 32-bit format.
     * @type {Integer}
     */
    uuid32 {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * UUID in 16-bit format.
     * @type {Integer}
     */
    uuid16 {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }
}
