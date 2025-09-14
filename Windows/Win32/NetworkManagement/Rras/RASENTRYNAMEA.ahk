#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.Rras
 * @version v4.0.30319
 * @charset ANSI
 */
class RASENTRYNAMEA extends Win32Struct
{
    static sizeof => 532

    static packingSize => 4

    /**
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Array<SByte>}
     */
    szEntryName{
        get {
            if(!this.HasProp("__szEntryNameProxyArray"))
                this.__szEntryNameProxyArray := Win32FixedArray(this.ptr + 4, 257, Primitive, "char")
            return this.__szEntryNameProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 264, "uint")
        set => NumPut("uint", value, this, 264)
    }

    /**
     * @type {Array<SByte>}
     */
    szPhonebookPath{
        get {
            if(!this.HasProp("__szPhonebookPathProxyArray"))
                this.__szPhonebookPathProxyArray := Win32FixedArray(this.ptr + 268, 261, Primitive, "char")
            return this.__szPhonebookPathProxyArray
        }
    }
}
