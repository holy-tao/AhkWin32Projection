#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\KSATTRIBUTE.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class KSATTRIBUTE_AUDIOSIGNALPROCESSING_MODE extends Win32Struct {
    static sizeof => 40

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
     * @type {Guid}
     */
    SignalProcessingMode {
        get {
            if(!this.HasProp("__SignalProcessingMode"))
                this.__SignalProcessingMode := Guid(24, this)
            return this.__SignalProcessingMode
        }
    }
}
