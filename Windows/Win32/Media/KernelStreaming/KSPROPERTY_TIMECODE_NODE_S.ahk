#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\KSP_NODE.ahk
#Include .\KSIDENTIFIER.ahk
#Include ..\TIMECODE_SAMPLE.ahk
#Include ..\TIMECODE.ahk
#Include ..\TIMECODE_SAMPLE_FLAGS.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class KSPROPERTY_TIMECODE_NODE_S extends Win32Struct {
    static sizeof => 56

    static packingSize => 8

    /**
     * @type {KSP_NODE}
     */
    NodeProperty {
        get {
            if(!this.HasProp("__NodeProperty"))
                this.__NodeProperty := KSP_NODE(0, this)
            return this.__NodeProperty
        }
    }

    /**
     * @type {TIMECODE_SAMPLE}
     */
    TimecodeSamp {
        get {
            if(!this.HasProp("__TimecodeSamp"))
                this.__TimecodeSamp := TIMECODE_SAMPLE(24, this)
            return this.__TimecodeSamp
        }
    }
}
