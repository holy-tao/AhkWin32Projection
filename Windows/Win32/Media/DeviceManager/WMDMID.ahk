#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/WMDM/wmdmid
 * @namespace Windows.Win32.Media.DeviceManager
 * @version v4.0.30319
 */
class WMDMID extends Win32Struct
{
    static sizeof => 140

    static packingSize => 4

    /**
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    dwVendorID {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Array<Byte>}
     */
    pID{
        get {
            if(!this.HasProp("__pIDProxyArray"))
                this.__pIDProxyArray := Win32FixedArray(this.ptr + 8, 128, Primitive, "char")
            return this.__pIDProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    SerialNumberLength {
        get => NumGet(this, 136, "uint")
        set => NumPut("uint", value, this, 136)
    }

    __New(ptrOrObj := 0, parent := ""){
        super.__New(ptrOrObj, parent)
        this.cbSize := 140
    }
}
