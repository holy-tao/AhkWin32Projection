#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.Rras
 * @version v4.0.30319
 * @charset ANSI
 */
class RASPPPNBFA extends Win32Struct
{
    static sizeof => 48

    static packingSize => 4

    /**
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    dwError {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    dwNetBiosError {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Array<SByte>}
     */
    szNetBiosError{
        get {
            if(!this.HasProp("__szNetBiosErrorProxyArray"))
                this.__szNetBiosErrorProxyArray := Win32FixedArray(this.ptr + 12, 17, Primitive, "char")
            return this.__szNetBiosErrorProxyArray
        }
    }

    /**
     * @type {Array<SByte>}
     */
    szWorkstationName{
        get {
            if(!this.HasProp("__szWorkstationNameProxyArray"))
                this.__szWorkstationNameProxyArray := Win32FixedArray(this.ptr + 29, 17, Primitive, "char")
            return this.__szWorkstationNameProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    bLana {
        get => NumGet(this, 46, "char")
        set => NumPut("char", value, this, 46)
    }
}
