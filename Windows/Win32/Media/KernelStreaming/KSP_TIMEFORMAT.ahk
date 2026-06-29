#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\KSIDENTIFIER.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class KSP_TIMEFORMAT extends Win32Struct {
    static sizeof => 64

    static packingSize => 8

    /**
     * @type {KSIDENTIFIER}
     */
    Property {
        get {
            if(!this.HasProp("__Property"))
                this.__Property := KSIDENTIFIER(0, this)
            return this.__Property
        }
    }

    /**
     * @type {Guid}
     */
    SourceFormat {
        get {
            if(!this.HasProp("__SourceFormat"))
                this.__SourceFormat := Guid(24, this)
            return this.__SourceFormat
        }
    }

    /**
     * @type {Guid}
     */
    TargetFormat {
        get {
            if(!this.HasProp("__TargetFormat"))
                this.__TargetFormat := Guid(40, this)
            return this.__TargetFormat
        }
    }

    /**
     * @type {Integer}
     */
    Time {
        get => NumGet(this, 56, "int64")
        set => NumPut("int64", value, this, 56)
    }
}
