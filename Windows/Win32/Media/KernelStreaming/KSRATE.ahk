#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\KSIDENTIFIER.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class KSRATE extends Win32Struct
{
    static sizeof => 40

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
    Interface{
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
        get => NumGet(this, 32, "int")
        set => NumPut("int", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }
}
