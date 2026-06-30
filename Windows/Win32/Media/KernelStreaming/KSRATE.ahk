#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\KSIDENTIFIER.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class KSRATE extends Win32Struct {
    static sizeof => 48

    static packingSize => 8

    /**
     * @type {Integer}
     */
    PresentationStart {
        get => NumGet(this, 0, "int64")
        set => NumPut("int64", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Duration {
        get => NumGet(this, 8, "int64")
        set => NumPut("int64", value, this, 8)
    }

    /**
     * @type {KSIDENTIFIER}
     */
    Interface {
        get {
            if(!this.HasProp("__Interface"))
                this.__Interface := KSIDENTIFIER(16, this)
            return this.__Interface
        }
    }

    /**
     * @type {Integer}
     */
    Rate {
        get => NumGet(this, 40, "int")
        set => NumPut("int", value, this, 40)
    }

    /**
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }
}
