#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\KSIDENTIFIER.ahk
#Include ..\TIMECODE.ahk
#Include ..\TIMECODE_SAMPLE.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class KSPROPERTY_TIMECODE_S extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * @type {KSIDENTIFIER}
     */
    Property{
        get {
            if(!this.HasProp("__Property"))
                this.__Property := KSIDENTIFIER(this.ptr + 0)
            return this.__Property
        }
    }

    /**
     * @type {TIMECODE_SAMPLE}
     */
    TimecodeSamp{
        get {
            if(!this.HasProp("__TimecodeSamp"))
                this.__TimecodeSamp := TIMECODE_SAMPLE(this.ptr + 8)
            return this.__TimecodeSamp
        }
    }
}
