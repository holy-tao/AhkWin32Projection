#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\AUDIOLOOPBACK_TAPPOINT_TYPE.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\KSATTRIBUTE.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class KSATTRIBUTE_AUDIOLOOPBACK_TAPPOINT extends Win32Struct {
    static sizeof => 28

    static packingSize => 4

    /**
     * @type {KSATTRIBUTE}
     */
    AttributeHeader {
        get {
            if(!this.HasProp("__AttributeHeader"))
                this.__AttributeHeader := KSATTRIBUTE(0, this)
            return this.__AttributeHeader
        }
    }

    /**
     * @type {AUDIOLOOPBACK_TAPPOINT_TYPE}
     */
    TapPoint {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }
}
