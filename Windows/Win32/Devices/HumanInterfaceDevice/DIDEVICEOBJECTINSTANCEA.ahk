#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * @namespace Windows.Win32.Devices.HumanInterfaceDevice
 * @charset ANSI
 */
class DIDEVICEOBJECTINSTANCEA extends Win32Struct {
    static sizeof => 316

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
        get => StrGet(this.ptr + 32, 259, "UTF-8")
        set => StrPut(value, this.ptr + 32, 259, "UTF-8")
    }

    /**
     * @type {Integer}
     */
    dwFFMaxForce {
        get => NumGet(this, 292, "uint")
        set => NumPut("uint", value, this, 292)
    }

    /**
     * @type {Integer}
     */
    dwFFForceResolution {
        get => NumGet(this, 296, "uint")
        set => NumPut("uint", value, this, 296)
    }

    /**
     * @type {Integer}
     */
    wCollectionNumber {
        get => NumGet(this, 300, "ushort")
        set => NumPut("ushort", value, this, 300)
    }

    /**
     * @type {Integer}
     */
    wDesignatorIndex {
        get => NumGet(this, 302, "ushort")
        set => NumPut("ushort", value, this, 302)
    }

    /**
     * @type {Integer}
     */
    wUsagePage {
        get => NumGet(this, 304, "ushort")
        set => NumPut("ushort", value, this, 304)
    }

    /**
     * @type {Integer}
     */
    wUsage {
        get => NumGet(this, 306, "ushort")
        set => NumPut("ushort", value, this, 306)
    }

    /**
     * @type {Integer}
     */
    dwDimension {
        get => NumGet(this, 308, "uint")
        set => NumPut("uint", value, this, 308)
    }

    /**
     * @type {Integer}
     */
    wExponent {
        get => NumGet(this, 312, "ushort")
        set => NumPut("ushort", value, this, 312)
    }

    /**
     * @type {Integer}
     */
    wReportId {
        get => NumGet(this, 314, "ushort")
        set => NumPut("ushort", value, this, 314)
    }
}
