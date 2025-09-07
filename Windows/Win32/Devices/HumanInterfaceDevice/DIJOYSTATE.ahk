#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Devices.HumanInterfaceDevice
 * @version v4.0.30319
 */
class DIJOYSTATE extends Win32Struct
{
    static sizeof => 80

    static packingSize => 4

    /**
     * @type {Integer}
     */
    lX {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    lY {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    lZ {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    lRx {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    lRy {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    lRz {
        get => NumGet(this, 20, "int")
        set => NumPut("int", value, this, 20)
    }

    /**
     * @type {Array<Int32>}
     */
    rglSlider{
        get {
            if(!this.HasProp("__rglSliderProxyArray"))
                this.__rglSliderProxyArray := Win32FixedArray(this.ptr + 24, 4, Primitive, "int")
            return this.__rglSliderProxyArray
        }
    }

    /**
     * @type {Array<UInt32>}
     */
    rgdwPOV{
        get {
            if(!this.HasProp("__rgdwPOVProxyArray"))
                this.__rgdwPOVProxyArray := Win32FixedArray(this.ptr + 32, 4, Primitive, "uint")
            return this.__rgdwPOVProxyArray
        }
    }

    /**
     * @type {Array<Byte>}
     */
    rgbButtons{
        get {
            if(!this.HasProp("__rgbButtonsProxyArray"))
                this.__rgbButtonsProxyArray := Win32FixedArray(this.ptr + 48, 1, Primitive, "char")
            return this.__rgbButtonsProxyArray
        }
    }
}
