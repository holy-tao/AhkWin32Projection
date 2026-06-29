#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class SOUNDDETECTOR_PATTERNHEADER extends Win32Struct {
    static sizeof => 20

    static packingSize => 4

    /**
     * @type {Integer}
     */
    Size {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Guid}
     */
    PatternType {
        get {
            if(!this.HasProp("__PatternType"))
                this.__PatternType := Guid(4, this)
            return this.__PatternType
        }
    }
}
