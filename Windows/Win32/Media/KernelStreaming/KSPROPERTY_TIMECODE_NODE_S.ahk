#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\KSIDENTIFIER.ahk
#Include .\KSP_NODE.ahk
#Include ..\TIMECODE.ahk
#Include ..\TIMECODE_SAMPLE.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class KSPROPERTY_TIMECODE_NODE_S extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * @type {KSP_NODE}
     */
    NodeProperty{
        get {
            if(!this.HasProp("__NodeProperty"))
                this.__NodeProperty := KSP_NODE(this.ptr + 0)
            return this.__NodeProperty
        }
    }

    /**
     * @type {TIMECODE_SAMPLE}
     */
    TimecodeSamp{
        get {
            if(!this.HasProp("__TimecodeSamp"))
                this.__TimecodeSamp := TIMECODE_SAMPLE(this.ptr + 16)
            return this.__TimecodeSamp
        }
    }
}
