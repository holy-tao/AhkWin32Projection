#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Devices.HumanInterfaceDevice
 * @version v4.0.30319
 * @charset ANSI
 */
class DIDEVICEOBJECTINSTANCEA extends Win32Struct
{
    static sizeof => 312

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
        get => StrGet(this.ptr + 28, 259, "UTF-8")
        set => StrPut(value, this.ptr + 28, 259, "UTF-8")
    }

    /**
     * @type {Integer}
     */
    dwFFMaxForce {
        get => NumGet(this, 288, "uint")
        set => NumPut("uint", value, this, 288)
    }

    /**
     * @type {Integer}
     */
    dwFFForceResolution {
        get => NumGet(this, 292, "uint")
        set => NumPut("uint", value, this, 292)
    }

    /**
     * @type {Integer}
     */
    wCollectionNumber {
        get => NumGet(this, 296, "ushort")
        set => NumPut("ushort", value, this, 296)
    }

    /**
     * @type {Integer}
     */
    wDesignatorIndex {
        get => NumGet(this, 298, "ushort")
        set => NumPut("ushort", value, this, 298)
    }

    /**
     * @type {Integer}
     */
    wUsagePage {
        get => NumGet(this, 300, "ushort")
        set => NumPut("ushort", value, this, 300)
    }

    /**
     * @type {Integer}
     */
    wUsage {
        get => NumGet(this, 302, "ushort")
        set => NumPut("ushort", value, this, 302)
    }

    /**
     * @type {Integer}
     */
    dwDimension {
        get => NumGet(this, 304, "uint")
        set => NumPut("uint", value, this, 304)
    }

    /**
     * @type {Integer}
     */
    wExponent {
        get => NumGet(this, 308, "ushort")
        set => NumPut("ushort", value, this, 308)
    }

    /**
     * @type {Integer}
     */
    wReportId {
        get => NumGet(this, 310, "ushort")
        set => NumPut("ushort", value, this, 310)
    }
}
