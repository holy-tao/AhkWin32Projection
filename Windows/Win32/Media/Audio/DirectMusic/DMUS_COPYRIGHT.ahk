#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Media.Audio.DirectMusic
 * @version v4.0.30319
 */
class DMUS_COPYRIGHT extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Array<Byte>}
     */
    byCopyright{
        get {
            if(!this.HasProp("__byCopyrightProxyArray"))
                this.__byCopyrightProxyArray := Win32FixedArray(this.ptr + 4, 4, Primitive, "char")
            return this.__byCopyrightProxyArray
        }
    }

    __New(ptrOrObj := 0, parent := ""){
        super.__New(ptrOrObj, parent)
        this.cbSize := 8
    }
}
