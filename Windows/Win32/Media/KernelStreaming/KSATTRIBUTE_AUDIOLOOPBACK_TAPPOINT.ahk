#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\KSATTRIBUTE.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class KSATTRIBUTE_AUDIOLOOPBACK_TAPPOINT extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {KSATTRIBUTE}
     */
    AttributeHeader{
        get {
            if(!this.HasProp("__AttributeHeader"))
                this.__AttributeHeader := KSATTRIBUTE(0, this)
            return this.__AttributeHeader
        }
    }

    /**
     * @type {Integer}
     */
    TapPoint {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }
}
