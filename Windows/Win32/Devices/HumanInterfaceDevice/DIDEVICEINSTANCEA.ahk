#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Devices.HumanInterfaceDevice
 * @version v4.0.30319
 * @charset ANSI
 */
class DIDEVICEINSTANCEA extends Win32Struct
{
    static sizeof => 568

    static packingSize => 8

    /**
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Pointer<Guid>}
     */
    guidInstance {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<Guid>}
     */
    guidProduct {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    dwDevType {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Array<SByte>}
     */
    tszInstanceName{
        get {
            if(!this.HasProp("__tszInstanceNameProxyArray"))
                this.__tszInstanceNameProxyArray := Win32FixedArray(this.ptr + 28, 260, Primitive, "char")
            return this.__tszInstanceNameProxyArray
        }
    }

    /**
     * @type {Array<SByte>}
     */
    tszProductName{
        get {
            if(!this.HasProp("__tszProductNameProxyArray"))
                this.__tszProductNameProxyArray := Win32FixedArray(this.ptr + 288, 260, Primitive, "char")
            return this.__tszProductNameProxyArray
        }
    }

    /**
     * @type {Pointer<Guid>}
     */
    guidFFDriver {
        get => NumGet(this, 552, "ptr")
        set => NumPut("ptr", value, this, 552)
    }

    /**
     * @type {Integer}
     */
    wUsagePage {
        get => NumGet(this, 560, "ushort")
        set => NumPut("ushort", value, this, 560)
    }

    /**
     * @type {Integer}
     */
    wUsage {
        get => NumGet(this, 562, "ushort")
        set => NumPut("ushort", value, this, 562)
    }
}
