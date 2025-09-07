#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Devices.HumanInterfaceDevice
 * @version v4.0.30319
 * @charset Unicode
 */
class DIDEVICEOBJECTINSTANCEW extends Win32Struct
{
    static sizeof => 576

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
    guidType {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    dwOfs {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    dwType {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {String}
     */
    tszName {
        get => StrGet(this.ptr + 28, 259, "UTF-16")
        set => StrPut(value, this.ptr + 28, 259, "UTF-16")
    }

    /**
     * @type {Integer}
     */
    dwFFMaxForce {
        get => NumGet(this, 548, "uint")
        set => NumPut("uint", value, this, 548)
    }

    /**
     * @type {Integer}
     */
    dwFFForceResolution {
        get => NumGet(this, 552, "uint")
        set => NumPut("uint", value, this, 552)
    }

    /**
     * @type {Integer}
     */
    wCollectionNumber {
        get => NumGet(this, 556, "ushort")
        set => NumPut("ushort", value, this, 556)
    }

    /**
     * @type {Integer}
     */
    wDesignatorIndex {
        get => NumGet(this, 558, "ushort")
        set => NumPut("ushort", value, this, 558)
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

    /**
     * @type {Integer}
     */
    dwDimension {
        get => NumGet(this, 564, "uint")
        set => NumPut("uint", value, this, 564)
    }

    /**
     * @type {Integer}
     */
    wExponent {
        get => NumGet(this, 568, "ushort")
        set => NumPut("ushort", value, this, 568)
    }

    /**
     * @type {Integer}
     */
    wReportId {
        get => NumGet(this, 570, "ushort")
        set => NumPut("ushort", value, this, 570)
    }
}
