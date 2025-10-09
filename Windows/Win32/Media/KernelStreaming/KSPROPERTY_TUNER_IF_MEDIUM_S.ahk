#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\KSIDENTIFIER.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class KSPROPERTY_TUNER_IF_MEDIUM_S extends Win32Struct
{
    static sizeof => 32

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
     * @type {KSIDENTIFIER}
     */
    IFMedium{
        get {
            if(!this.HasProp("__IFMedium"))
                this.__IFMedium := KSIDENTIFIER(this.ptr + 16)
            return this.__IFMedium
        }
    }
}
