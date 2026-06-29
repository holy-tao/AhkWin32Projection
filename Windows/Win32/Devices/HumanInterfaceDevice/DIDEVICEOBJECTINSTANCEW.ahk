#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * @namespace Windows.Win32.Devices.HumanInterfaceDevice
 * @charset Unicode
 */
class DIDEVICEOBJECTINSTANCEW extends Win32Struct {
    static sizeof => 576

    static packingSize => 4

    /**
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Guid}
     */
    guidType {
        get {
            if(!this.HasProp("__guidType"))
                this.__guidType := Guid(4, this)
            return this.__guidType
        }
    }

    /**
     * @type {Integer}
     */
    dwOfs {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * @type {Integer}
     */
    dwType {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * @type {String}
     */
    tszName {
        get => StrGet(this.ptr + 32, 259, "UTF-16")
        set => StrPut(value, this.ptr + 32, 259, "UTF-16")
    }

    /**
     * @type {Integer}
     */
    dwFFMaxForce {
        get => NumGet(this, 552, "uint")
        set => NumPut("uint", value, this, 552)
    }

    /**
     * @type {Integer}
     */
    dwFFForceResolution {
        get => NumGet(this, 556, "uint")
        set => NumPut("uint", value, this, 556)
    }

    /**
     * @type {Integer}
     */
    wCollectionNumber {
        get => NumGet(this, 560, "ushort")
        set => NumPut("ushort", value, this, 560)
    }

    /**
     * @type {Integer}
     */
    wDesignatorIndex {
        get => NumGet(this, 562, "ushort")
        set => NumPut("ushort", value, this, 562)
    }

    /**
     * @type {Integer}
     */
    wUsagePage {
        get => NumGet(this, 564, "ushort")
        set => NumPut("ushort", value, this, 564)
    }

    /**
     * @type {Integer}
     */
    wUsage {
        get => NumGet(this, 566, "ushort")
        set => NumPut("ushort", value, this, 566)
    }

    /**
     * @type {Integer}
     */
    dwDimension {
        get => NumGet(this, 568, "uint")
        set => NumPut("uint", value, this, 568)
    }

    /**
     * @type {Integer}
     */
    wExponent {
        get => NumGet(this, 572, "ushort")
        set => NumPut("ushort", value, this, 572)
    }

    /**
     * @type {Integer}
     */
    wReportId {
        get => NumGet(this, 574, "ushort")
        set => NumPut("ushort", value, this, 574)
    }
}
