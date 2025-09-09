#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Devices.HumanInterfaceDevice
 * @version v4.0.30319
 */
class DIJOYSTATE2 extends Win32Struct
{
    static sizeof => 272

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
                this.__rglSliderProxyArray := Win32FixedArray(this.ptr + 24, 2, Primitive, "int")
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
                this.__rgbButtonsProxyArray := Win32FixedArray(this.ptr + 48, 128, Primitive, "char")
            return this.__rgbButtonsProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    lVX {
        get => NumGet(this, 176, "int")
        set => NumPut("int", value, this, 176)
    }

    /**
     * @type {Integer}
     */
    lVY {
        get => NumGet(this, 180, "int")
        set => NumPut("int", value, this, 180)
    }

    /**
     * @type {Integer}
     */
    lVZ {
        get => NumGet(this, 184, "int")
        set => NumPut("int", value, this, 184)
    }

    /**
     * @type {Integer}
     */
    lVRx {
        get => NumGet(this, 188, "int")
        set => NumPut("int", value, this, 188)
    }

    /**
     * @type {Integer}
     */
    lVRy {
        get => NumGet(this, 192, "int")
        set => NumPut("int", value, this, 192)
    }

    /**
     * @type {Integer}
     */
    lVRz {
        get => NumGet(this, 196, "int")
        set => NumPut("int", value, this, 196)
    }

    /**
     * @type {Array<Int32>}
     */
    rglVSlider{
        get {
            if(!this.HasProp("__rglVSliderProxyArray"))
                this.__rglVSliderProxyArray := Win32FixedArray(this.ptr + 200, 2, Primitive, "int")
            return this.__rglVSliderProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    lAX {
        get => NumGet(this, 208, "int")
        set => NumPut("int", value, this, 208)
    }

    /**
     * @type {Integer}
     */
    lAY {
        get => NumGet(this, 212, "int")
        set => NumPut("int", value, this, 212)
    }

    /**
     * @type {Integer}
     */
    lAZ {
        get => NumGet(this, 216, "int")
        set => NumPut("int", value, this, 216)
    }

    /**
     * @type {Integer}
     */
    lARx {
        get => NumGet(this, 220, "int")
        set => NumPut("int", value, this, 220)
    }

    /**
     * @type {Integer}
     */
    lARy {
        get => NumGet(this, 224, "int")
        set => NumPut("int", value, this, 224)
    }

    /**
     * @type {Integer}
     */
    lARz {
        get => NumGet(this, 228, "int")
        set => NumPut("int", value, this, 228)
    }

    /**
     * @type {Array<Int32>}
     */
    rglASlider{
        get {
            if(!this.HasProp("__rglASliderProxyArray"))
                this.__rglASliderProxyArray := Win32FixedArray(this.ptr + 232, 2, Primitive, "int")
            return this.__rglASliderProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    lFX {
        get => NumGet(this, 240, "int")
        set => NumPut("int", value, this, 240)
    }

    /**
     * @type {Integer}
     */
    lFY {
        get => NumGet(this, 244, "int")
        set => NumPut("int", value, this, 244)
    }

    /**
     * @type {Integer}
     */
    lFZ {
        get => NumGet(this, 248, "int")
        set => NumPut("int", value, this, 248)
    }

    /**
     * @type {Integer}
     */
    lFRx {
        get => NumGet(this, 252, "int")
        set => NumPut("int", value, this, 252)
    }

    /**
     * @type {Integer}
     */
    lFRy {
        get => NumGet(this, 256, "int")
        set => NumPut("int", value, this, 256)
    }

    /**
     * @type {Integer}
     */
    lFRz {
        get => NumGet(this, 260, "int")
        set => NumPut("int", value, this, 260)
    }

    /**
     * @type {Array<Int32>}
     */
    rglFSlider{
        get {
            if(!this.HasProp("__rglFSliderProxyArray"))
                this.__rglFSliderProxyArray := Win32FixedArray(this.ptr + 264, 2, Primitive, "int")
            return this.__rglFSliderProxyArray
        }
    }
}
