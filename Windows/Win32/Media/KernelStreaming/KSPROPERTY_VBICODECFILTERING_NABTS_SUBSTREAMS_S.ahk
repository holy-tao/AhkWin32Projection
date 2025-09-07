#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\KSIDENTIFIER.ahk
#Include .\VBICODECFILTERING_NABTS_SUBSTREAMS.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class KSPROPERTY_VBICODECFILTERING_NABTS_SUBSTREAMS_S extends Win32Struct
{
    static sizeof => 520

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
     * @type {VBICODECFILTERING_NABTS_SUBSTREAMS}
     */
    Substreams{
        get {
            if(!this.HasProp("__Substreams"))
                this.__Substreams := VBICODECFILTERING_NABTS_SUBSTREAMS(this.ptr + 8)
            return this.__Substreams
        }
    }
}
